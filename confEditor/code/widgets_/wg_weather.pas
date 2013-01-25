unit wg_weather;

interface
uses
  SysUtils,Classes,ExtCtrls,Controls,Forms,IniFiles,Dialogs,Graphics,
  NativeXml,
  sBitBtn,sPanel,sLabel;

  procedure SetWeather_FromWeatherIni;
  procedure SaveWeather_AtExit;

  procedure AddWeatherPanels_FromWeatherIni(num: Integer);
  procedure CreateWeatherIniFirstTime;
  procedure PressPlus_Add;
  procedure PressCancel_Add;
  procedure KeyPressedInEdit(aKey: Char);
  procedure SearchForTown;
  procedure onClickIn_Town(town: Integer);
  procedure OnClickCheckIn_Town;
  procedure CreateWeatherPanel(num: Integer);
  procedure SortOtherWeatherPanels(killed: Integer);
  procedure WeatherPanelClicked(PanelNum: Integer);
  procedure ShowTheActButtonsAbove(Show: Boolean);

  procedure GetWeatherData(num: Integer);
  
  procedure Assigned_Weather;
  procedure Assigned_WeatherPosTowns;

  procedure RefreshTheWeatherPanels;
  procedure RefreshTheTempPanels(CorF: String);

  procedure WeatherWheelAction(sWheelDelta: integer; sHandled: Boolean);
  
// Menu actions
  procedure Show_widget_weather;
  procedure wg_weather_ShowDynamicComps;
  procedure wg_weather_FreeDynamicComps;

implementation

uses
  main,mainconf,onflycomponents,FunctionX,menu,
  wg_timedate;

var
  FXml_Weather: TNativeXml;
  FXml_WeatherPosTown: TNativeXml; 

  WOEID_List: TStringList;
  CheckInTownInfo: array[0..8] of string;
  cPanels: Integer;
  UN,WS,WS_CorF: string;

  GlobalyActionButtons: Boolean;
  FromRButton,FromCorFButton,FromCOTButton: Boolean;

procedure SetWeather_FromWeatherIni;
var
  i : Integer;
begin
  cPanels := WeatherIni.ReadInteger('SelCount','count',cPanels);
  if cPanels <> -1 then
    begin
      for i := 0 to cPanels do
        AddWeatherPanels_FromWeatherIni(i);
      cPanels := cPanels + 1;
      ShowTheActButtonsAbove(True);
      GlobalyActionButtons := True;
      FromRButton := False;
      FromCorFButton := False;
      FromCOTButton := False;
    end;
end;

procedure SaveWeather_AtExit;
const
  EraseXmlsDir = 'media\widgets\weather\xml';
var
  MySRec: TSearchRec; 
