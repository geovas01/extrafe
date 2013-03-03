unit wg_timedate;

interface
uses
  SysUtils,Classes,ExtCtrls,Windows,Forms,Controls,Dialogs,
  IdSNTP,IdException,
  DateUtils,IniFiles,
  sPanel,sLabel,sBitBtn,
  AsyncCalls,AnalogClock,
  ce_config,
  NativeXml;

type
  TMyTimer = class(TTimer)
  public
    procedure OnMyTimer(Sender: TObject);
  end;

//Date Time world Panel
  procedure CreateDateTimeIniFirstTime;
  procedure SetDateTime_FromDateTimeIni;
  procedure AddDateTimePanels_FromDateTimeIni(iPanels: Integer);

  procedure Press_AddTime;
  procedure Cancel_Add;
  procedure Get_DataOfCountry;
  procedure AddSelection;
  procedure CreateDateTimePanel(num: Integer);
  procedure SortOtherDateTimePanels(killed: Integer);
  function GetTimeZone: string;

  procedure DateTimeWheelAction(sWheelDelta: Integer; sHandled: Boolean);
  
  
//Internet Panel
  procedure Set_ComputersTime;
  procedure Get_InternetTime;
  procedure ShowWorldClock;
  procedure ShowInternetTime;

// Menu actions
  procedure Show_widget_timedate;
  procedure wg_timedate_ShowDynamicComps;
  procedure wg_timedate_FreeDynamicComps;

implementation

uses
  main,mainconf,onflycomponents,FunctionX,menu,
  wg_weather;

var
  freeCompsGetTimeZoneInfo: Boolean;
  MyTimer: TMyTimer;
  CDPanels: Integer;
  dtCountry,dtCapital,dtHour,dtPopulation,dtMyTimeZone: string;
  dtTime,dtTime1: TTime;
  fXmlCountries: TNativeXml;
  node: TXmlNode;

procedure CreateDateTimeIniFirstTime;
begin
  DateTimeIni := TIniFile.Create(Program_Path + 'media\widgets\datetime\datetime.ini');
  DateTimeIni.WriteString('SelCount','Count','-1');
  SetDateTime_FromDateTimeIni;
end;

procedure SetDateTime_FromDateTimeIni;
var
  i: Integer;
begin
  CDPanels := DateTimeIni.ReadInteger('SelCount','Count',CDPanels);
  if CDPanels <> -1 then
    begin
      for i := 0 to CDPanels  do
        AddDateTimePanels_FromDateTimeIni(i);
      CDPanels := CDPanels + 1;
    end;
end;

procedure AddDateTimePanels_FromDateTimeIni(iPanels: Integer);
var
  node: TXmlNode;
  i: Integer;
begin
  fXmlCountries := TNativeXml.CreateName('Countries');
  fXmlCountries.XmlFormat := xfReadable;
  fXmlCountries.LoadFromFile(Program_Path + 'media\widgets\datetime\countries.xml');
  dtCountry := DateTimeIni.ReadString('Countries','Country' + IntToStr(iPanels),dtCountry);
  with fXmlCountries.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := fXmlCountries.Root.Nodes[i];
        if node.Name = 'row' then
          begin
            if node.ReadAttributeString('Country') = dtCountry then
              begin
                dtCapital := node.ReadAttributeString('Capital');
                dtPopulation := node.ReadAttributeString('Population');
                dtHour := node.ReadAttributeString('GTM');
                Break;
              end;
          end;
      end;
  fXmlCountries.Free;
  CreateDateTimePanel(iPanels + 1);
end;

procedure Press_AddTime;
var
  comp: TComponent;
begin
  Conf.sButton21.Visible := True;
  if freeCompsGetTimeZoneInfo = True then
    begin
      Comp := FindComponentEx('Conf.Pic_datetime1');
      TImage(Comp).Free;
      Comp := FindComponentEx('Conf.Pic_datetime2');
      TImage(Comp).Free;
      freeCompsGetTimeZoneInfo := False;
    end;
  Conf.sComboBox42.Visible := True;
end;

procedure Cancel_Add;
var
  comp: TComponent;
begin
  Conf.sComboBox42.Visible := False;
  Conf.sComboBox42.ItemIndex := -1;
  Conf.sComboBox42.Text := 'Countries...';
  if FindComponentEx('Conf.Pic_datetime1') <> nil then
    begin
      comp := FindComponentEx('Conf.Pic_datetime1');
      TImage(comp).Free;
    end;
  if FindComponentEx('Conf.Pic_datetime2') <> nil then
    begin
      comp := FindComponentEx('Conf.Pic_datetime2');
      TImage(comp).Free;
    end;
  Conf.sButton21.Visible := False;
  Conf.sButton24.Visible := False;
