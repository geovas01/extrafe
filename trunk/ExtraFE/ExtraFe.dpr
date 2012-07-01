program ExtraFe;

uses
  Forms,
  main in 'main.pas' {MainForm},
  used_pro in 'code\special\used_pro.pas',
  loadT in 'code\gui\loadT.pas',
  main_menu in 'code\gui\main_menu.pas',
  uSimpleAnimationsObjects in 'code\gui\uSImpleAnimationsObjects.pas',
  uTweener in 'code\gui\uTweener.pas',
  uGlSceneProfiler in 'code\gui\uGlSceneProfiler.pas',
  mame in 'code\arcade\mame.pas',
  uSimpleListBox in 'code\arcade\uSimpleListBox.pas',
  uSimplePanel in 'code\arcade\uSimplePanel.pas',
  uSimpleButton in 'code\gui\uSimpleButton.pas',
  uBaseButton in 'code\gui\uBaseButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExtraFE - Frontend for Emulators and not only...';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
