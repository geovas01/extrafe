unit ce_config;

interface

uses
  SysUtils,Classes,ExtCtrls,Graphics,
  NativeXml,NLDJoystick,
  JvgCheckBox,JvLED;

type 
  ButtonStringArray = array of string;
  
  
  procedure SetCE_ConfigFromConfigIni;
  procedure SaveCE_ConfigAtExit;


  procedure FirstTimeStart;
  procedure ReadConfiguration;

  procedure CheckShowHelpInFormCaption;
  procedure WindowsEffectsType;
  procedure CreateLog_For_All;
  procedure FoundAndSetJoystics;
  procedure ShowOrHideTestJoy1Area;
  procedure ShowOrHideTestJoy2Area;

  Procedure JoyAndButtonPressed(Button : TJoyButtons;joyID: integer);
  procedure TestPressButtonDownInAreaJoystics(Button : TJoyButtons; Joy: Integer); 
  procedure TestPressButtonUpInAreaJoystics(Button : TJoyButtons;joyId: integer);
  procedure TestJoyHandleInAreaJoystics(GetJoyState: TJoyRelPos);

// Menu actions
  procedure Show_confEditor_configurationpanel;
  procedure ce_config_ShowDynamicComps;
  procedure ce_config_FreeDynamicComps;

var
  FXml_CE: TNativeXml;
  CE_SHelpInCaption,CE_SHelpInMain: Boolean;
  WinEffectsType,Ce_XMLPath: string;
  WinEffectsTime,Inode_Ce,ThemeNumber: Integer;

implementation

uses
  main,mainconf,onflycomponents,FunctionX,menu,
  ce_wizard,ce_themes,form_splash;

var
  node: TXmlNode;

procedure SetCE_ConfigFromConfigIni;
begin
  StartSkinEngine;
  Splash_Screen.Show;
  CDirPath := Conf.Caption;
  CreateSTBarInfo;
  Splash_Screen.Progress_Label(5,'Info Created');
  HideAllPanels;
  Splash_Screen.Progress_Label(15,'ConfEditor initilisize');
  runMenuJustOpen;
  LoadStaticImages;
  LoadCostumCursors;
  Splash_Screen.Progress_Label(20,'Cursors OK');
end;

procedure SaveCE_ConfigAtExit;
begin
  if not Assigned(FXml_CE) then
    begin
      FXml_CE := TNativeXml.CreateName('confeditor');
      FXml_CE.XmlFormat := xfReadable;
    end;
  FXml_CE.Root.WriteAttributeString('Ver',STBarInfo[0]);
  node := FXml_CE.Root.NodeByName('rowconfig');
  node.WriteAttributeBool('HelpInCaption',CE_SHelpInCaption);
  node.WriteAttributeBool('HelpInMainMenu',CE_SHelpInMain);
  node.WriteAttributeString('WindowsEffects',WinEffectsType);
  node.WriteAttributeInteger('EffectsTime',WinEffectsTime);
  FXml_CE.SaveToFile(Ce_XMLPath);
end;

procedure FirstTimeStart;
begin
  FXml_CE := TNativeXml.CreateName('confEditor');
  FXml_CE.XmlFormat := xfReadable;
  FXml_CE.Root.WriteAttributeString('Ver',GetVersion(Program_Path + 'confeditor.exe'));
  STBarInfo[0] := GetVersion(Program_Path+'confeditor.exe');
  node := FXml_CE.Root.NodeNew('rowtheme');
  node.WriteAttributeInteger('ThemeNumber',0);
  node := FXml_CE.Root.NodeNew('rowconfig');
  node.WriteAttributeBool('HelpInCaption',True);
  node.WriteAttributeBool('HelpInMainMenu',True);
  node.WriteAttributeString('WindowsEffects','None');
  node.WriteAttributeInteger('EffectsTime',400);
  ThemeNumber := 0;
  CE_SHelpInCaption := True;
  CE_SHelpInMain := True;
  WinEffectsType := 'None';
  WinEffectsTime := 400;
  conf.sCheckBox1.Checked := CE_SHelpInMain;
  Conf.sCheckBox2.Checked := CE_SHelpInCaption;
  Conf.sComboBox74.ItemIndex  := Conf.sComboBox74.IndexOf(WinEffectsType);
  Conf.sComboBox74.Text := WinEffectsType;
  Started := True;
  WindowsEffectsType;
  Conf.se1.Value := WinEffectsTime;
  FXml_CE.SaveToFile(Ce_XMLPath);
