unit ce_config;

interface

uses
  SysUtils,Classes,ExtCtrls,
  NativeXml;

  procedure SetCE_ConfigFromConfigIni;
  procedure SaveCE_ConfigAtExit;


  procedure FirstTimeStart;
  procedure ReadConfiguration;

  procedure CheckShowHelpInFormCaption;
  procedure WindowsEffectsType;
  procedure CreateLog_For_All;

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
  STBarInfo[0] := 'Version : '+ GetVersion(Program_Path+'confeditor.exe');
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
  StBarInfo[1] := GetVersion('extrafe.exe');
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
