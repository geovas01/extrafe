unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,StdCtrls,
  sBitBtn,sPanel,pngimage,
  ce_config,ce_themes,ce_wizard,
  exf_config,exf_themes,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_builds,mame_database,
  zinc_paths,zinc_graphics,zinc_sound,zinc_database,
  hatari_system,hatari_roms,hatari_screen,hatari_joy,hatari_paths,hatari_database,
  psx_screen,psx_sound,psx_others,psx_paths,psx_database,
  kigb_screen,kigb_sound,kigb_others,kigb_paths,kigb_database,
  wg_weather,wg_timedate;

  procedure runMenuJustOpen;
  procedure ShowCurrentMenu(howmany: Integer; BackButton: Boolean; MenuState: string;Image: Byte);
  procedure ShowButtonDown(Button: Byte; Image: String);
  procedure ShowMouseEnterButton(Button: Byte);
  procedure ShowMouseLeaveButton(Button: Byte);
  procedure DisableMenuButtons(What: Boolean);
  procedure ShowHidePanel(hidePanel,showPanel: string);
  procedure ShowPathInCaption(OldText,NewText:string;Back,trimw: Boolean);
  procedure ChangeStatusInfo;
  procedure CurrentStateSave;
  procedure ShowMenuImage(Name: string);

// All menu buttons
  procedure MenuBackButton;
  procedure MenuButton1;
  procedure MenuButton2;
  procedure MenuButton3;
  procedure MenuButton4;
  procedure MenuButton5;
  procedure MenuButton6;
  procedure MenuButton7;
  procedure MenuButton8;
  procedure MenuButton9;
  procedure MenuButton10;

var
  STBarMessages: Byte;
  STBarInfo1,STBarInfo2: String;

implementation
uses
  main,FunctionX,mainconf;

procedure runMenuJustOpen;
begin
  ShowCurrentMenu(3,False,Cmenustate,0);
end;

procedure ShowCurrentMenu(howmany: Integer; BackButton: Boolean; MenuState: string;Image: Byte);
var
  i,k: Integer;
  component: TComponent;
  MenuButtonsNames: array [0..9] of string;
  MenuBitBtnIcons: array [0..9] of string;
  BmpImage: TBitmap;
begin
  for i := 0 to howmany do
    begin
      MenuButtonsNames[i] := '';
      MenuBitBtnIcons[i] := '';
      component := FindComponentEx('Conf.sBitBtn'+inttostr(i+6));
      TsBitBtn(component).Glyph.Empty;
    end;
  if MenuState = '' then
    begin
      MenuButtonsNames[0] := 'ConfEditor';
      MenuButtonsNames[1] := 'ExtraFE';
      MenuButtonsNames[2] := 'Emulators';
      MenuButtonsNames[3] := 'Widgets';
      MenuBitBtnIcons[0] := 'GLYF_CONFEDITOR';
      MenuBitBtnIcons[1] := 'GLYF_EXTRAFE';
      MenuBitBtnIcons[2] := 'GLYF_EMULATORS';
      MenuBitBtnIcons[3] := 'GLYF_WIDGETS';
    end
  else if MenuState = 'confeditor' then
    begin
      MenuButtonsNames[0] := 'Start Wizard';
      MenuButtonsNames[1] := 'Configuration';
      MenuButtonsNames[2] := 'Themes';
      for k := 0 to 2 do
        MenuBitBtnIcons[k] := 'GLYF_CONFEDITOR';
    end
  else if MenuState = 'extrafe' then
    begin
      MenuButtonsNames[0] := 'Configuration';
      MenuButtonsNames[1] := 'Themes';
      for k := 0 to 1 do
        MenuBitBtnIcons[k] := 'GLYF_EXTRAFE';
    end
  else if MenuState = 'emulators' then
    begin
      MenuButtonsNames[0] := 'Arcade';
      MenuButtonsNames[1] := 'Computers';
      MenuButtonsNames[2] := 'Consoles';
      MenuButtonsNames[3] := 'Handhelds';
      MenuBitBtnIcons[0] := 'GLYF_EM_ARCADE';
      MenuBitBtnIcons[1] := 'GLYF_EM_COMPUTERS';
      MenuBitBtnIcons[2] := 'GLYF_EM_CONSOLES';
      MenuBitBtnIcons[3] := 'GLYF_EM_HANDHELDS';
    end
  else if MenuState = 'em_arcade' then
    begin
      MenuButtonsNames[0] := 'Mame';
      MenuButtonsNames[1] := 'Zinc';
      MenuBitBtnIcons[0] := 'GLYF_EM_ARCADE_MAME';
      MenuBitBtnIcons[1] := 'GLYF_EM_ARCADE_ZINC'; 
    end
  else if MenuState = 'em_arcade_mame' then
    begin
      MenuButtonsNames[0] := 'Directories';
      MenuButtonsNames[1] := 'Graphics';
      MenuButtonsNames[2] := 'Controllers/Sound';
      MenuButtonsNames[3] := 'Others';
      MenuButtonsNames[4] := 'Builds Extra/Tools';
      MenuButtonsNames[5] := 'Database';
      for k := 0 to 5 do
        MenuBitBtnIcons[k] := 'GLYF_EM_ARCADE_MAME';
    end
  else if MenuState = 'em_arcade_zinc' then
    begin
      MenuButtonsNames[0] := 'Paths';
      MenuButtonsNames[1] := 'Graphics';
      MenuButtonsNames[2] := 'Sound';
      MenuButtonsNames[3] := 'Database';
      for k := 0 to 3 do
        MenuBitBtnIcons[k] := 'GLYF_EM_ARCADE_ZINC';
    end
  else if MenuState = 'em_computers' then
    begin
      MenuButtonsNames[0] := 'Atari';
      MenuBitBtnIcons[0] := 'GLYF_EM_COMPUTERS_ATARI';
    end
  else if MenuState = 'em_computers_atari' then
    begin
      MenuButtonsNames[0] := 'Hatari';
      MenuBitBtnIcons[0] := 'GLYF_EM_COMPUTERS_ATARI_HATARI';
    end
  else if (MenuState = 'em_computers_hatari') then
    begin
      MenuButtonsNames[0] := 'Paths';
      MenuButtonsNames[1] := 'System';
      MenuButtonsNames[2] := 'Roms/Disks';
      MenuButtonsNames[3] := 'Screen/Sound';
      MenuButtonsNames[4] := 'Joystick/Keyboard';
      MenuButtonsNames[5] := 'Database';
      for k := 0 to 5 do
        MenuBitBtnIcons[k] := 'GLYF_EM_COMPUTERS_ATARI_HATARI';
    end
  else if MenuState = 'em_consoles' then
    begin
      MenuButtonsNames[0] := 'Sony';
      MenuBitBtnIcons[0] := 'GLYF_EM_CONSOLES_SONY';
    end
  else if MenuState = 'em_consoles_sony' then
    begin
      MenuButtonsNames[0] := 'pSXEmulator';
      MenuBitBtnIcons[0] := 'GLYF_EM_CONSOLES_SONY_PSX';
    end
  else if MenuState = 'em_consoles_sony_psx' then
    begin
      MenuButtonsNames[0] := 'Paths';
      MenuButtonsNames[1] := 'Screen';
      MenuButtonsNames[2] := 'Controllers/Sound';
      MenuButtonsNames[3] := 'Others';
      MenuButtonsNames[4] := 'Database';
      for k:= 0 to 4 do
        MenuBitBtnIcons[k] := 'GLYF_EM_CONSOLES_SONY_PSX';
    end
  else if MenuState = 'em_handheld' then
    begin
      MenuButtonsNames[0] := 'Nintendo';
      MenuBitBtnIcons[0] := 'GLYF_EM_HANDHELDS_NINTENDO';
    end
  else if MenuState = 'em_handheld_nintendo' then
    begin
      MenuButtonsNames[0] := 'Kigb';
      MenuBitBtnIcons[0] := 'GLYF_EM_HANDHELDS_NINTENDO_KIGB';
    end
  else if MenuState = 'em_handheld_kigb' then
    begin
      MenuButtonsNames[0] := 'Paths/System';
      MenuButtonsNames[1] := 'Screen';
      MenuButtonsNames[2] := 'Controllers/Sound';
      MenuButtonsNames[3] := 'Others';
      MenuButtonsNames[4] := 'Database';
      for k := 0 to 4 do
        MenuBitBtnIcons[k] := 'GLYF_EM_HANDHELDS_NINTENDO_KIGB';
    end
  else if MenuState = 'widgets' then
    begin
      MenuButtonsNames[0] := 'Weather';
      MenuButtonsNames[1] := 'Time/Date';
      for k := 0 to 1 do
        MenuBitBtnIcons[k] := 'GLYF_WIDGETS';
    end;
  Conf.sBitBtn16.Visible := BackButton;
  for i := 0 to howmany do
    begin
      component := FindComponentEx('Conf.sBitBtn'+inttostr(i+6));
      TsBitBtn(component).Visible := True;
      TsBitBtn(component).Caption := MenuButtonsNames[i];
      BmpImage := TBitmap.Create;
      BmpImage.LoadFromResourceName(HInstance,MenuBitBtnIcons[i]);
      TsBitBtn(component).Glyph := BmpImage;
      BmpImage.Free;
    end;
  for i := howmany+1 to 9 do
    begin
      component := FindComponentEx('Conf.sBitBtn'+inttostr(i+6));
      TsBitBtn(component).Visible := False;
    end;
  if MenuState <> '' then
    Conf.stat1.SetFocus;