end;

procedure ReadConfiguration;
begin
  FXml_CE := TNativeXml.CreateName('confeditor');
  FXml_CE.LoadFromFile(Ce_XMLPath);
  FXml_CE.XmlFormat := xfReadable;
  if FXml_CE.Root.ReadAttributeString('Ver','') <> GetVersion(Program_Path + 'confeditor.exe') then
    FXml_CE.Root.WriteAttributeString('Ver',GetVersion(Program_Path + 'confeditor.exe'));
  STBarInfo[0] := FXml_CE.Root.ReadAttributeString('Ver');
  if FileExists(Program_Path + 'extrafe.exe') then
    StBarInfo[1] := GetVersion('extrafe.exe')
  else
    StBarInfo[1] := 'Not Found';
  node := FXml_CE.Root.NodeByName('rowtheme');
  ThemeNumber := node.ReadAttributeInteger('ThemeNumber');
  node := FXml_CE.Root.NodeByName('rowconfig');
  CE_SHelpInCaption := node.ReadAttributeBool('HelpInCaption');
  CE_SHelpInMain := node.ReadAttributeBool('HelpInMainMenu');
  WinEffectsType := node.ReadAttributeString('WindowsEffects');
  WinEffectsTime := node.ReadAttributeInteger('EffectsTime');
  conf.sCheckBox1.Checked := CE_SHelpInMain;
  Conf.sCheckBox2.Checked := CE_SHelpInCaption;
  Conf.sComboBox74.ItemIndex  := Conf.sComboBox74.IndexOf(WinEffectsType);
  Conf.sComboBox74.Text := WinEffectsType;
  Started := True;
  WindowsEffectsType;
  Conf.se1.Value := WinEffectsTime;
end;

procedure CheckShowHelpInFormCaption;
begin
  CE_SHelpInCaption := Conf.sCheckBox2.Checked;
  if CE_SHelpInCaption then
    Conf.Caption := '"confEditor"    Path: ConfEditor>Configuration'
  else
    Conf.Caption := '"confEditor"';
  CDirPath := Conf.Caption;
end;

procedure WindowsEffectsType;
var
  WEffTypes: array [0..5] of string;
  k: Integer;
begin
  Randomize;
  for k := 0 to 5 do
    WEffTypes[k] := '';
  WEffTypes[0] := 'None';
  WEffTypes[1] := IntToStr($00000002);
  WEffTypes[2] := IntToStr($00000001);
  WEffTypes[3] := IntToStr($00000008);
  WEffTypes[4] := IntToStr($00000004);
  WEffTypes[5] := IntToStr($00000010);
  case Conf.sComboBox74.ItemIndex of
    0 : WinEffectsType := WEffTypes[0];
    1 : WinEffectsType := WEffTypes[1];
    2 : WinEffectsType := WEffTypes[2];
    3 : WinEffectsType := WEffTypes[3];
    4 : WinEffectsType := WEffTypes[4];
    5 : WinEffectsType := WEffTypes[3] + WEffTypes[1];
    6 : WinEffectsType := WEffTypes[3] + WEffTypes[2];
    7 : WinEffectsType := WEffTypes[4] + WEffTypes[1];
    8 : WinEffectsType := WEffTypes[4] + WEffTypes[2];
    9 : WinEffectsType := WEffTypes[5];
    10 : WinEffectsType := WEffTypes[Random(5)];
  end;
end;

procedure CreateLog_For_All;
var
  i: Integer;
  LogFile: TStringList;
