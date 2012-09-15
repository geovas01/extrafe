unit wg_timedate;

interface
uses
  SysUtils,Classes,ExtCtrls,Windows,Forms,IdSNTP,IdException,
  sPanel,sLabel;

type
  TMyTimer = class(TTimer)
  public
    procedure OnMyTimer(Sender: TObject);
  end;

  procedure Press_AddTime;
  procedure Cancel_Add;
  procedure Get_DataOfCountry;
  procedure Get_InternetTime;
  procedure Set_ComputersTime;
  procedure AddSelection;
  procedure CreateDateTimePanel(num: Integer);

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
  Conf.grp32.Visible := True;
  Conf.sComboBox42.Visible := True;
end;

procedure Cancel_Add;
begin
  Conf.grp32.Visible := False;
  Conf.sComboBox42.Visible := False;
  Conf.sComboBox42.ItemIndex := -1;
  Conf.sComboBox42.Text := 'Countries...';
  Conf.sButton21.Visible := False;
  Conf.sButton24.Visible := False;
end;

procedure Get_DataOfCountry;
const
  picFlagNone = 'media\confeditor\images\timedate\flags\none.gif';
  picMapNone = 'media\confeditor\images\timedate\maps\none.gif';
var
  TimeZone: TextFile;
  Path,text,text1,text2,Capital,hour: string;
  picFlag,picMap: string;
  i: Integer;
  Comp: TComponent;
  UpDateTime: TTimer;
begin
  if freeCompsGetTimeZoneInfo = True then
    begin
      Comp := FindComponentEx('Conf.Pic_datetime1');
      TImage(Comp).Free;
      Comp := FindComponentEx('Conf.Pic_datetime2');
      TImage(Comp).Free;
    end;
  Path := ExtractFilePath(Application.ExeName) + 'media\widgets\datetime\cocaca.txt';
  AssignFile(TimeZone,Path);
  Reset(TimeZone);
    while not Eof(TimeZone) do
      begin
        Readln(TimeZone,text);
        i := Pos('=',text);
        text1 := Trim(Copy(text,0,i-1));
        text2 := Trim(Copy(text,i+1,Length(text) - i));
        if text1 = Conf.sComboBox42.Text then
          begin
            picFlag := ExtractFilePath(Application.ExeName) + 'media\confeditor\images\timedate\flags\' + text1 + '.gif';
            picMap := ExtractFilePath(Application.ExeName) + 'media\confeditor\images\timedate\maps\' + text1 + '.gif';
            if FileExists(picFlag) then
              begin
                picFlag := 'media\confeditor\images\timedate\flags\' + text1 + '.gif';
                Image_Comp(Conf.grp32,picFlag,15,112,100,80,1,'_datetime',True,True)
              end
            else
              Image_Comp(Conf.grp32,picFlagNone,25,112,80,80,1,'_datetime',True,True);
            if FileExists(picMap) then
              begin
                picMap := 'media\confeditor\images\timedate\maps\' + text1 + '.gif';
                Image_Comp(Conf.grp32,picMap,120,64,219,161,2,'_datetime',True,True)
              end
            else
              Image_Comp(Conf.grp32,picMapNone,120,64,209,161,2,'_datetime',True,True);
            freeCompsGetTimeZoneInfo := True;
            i := Pos('(',text2);
            Capital := Trim(Copy(text2,0,i-1));
            hour := Trim(Copy(text2,i + 1,Length(text2)-i-1));
            Break;
          end;
      end;
  CloseFile(TimeZone);
  Text := TimeToStr(Now);
  Conf.sButton24.Visible := True;
  Conf.sButton24.Caption := text;
  MyTimer.Enabled := True;
end;

procedure AddSelection;
begin
  if CDpanels = -1 then
    CDPanels := 0;
  CreateDateTimePanel(CDPanels+1);
  Cancel_Add;
end;

procedure CreateDateTimePanel(num: Integer);
var
  comp: TComponent;
  TTop: Integer;
begin
  if num = 1 then
    TTop := 8
  else
    TTop := (70 * (num - 1)) + (8 * num);
  Panel_Comp(Conf.ScrollBox2,'_datetime',(num - 1) + 11,8,TTop,70,322);
  Comp := FindComponentEx('Conf.MyPanel_datetime' + IntToStr((num - 1)+11));
  BitBtn_Comp(TsPanel(Comp),(num - 1)+11,'datetime',304,2,16,16,33);
  AnalogClock_Comp(TsPanel(comp),num-1,5,15,30,30);
end;

procedure Get_InternetTime;
var
  SNTPClient: TIdSNTP;
  DT,DateTimeNow: string;
  SysDateTime: TDateTime;
  setSystemDateTime: SYSTEMTIME;
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

procedure Set_ComputersTime;
begin

end;

{ TMyTimer }

procedure TMyTimer.OnMyTimer(Sender: TObject);
var
  text: string;
begin
  text := TimeToStr(now);
  Conf.sButton24.Caption := text;
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
  Interval := 1000;
  OnTimer := OnMyTimer;
end;

finalization
  FreeAndNil(MyTimer);
end.
