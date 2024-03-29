program confEditor;

{$R 'resfiles\bitbtn_glyphs\bitbtn_glyphs.res' 'resfiles\bitbtn_glyphs\bitbtn_glyphs.rc'}
{$R 'resfiles\menu_images\menu_images.res' 'resfiles\menu_images\menu_images.rc'}
{%ToDo 'confEditor.todo'}

uses
  Forms,
  Windows,
  Dialogs,
  main in 'code\main\main.pas' {Conf},
  mainconf in 'code\main\mainconf.pas',
  FunctionX in 'code\others\FunctionX.pas',
  wizard in 'code\others\wizard.pas' {FormWizard},
  menu in 'code\main\menu.pas',
  ce_themes in 'code\ce_\ce_themes.pas',
  mame_database in 'code\mame_\mame_database.pas',
  ce_config in 'code\ce_\ce_config.pas',
  mame_dirs in 'code\mame_\mame_dirs.pas',
  mame_graphics in 'code\mame_\mame_graphics.pas',
  mame_sound in 'code\mame_\mame_sound.pas',
  mame_others in 'code\mame_\mame_others.pas',
  mame_hlsl in 'code\mame_\mame_hlsl.pas',
  zinc_paths in 'code\zinc_\zinc_paths.pas',
  zinc_graphics in 'code\zinc_\zinc_graphics.pas',
  zinc_sound in 'code\zinc_\zinc_sound.pas',
  hatari_system in 'code\hatari_\hatari_system.pas',
  hatari_roms in 'code\hatari_\hatari_roms.pas',
  hatari_screen in 'code\hatari_\hatari_screen.pas',
  hatari_joy in 'code\hatari_\hatari_joy.pas',
  kigb_paths in 'code\kigb_\kigb_paths.pas',
  kigb_screen in 'code\kigb_\kigb_screen.pas',
  kigb_sound in 'code\kigb_\kigb_sound.pas',
  kigb_others in 'code\kigb_\kigb_others.pas',
  psx_paths in 'code\psx_\psx_paths.pas',
  psx_screen in 'code\psx_\psx_screen.pas',
  psx_sound in 'code\psx_\psx_sound.pas',
  psx_others in 'code\psx_\psx_others.pas',
  global in 'code\others\global.pas',
  form_splash in 'code\other_forms_\form_splash.pas' {Splash_Screen},
  form_general in 'code\other_forms_\form_general.pas' {FGeneral},
  zinc_database in 'code\zinc_\zinc_database.pas',
  onflycomponents in 'code\main\onflycomponents.pas',
  ce_wizard in 'code\ce_\ce_wizard.pas',
  exf_config in 'code\exf_\exf_config.pas',
  exf_themes in 'code\exf_\exf_themes.pas',
  wg_timedate in 'code\widgets_\wg_timedate.pas',
  wg_weather in 'code\widgets_\wg_weather.pas',
  hatari_paths in 'code\hatari_\hatari_paths.pas',
  hatari_database in 'code\hatari_\hatari_database.pas',
  psx_database in 'code\psx_\psx_database.pas',
  kigb_database in 'code\kigb_\kigb_database.pas',
  AnalogClock in 'code\widgets_\AnalogClock.pas',
  ce_logsession in 'code\ce_\ce_logsession.pas',
  form_search in 'code\other_forms_\form_search.pas' {fSearch};

var
  Map : THandle;
  
{$R *.res}

begin
  // Only one instance for your application.
  Map := CreateFileMapping($FFFFFFFF, nil, PAGE_READONLY, 0, 32, 'MyACMap');
  if Map = 0 then
    begin
      ShowMessage('Error memory allocation.');
      Halt;
    end
  else if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      ShowMessage('ConfEditor already running');
      Halt;
    end;

  Splash_Screen := TSplash_Screen.Create(Application);
  Application.Initialize;
  Splash_Screen.Update;
  Application.Title := 'confEditor - Configuration tool for ExtraFE';
  Application.CreateForm(TConf, Conf);
  Application.CreateForm(TFormWizard, FormWizard);
  Application.CreateForm(TFGeneral, FGeneral);
  Application.CreateForm(TfSearch, fSearch);
  Splash_Screen.JvBmpAnimator1.Active := False;
  Splash_Screen.Progress_Label(100,'ConfEditor Ready To Run');
  Sleep(1000);
  Splash_Screen.Hide;
  Splash_Screen.Free;
  Application.Run;
end.