end;

procedure ShowButtonDown(Button: Byte; Image: string);
var
  i : Byte;
  component: TComponent;
  BmpImage: TBitmap;
begin
  for i := 0 to 9 do
    begin
      component := FindComponentEx('Conf.sBitBtn'+inttostr(i+6));
      TsBitBtn(component).Down := False;
    end;
  case Button of
    6 : conf.sBitBtn6.Down := true;
    7 : conf.sBitBtn7.Down := true;
    8 : conf.sBitBtn8.Down := true;
    9 : conf.sBitBtn9.Down := true;
    10 : conf.sBitBtn10.Down := true;
    11 : conf.sBitBtn11.Down := true;
    12 : conf.sBitBtn12.Down := true;
    13 : conf.sBitBtn13.Down := true;
    14 : conf.sBitBtn14.Down := true;
    15 : conf.sBitBtn15.Down := true;
  end;
  BmpImage:= TBitmap.Create;
  BmpImage.LoadFromResourceName(HInstance,Image);
  Conf.Menu_Image.Bitmap := BmpImage;
  BmpImage.Free;
end;

procedure ShowMouseEnterButton(Button: Byte);
begin
  Case Button of
    6 : begin
          if (Cmenustate = '') then
            ShowMenuImage('CONFEDITOR')
          else if (Cmenustate = 'confeditor') or (Cmenustate = 'startwizard') or (Cmenustate = 'ce_configuration') or
            (Cmenustate = 'ce_themes') then
            ShowMenuImage('CONFEDITOR_WIZARD')
          else if (Cmenustate = 'extrafe') or (Cmenustate = 'exf_configuration') or (Cmenustate = 'exf_themes') then
            ShowMenuImage('EXTRAFE_CONFIG')
          else if (Cmenustate = 'emulators') then
            ShowMenuImage('EM_ARCADE')
          else if (Cmenustate = 'em_arcade') then
            ShowMenuImage('EM_ARCADE_MAME')
          else if (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_sound') or (Cmenustate = 'em_arcade_mame_others') or
            (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_database') or (Cmenustate = 'em_arcade_mame') then
            ShowMenuImage('EM_ARCADE_MAME_DIRS')
          else if (Cmenustate = 'em_arcade_zinc') or (Cmenustate = 'em_arcade_zinc_graphics') or (Cmenustate = 'em_arcade_zinc_sound') or (Cmenustate = 'em_arcade_zinc_database') then
            ShowMenuImage('EM_ARCADE_ZINC_DIRS')
          else if (Cmenustate = 'em_computers') then
            ShowMenuImage('EM_COMPUTERS_ATARI')
          else if (Cmenustate = 'em_computers_atari') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI')
          else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_roms') or (Cmenustate = 'em_computers_hatari_screen') or
            (Cmenustate = 'em_computers_hatari_joy') or (Cmenustate = 'em_computers_hatari_system') or (Cmenustate = 'em_computers_hatari_database') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_PATHS')
          else if (Cmenustate = 'em_consoles') then
            ShowMenuImage('EM_CONSOLES_SONY')
          else if (Cmenustate = 'em_consoles_sony') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX')
          else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_screen') or (Cmenustate = 'em_consoles_psx_sound') or
            (Cmenustate = 'em_consoles_psx_others') or (Cmenustate = 'em_consoles_psx_database') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_DIRS')
          else if Cmenustate = 'em_handheld' then
            ShowMenuImage('EM_HANDHELDS_NINTENDO')
          else if Cmenustate = 'em_handheld_nintendo' then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB')
          else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_kigb_screen') or (Cmenustate = 'em_kigb_sound') or
            (Cmenustate = 'em_kigb_others') or (Cmenustate = 'em_kigb_database') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DIRS')
          else if (Cmenustate = 'widgets') or (Cmenustate = 'wg_timedate') then
            ShowMenuImage('WG_WEATHER');
        end;
    7 : begin
          if (Cmenustate = '') then
            ShowMenuImage('EXTRAFE')
          else if (Cmenustate = 'confeditor') or (Cmenustate = 'startwizard') or
            (Cmenustate = 'ce_themes') then
            ShowMenuImage('CONFEDITOR_CONFIG')
          else if (Cmenustate = 'extrafe') or (Cmenustate = 'exf_configuration') or (Cmenustate = 'exf_themes') then
            ShowMenuImage('EXTRAFE_THEMES')
          else if (Cmenustate = 'emulators') then
            ShowMenuImage('EM_COMPUTERS')
          else if (Cmenustate = 'em_arcade') then
            ShowMenuImage('EM_ARCADE_ZINC')
          else if (Cmenustate = 'em_arcade_mame_paths') or (Cmenustate = 'em_arcade_mame_sound') or (Cmenustate = 'em_arcade_mame_others') or
            (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_database') or (Cmenustate = 'em_arcade_mame') then
            ShowMenuImage('EM_ARCADE_MAME_GRAPHICS')
          else if (Cmenustate = 'em_arcade_zinc') or (Cmenustate = 'em_arcade_zinc_paths') or (Cmenustate = 'em_arcade_zinc_sound') or (Cmenustate = 'em_arcade_zinc_database') then
            ShowMenuImage('EM_ARCADE_ZINC_GRAPHICS')
          else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_roms') or (Cmenustate = 'em_computers_hatari_screen') or
            (Cmenustate = 'em_computers_hatari_joy') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_database') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SYSTEM')
          else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_paths') or (Cmenustate = 'em_consoles_psx_sound') or
            (Cmenustate = 'em_consoles_psx_others') or (Cmenustate = 'em_consoles_psx_database') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_SCREEN')
          else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_kigb_paths') or (Cmenustate = 'em_kigb_sound') or
            (Cmenustate = 'em_kigb_others') or (Cmenustate = 'em_kigb_database') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SCREEN')
          else if (Cmenustate = 'widgets') or (Cmenustate = 'wg_weather') then
            ShowMenuImage('WG_TIMEDATE');
        end;
    8 : begin
          if (Cmenustate = '') then
            ShowMenuImage('EMULATORS')
          else if (Cmenustate = 'confeditor') or (Cmenustate = 'startwizard') or
            (Cmenustate = 'ce_configuration') then
            ShowMenuImage('CONFEDITOR_THEMES')
          else if (Cmenustate = 'emulators') then
            ShowMenuImage('EM_CONSOLES')
          else if (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_paths') or (Cmenustate = 'em_arcade_mame_others') or
            (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_database') or (Cmenustate = 'em_arcade_mame') then
            ShowMenuImage('EM_ARCADE_MAME_SOUND')
          else if (Cmenustate = 'em_arcade_zinc') or (Cmenustate = 'em_arcade_zinc_graphics') or (Cmenustate = 'em_arcade_zinc_paths') or (Cmenustate = 'em_arcade_zinc_database') then
            ShowMenuImage('EM_ARCADE_ZINC_SOUND')
          else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_screen') or (Cmenustate = 'em_computers_hatari_system') or
            (Cmenustate = 'em_computers_hatari_joy') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_database') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DISKS')
          else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_screen') or (Cmenustate = 'em_consoles_psx_paths') or
            (Cmenustate = 'em_consoles_psx_others') or (Cmenustate = 'em_consoles_psx_database') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_SOUND')
          else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_kigb_screen') or (Cmenustate = 'em_kigb_paths') or
            (Cmenustate = 'em_kigb_others') or (Cmenustate = 'em_kigb_database') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SOUND');
        end;
    9 : begin
          if (Cmenustate = '') then
            ShowMenuImage('WIDGETS')
          else if (Cmenustate = 'emulators') then
            ShowMenuImage('EM_HANDHELDS')
          else if (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_sound') or (Cmenustate = 'em_arcade_mame_paths') or
            (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_database') or (Cmenustate = 'em_arcade_mame') then
            ShowMenuImage('EM_ARCADE_MAME_OTHERS')
          else if (Cmenustate = 'em_arcade_zinc') or (Cmenustate = 'em_arcade_zinc_paths') or (Cmenustate = 'em_arcade_zinc_graphics') or (Cmenustate = 'em_arcade_zinc_sound') then
            ShowMenuImage('EM_ARCADE_ZINC_DATABASE')
          else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_roms') or (Cmenustate = 'em_computers_hatari_joy') or
            (Cmenustate = 'em_computers_hatari_system') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_database') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SCREEN')
          else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_screen') or (Cmenustate = 'em_consoles_psx_sound') or
            (Cmenustate = 'em_consoles_psx_paths') or (Cmenustate = 'em_consoles_psx_database') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_OTHERS')
          else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_kigb_screen') or (Cmenustate = 'em_kigb_sound') or
            (Cmenustate = 'em_kigb_paths') or (Cmenustate = 'em_kigb_database') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_OTHERS');
        end;
    10 :  begin
            if (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_sound') or (Cmenustate = 'em_arcade_mame_others') or
              (Cmenustate = 'em_arcade_mame_paths') or (Cmenustate = 'em_arcade_mame_database') or (Cmenustate = 'em_arcade_mame') then
              ShowMenuImage('EM_ARCADE_MAME_BUILDS')
            else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_roms') or (Cmenustate = 'em_computers_hatari_screen') or
            (Cmenustate = 'em_computers_hatari_system') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_database') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_JOY')
            else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_screen') or (Cmenustate = 'em_consoles_psx_sound') or
            (Cmenustate = 'em_consoles_psx_paths') or (Cmenustate = 'em_consoles_psx_others') then
              ShowMenuImage('EM_CONSOLES_SONY_PSX_DATABASE')
            else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_kigb_screen') or (Cmenustate = 'em_kigb_sound') or
            (Cmenustate = 'em_kigb_paths') or (Cmenustate = 'em_kigb_others') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DATABASE');
          end;
    11 :  begin
            if (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_sound') or (Cmenustate = 'em_arcade_mame_others') or
            (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_paths') or (Cmenustate = 'em_arcade_mame') then
              ShowMenuImage('EM_ARCADE_MAME_DATABASE')
            else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_roms') or (Cmenustate = 'em_computers_hatari_joy') or
            (Cmenustate = 'em_computers_hatari_system') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_screen') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DATABASE')
           end;
    12 :  begin

          end;
    13 :  begin

          end;
    14 :  begin

          end;
    15 :  begin

          end;
   end;
end;

procedure ShowMouseLeaveButton(Button: Byte);
begin
  Case Button of
    6 : begin
          if Cmenustate = 'widgets' then
            ShowMenuImage('WIDGETS')
          else if Cmenustate = 'wg_timedate' then
            ShowMenuImage('WG_TIMEDATE')
          else if Cmenustate = 'confeditor' then
            ShowMenuImage('CONFEDITOR')
          else if (Cmenustate = 'ce_configuration') then
            ShowMenuImage('CONFEDITOR_CONFIG')
          else if (Cmenustate = 'ce_themes') then
            ShowMenuImage('CONFEDITOR_THEMES')
          else if Cmenustate = 'extrafe' then
            ShowMenuImage('EXTRAFE')
          else if Cmenustate = 'exf_themes' then
            ShowMenuImage('EXTRAFE_THEMES')
          else if Cmenustate = 'emulators' then
            ShowMenuImage('EMULATORS')
          else if Cmenustate = 'em_arcade' then
            ShowMenuImage('EM_ARCADE')
          else if Cmenustate = 'em_arcade_mame' then
            ShowMenuImage('EM_ARCADE_MAME')
          else if Cmenustate = 'em_arcade_mame_graphics' then
            ShowMenuImage('EM_ARCADE_MAME_GRAPHICS')
          else if Cmenustate = 'em_arcade_mame_sound' then
            ShowMenuImage('EM_ARCADE_MAME_SOUND')
          else if Cmenustate = 'em_arcade_mame_others' then
            ShowMenuImage('EM_ARCADE_MAME_OTHERS')
          else if Cmenustate = 'em_arcade_mame_builds' then
            ShowMenuImage('EM_ARCADE_MAME_BUILDS')
          else if Cmenustate = 'em_arcade_mame_database' then
            ShowMenuImage('EM_ARCADE_MAME_DATABASE')
          else if Cmenustate = 'em_arcade_zinc' then
            ShowMenuImage('EM_ARCADE_ZINC')
          else if Cmenustate = 'em_arcade_zinc_graphics' then
            ShowMenuImage('EM_ARCADE_ZINC_GRAPHICS')
          else if Cmenustate = 'em_arcade_zinc_sound' then
            ShowMenuImage('EM_ARCADE_ZINC_SOUND')
          else if (Cmenustate = 'em_arcade_zinc_database') then
            ShowMenuImage('EM_ARCADE_ZINC_DATABASE')
          else if Cmenustate = 'em_computers' then
            ShowMenuImage('EM_COMPUTERS')
          else if (Cmenustate = 'em_computers_atari') then
            ShowMenuImage('EM_COMPUTERS_ATARI')
          else if (Cmenustate = 'em_computers_hatari') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI')
          else if (Cmenustate = 'em_computers_hatari_system') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SYSTEM')
          else if (Cmenustate = 'em_computers_hatari_roms') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DISKS')
          else if (Cmenustate = 'em_computers_hatari_screen') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SCREEN')
          else if (Cmenustate = 'em_computers_hatari_joy') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_JOY')
          else if (Cmenustate = 'em_computers_hatari_database') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DATABASE')
          else if (Cmenustate = 'em_consoles') then
            ShowMenuImage('EM_CONSOLES')
          else if (Cmenustate = 'em_consoles_sony') then
            ShowMenuImage('EM_CONSOLES_SONY')
          else if (Cmenustate = 'em_consoles_sony_psx') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX')
          else if (Cmenustate = 'em_consoles_psx_screen') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_SCREEN')
          else if (Cmenustate = 'em_consoles_psx_sound') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_SOUND')
          else if (Cmenustate = 'em_consoles_psx_others') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_OTHERS')
          else if (Cmenustate = 'em_consoles_psx_database') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_DATABASE')
          else if (Cmenustate = 'em_handheld') then
            ShowMenuImage('EM_HANDHELDS')
          else if (Cmenustate = 'em_handheld_nintendo') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO')
          else if (Cmenustate = 'em_handheld_kigb') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB')
          else if (Cmenustate = 'em_kigb_screen') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SCREEN')
          else if (Cmenustate = 'em_kigb_sound') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SOUND')
          else if (Cmenustate = 'em_kigb_others') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_OTHERS')
          else if (Cmenustate = 'em_kigb_database') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DATABASE');
        end;
    7 : begin
          if Cmenustate = 'widgets' then
            ShowMenuImage('WIDGETS')
          else if Cmenustate = 'wg_weather' then
            ShowMenuImage('WG_WEATHER')
          else if (Cmenustate = '') or (Cmenustate = 'confeditor') then
            ShowMenuImage('CONFEDITOR')
          else if (Cmenustate = 'startwizard') then
            ShowMenuImage('CONFEDITOR_WIZARD')
          else if (Cmenustate = 'ce_themes') then
            ShowMenuImage('CONFEDITOR_THEMES')
          else if Cmenustate = 'extrafe' then
            ShowMenuImage('EXTRAFE')
          else if Cmenustate = 'exf_configuration' then
            ShowMenuImage('EXTRAFE_CONFIG')
          else if Cmenustate = 'emulators' then
            ShowMenuImage('EMULATORS')
          else if Cmenustate = 'em_arcade' then
            ShowMenuImage('EM_ARCADE')
          else if Cmenustate = 'em_arcade_mame' then
            ShowMenuImage('EM_ARCADE_MAME')
          else if Cmenustate = 'em_arcade_mame_paths' then
            ShowMenuImage('EM_ARCADE_MAME_DIRS')
          else if Cmenustate = 'em_arcade_mame_sound' then
            ShowMenuImage('EM_ARCADE_MAME_SOUND')
          else if Cmenustate = 'em_arcade_mame_others' then
            ShowMenuImage('EM_ARCADE_MAME_OTHERS')
          else if Cmenustate = 'em_arcade_mame_builds' then
            ShowMenuImage('EM_ARCADE_MAME_BUILDS')
          else if Cmenustate = 'em_arcade_mame_database' then
            ShowMenuImage('EM_ARCADE_MAME_DATABASE')
          else if Cmenustate = 'em_arcade_zinc' then
            ShowMenuImage('EM_ARCADE_ZINC')
          else if Cmenustate = 'em_arcade_zinc_paths' then
            ShowMenuImage('EM_ARCADE_ZINC_DIRS')
          else if Cmenustate = 'em_arcade_zinc_sound' then
            ShowMenuImage('EM_ARCADE_ZINC_SOUND')
          else if (Cmenustate = 'em_arcade_zinc_database') then
            ShowMenuImage('EM_ARCADE_ZINC_DATABASE')
          else if (Cmenustate = 'em_computers_atari') then
            ShowMenuImage('EM_COMPUTERS_ATARI')
          else if (Cmenustate = 'em_computers_hatari') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI')
          else if (Cmenustate = 'em_computers_hatari_paths') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_PATHS')
          else if (Cmenustate = 'em_computers_hatari_roms') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DISKS')
          else if (Cmenustate = 'em_computers_hatari_screen') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SCREEN')
          else if (Cmenustate = 'em_computers_hatari_joy') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_JOY')
          else if (Cmenustate = 'em_computers_hatari_database') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DATABASE')
          else if (Cmenustate = 'em_consoles_sony_psx') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX')
          else if (Cmenustate = 'em_consoles_psx_paths') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_DIRS')
          else if (Cmenustate = 'em_consoles_psx_sound') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_SOUND')
          else if (Cmenustate = 'em_consoles_psx_others') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_OTHERS')
          else if (Cmenustate = 'em_consoles_psx_database') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_DATABASE')
          else if (Cmenustate = 'em_handheld_nintendo') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO')
          else if (Cmenustate = 'em_handheld_kigb') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB')
          else if (Cmenustate = 'em_kigb_paths') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DIRS')
          else if (Cmenustate = 'em_kigb_sound') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SOUND')
          else if (Cmenustate = 'em_kigb_others') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_OTHERS')
          else if (Cmenustate = 'em_kigb_database') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DATABASE');
        end;
    8 : begin
          if Cmenustate = 'weather' then
            ShowMenuImage('WEATHER')
          else if Cmenustate = 'timedate' then
            ShowMenuImage('TIMEDATE')
          else if (Cmenustate = '') or (Cmenustate = 'confeditor') then
            ShowMenuImage('CONFEDITOR')
          else if (Cmenustate = 'startwizard') then
            ShowMenuImage('CONFEDITOR_WIZARD')
          else if (Cmenustate = 'ce_configuration') then
            ShowMenuImage('CONFEDITOR_CONFIG')
          else if Cmenustate = 'emulators' then
            ShowMenuImage('EMULATORS')
          else if Cmenustate = 'em_arcade_mame' then
            ShowMenuImage('EM_ARCADE_MAME')
          else if Cmenustate = 'em_arcade_mame_graphics' then
            ShowMenuImage('EM_ARCADE_MAME_GRAPHICS')
          else if Cmenustate = 'em_arcade_mame_paths' then
            ShowMenuImage('EM_ARCADE_MAME_DIRS')
          else if Cmenustate = 'em_arcade_mame_others' then
            ShowMenuImage('EM_ARCADE_MAME_OTHERS')
          else if Cmenustate = 'em_arcade_mame_builds' then
            ShowMenuImage('EM_ARCADE_MAME_BUILDS')
          else if Cmenustate = 'em_arcade_mame_database' then
            ShowMenuImage('EM_ARCADE_MAME_DATABASE')
          else if Cmenustate = 'em_arcade_zinc' then
            ShowMenuImage('EM_ARCADE_ZINC')
          else if Cmenustate = 'em_arcade_zinc_graphics' then
            ShowMenuImage('EM_ARCADE_ZINC_GRAPHICS')
          else if Cmenustate = 'em_arcade_zinc_paths' then
            ShowMenuImage('EM_ARCADE_ZINC_DIRS')
          else if (Cmenustate = 'em_arcade_zinc_database') then
            ShowMenuImage('EM_ARCADE_ZINC_DATABASE')
          else if (Cmenustate = 'em_computers_atari') then
            ShowMenuImage('EM_COMPUTERS_ATARI')
          else if (Cmenustate = 'em_computers_hatari') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI')
          else if (Cmenustate = 'em_computers_hatari_paths') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_PATHS')
          else if (Cmenustate = 'em_computers_hatari_system') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SYSTEM')
          else if (Cmenustate = 'em_computers_hatari_screen') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SCREEN')
          else if (Cmenustate = 'em_computers_hatari_joy') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_JOY')
          else if (Cmenustate = 'em_computers_hatari_database') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DATABASE')
          else if (Cmenustate = 'em_consoles_sony_psx') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX')
          else if (Cmenustate = 'em_consoles_psx_screen') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_SCREEN')
          else if (Cmenustate = 'em_consoles_psx_paths') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_DIRS')
          else if (Cmenustate = 'em_consoles_psx_others') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_OTHERS')
          else if (Cmenustate = 'em_consoles_psx_database') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_DATABASE')
          else if (Cmenustate = 'em_handheld_nintendo') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO')
          else if (Cmenustate = 'em_handheld_kigb') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB')
          else if (Cmenustate = 'em_kigb_screen') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SCREEN')
          else if (Cmenustate = 'em_kigb_paths') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DIRS')
          else if (Cmenustate = 'em_kigb_others') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_OTHERS')
          else if (Cmenustate = 'em_kigb_database') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DATABASE');
        end;
    9 : begin
          if Cmenustate = 'timedate' then
            ShowMenuImage('TIMEDATE')
          else if Cmenustate = '' then
            ShowMenuImage('CONFEDITOR')
          else if Cmenustate = 'emulators' then
            ShowMenuImage('EMULATORS')
          else if Cmenustate = 'em_arcade_mame' then
            ShowMenuImage('EM_ARCADE_MAME')
          else if Cmenustate = 'em_arcade_mame_graphics' then
            ShowMenuImage('EM_ARCADE_MAME_GRAPHICS')
          else if Cmenustate = 'em_arcade_mame_sound' then
            ShowMenuImage('EM_ARCADE_MAME_SOUND')
          else if Cmenustate = 'em_arcade_mame_paths' then
            ShowMenuImage('EM_ARCADE_MAME_DIRS')
          else if Cmenustate = 'em_arcade_mame_builds' then
            ShowMenuImage('EM_ARCADE_MAME_BUILDS')
          else if Cmenustate = 'em_arcade_mame_database' then
            ShowMenuImage('EM_ARCADE_MAME_DATABASE')
          else if Cmenustate = 'em_arcade_zinc' then
            ShowMenuImage('EM_ARCADE_ZINC')
          else if Cmenustate = 'em_arcade_zinc_paths' then
            ShowMenuImage('EM_ARCADE_ZINC_DIRS')
          else if Cmenustate = 'em_arcade_zinc_graphics' then
            ShowMenuImage('EM_ARCADE_ZINC_GRAPHICS')
          else if Cmenustate = 'em_arcade_zinc_sound' then
            ShowMenuImage('EM_ARCADE_ZINC_SOUND')
          else if (Cmenustate = 'em_computers_atari') then
            ShowMenuImage('EM_COMPUTERS_ATARI')
          else if (Cmenustate = 'em_computers_hatari') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI')
          else if (Cmenustate = 'em_computers_hatari_paths') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_PATHS')
          else if (Cmenustate = 'em_computers_hatari_roms') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DISKS')
          else if (Cmenustate = 'em_computers_hatari_joy') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_JOY')
          else if (Cmenustate = 'em_computers_hatari_system') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SYSTEM')
          else if (Cmenustate = 'em_computers_hatari_database') then
            ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DATABASE')
          else if (Cmenustate = 'em_consoles_sony_psx') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX')
          else if (Cmenustate = 'em_consoles_psx_screen') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_SCREEN')
          else if (Cmenustate = 'em_consoles_psx_sound') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_SOUND')
          else if (Cmenustate = 'em_consoles_psx_paths') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_DIRS')
          else if (Cmenustate = 'em_consoles_psx_database') then
            ShowMenuImage('EM_CONSOLES_SONY_PSX_DATABASE')
          else if (Cmenustate = 'em_handheld_kigb') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB')
          else if (Cmenustate = 'em_kigb_screen') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SCREEN')
          else if (Cmenustate = 'em_kigb_sound') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SOUND')
          else if (Cmenustate = 'em_kigb_paths') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DIRS')
          else if (Cmenustate = 'em_kigb_database') then
            ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DATABASE');
        end;
    10 :  begin
            if Cmenustate = 'weather' then
              ShowMenuImage('WEATHER')
            else if Cmenustate = '' then
              ShowMenuImage('CONFEDITOR')
            else if Cmenustate = 'em_arcade_mame' then
              ShowMenuImage('EM_ARCADE_MAME')
            else if Cmenustate = 'em_arcade_mame_graphics' then
              ShowMenuImage('EM_ARCADE_MAME_GRAPHICS')
            else if Cmenustate = 'em_arcade_mame_sound' then
              ShowMenuImage('EM_ARCADE_MAME_SOUND')
            else if Cmenustate = 'em_arcade_mame_others' then
              ShowMenuImage('EM_ARCADE_MAME_OTHERS')
            else if Cmenustate = 'em_arcade_mame_paths' then
              ShowMenuImage('EM_ARCADE_MAME_DIRS')
            else if Cmenustate = 'em_arcade_mame_database' then
              ShowMenuImage('EM_ARCADE_MAME_DATABASE')
            else if (Cmenustate = 'em_computers_hatari') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI')
            else if (Cmenustate = 'em_computers_hatari_paths') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_PATHS')
            else if (Cmenustate = 'em_computers_hatari_roms') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DISKS')
            else if (Cmenustate = 'em_computers_hatari_screen') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SCREEN')
            else if (Cmenustate = 'em_computers_hatari_system') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SYSTEM')
            else if (Cmenustate = 'em_computers_hatari_database') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DATABASE')
            else if (Cmenustate = 'em_consoles_sony_psx') then
              ShowMenuImage('EM_CONSOLES_SONY_PSX')
            else if (Cmenustate = 'em_consoles_psx_screen') then
              ShowMenuImage('EM_CONSOLES_SONY_PSX_SCREEN')
            else if (Cmenustate = 'em_consoles_psx_sound') then
              ShowMenuImage('EM_CONSOLES_SONY_PSX_SOUND')
            else if (Cmenustate = 'em_consoles_psx_paths') then
              ShowMenuImage('EM_CONSOLES_SONY_PSX_DIRS')
            else if (Cmenustate = 'em_consoles_psx_others') then
              ShowMenuImage('EM_CONSOLES_SONY_PSX_OTHERS')
            else if (Cmenustate = 'em_handheld_kigb') then
              ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB')
            else if (Cmenustate = 'em_kigb_screen') then
              ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SCREEN')
            else if (Cmenustate = 'em_kigb_sound') then
              ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_SOUND')
            else if (Cmenustate = 'em_kigb_paths') then
              ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_DIRS')
            else if (Cmenustate = 'em_kigb_others') then
              ShowMenuImage('EM_HANDHELDS_NINTENDO_KIGB_OTHERS');
          end;
    11 :  begin
            if Cmenustate = 'em_arcade_mame' then
              ShowMenuImage('EM_ARCADE_MAME')
            else if Cmenustate = 'em_arcade_mame_graphics' then
              ShowMenuImage('EM_ARCADE_MAME_GRAPHICS')
            else if Cmenustate = 'em_arcade_mame_sound' then
              ShowMenuImage('EM_ARCADE_MAME_SOUND')
            else if Cmenustate = 'em_arcade_mame_others' then
              ShowMenuImage('EM_ARCADE_MAME_OTHERS')
            else if Cmenustate = 'em_arcade_mame_builds' then
              ShowMenuImage('EM_ARCADE_MAME_BUILDS')
            else if Cmenustate = 'em_arcade_mame_paths' then
              ShowMenuImage('EM_ARCADE_MAME_DIRS')
            else if (Cmenustate = 'em_computers_hatari') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI')
            else if (Cmenustate = 'em_computers_hatari_paths') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_PATHS')
            else if (Cmenustate = 'em_computers_hatari_roms') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_DISKS')
            else if (Cmenustate = 'em_computers_hatari_joy') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_JOY')
            else if (Cmenustate = 'em_computers_hatari_system') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SYSTEM')
            else if (Cmenustate = 'em_computers_hatari_screen') then
              ShowMenuImage('EM_COMPUTERS_ATARI_HATARI_SCREEN')
          end;
    12 :  begin

          end;
    13 :  begin

          end;
    14 :  begin

          end;
    15 :  begin

          end;
   end;
end;

procedure MenuBackButton;
begin
  showHidePanel(CurrentPanel,'');
  if (Cmenustate = 'confeditor') or (Cmenustate = 'startwizard') or (Cmenustate = 'ce_configuration') or
    (Cmenustate = 'ce_themes') or (Cmenustate = 'extrafe') or (Cmenustate = 'exf_configuration') or
    (Cmenustate = 'exf_themes') or (Cmenustate = 'emulators') or (Cmenustate = 'widgets') or
    (Cmenustate = 'wg_weather') or (Cmenustate = 'wg_timedate')then
    begin
      if Cmenustate = 'ce_configuration' then
        ce_config_FreeDynamicComps
      else if Cmenustate = 'startwizard' then
        ce_wizard_FreeDynamicComps
      else if Cmenustate = 'ce_themes' then
        ce_themes_FreeDynamicComps
      else if Cmenustate = 'exf_configuration' then
        exf_config_FreeDynamicComps
      else if Cmenustate = 'exf_themes' then
        exf_themes_FreeDynamicComps
      else if Cmenustate = 'wg_weather' then
        wg_weather_FreeDynamicComps
      else if Cmenustate = 'wg_timedate' then
        wg_timedate_FreeDynamicComps;
      ShowPathInCaption(CDirPath,'',True,False);
      Cmenustate := '';
      runMenuJustOpen;
      ShowButtonDown(16,'CONFEDITOR');
    end
  else if (Cmenustate = 'em_arcade') or (Cmenustate = 'em_computers') or (Cmenustate = 'em_consoles') or
    (Cmenustate = 'em_handheld') then
    begin
      ShowPathInCaption(CDirPath,'1',True,False);
      Cmenustate := 'emulators';
      ShowCurrentMenu(3,True,Cmenustate,3);
      ShowButtonDown(16,'EMULATORS');    
    end
  else if (Cmenustate = 'em_arcade_mame') or (Cmenustate = 'em_arcade_zinc') then
    begin
      ShowPathInCaption(CDirPath,'Mame',True,False);
      Cmenustate := 'em_arcade';
      ShowCurrentMenu(1,True,Cmenustate,5);
      ShowButtonDown(16,'EM_ARCADE');
    end
  else if (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_sound') or (Cmenustate = 'em_arcade_mame_database') or
     (Cmenustate = 'em_arcade_mame_others') or (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_paths') then
    begin
      if Cmenustate = 'em_arcade_mame_paths' then
        em_mame_dirs_FreeDynamicComps
      else if Cmenustate = 'em_arcade_mame_graphics' then
        em_mame_graphics_FreeDynamicComps
      else if Cmenustate = 'em_arcade_mame_sound' then
        em_mame_sound_FreeDynamicComps
      else if Cmenustate = 'em_arcade_mame_others' then
        em_mame_others_FreeDynamicComps
      else if Cmenustate = 'em_arcade_mame_builds' then
        em_mame_builds_FreeDynamicComps
      else if Cmenustate = 'em_arcade_mame_database' then
        em_mame_database_FreeDynamicComps;
      CurrentStateSave;
      ShowPathInCaption(CDirPath,'Mame',True,True);
      Cmenustate := 'em_arcade';
      ShowCurrentMenu(1,True,Cmenustate,5);
      ShowButtonDown(16,'EM_ARCADE');
    end
  else if (Cmenustate = 'em_arcade_zinc_paths') or (Cmenustate ='em_arcade_zinc_graphics') or (Cmenustate = 'em_arcade_zinc_sound') or
    (Cmenustate = 'em_arcade_zinc_database') then
    begin
      if Cmenustate = 'em_arcade_zinc_paths' then
        em_zinc_paths_FreeDynamicComps
      else if Cmenustate = 'em_arcade_zinc_graphics' then
        em_zinc_graphics_FreeDynamicComps
      else if Cmenustate = 'em_arcade_zinc_sound' then
        em_zinc_sound_FreeDynamicComps
      else if Cmenustate = 'em_arcade_zinc_database' then
        em_zinc_database_FreeDynamicComps;
      CurrentStateSave;
      ShowPathInCaption(CDirPath,'Zinc',True,True);
      Cmenustate := 'em_arcade';
      ShowCurrentMenu(1,True,Cmenustate,5);
      ShowButtonDown(16,'EM_ARCADE');
    end
  else if (Cmenustate = 'em_computers_atari') then
    begin
      ShowPathInCaption(CDirPath,'1',True,False);
      Cmenustate := 'em_computers';
      ShowCurrentMenu(0,True,Cmenustate,15);
    end
  else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_roms') or (Cmenustate = 'em_computers_hatari_screen') or
    (Cmenustate = 'em_computers_hatari_joy') or (Cmenustate = 'em_computers_hatari_system') or (Cmenustate = 'em_computers_hatari_paths') or
    (Cmenustate = 'em_computers_hatari_database') then
    begin
      if (Cmenustate = 'em_computers_hatari_paths') then
        em_hatari_paths_FreeDynamicComps
      else if Cmenustate = 'em_computers_hatari_system' then
        em_hatari_system_FreeDynamicComps
      else if Cmenustate = 'em_computers_hatari_roms' then
        em_hatari_roms_FreeDynamicComps
      else if Cmenustate = 'em_computers_hatari_screen' then
        em_hatari_screen_FreeDynamicComps
      else if Cmenustate = 'em_computers_hatari_joy' then
        em_hatari_joy_FreeDynamicComps
      else if (Cmenustate = 'em_computers_hatari_database') then
        em_hatari_database_FreeDynamicComps;
      ShowPathInCaption(CDirPath,'Hatari',True,True);
      Cmenustate := 'em_computers_atari';
      ShowCurrentMenu(0,True,Cmenustate,14);
      ShowButtonDown(16,'EM_COMPUTERS_ATARI');
    end
  else if (Cmenustate = 'em_consoles_sony') then
    begin
      ShowPathInCaption(CDirPath,'1',True,False);
      Cmenustate := 'em_consoles';
      ShowCurrentMenu(0,True,Cmenustate,4);
    end
  else if (Cmenustate = 'em_consoles_sony_psx') then
    begin
      ShowPathInCaption(CDirPath,'1',True,False);
      Cmenustate := 'em_consoles_sony';
      ShowCurrentMenu(0,True,Cmenustate,19);
      ShowButtonDown(16,'EM_CONSOLES_SONY');    
    end
  else if (Cmenustate = 'em_consoles_psx_paths') or (Cmenustate = 'em_consoles_psx_screen') or
    (Cmenustate = 'em_consoles_psx_sound') or (Cmenustate = 'em_consoles_psx_others' ) or (Cmenustate = 'em_consoles_psx_database') then
    begin
      if Cmenustate = 'em_consoles_psx_paths' then
        em_psx_paths_FreeDynamicComps
      else if Cmenustate = 'em_consoles_psx_screen' then
        em_psx_screen_FreeDynamicComps
      else if Cmenustate = 'em_consoles_psx_sound' then
        em_psx_sound_FreeDynamicComps
      else if Cmenustate = 'em_consoles_psx_others' then
        em_psx_others_FreeDynamicComps
      else if Cmenustate = 'em_consoles_psx_database' then
        em_psx_database_FreeDynamicComps;
      ShowPathInCaption(CDirPath,'pSXEmulator',True,True);
      Cmenustate := 'em_consoles_sony';
      ShowCurrentMenu(0,True,Cmenustate,19);
      ShowButtonDown(16,'EM_CONSOLES_SONY');
    end
  else if (Cmenustate = 'em_handheld_nintendo') then
    begin
      ShowPathInCaption(CDirPath,'1',True,False);
      Cmenustate := 'em_handheld';
      ShowCurrentMenu(0,True,Cmenustate,16);
    end
  else if (Cmenustate = 'em_handheld_kigb') then
    begin
      ShowPathInCaption(CDirPath,'1',True,False);
      Cmenustate := 'em_handheld_nintendo';
      ShowCurrentMenu(0,True,Cmenustate,18);
      ShowButtonDown(16,'EM_HANDHELDS_NINTENDO');
    end
  else if (Cmenustate = 'em_handheld_kigb_paths') or (Cmenustate = 'em_handheld_kigb_screen') or (Cmenustate = 'em_handheld_kigb_sound') or
    (Cmenustate = 'em_handheld_kigb_others') or (Cmenustate = 'em_handheld_kigb_database') then
    begin
      if Cmenustate = 'em_handheld_kigb_paths' then
        em_kigb_paths_FreeDynamicComps
      else if Cmenustate = 'em_handheld_kigb_screen' then
        em_kigb_screen_FreeDynamicComps
      else if Cmenustate = 'em_handheld_kigb_sound' then
        em_kigb_sound_FreeDynamicComps
      else if Cmenustate = 'em_handheld_kigb_others' then
        em_kigb_others_FreeDynamicComps
      else if Cmenustate = 'em_handheld_kigb_database' then
        em_kigb_database_FreeDynamicComps;
      ShowPathInCaption(CDirPath,'Kigb',True,True);
      Cmenustate := 'em_handheld_nintendo';
      ShowCurrentMenu(0,True,Cmenustate,18);
      ShowButtonDown(16,'EM_HANDHELDS_NINTENDO');
    end
end;

procedure MenuButton1;
begin
  if (Cmenustate = '') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn6.Caption,False,False);
      ShowHidePanel(CurrentPanel,'');
      Cmenustate := 'confeditor';
      ShowCurrentMenu(2,True,Cmenustate,0);
      ShowButtonDown(16,'CONFEDITOR');
    end
  else if (Cmenustate = 'confeditor') or (Cmenustate = 'ce_configuration') or (Cmenustate = 'ce_themes') then
    Show_confEditor_wizardpanel
  else if (Cmenustate = 'extrafe') or (Cmenustate = 'exf_themes') then
    Show_ExtraFe_configurationpanel
  else if (Cmenustate = 'emulators') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn6.Caption,False,False);
      Cmenustate := 'em_arcade';
      ShowCurrentMenu(1,True,Cmenustate,5);
    end
  else if (Cmenustate = 'em_arcade') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn6.Caption,False,False);
      Cmenustate := 'em_arcade_mame';
      ShowCurrentMenu(5,True,Cmenustate,6);
    end
  else if (Cmenustate = 'em_arcade_zinc') or (Cmenustate = 'em_arcade_zinc_graphics') or (Cmenustate = 'em_arcade_zinc_sound') or
    (Cmenustate = 'em_arcade_zinc_database') then
    Show_zinc_pathspanel
  else if (Cmenustate = 'em_arcade_mame') or (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_sound') or
     (Cmenustate = 'em_arcade_mame_others') or (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_database')  then
    Show_mame_dirspanel
  else if (Cmenustate = 'em_computers') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn6.Caption,False,False);
      Cmenustate := 'em_computers_atari';
      ShowCurrentMenu(0,True,Cmenustate,14);
    end
  else if (Cmenustate = 'em_computers_atari') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn6.Caption,False,False);
      Cmenustate := 'em_computers_hatari';
      ShowCurrentMenu(5,True,Cmenustate,17);
    end
  else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_roms') or (Cmenustate = 'em_computers_hatari_screen') or
    (Cmenustate = 'em_computers_hatari_joy') or (Cmenustate = 'em_computers_hatari_system') or (Cmenustate = 'em_computers_hatari_database') then
    Show_hatari_pathspanel
  else if (Cmenustate = 'em_consoles') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn6.Caption,False,False);
      Cmenustate := 'em_consoles_sony';
      ShowCurrentMenu(0,True,Cmenustate,19);
    end
  else if (Cmenustate = 'em_consoles_sony') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn6.Caption,False,False);
      Cmenustate := 'em_consoles_sony_psx';
      ShowCurrentMenu(4,True,Cmenustate,7);
    end
  else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_screen') or (Cmenustate = 'em_consoles_psx_sound') or
    (Cmenustate = 'em_consoles_psx_others') or (Cmenustate = 'em_consoles_psx_database') then
    Show_psx_pathspanel
  else if (Cmenustate = 'em_handheld') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn6.Caption,False,False);
      Cmenustate := 'em_handheld_nintendo';
      ShowCurrentMenu(0,True,Cmenustate,18);
    end
  else if (Cmenustate = 'em_handheld_nintendo') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn6.Caption,False,False);
      Cmenustate := 'em_handheld_kigb';
      ShowCurrentMenu(4,True,Cmenustate,21);
    end
  else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_handheld_kigb_screen') or (Cmenustate = 'em_handheld_kigb_sound') or
    (Cmenustate = 'em_handheld_kigb_others') or (Cmenustate = 'em_handheld_kigb_database') then
    Show_kigb_pathspanel
  else if (Cmenustate = 'widgets') or (Cmenustate = 'wg_timedate') then
    Show_widget_weather;
