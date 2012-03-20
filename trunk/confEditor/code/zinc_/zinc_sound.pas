unit zinc_sound;

interface
uses
  SysUtils;

  procedure Zinc_FilterEnabled;
  procedure Zinc_SurroundLiteEnabled;

implementation

uses
  main,mainconf;

procedure Zinc_FilterEnabled;
begin
  Conf.sEdit74.Enabled := Conf.sCheckBox84.Checked;
end;

procedure Zinc_SurroundLiteEnabled;
begin
  Conf.sEdit75.Enabled := Conf.sCheckBox85.Checked;
end;

end.