begin
  LogFile := TStringList.Create;
  LogFile.Add('[Results for sPanel]');
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sPanel' + IntToStr(i)) <> nil then
        LogFile.Add('Conf.sPanel' + IntToStr(i) + ' is find')
      else
        LogFile.Add('Conf.sPanel' + IntToStr(i) + ' not find');
    end;
  LogFile.Add(' ');
  LogFile.Add('Results for sLabel');
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sLabel' + IntToStr(i)) <> nil then
        LogFile.Add('Conf.sLabel' + IntToStr(i) + ' is find')
      else
        LogFile.Add('Conf.slabel' + IntToStr(i) + ' not find');
    end;
  LogFile.Add(' ');
  LogFile.Add('Results for sCheckBox');
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sCheckBox' + IntToStr(i)) <> nil then
        LogFile.Add('Conf.sCheckBox' + IntToStr(i) + ' is find')
      else
        LogFile.Add('Conf.sCheckBox' + IntToStr(i) + ' not find');
    end;
  LogFile.Add(' ');
  LogFile.Add('Results for sComboBox');
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sComboBox' + IntToStr(i)) <> nil then
        LogFile.Add('Conf.sComboBox' + IntToStr(i) + ' is find')
      else
        LogFile.Add('Conf.sComboBox' + IntToStr(i) + ' not find');
    end;
  LogFile.Add(' ');
  LogFile.Add('Results for sEdit');
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sEdit' + IntToStr(i)) <> nil then
        LogFile.Add('Conf.sEdit' + IntToStr(i) + ' is find')
      else
        LogFile.Add('Conf.sEdit' + IntToStr(i) + ' not find');
    end;
  LogFile.Add(' ');
  LogFile.Add('Results for sBitBtn');
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sBitBtn' + IntToStr(i)) <> nil then
        LogFile.Add('Conf.sBitBtn' + IntToStr(i) + ' is find')
      else
        LogFile.Add('Conf.sBitBtn' + IntToStr(i) + ' not find');
    end;
  LogFile.Add(' ');
  LogFile.Add('Results for Radio Button');
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.rb' + IntToStr(i)) <> nil then
        LogFile.Add('Conf.rb' + IntToStr(i) + ' is find')
      else
        LogFile.Add('Conf.rb' + IntToStr(i) + ' not find');
    end;
  LogFile.Add(' ');
  LogFile.Add('Results for sButton');
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sButton' + IntToStr(i)) <> nil then
        LogFile.Add('Conf.sButton' + IntToStr(i) + ' is find')
      else
        LogFile.Add('Conf.sButton' + IntToStr(i) + ' not find');
    end;
  LogFile.SaveToFile('log.txt');
  LogFile.Free;
end;

procedure FoundAndSetJoystics;
var
  i: Integer;
begin
  Conf.CEJoy1.Active := True;
  if Conf.CEJoy1.Active = True then
    begin
      if Conf.CEJoy1.ButtonCount = 0 then
        begin
          Conf.L_FoundJoy1.Font.Color := clBlue;
          Conf.L_FoundJoy1.Caption := 'Virtual';
          Conf.sBitBtn112.Enabled := False;
          Conf.L_Joy1Id.Visible := False;
          Conf.L_Joy1Buttons.Visible := False;
          Conf.L_Joy1Axis.Visible := False;
          Conf.L_Joy1POV.Visible := False;
          Joy1Active := False;
        end
      else
        begin
          Conf.L_FoundJoy1.Font.Color := clgreen;
          Conf.L_FoundJoy1.Caption := 'OK';
          Conf.sBitBtn112.Enabled := True;
          Conf.CEJoy1.Advanced := True;
          Conf.L_Joy1Id.Caption := 'Joy ID : ' + IntToStr(Conf.CEJoy1.ID);
          Conf.L_Joy1Buttons.Caption := 'Joy Buttons : ' + IntToStr(Conf.CEJoy1.ButtonCount);
          Conf.L_Joy1Axis.Caption := 'Joy Axis : ' + IntToStr(Conf.CEJoy1.AxisCount);
          Conf.L_Joy1POV.Caption := 'Joy Has POV : ' + BoolToStr(Conf.CEJoy1.HasPOV);
          Conf.L_Joy1Id.Visible := True;
          Conf.L_Joy1Buttons.Visible := True;
          Conf.L_Joy1Axis.Visible := True;
          Conf.L_Joy1POV.Visible := True;
          Joy1Active := True;
        end;
    end
  else
    begin
      Conf.L_FoundJoy1.Font.Color := clRed;
      Conf.L_FoundJoy1.Caption := 'NO';
      Conf.sBitBtn112.Enabled := False;
      Conf.L_Joy1Id.Visible := False;
      Conf.L_Joy1Buttons.Visible := False;
      Conf.L_Joy1Axis.Visible := False;
      Conf.L_Joy1POV.Visible := False;
      Joy1Active := False;
    end;
  Conf.CEJoy2.Active := True;
  if Conf.CEJoy2.Active = True then
    begin
      if Conf.CEJoy2.ButtonCount = 0 then
        begin
          Conf.L_FoundJoy2.Font.Color := clBlue;
          Conf.L_FoundJoy2.Caption := 'Virtual';
          Conf.sBitBtn113.Enabled := False;
          Conf.L_Joy2Id.Visible := False;
          Conf.L_Joy2Buttons.Visible := False;
          Conf.L_Joy2Axis.Visible := False;
          Conf.L_Joy2POV.Visible := False;
          Joy2Active := False;
        end
      else
        begin
          Conf.L_FoundJoy2.Font.Color := clgreen;
          Conf.L_FoundJoy2.Caption := 'OK';
          Conf.sBitBtn113.Enabled := True;
          Conf.CEJoy2.Advanced := True;
          Conf.L_Joy2Id.Caption := 'Joy ID : ' + IntToStr(Conf.CEJoy2.ID);
          Conf.L_Joy2Buttons.Caption := 'Joy Buttons : ' + IntToStr(Conf.CEJoy2.ButtonCount);
          Conf.L_Joy2Axis.Caption := 'Joy Axis : ' + IntToStr(Conf.CEJoy2.AxisCount);
          Conf.L_Joy2POV.Caption := 'Joy Has POV : ' + BoolToStr(Conf.CEJoy2.HasPOV);
          Conf.L_Joy2Id.Visible := True;
          Conf.L_Joy2Buttons.Visible := True;
          Conf.L_Joy2Axis.Visible := True;
          Conf.L_Joy2POV.Visible := True;
          Joy2Active := True;
        end
    end
  else
    begin
      Conf.L_FoundJoy2.Font.Color := clRed;
      Conf.L_FoundJoy2.Caption := 'NO';
      Conf.sBitBtn113.Enabled := False;
      Conf.L_Joy2Id.Visible := False;
      Conf.L_Joy2Buttons.Visible := False;
      Conf.L_Joy2Axis.Visible := False;
      Conf.L_Joy2POV.Visible := False;
      Joy2Active := False;
    end;
  // For Hatari,pSX,KiGB
  if Joy1Active = True then
    begin
      Conf.sComboBox56.Items.Add('Joy ID 0');
      Conf.sComboBox21.Items.Add('Joy ID 0');
      Conf.sComboBox70.Items.Add('Joy ID 0');
      Conf.sComboBox71.Items.Add('Joy ID 0');
      for i := 0 to 31 do 
        Joy1Buttons[i] := '0';
    end;
  if Joy2Active = True then
    begin
      Conf.sComboBox56.Items.Add('Joy ID 1');
      Conf.sComboBox21.Items.Add('Joy ID 1');
      Conf.sComboBox70.Items.Add('Joy ID 1');
      Conf.sComboBox71.Items.Add('Joy ID 1');
      for i := 0 to 31 do 
        Joy2Buttons[i] := '0';
    end;