begin
  FindFirst(EraseXmlsDir+'\*.*', faAnyFile+faReadOnly, MySRec);
  DeleteFile(EraseXmlsDir + '\' + MySRec.Name);
  while FindNext(MySRec) = 0 do
    DeleteFile(EraseXmlsDir + '\' + MySRec.Name);
  FindClose(MySRec);    
end;

procedure AddWeatherPanels_FromWeatherIni(num: Integer);
begin
  if StBarInfo[3] = 'Internet Connected' then
    GetWeatherData(num);
end;

procedure CreateWeatherIniFirstTime;
begin
  WeatherIni := TIniFile.Create(Program_Path + 'media\widgets\weather\weather.ini');
  WeatherIni.WriteString('SelCount','count','-1');
  WeatherIni.WriteString('WOEID','town',' ');
  WeatherIni.WriteString('Symbol','town',' ');
  SetWeather_FromWeatherIni;
end;

procedure PressPlus_Add;
begin
  if StBarInfo[3] = 'Internet Connected' then
    begin
      Conf.grp31.Visible := True;
      Conf.sButton18.Enabled := False;
      Conf.sButton19.Visible := True;
      Conf.sEdit31.Visible := True;
      Conf.rb7.Visible := True;
      Conf.rb8.Visible := True;
      Conf.sEdit31.SetFocus;
      Conf.sListBox1.Clear;
      Conf.sListBox1.Visible := False;
      Conf.sButton20.Caption := '';
      Conf.sButton20.Visible := False;
    end
end;

procedure PressCancel_Add;
begin
  Conf.sButton18.Enabled := True;
  Conf.sButton19.Visible := False;
  Conf.sEdit31.Text := '';
  Conf.grp31.Visible := False;
end;

procedure KeyPressedInEdit(aKey: Char);
begin
  if aKey = #13 then
    begin
      Conf.sListBox1.Visible := True;
      Conf.sListBox1.SetFocus;
      SearchForTown;
    end;
end;

procedure SearchForTown;
const
  pathToPosAnwsers = 'media\widgets\weather\xml\PosibleAnwsers.xml';
var
  Answers : TStringList;
  Answer: string;
  procedure createListBox(SName: string);
  var
    i,k,l : Integer;
    node: TXmlNode;
  begin
    l := 0;
    with FXml_WeatherPosTown.Root do
      for i := 0 to NodeCount - 1 do
        for k := 0 to Nodes[i].NodeCount - 1 do 
          begin
            node := FXml_WeatherPosTown.Root.Nodes[i].Nodes[k];
            if SName = 'woeid' then
              begin
                if node.Name = 'woeid' then
                  begin
                    Answer := node.Value;
                    WOEID_List.Insert(l,Answer);
                    l := l + 1;
                  end;
              end
            else if SName = 'name' then
              begin
                if node.Name = 'name' then
                  begin
                    Answer := node.Value;
                    Conf.sListBox1.Items.Add(Answer);
                  end;
              end
            else if (SName = 'country') or (SName = 'admin1') then
              begin
                if (node.Name = 'country') or (node.Name = 'admin1') then
                  begin
                    Answer := node.Value;
                    Conf.sListBox1.Items.Insert(l,Conf.sListBox1.Items.Strings[l] + ' , ' + Answer);
                    Conf.sListBox1.Items.Delete(l + 1);
                    if node.Name = 'admin1' then
                      l := l + 1;
                  end;
              end;
          end;
  end;
begin
  Answers := TStringList.Create;
  Answers.Add(Conf.IdHTTP1.Get('http://where.yahooapis.com/v1/places.q('+ Conf.sEdit31.Text +');count=5?appid=lueQw7fV34EHWqaWFj9cicD3IBPNPmurGhrfWa7BE2fhQw.KEwclMcU7Oo0ApWdl'));
  Answers.SaveToFile(pathToPosAnwsers);
  Conf.sListBox1.Clear;
  Assigned_WeatherPosTowns;
  FXml_WeatherPosTown.LoadFromFile(pathToPosAnwsers);
  createListBox('name');
  createListBox('country');
  WOEID_List := TStringList.Create;
  createListBox('woeid');
  Conf.sListBox1.ItemIndex := 0;
  Answers.Free;
  if Conf.sListBox1.Items.Count <> 0 then
    onClickIn_Town(0);
end;

procedure onClickIn_Town(town: Integer);
begin
  FromCOTButton := True;
  GetWeatherData(town);
  FromCOTButton := False;
end;

procedure OnClickCheckIn_Town;
begin
  if cPanels > 9 then
    ShowMessage('Sorry only 10 selections you can do...'  + #13#10 + 'If you want this selection please erase one of your previous selections.')
  else
    begin
      if cPanels = -1 then
        cPanels := 0;
      CreateWeatherPanel(cPanels+1);
      PressCancel_Add;
    end;
end;

procedure CreateWeatherPanel(num: Integer);
var
  Comp: TComponent;
  TTop: Integer;
begin
  Conf.ScrollBox1.VertScrollBar.Position := 0;
  if num = 1 then
    TTop := 8
  else
    TTop := (70 * (num - 1)) + (8 * num);
  Panel_Comp(Conf.ScrollBox1,'_weather',num - 1,8,TTop,70,322);
  Comp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(num - 1));
  BitBtn_Comp(TsPanel(Comp),num - 1,'weather',304,2,16,16,33);
  Label_Comp(TsPanel(Comp),CheckInTownInfo[3],2,2,(num - 1) * 6,'_weather',True,True,True);
  Label_Comp(TsPanel(Comp),CheckInTownInfo[0]+ ', ' + CheckInTownInfo[1],2,16,((num - 1) * 6) + 1,'_weather',True,True,True);
  Image_Comp(TsPanel(Comp),'media\confeditor\images\weather\wt_simple\'+ CheckInTownInfo[7] +'.png',2,32,32,32,num - 1,'_weather',True,True);
  Label_Comp(TsPanel(Comp),CheckInTownInfo[6],36,36,((num - 1) * 6) + 2,'_weather',True,True,True);
  Label_Comp(TsPanel(Comp),CheckInTownInfo[2] + ' '+ Char(176) + UpperCase(WS),36,48,((num - 1) * 6) + 3,'_weather',True,True,True);
  Label_Comp(TsPanel(Comp),'Sunrise: ' + CheckInTownInfo[4],220,36,((num - 1) * 6) + 4,'_weather',True,True,True);
  Label_Comp(TsPanel(Comp),'Sunset : ' + CheckInTownInfo[5],220,48,((num - 1) * 6) + 5,'_weather',True,True,True);
  if Started = False then
    begin
      WeatherIni.WriteInteger('SelCount','count',cPanels);
      WeatherIni.WriteInteger('WOEID','town' + IntToStr(cPanels),StrToInt(UN));
      WeatherIni.WriteString('Symbol','town' + IntToStr(cPanels),WS);
      cPanels := cPanels + 1;
    end;
end;

procedure SortOtherWeatherPanels(killed: Integer);
var
  i,k: Integer;
  comp: TComponent;
  CTown,CSymbol: string;
begin
  if killed = cPanels - 1 then
    begin
      WeatherIni.WriteString('SelCount','count',IntToStr(killed -1));
      WeatherIni.DeleteKey('WOEID','town' + IntToStr(killed));
      WeatherIni.DeleteKey('Symbol','town' + IntToStr(killed));
      cPanels := cPanels - 1;
    end
  else if killed >= 0 then
    begin
      cPanels := cPanels - 1;
      for i := killed to cPanels - 1 do
        begin
          comp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(i + 1));
          TsPanel(comp).Top := TsPanel(comp).Top - 78;
          TsPanel(comp).Name := 'Mypanel_weather' + IntToStr(i);
          comp := FindComponentEx('Conf.MyBitBtn' + IntToStr(i + 1));
          TsBitBtn(comp).Name := 'MyBitBtn' + IntToStr(i);
          TsBitBtn(comp).Tag := i;
          comp := FindComponentEx('Conf.Pic_weather' + IntToStr(i + 1));
          TImage(comp).Name := 'Pic_weather' + IntToStr(i);
          for k := 0 to 5 do
            begin
              comp := FindComponentEx('Conf.Label_weather' + IntToStr(((i + 1) * 6)+ k ));
              if i = 0 then
                TsLabel(comp).Name := 'Label_weather' + IntToStr(i + k)
              else
                TsLabel(comp).Name := 'Label_weather' + IntToStr((i * 6) + k)
            end;
        end;
      WeatherIni.WriteString('SelCount','count',IntToStr(cPanels -1));
      WeatherIni.DeleteKey('WOEID','town0');
      WeatherIni.DeleteKey('Symbol','town0');
      for i := 0 to cPanels do
        begin
          CTown := WeatherIni.ReadString('WOEID','town' + IntToStr(i + 1),CTown);
          WeatherIni.WriteString('WOEID','town' + IntToStr(i),CTown);
          CSymbol := WeatherIni.ReadString('Symbol','town' + IntToStr(i + 1),CSymbol);
          WeatherIni.WriteString('Symbol','town' + IntToStr(i),CSymbol);
        end;
      WeatherIni.DeleteKey('WOEID','town' + IntToStr(cPanels));
      WeatherIni.DeleteKey('Symbol','town' + IntToStr(cPanels));
    end;
end;

procedure Assigned_Weather;
begin
  if not Assigned(FXml_Weather) then
    begin
      FXml_Weather := TNativeXml.CreateName('rss');
      FXml_Weather.XmlFormat := xfReadable;
    end;
end;

procedure Assigned_WeatherPosTowns;
begin
  if not Assigned(FXml_WeatherPosTown) then
    begin
      FXml_WeatherPosTown := TNativeXml.CreateName('places');
      FXml_WeatherPosTown.XmlFormat := xfReadable;
    end;
end;

procedure WeatherPanelClicked(PanelNum: Integer);
var
  comp: TComponent;
  temp: string;
begin
  comp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(PanelNum));
  TsPanel(comp).SkinData.CustomColor := not TsPanel(comp).SkinData.CustomColor;
  TsPanel(comp).Repaint;
  if TsPanel(comp).SkinData.CustomColor = true then
    begin
      comp := FindComponentEx('Conf.Label_weather' + IntToStr((PanelNum * 6) + 3));
      temp := TsLabel(comp).Caption;
      temp := temp[Length(temp)];
      if GlobalyActionButtons = true then
        begin
          if temp = 'C' then
            Conf.sBitBtn114.Enabled := False
          else if temp = 'F' then 
            Conf.sBitBtn115.Enabled := False
        end
      else
        begin
          if temp = 'C' then 
            begin
              if Conf.sBitBtn115.Enabled = false then
                Conf.sBitBtn115.Enabled := True;
            end
          else if temp = 'F' then
            begin
              if Conf.sBitBtn114.Enabled = false then
                Conf.sBitBtn114.Enabled := True;
            end;
        end;
      GlobalyActionButtons := false;      
    end
  else
    begin
      comp := FindComponentEx('Conf.Label_weather' + IntToStr((PanelNum * 6) + 3));
      temp := TsLabel(comp).Caption;
      temp := temp[Length(temp)];
      if temp = 'C' then 
        Conf.sBitBtn114.Enabled := True
      else if temp = 'F' then 
        Conf.sBitBtn115.Enabled := True;
    end;
end;

procedure ShowTheActButtonsAbove(Show: Boolean);
begin
  Conf.sBitBtn114.Visible := Show;
  Conf.sBitBtn115.Visible := Show;
  Conf.sBitBtn116.Visible := Show;
end;

procedure RefreshTheWeatherPanels;
var
  i,TownsNum: integer;
  comp: TComponent;
  TownsFind: array [0..9] of string;
  GlobalOrNot: Boolean;

  procedure RefreshCurrentPanel(panel: integer);
  var
    k: integer;
  begin
    FromRButton := True;
    GetWeatherData(panel);
    FromRButton := False;
    for k := 0 to 5 do 
      begin
        comp := FindComponentEx('Conf.Label_weather' + IntToStr((panel * 6) + k));
        case k of 
          0 : TsLabel(comp).Caption := CheckInTownInfo[3];        
          1 : TsLabel(comp).Caption := CheckInTownInfo[0];
          2 : TsLabel(comp).Caption := CheckInTownInfo[6];
          3 : TsLabel(comp).Caption := CheckInTownInfo[2] + ' '+ Char(176) + UpperCase(WS);  
          4 : TsLabel(comp).Caption := 'Sunrise: ' + CheckInTownInfo[4];
          5 : TsLabel(comp).Caption := 'Sunset : ' + CheckInTownInfo[5];
        end;
      end;
    comp := FindComponentEx('Conf.Pic_weather' + IntToStr(panel));
    TImage(Comp).Picture.LoadFromFile(Program_Path + 'media\confeditor\images\weather\wt_simple\' + CheckInTownInfo[7] +'.png');
    comp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(panel));
    TsPanel(comp).SkinData.CustomColor := not TsPanel(comp).SkinData.CustomColor;
    TsPanel(comp).Repaint;
  end;
begin
  GlobalOrNot := False;
  for i := 0 to 9 do 
    TownsFind[i] := '0';
  TownsNum := WeatherIni.ReadInteger('SelCount','Count',TownsNum);
  if TownsNum <> -1 then
    begin    
      for i := 0 to TownsNum do
        begin
          comp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(i));
          if TsPanel(comp).SkinData.CustomColor = true then
            begin
              TownsFind[i] := '1';
              GlobalOrNot := True;
            end;
        end;
      if GlobalOrNot = true then 
        begin
          for i := 0 to TownsNum do 
            if TownsFind[i] = '1' then
              begin
                RefreshCurrentPanel(i);            
                Application.ProcessMessages;
              end;
        end
      else
        begin
          for i := 0 to TownsNum do 
            begin
              comp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(i));
              TsPanel(comp).SkinData.CustomColor := not TsPanel(comp).SkinData.CustomColor;
              TsPanel(comp).Repaint;
              Application.ProcessMessages;
            end;
          for i := 0 to TownsNum do 
            begin
              RefreshCurrentPanel(i);
              Application.ProcessMessages;
            end;
        end;
    end;