end;

procedure MenuButton2;
begin
  if (Cmenustate = '') then
    begin
      ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,False);
      ShowHidePanel(CurrentPanel,'');
      Cmenustate := 'extrafe';
      ShowCurrentMenu(1,True,Cmenustate,1);
      ShowButtonDown(16,'EXTRAFE');
    end
  else if (Cmenustate = 'confeditor') or (Cmenustate = 'startwizard') or (Cmenustate = 'ce_themes') then
    Show_confEditor_configurationpanel
  else if (Cmenustate = 'extrafe') or (Cmenustate = 'exf_configuration') then
    Show_ExtraFe_themespanel
  else if (Cmenustate = 'em_arcade') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn7.Caption,False,False);
      Cmenustate := 'em_arcade_zinc';
      ShowCurrentMenu(3,True,Cmenustate,20);
    end
  else if (Cmenustate = 'em_arcade_zinc') or (Cmenustate = 'em_arcade_zinc_paths') or (Cmenustate = 'em_arcade_zinc_sound') or
    (Cmenustate = 'em_arcade_zinc_database') then
    Show_zinc_graphicspanel
  else if (Cmenustate = 'em_arcade_mame') or (Cmenustate = 'em_arcade_mame_paths') or (Cmenustate = 'em_arcade_mame_sound') or
     (Cmenustate = 'em_arcade_mame_others') or (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_database')  then
    Show_mame_graphicspanel
  else if (Cmenustate = 'emulators') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn7.Caption,False,False);
      Cmenustate := 'em_computers';
      ShowCurrentMenu(0,True,Cmenustate,15); 
    end
  else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_roms') or (Cmenustate = 'em_computers_hatari_screen') or
    (Cmenustate = 'em_computers_hatari_joy') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_database') then
    Show_hatari_systempanel
  else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_paths') or (Cmenustate = 'em_consoles_psx_sound') or
    (Cmenustate = 'em_consoles_psx_others') or (Cmenustate = 'em_consoles_psx_database') then
    Show_psx_screenpanel
  else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_handheld_kigb_paths') or (Cmenustate = 'em_handheld_kigb_sound') or
    (Cmenustate = 'em_handheld_kigb_others') or (Cmenustate = 'em_handheld_kigb_database') then
    Show_kigb_screenpanel
  else if (Cmenustate = 'widgets') or (Cmenustate = 'wg_weather') then
    Show_widget_timedate;