end;

Procedure JoyAndButtonPressed(Button : TJoyButtons; joyID: integer);
var
  Result: array [0..31] of string;
  i: Integer;
begin
  for i := 0 to 31 do 
    Result[i] := '0';
  if joybtn1 in Button then Result[0] := '1';
  if joybtn2 in Button then Result[1] := '1';
  if joybtn3 in Button then Result[2] := '1';
  if joybtn4 in Button then Result[3] := '1';
  if joybtn5 in Button then Result[4] := '1';
  if joybtn6 in Button then Result[5] := '1';
  if joybtn7 in Button then Result[6] := '1';
  if joybtn8 in Button then Result[7] := '1';
  if joybtn9 in Button then Result[8] := '1';
  if joybtn10 in Button then Result[9] := '1';
  if joybtn11 in Button then Result[10] := '1';
  if joybtn12 in Button then Result[11] := '1';
  if joybtn13 in Button then Result[12] := '1';
  if joybtn14 in Button then Result[13] := '1';
  if joybtn15 in Button then Result[14] := '1';
  if joybtn16 in Button then Result[15] := '1';
  if joybtn17 in Button then Result[16] := '1';
  if joybtn18 in Button then Result[17] := '1';
  if joybtn19 in Button then Result[18] := '1';
  if joybtn20 in Button then Result[19] := '1';
  if joybtn21 in Button then Result[20] := '1';
  if joybtn22 in Button then Result[21] := '1';
  if joybtn23 in Button then Result[22] := '1';
  if joybtn24 in Button then Result[23] := '1';
  if joybtn25 in Button then Result[24] := '1';
  if joybtn26 in Button then Result[25] := '1';
  if joybtn27 in Button then Result[26] := '1';
  if joybtn28 in Button then Result[27] := '1';
  if joybtn29 in Button then Result[28] := '1';
  if joybtn30 in Button then Result[29] := '1';
  if joybtn31 in Button then Result[30] := '1';
  if joybtn32 in Button then Result[31] := '1';  
  for i := 0 to 31 do 
    if joyID = 0 then    
      Joy1Buttons[i] := Result[i]
    else
      Joy2Buttons[i] := Result[i];
