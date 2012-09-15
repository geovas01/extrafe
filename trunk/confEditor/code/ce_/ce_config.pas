unit ce_config;

interface

uses
  SysUtils,OmniXML,OmniXMLUtils,Classes,ExtCtrls;

  procedure CheckShowHelpInMainPanel;
  procedure CheckShowHelpInFormCaption;
  procedure WindowsEffectsType;
  procedure WindowsEffectsTimeChange;
  procedure CreateLog_For_All;

// Menu actions
  procedure Show_confEditor_configurationpanel;
  procedure ce_config_ShowDynamicComps;
  procedure ce_config_FreeDynamicComps;

implementation

uses
  main,mainconf,onflycomponents,FunctionX,menu,
  ce_wizard,ce_themes;

procedure CheckShowHelpInMainPanel;
begin
  CE_SHelpInMain := conf.sCheckBox1.Checked;
  Row_Config.HelpInMainMenu := CE_SHelpInMain;
  CeXML.SaveToFile(Ce_XMLPath,ofIndent);
end;

procedure CheckShowHelpInFormCaption;
begin
  CE_SHelpInCaption := Conf.sCheckBox2.Checked;
  Row_Config.HelpInCaption := CE_SHelpInCaption;
  CeXML.SaveToFile(Ce_XMLPath,ofIndent);
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
  if Started = False then
    begin
      Row_Config.WindowsEffects := Conf.sComboBox74.Items.Strings[Conf.sComboBox74.itemIndex];
      CeXML.SaveToFile(Ce_XMLPath,ofIndent);
    end;
end;

procedure WindowsEffectsTimeChange;
begin
  WinEffectsTime := Conf.se1.Value;
  Row_Config.EffectsTime := WinEffectsTime;
  CeXML.SaveToFile(Ce_XMLPath,ofIndent);
end;

procedure CreateLog_For_All;
var
  comp: TComponent;
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
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'ce_configuration';
  ce_config_ShowDynamicComps;
  ShowButtonDown(7,'CONFEDITOR_CONFIG');
  ShowHidePanel(CurrentPanel,'Pce_config');
end;

end.
