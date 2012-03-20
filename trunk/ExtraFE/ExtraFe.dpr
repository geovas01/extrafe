program ExtraFe;

uses
  Forms,
  main in 'main.pas' {MainForm},
  used_pro in 'code\special\used_pro.pas',
  loadT in 'code\gui\loadT.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExtraFe';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