end;

procedure ShowOrHideTestJoy1Area;
var
  i: integer;
  comp: TComponent;
begin
  Conf.grp34.Visible := not Conf.grp34.Visible;
  if  Conf.grp34.Visible = True then
    begin
      for i := 0 to 31 do
      begin
        comp := FindComponentEx('Conf.JvgCheckBox' + IntToStr(i + 1));
        if Conf.CEJoy1.ButtonCount > i then
          TJvgCheckBox(comp).Enabled := True
        else
          TJvgCheckBox(comp).Enabled := False;
      end;
    end
end;

procedure ShowOrHideTestJoy2Area;
var
  i: integer;
  comp: TComponent;
begin
  Conf.grp34.Visible := not Conf.grp34.Visible;
  if  Conf.grp34.Visible = True then
    begin
      for i := 0 to 31 do
      begin
        comp := FindComponentEx('Conf.JvgCheckBox' + IntToStr(i + 1));
        if Conf.CEJoy2.ButtonCount > i then
          TJvgCheckBox(comp).Enabled := True
        else
          TJvgCheckBox(comp).Enabled := False;
      end;
    end;
end;

procedure TestPressButtonDownInAreaJoystics(Button : TJoyButtons; Joy: Integer);
var
  comp: TComponent;
  i: integer;
begin
  JoyAndButtonPressed(Button,Joy);
  for i := 0 to 31 do 
    begin  
      if Joy1Buttons[i] = '1' then 
        begin
          comp := FindComponentEx('Conf.JvgCheckBox' + IntToStr(i + 1));
          TJvgCheckBox(comp).Checked := True;
        end;
    end;
end;

procedure TestPressButtonUpInAreaJoystics(Button : TJoyButtons;joyId: integer);
var
  i: Integer;
  comp: TComponent;
begin
  JoyAndButtonPressed(Button,joyId);
  for i := 0 to 31 do 
    begin  
      if Joy1Buttons[i] = '0' then 
        begin
          comp := FindComponentEx('Conf.JvgCheckBox' + IntToStr(i + 1));
          TJvgCheckBox(comp).Checked := false;
        end;
    end;
end;

procedure TestJoyHandleInAreaJoystics(GetJoyState: TJoyRelPos);
  procedure setTheStateLeds(led: string);
  var
    i : Integer;
    LedNum: Byte;
    comp : TComponent;
  begin
    if led = 'center' then LedNum := 1;
    if led = 'up' then LedNum := 2;
    if led = 'down' then LedNum := 3;
    if led = 'right' then LedNum := 4;
    if led = 'left' then LedNum := 5;
    comp := FindComponentEx('Conf.JvLED' + IntToStr(LedNum));
    TJvLED(comp).Status := True;
    for i := 1 to 5 do
      if i <> LedNum  then
        begin
          comp := FindComponentEx('Conf.JvLED' + IntToStr(i));
          TJvLED(comp).Status := False;
        end;
  end;
begin
  if GetJoyState.X > 0 then
    setTheStateLeds('right')
  else if GetJoyState.X < 0 then
    setTheStateLeds('left')
  else if GetJoyState.Y > 0 then
    setTheStateLeds('down')
  else if GetJoyState.Y < 0 then
    setTheStateLeds('up');
end;

/////////////////////////////////////////////////////////////////////////////////
procedure ce_config_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pce_config,'media\confeditor\images\confeditor\confeditor.png',
              3,571,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pce_config,'media\confeditor\images\confeditor\confeditor_image.png',
              600,381,126,280,i,'',True,False);
        3 : Image_Comp(Conf.Pce_config,'media\confeditor\images\confeditor\configuration.png',
              499,2,230,71,i,'',True,False);
      end;
    end;
end;

procedure ce_config_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
end;

procedure Show_confEditor_configurationpanel;
begin
  if Cmenustate = 'startwizard' then
    ce_wizard_FreeDynamicComps
  else if Cmenustate = 'ce_themes' then
    ce_themes_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'ce_configuration';
  ce_config_ShowDynamicComps;
  ShowButtonDown(7,'CONFEDITOR_CONFIG');
  ShowHidePanel(CurrentPanel,'Pce_config');
end;

end.