end;

procedure Get_DataOfCountry;
const
  picFlagNone = 'media\confeditor\images\timedate\flags\none.gif';
  picMapNone = 'media\confeditor\images\timedate\maps\none.gif';
  xmlPath = 'media\widgets\datetime\countries.xml';
var
  cbText,picFlag,picMap: string;
  comp : TComponent;
  i: Integer;
begin
  dtCountry := '';
  dtCapital := '';
  dtHour := '';
  dtPopulation := '';
  if freeCompsGetTimeZoneInfo = True then
    begin
      Comp := FindComponentEx('Conf.Pic_datetime1');
      TImage(Comp).Free;
      Comp := FindComponentEx('Conf.Pic_datetime2');
      TImage(Comp).Free;
      Comp := FindComponentEx('Conf.MyAnalogClock1');
      TAnalogClock(Comp).Free;
    end;
  fXmlCountries := TNativeXml.CreateName('Countries');
  fXmlCountries.XmlFormat := xfReadable;
  fXmlCountries.LoadFromFile(Program_Path + xmlPath);
  cbText := SetCapitalTheFirstLetter(Conf.sComboBox42.Text);
  with fXmlCountries.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := fXmlCountries.Root.Nodes[i];
        if node.Name = 'row' then
          if node.ReadAttributeString('Country') = cbText then
            begin
              picFlag := Program_Path + 'media\confeditor\images\timedate\flags\' + cbText + '.gif';
              picMap := Program_Path + 'media\confeditor\images\timedate\maps\' + cbText + '.gif';
              if FileExists(picFlag) then
                begin
                  picFlag := 'media\confeditor\images\timedate\flags\' + cbText + '.gif';
                  Image_Comp(Conf.Ptimedate_worldclock,picFlag,376,152,100,80,1,'_datetime',True,True)
                end
              else
                Image_Comp(Conf.Ptimedate_worldclock,picFlagNone,386,152,80,80,1,'_datetime',True,True);
              if FileExists(picMap) then
                begin
                  picMap := 'media\confeditor\images\timedate\maps\' + cbText + '.gif';
                  Image_Comp(Conf.Ptimedate_worldclock,picMap,480,104,225,161,2,'_datetime',True,True)
                end
              else
                Image_Comp(Conf.Ptimedate_worldclock,picMapNone,480,104,215,161,2,'_datetime',True,True);
              freeCompsGetTimeZoneInfo := True;
              dtCountry := node.ReadAttributeString('Country');
              dtCapital := node.ReadAttributeString('Capital');
              dtHour := node.ReadAttributeString('GTM');
              dtPopulation := node.ReadAttributeString('Population');
              dtPopulation := FormatFloat('#.##,', StrToInt(dtPopulation));
              Break;
            end;
      end;
  fXmlCountries.Free;
  dtMyTimeZone := GetTimeZone;
  dtTime1 := Now;
  dtTime1 := IncHour(dtTime1,StrToInt(dtHour));
  dtTime1 := IncHour(dtTime1,StrToInt('-'+dtMyTimeZone));
  Conf.sButton24.Visible := True;
  Conf.sButton24.Caption := 'Please Wait...';
  MyTimer.Enabled := True;
end;