end;

procedure MenuButton3;
begin
  if (Cmenustate = '') then
    begin
      ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,False);
      ShowHidePanel(CurrentPanel,'');
      Cmenustate := 'emulators';
      ShowCurrentMenu(3,True,Cmenustate,3);
      ShowButtonDown(16,'EMULATORS');
    end
  else if (Cmenustate = 'confeditor') or (Cmenustate = 'startwizard') or (Cmenustate = 'ce_configuration') then
    Show_confEditor_themespanel
  else if (Cmenustate = 'em_arcade_zinc') or (Cmenustate = 'em_arcade_zinc_graphics') or (Cmenustate = 'em_arcade_zinc_paths') or
    (Cmenustate = 'em_arcade_zinc_database') then
    Show_zinc_soundpanel
  else if (Cmenustate = 'em_arcade_mame') or (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_paths') or
     (Cmenustate = 'em_arcade_mame_others') or (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_database')  then
    Show_mame_soundpanel
  else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_screen') or (Cmenustate = 'em_computers_hatari_system') or
    (Cmenustate = 'em_computers_hatari_joy') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_database') then
    Show_hatari_romspanel
  else if (Cmenustate = 'emulators') then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn8.Caption,False,False);
      Cmenustate := 'em_consoles';
      ShowCurrentMenu(0,True,Cmenustate,4);
    end
  else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_screen') or (Cmenustate = 'em_consoles_psx_paths') or
    (Cmenustate = 'em_consoles_psx_others') or (Cmenustate = 'em_consoles_psx_database') then
    Show_psx_soundpanel
  else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_handheld_kigb_screen') or (Cmenustate = 'em_handheld_kigb_paths') or
    (Cmenustate = 'em_handheld_kigb_others') or (Cmenustate = 'em_handheld_kigb_database') then
    Show_kigb_soundpanel;
end;

procedure MenuButton4;
begin
  if (Cmenustate = '') then
    begin
      ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,False);
      ShowHidePanel(CurrentPanel,'');
      Cmenustate := 'widgets';
      ShowCurrentMenu(1,True,Cmenustate,1);
      ShowButtonDown(16,'WIDGETS');
    end
  else if (Cmenustate = 'em_arcade_mame') or (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_sound') or
     (Cmenustate = 'em_arcade_mame_paths') or (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_database')  then
    Show_mame_otherspanel
  else if (Cmenustate = 'em_arcade_zinc') or (Cmenustate = 'em_arcade_zinc_paths') or
   (Cmenustate = 'em_arcade_zinc_graphics') or (Cmenustate = 'em_arcade_zinc_sound') then
    Show_zinc_databasepanel
  else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_roms') or (Cmenustate = 'em_computers_hatari_joy') or
    (Cmenustate = 'em_computers_hatari_system') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_database') then
    Show_hatari_screenpanel
  else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_screen') or (Cmenustate = 'em_consoles_psx_sound') or
    (Cmenustate = 'em_consoles_psx_paths') or (Cmenustate = 'em_consoles_psx_database') then
    Show_psx_otherspanel
  else if Cmenustate = 'emulators' then
    begin
      ShowPathInCaption(CDirPath,conf.sBitBtn9.Caption,False,False);
      Cmenustate := 'em_handheld';
      ShowCurrentMenu(0,True,Cmenustate,16);
    end
  else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_handheld_kigb_screen') or (Cmenustate = 'em_handheld_kigb_sound') or
    (Cmenustate = 'em_handheld_kigb_paths') or (Cmenustate = 'em_handheld_kigb_database') then
    Show_kigb_otherspanel;
end;

procedure MenuButton5;
begin
  if (Cmenustate = 'em_arcade_mame') or (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_sound') or
     (Cmenustate = 'em_arcade_mame_others') or (Cmenustate = 'em_arcade_mame_paths') or (Cmenustate = 'em_arcade_mame_database')  then
    Show_mame_buildspanel
  else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_roms') or
    (Cmenustate = 'em_computers_hatari_system') or (Cmenustate = 'em_computers_hatari_screen') or (Cmenustate = 'em_computers_hatari_database') then
    Show_hatari_joypanel
  else if (Cmenustate = 'em_consoles_sony_psx') or (Cmenustate = 'em_consoles_psx_screen') or (Cmenustate = 'em_consoles_psx_sound') or
    (Cmenustate = 'em_consoles_psx_paths') or (Cmenustate = 'em_consoles_psx_others') then
    Show_psx_databasepanel
  else if (Cmenustate = 'em_handheld_kigb') or (Cmenustate = 'em_handheld_kigb_screen') or (Cmenustate = 'em_handheld_kigb_sound') or
    (Cmenustate = 'em_handheld_kigb_paths') or (Cmenustate = 'em_handheld_kigb_others') then
    Show_kigb_databasespanel;

end;

procedure MenuButton6;
begin
  if (Cmenustate = 'em_arcade_mame') or (Cmenustate = 'em_arcade_mame_graphics') or (Cmenustate = 'em_arcade_mame_sound') or
     (Cmenustate = 'em_arcade_mame_others') or (Cmenustate = 'em_arcade_mame_builds') or (Cmenustate = 'em_arcade_mame_paths')  then
    Show_mame_databasepanel
  else if (Cmenustate = 'em_computers_hatari') or (Cmenustate = 'em_computers_hatari_paths') or (Cmenustate = 'em_computers_hatari_roms') or
    (Cmenustate = 'em_computers_hatari_system') or (Cmenustate = 'em_computers_hatari_screen') or (Cmenustate = 'em_computers_hatari_joy') then
    Show_hatari_databasepanel;

end;

procedure MenuButton7;
begin

end;

procedure MenuButton8;
begin

end;

procedure MenuButton9;
begin

end;

procedure MenuButton10;
begin

end;

procedure ShowHidePanel(hidePanel,showPanel: string);
var
  component: TComponent;
begin
  if hidePanel <> '' then
    begin
      component := FindComponentEx('Conf.'+hidePanel);
      if WinEffectsType <> 'None' then
        if (StrToInt(WinEffectsType) > 10) and (StrToInt(WinEffectsType) <> 16) then
          AnimateWindow(TsPanel(component).Handle,WinEffectsTime,AW_SLIDE or AW_HIDE or StrToInt(Trim(Copy(WinEffectsType,1,1))) or StrToInt(Trim(Copy(WinEffectsType,2,1))))
        else
          AnimateWindow(TsPanel(component).Handle,WinEffectsTime,AW_SLIDE or AW_HIDE or StrToInt(WinEffectsType));
      TsPanel(component).Left := 727;
      if WinEffectsType <> 'None' then
        if (StrToInt(WinEffectsType) > 10) and (StrToInt(WinEffectsType) <> 16) then
          if StrToInt(WinEffectsType) > 10 then
            AnimateWindow(TsPanel(component).Handle,1,AW_SLIDE or AW_ACTIVATE or StrToInt(Trim(Copy(WinEffectsType,1,1))) or StrToInt(Trim(Copy(WinEffectsType,2,1))))
          else
            AnimateWindow(TsPanel(component).Handle,1,AW_SLIDE or AW_ACTIVATE or StrToInt(WinEffectsType))
    end;
  if showPanel <> '' then
    begin
      component := FindComponentEx('Conf.'+showPanel);
      if WinEffectsType <> 'None' then
        if (StrToInt(WinEffectsType) > 10) and (StrToInt(WinEffectsType) <> 16) then
          AnimateWindow(TsPanel(component).Handle,1,AW_SLIDE or AW_HIDE or StrToInt(Trim(Copy(WinEffectsType,1,1))) or StrToInt(Trim(Copy(WinEffectsType,2,1))))
        else
          AnimateWindow(TsPanel(component).Handle,1,AW_SLIDE or AW_HIDE or StrToint(WinEffectsType));
      TsPanel(component).Left := 1;
      if WinEffectsType <> 'None' then
        if (StrToInt(WinEffectsType) > 10) and (StrToInt(WinEffectsType) <> 16) then
          AnimateWindow(TsPanel(component).Handle,WinEffectsTime,AW_SLIDE or AW_ACTIVATE or StrToInt(Trim(Copy(WinEffectsType,1,1))) or StrToInt(Trim(Copy(WinEffectsType,2,1))))
        else
          AnimateWindow(TsPanel(component).Handle,WinEffectsTime,AW_SLIDE or AW_ACTIVATE or StrToInt(WinEffectsType));
    end;
  CurrentPanel := showPanel;
end;

procedure ShowPathInCaption(OldText,NewText:string;Back,trimw: Boolean);
var
  i,k : integer;
  cText,cText1,OldText1: string;
  component : TComponent;
  ButtonPushed: Boolean;
begin
  if CE_SHelpInCaption = true then
    begin
      if Back = False then
        if trimw = True then
          begin
            i := Pos('>',CDirPath);
            cText := Trim(Copy(OldText,i,100));
            cText := Trim(Copy(OldText,0,i-1)) + cText;
            repeat
              i := Pos('>',CDirPath);
              cText1 := Trim(Copy(CDirPath,i+1,100));
              CDirPath := cText1;
            until i = 0;
            for k := 0 to 9 do
            begin
              component := FindComponentEx('Conf.sBitBtn'+inttostr(k+6));
              OldText1 := TsBitBtn(component).Caption;
              if (OldText1 <> NewText) and (OldText1 = cText1) then
                begin
                  ButtonPushed := True;
                  Break;
                end;
            end;
            if ButtonPushed = True then
              Conf.Caption := Trim(Copy(cText,0,(Length(cText) - (Length(OldText1)+1))))+'>'+NewText
            else
              Conf.Caption := OldText+'>'+NewText;
          end
        else
          begin
            if (OldText = '"confEditor"') or (NewText = 'Weather') or (NewText = 'Time/Date') or
              (NewText = 'Emulators') or (NewText = 'ConfEditor') or (NewText = 'ExtraFE') then
              Conf.Caption := '"confEditor"   Path: '+NewText
            else
              Conf.Caption := OldText+'>'+NewText;
          end
      else
        begin
          if trimw = True then
            begin
              OldText1 := OldText;
              repeat
                i := Pos('>',CDirPath);
                cText := Trim(Copy(OldText1,i+1,100));
                CDirPath := cText;
                OldText1 := cText;
              until i = 0;
              Conf.Caption := Trim(Copy(OldText,0,(Length(OldText) - ((Length(NewText)+1)+(Length(cText)+1)))));
            end
          else
            begin
              if NewText = '' then
                Conf.Caption := '"confEditor"'
              else
                begin
                  OldText1 := OldText;
                  repeat
                    i := Pos('>',CDirPath);
                    cText := Trim(Copy(OldText1,i+1,100));
                    CDirPath := cText;
                    OldText1 := cText;
                  until i = 0;
                  Conf.Caption := Trim(Copy(OldText,0,(Length(OldText) - (Length(cText)+1))));
                end;
              end;
        end;
      CDirPath := Conf.Caption;
    end;
end;

procedure ChangeStatusInfo;
begin
  case STBarMessages of
    0 : begin
          Conf.stat1.Panels[0].Text := STBarInfo2;
          STBarMessages := 1;
        end;
    1 : Begin
          Conf.stat1.Panels[0].Text := STBarInfo1;
          STBarMessages := 0;
        end;
  end;
end;

procedure DisableMenuButtons(What: Boolean);
var
  component: TComponent;
  i: Byte;
begin
  for i := 6 to 16 do
    begin
      component := FindComponentEx('Conf.sBitBtn'+IntToStr(i));
      TsBitBtn(component).Enabled := What;
    end;
end;

procedure CurrentStateSave;
begin
// Mame
  if Cmenustate = 'em_arcade_mame_paths' then
    SaveMame_DirsAtExit
  else if Cmenustate = 'em_arcade_mame_graphics' then
    SaveMame_GraphicsAtExit
  else if Cmenustate = 'em_arcade_mame_sound' then
    SaveMame_SoundAtExit
  else if Cmenustate = 'em_arcade_mame_others' then
    SaveMame_OthersAtExit
  else if Cmenustate = 'em_arcade_mame_builds' then
    SaveMame_BuildsAtExit
// ZiNC
  else if Cmenustate = 'em_arcade_zinc_paths' then
    SaveZinc_PathsAtExit
  else if Cmenustate = 'em_arcade_zinc_graphics' then
    SaveZinc_GraphicsAtExit
  else if Cmenustate = 'em_arcade_zinc_sound' then
    SaveZinc_SoundAtExit
// Hatari
  else if Cmenustate = 'em_computers_hatari_system' then
    SaveHatari_SystemAtExit
  else if Cmenustate = 'em_computers_hatari_roms' then
    SaveHatari_RomsAtExit
  else if Cmenustate = 'em_computers_hatari_screen' then
    SaveHatari_ScreenAtExit
  else if Cmenustate = 'em_computers_hatari_joy' then
    SaveHatari_JoyAtExit
// pSX
  else if Cmenustate = 'em_consoles_psx_paths' then
    SavepSX_PathsAtExit
  else if Cmenustate = 'em_consoles_psx_screen' then
    SavepSX_ScreenAtExit
  else if Cmenustate = 'em_consoles_psx_sound' then
    SavepSX_SoundAtExit
  else if Cmenustate = 'em_consoles_psx_others' then
    SavepSX_OthersAtExit
// KiGB
  else if Cmenustate = 'em_handheld_kigb_paths' then
    SaveKigb_PathsAtExit
  else if Cmenustate = 'em_handheld_kigb_screen' then
    SaveKigb_ScreenAtExit;
      
end;

procedure ShowMenuImage(Name: string);
var
  BmpImage: TBitmap;
begin
  BmpImage:= TBitmap.Create;
  BmpImage.LoadFromResourceName(HInstance,Name);
  Conf.Menu_Image.Bitmap := BmpImage;
  BmpImage.Free;
end;

end.