end;

procedure RefreshTheTempPanels(CorF: String);
var
  i,TownsNum: integer;
  comp: TComponent;
  GlobalOrNot: Boolean;
  TownsFind: array [0..9] of string;  

  procedure RefreshCurrentTempInPanel(Panel: Integer; TempType: string);
  begin
    FromCorFButton := True;
    GetWeatherData(Panel);
    FromCorFButton := False;
    comp := FindComponentEx('Conf.Label_weather' + IntToStr((Panel * 6) + 3));
    TsLabel(comp).Caption := CheckInTownInfo[2] + ' '+ Char(176) + UpperCase(CorF);  
    WeatherIni.WriteString('Symbol','town' + IntToStr(Panel),LowerCase(CorF));
    comp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(panel));
    TsPanel(comp).SkinData.CustomColor := not TsPanel(comp).SkinData.CustomColor;
    TsPanel(comp).Repaint;
  end;
  
begin
  WS_CorF := LowerCase(CorF);
  GlobalOrNot := False;
  for i := 0 to 9 do 
    TownsFind[i] := '0';
  TownsNum := WeatherIni.ReadInteger('SelCount','Count',TownsNum);
  if TownsNum <> -1 then    
    begin
      for i := 0 to TownsNum do
        begin
          comp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(i));
          if TsPanel(comp).SkinData.CustomColor = true then
            begin
              TownsFind[i] := '1';
              GlobalOrNot := True;
            end;
        end;
      if GlobalOrNot = true then 
        begin
          for i := 0 to TownsNum do 
            if TownsFind[i] = '1' then
              begin
                RefreshCurrentTempInPanel(i,CorF);            
                Application.ProcessMessages;
              end;
        end
      else
        begin
          for i := 0 to TownsNum do 
            begin
              comp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(i));
              TsPanel(comp).SkinData.CustomColor := not TsPanel(comp).SkinData.CustomColor;
              TsPanel(comp).Repaint;
              Application.ProcessMessages;
            end;
          for i := 0 to TownsNum do 
            begin
              RefreshCurrentTempInPanel(i,CorF);            
              Application.ProcessMessages;
            end;
        end;
    end;