procedure AddSelection;
begin
  if CDPanels > 9 then
    ShowMessage('Sorry only 10 selections you can do...'  + #13#10 + 'If you want this selection please erase one of your previous selections.')  
  else
    begin
      if CDpanels = -1 then
        CDPanels := 0;
      CreateDateTimePanel(CDPanels+1);
      Cancel_Add;
      CDPanels := CDPanels + 1;
    end;
end;

procedure CreateDateTimePanel(num: Integer);
var
  comp: TComponent;
  TTop,CountC: Integer;
begin
  Conf.ScrollBox2.VertScrollBar.Position := 0;
  if num = 1 then
    TTop := 8
  else
    TTop := (70 * (num - 1)) + (8 * num);
  dtMyTimeZone := GetTimeZone;
  Panel_Comp(Conf.ScrollBox2,'_datetime',(num - 1) + 11,8,TTop,70,322);
  Comp := FindComponentEx('Conf.MyPanel_datetime' + IntToStr((num - 1)+11));
  BitBtn_Comp(TsPanel(Comp),(num - 1) + 11,'datetime',304,2,16,16,33);
  dtHour := IntToStr(StrToInt(dtHour) - StrToInt(dtMyTimeZone));
  if StrToInt(dtHour) > 0 then
    AnalogClock_Comp(TsPanel(comp),num-1,5,10,50,60,StrToTime(dthour),True)
  else
    begin
      Delete(dtHour,1,1);
      AnalogClock_Comp(TsPanel(comp),num-1,5,10,50,60,-StrToTime(dthour),True);
    end;
  Label_Comp(TsPanel(comp),'Country : ' + dtCountry,70,10,((num - 1) * 4),'_datetime',True,True,True);
  Label_Comp(TsPanel(comp),'Capital : ' + dtCapital,70,50,((num - 1) * 4) + 1,'_datetime',True,True,True);
  Label_Comp(TsPanel(comp),'GTM : ' + dtHour,260,50,((num - 1) * 4) + 2,'_datetime',True,True,True);
  Label_Comp(TsPanel(comp),'Population : ' + dtPopulation,70,30,((num - 1) * 4)+ 3,'_datetime',True,True,True);
  if Started = False then
    begin
      CountC := DateTimeIni.ReadInteger('SelCount','Count',CountC);
      DateTimeIni.WriteInteger('SelCount','Count',CountC + 1);
      DateTimeIni.WriteString('Countries','Country' + IntToStr(CountC + 1),dtCountry);
    end
  else
    begin
      ShowProgressBar((num * 100) div CDPanels,'Load Users Datetime selections...','datetime');
    end;
end;

procedure SortOtherDateTimePanels(killed: Integer);
var
  i,k: Integer;
  comp: TComponent;
  CCountry: string;
begin
  if killed = (CDPanels - 1) + 11  then
    begin
      DateTimeIni.WriteString('SelCount','Count',IntToStr((killed - 1)-11));
      DateTimeIni.DeleteKey('Countries','Country' + IntToStr(killed - 11));
      CDPanels := CDPanels - 1;
    end
  else if (killed - 11) >= 0 then
    begin
      CDPanels := CDPanels - 1;
      for i := (killed - 11) to CDPanels - 1 do
        begin
          comp := FindComponentEx('Conf.MyPanel_datetime' + IntToStr(i + 1 + 11));
          TsPanel(comp).Top := TsPanel(comp).Top - 78;
          TsPanel(comp).Name := 'Mypanel_datetime' + IntToStr(i + 11);
          comp := FindComponentEx('Conf.MyBitBtn' + IntToStr(i + 1 + 11));
          TsBitBtn(comp).Name := 'MyBitBtn' + IntToStr(i + 11);
          TsBitBtn(comp).Tag := i + 11;
          comp := FindComponentEx('Conf.MyAnalogClock' + IntToStr(i + 1));
          TAnalogClock(comp).Name := 'MyAnalogClock' + IntToStr(i);
          for k := 0 to 3 do
            begin
              comp := FindComponentEx('Conf.Label_datetime' + IntToStr(((i + 1) * 4) + k ));
              if i = 0 then
                TsLabel(comp).Name := 'Label_datetime' + IntToStr(i + k)
              else
                TsLabel(comp).Name := 'Label_datetime' + IntToStr((i * 4) + k);
            end;
        end;
      DateTimeIni.WriteString('SelCount','Count',IntToStr(CDPanels - 1));
      DateTimeIni.DeleteKey('Countries','Country0');
      for i := 0 to CDPanels do
        begin
          CCountry := DateTimeIni.ReadString('Countries','Country' + IntToStr(i + 1),CCountry);
          DateTimeIni.WriteString('Countries','Country' + IntToStr(i),CCountry);
        end;
      DateTimeIni.DeleteKey('Countries','Country' + IntToStr(CDPanels));
    end;
end;

{ TMyTimer }

procedure TMyTimer.OnMyTimer(Sender: TObject);
begin
  dtMyTimeZone := GetTimeZone;
  dtTime := Now;
  dtTime := IncHour(dtTime,StrToInt(dtHour));
  dtTime := IncHour(dtTime,StrToInt('-'+dtMyTimeZone));
  Conf.sButton24.Caption := TimeToStr(dtTime);
end;

function GetTimeZone: string; 
var 
  TimeZone: TTimeZoneInformation;
begin
  GetTimeZoneInformation(TimeZone);
  Result := IntToStr(TimeZone.Bias div -60); 
end;

//
// Internet Panel

procedure Get_InternetTime;
var
  SNTPClient: TIdSNTP;
  DT,DateTimeNow: string;
//  SysDateTime: TDateTime;
//  setSystemDateTime: SYSTEMTIME;
//  aIT: IAsyncCall;

  function ShowInternetTime : Boolean;
    begin
      SNTPClient := TIdSNTP.Create(nil);
      try
        try
          if Conf.sComboBox77.Text <> 'Time Servers...' then
            begin
              SNTPClient.Host := Conf.sComboBox77.Text;
              SNTPClient.SyncTime;
              DT := DateTimeToStr(SNTPClient.DateTime);
              Conf.sLabel130.Caption := 'Time Server: ' + Conf.sComboBox77.Text;
              Conf.sLabel131.Caption := 'Date Time: '+ DT;
              DateTimeNow := DateTimeToStr(Now);
              Conf.sLabel133.Caption := 'Computers Date Time: '+ DateTimeNow;
              if DateTimeNow <> DT then
                Conf.sButton25.Visible := True;
            end
          else
            begin
              Conf.sLabel130.Caption := 'Please select a time server...';
              Conf.sLabel131.Caption := '';
            end;
        finally
          SNTPClient.Free;
        end;
      except
        on E: EIdException do
          if E.Message = 'Socket Error # 11001'+#13#10+'Host not found.' then
            begin
              Conf.sLabel130.Caption := 'Time Server: ' + Conf.sComboBox77.Text +' not accesible';
              Conf.sLabel131.Caption := '';
            end;
      end;

//  SysDateTime := Now;
//  Memo1.Lines.Add(DateTimeToStr(SysDateTime));
//  DateTimeToSystemTime(SysDateTime,setSystemDateTime);
//  SetLocalTime(setSystemDateTime);
//  Memo1.Lines.Add('System Date and Time succesfully added');
    end;
begin
  Conf.sButton25.Visible := False;
  Conf.sLabel130.Caption := '';
  Conf.sLabel131.Caption := '';
  Conf.sLabel133.Caption := '';
  LocalAsyncExec(@ShowInternetTime,Application.ProcessMessages);
end;

procedure Set_ComputersTime;
begin
  
end;



procedure ShowWorldClock;
begin
  Conf.sBitBtn110.Down := True;
  Conf.sBitBtn111.Down := False;
  Conf.Ptimedate_worldclock.BringToFront;
end;

procedure ShowInternetTime;
begin
  Conf.sBitBtn111.Down := True;
  Conf.sBitBtn110.Down := False;
  Conf.Ptimedate_internettime.BringToFront;
end;

procedure DateTimeWheelAction(sWheelDelta: Integer; sHandled: Boolean);
var
  PosNumber: Integer;
begin
  if sWheelDelta > 0 then
    with Conf.ScrollBox2.VertScrollBar do 
      begin
        PosNumber := Position - Conf.ScrollBox2.VertScrollBar.Increment;
        if PosNumber < 0 then 
          PosNumber := 0;
        Position := PosNumber;
      end;
  if sWheelDelta < 0 then 
    with Conf.ScrollBox2.VertScrollBar do
      begin
        PosNumber := Position + Conf.ScrollBox2.VertScrollBar.Increment;
        if PosNumber >= Conf.ScrollBox2.VertScrollBar.Range then
          PosNumber := Conf.ScrollBox2.VertScrollBar.Range - 1;
        Position := PosNumber;
      end;
  sHandled := True;
end;

/////////////////////////////////////////////////////////////////////
procedure Show_widget_timedate;
begin
  if Cmenustate = 'wg_weather' then
    wg_weather_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,False);
  Cmenustate := 'wg_timedate';
  wg_timedate_ShowDynamicComps;
  ShowButtonDown(10,'WG_TIMEDATE');
  ShowHidePanel(CurrentPanel,'Pwg_timedate');
  if Conf.sBitBtn111.Down = False then
    ShowWorldClock;
  ScrollBoxTheme(ThemeNumber + 1);
end;

procedure wg_timedate_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 2 do
    begin
      case i of
        1 : Image_Comp(Conf.Pwg_timedate,'media\confeditor\images\timedate\timedate.png',
              3,571,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pwg_timedate,'media\confeditor\images\timedate\timedate_image.png',
              600,447,126,211,i,'',True,False);
      end;
    end;
end;

procedure wg_timedate_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 2 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
end;
////////////////////////////////////////////////////////////////////


initialization

MyTimer := TMyTimer.Create(nil);
with MyTimer do
begin
  Enabled := False;
  Interval := 1000;
  OnTimer := OnMyTimer;
end;

finalization
  FreeAndNil(MyTimer);
end.
