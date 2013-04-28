program ExtraFe;

{%ToDo 'ExtraFe.todo'}
{%File 'dlls\7z.dll'}
{%File 'dlls\bass.dll'}
{%File 'dlls\VampyreImaging.dll'}

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
  uSimplePanel in 'code\arcade\uSimplePanel.pas',
  uSimpleButton in 'code\gui\uSimpleButton.pas',
  uBaseButton in 'code\gui\uBaseButton.pas',
  uMain_ListBox in 'code\arcade\uMain_ListBox.pas',
  vitru_key in 'code\special\vitru_key.pas',
  zinc in 'code\arcade\zinc.pas',
  mame_res in 'code\arcade\mame_res.pas',
  zinc_res in 'code\arcade\zinc_res.pas',
  DSiWin32 in 'code\special\DSiWin32.pas',
  mame_upper in 'code\arcade\mame_upper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExtraFE - Frontend for Emulators and not only...';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