end;

Procedure GetWeatherData(num: Integer);
var
  Town_Ans: TStringList;
  TownHaveW: string;
  i,k,l: Integer;
  node: TXmlNode;
begin
  if FromCOTButton = true then
    begin
      UN := WOEID_List.Strings[num];
      if Conf.rb7.Checked then
        WS := 'c'
      else
        WS := 'f';
    end;
  if (Started = true) or ((Started = False) and (FromRButton = True))  then 
    begin
      UN := WeatherIni.ReadString('WOEID','town' + IntToStr(num),UN);
      WS := WeatherIni.ReadString('Symbol','town' + IntToStr(num),WS);
    end;
  if ((Started = False) and (FromCorFButton = True)) then
    begin
      UN := WeatherIni.ReadString('WOEID','town' + IntToStr(num),UN);
      WS := WS_CorF;    
    end;
  for i := 0 to 7 do
    CheckInTownInfo[i] := '';
  Town_Ans := TStringList.Create;
  Town_Ans.Add(Conf.IdHTTP1.Get('http://weather.yahooapis.com/forecastrss?w='+ UN +'&u=' + WS));
  Town_Ans.SaveToFile('media\widgets\weather\xml\'+UN + 'town.xml');
  Assigned_Weather;
  FXml_Weather.LoadFromFile('media\widgets\weather\xml\'+UN +'town.xml');
    with FXml_Weather.Root do
      for i := 0 to NodeCount - 1 do
        for K := 0 to Nodes[i].NodeCount - 1 do
          begin
            node := FXml_Weather.Root.Nodes[i].Nodes[k];
            if node.Name = 'title' then
              begin
                TownHaveW := node.Value;
                Break;
              end;
          end;
  if TownHaveW <> 'Yahoo! Weather - Error' then
    begin
      if FromCOTButton = True then
        Conf.sButton20.Visible := True;
      with FXml_Weather.Root do
        for i := 0 to NodeCount - 1 do
          for k := 0 to Nodes[i].NodeCount - 1 do
            begin
              node := FXml_Weather.Root.Nodes[i].Nodes[k];
              if node.Name = 'yweather:location' then
                begin
                  CheckInTownInfo[0] := node.ReadAttributeString('city');
                  CheckInTownInfo[1] := node.ReadAttributeString('country');
                  if FromCOTButton = True then
                    begin
                      Conf.sButton20.Caption :=  'Town : "'+ CheckInTownInfo[0] +'"';
                      Conf.sButton20.Caption := Conf.sButton20.Caption + #13#10 + 'Country : "'+ CheckInTownInfo[1] +'"';
                      Conf.sButton20.Caption := Conf.sButton20.Caption + #13#10 + '-----------------------------------------------------------------------';
                    end;
                end
              else if node.Name = 'yweather:astronomy' then
                begin
                  CheckInTownInfo[4] := node.ReadAttributeString('sunrise');
                  CheckInTownInfo[5] := node.ReadAttributeString('sunset');
                end;
              for l := 0 to Nodes[i].Nodes[k].NodeCount - 1 do
                begin
                  node := FXml_Weather.Root.Nodes[i].Nodes[k].Nodes[l];
                  if node.Name = 'yweather:condition' then
                    begin
                      CheckInTownInfo[2] := node.ReadAttributeString('temp');
                      CheckInTownInfo[3] := node.ReadAttributeString('date');
                      if FromCOTButton = True then 
                        begin
                          Conf.sButton20.Caption := Conf.sButton20.Caption + #13#10 + ' '+ #13#10 + 'DataTime : '+ CheckInTownInfo[3];
                          Conf.sButton20.Caption := Conf.sButton20.Caption + #13#10 + 'Temp : ' + CheckInTownInfo[2] + #13#10 + ' '+ #13#10;
                        end;                       
                      CheckInTownInfo[6] := node.ReadAttributeString('text');
                      CheckInTownInfo[7] := node.ReadAttributeString('code');  
                    end
                end;
            end;
      if Started = True then
        CreateWeatherPanel(num + 1);
    end
  else
    begin
      if Started = True then
        begin
          CheckInTownInfo[0] := 'Sorry No Forcast for this Town.';
          CreateWeatherPanel(num + 1);
        end;
      if FromCOTButton = True then 
        begin
          Conf.sButton20.Visible := True;
          Conf.sButton20.Caption := 'Sorry No Forcast for this Town.';
          CheckInTownInfo[0] := 'Sorry No Forcast for this Town.'
        end;
    end;
end;

procedure WeatherWheelAction(sWheelDelta: integer; sHandled: Boolean);
var
  PosNumber: Integer;
begin
  if sWheelDelta > 0 then
    with Conf.ScrollBox1.VertScrollBar do 
      begin
        PosNumber := Position - Conf.ScrollBox1.VertScrollBar.Increment;
        if PosNumber < 0 then 
          PosNumber := 0;
        Position := PosNumber;
      end;
  if sWheelDelta < 0 then 
    with Conf.ScrollBox1.VertScrollBar do
      begin
        PosNumber := Position + Conf.ScrollBox1.VertScrollBar.Increment;
        if PosNumber >= Conf.ScrollBox1.VertScrollBar.Range then
          PosNumber := Conf.ScrollBox1.VertScrollBar.Range - 1;
        Position := PosNumber;
      end;
  sHandled := True;
end;
  
/////////////////////////////////////////////////////////////////////

procedure Show_widget_weather;
begin
  if Cmenustate = 'wg_timedate' then
    wg_timedate_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn6.Caption,False,False);
  Cmenustate := 'wg_weather';
  wg_weather_ShowDynamicComps;
  ShowButtonDown(10,'WG_WEATHER');
  ShowHidePanel(CurrentPanel,'Pwg_weather');
end;

procedure wg_weather_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 2 do
    begin
      case i of
        1 : Image_Comp(Conf.Pwg_weather,'media\confeditor\images\weather\weather.png',
              3,596,155,57,i,'',True,False);
        2 : Image_Comp(Conf.Pwg_weather,'media\confeditor\images\weather\weather_image.png',
              573,381,153,280,i,'',True,False);
      end;
    end;
end;

procedure wg_weather_FreeDynamicComps;
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

end.
