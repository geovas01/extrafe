unit ce_config;

interface

uses
  SysUtils,OmniXML,OmniXMLUtils;

  procedure CheckShowHelpInMainPanel;
  procedure CheckShowHelpInFormCaption;
  procedure WindowsEffectsType;
  procedure WindowsEffectsTimeChange;

implementation

uses
  main,mainconf;

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
  if CE_SHelpInCaption = true then
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

end.
