unit hatari_joy;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetHatari_JoyfromHatariIni;
  procedure SaveHatari_JoyAtExit;

  procedure PressJoy_Disable;
  procedure PressJoy_Keyboard;
  procedure PressJoy_RealJoystick;
  procedure SetHatari_Mapping;
  procedure SetUpHatariMapping;
  procedure EjectHatari_Mapping;

// Menu actions
  procedure Show_hatari_joypanel;
  procedure em_hatari_joy_ShowDynamicComps;
  procedure em_hatari_joy_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_roms,hatari_screen,hatari_system,hatari_paths,hatari_database;

procedure SetHatari_JoyfromHatariIni;
var
  Joy_Str: string;
  Joy_Int: Integer;
begin
  if Hatari_Exe <> '' then
    begin
      Conf.sComboBox55.ItemIndex := 0;
      Joy_Int := Hatari_ini.ReadInteger('Joystick0','nJoystickMode',Joy_Int);
      case Joy_Int of
        0 : Conf.rb28.Checked := True;
        1 : Conf.rb30.Checked := True;
        2 : conf.rb29.Checked := True;
      end;
      Joy_Str := Hatari_ini.ReadString('Joystick0','bEnableAutoFire',Joy_Str);
      Conf.sCheckBox101.Checked := StrToBool(Joy_Str);
      Joy_Int := Hatari_ini.ReadInteger('Keyboard','nKeymapType',Joy_Int);
      Conf.sComboBox57.ItemIndex := Joy_Int;
      Joy_Str := Hatari_ini.ReadString('Keyboard','szMappingFileName',Joy_Str);
      Conf.sLabel81.Caption := Joy_Str;
      Joy_Str :=  Hatari_ini.ReadString('Keyboard','bDisableKeyRepeat',Joy_Str);
      Conf.sCheckBox102.Checked := StrToBool(Joy_Str);
    end;
end;

procedure SaveHatari_JoyAtExit;
begin
//
end;

procedure PressJoy_Disable;
begin
  Conf.sLabel29.Enabled := False;
  Conf.sLabel30.Enabled := False;
  Conf.sLabel31.Enabled := False;
  Conf.sLabel44.Enabled := False;
  Conf.sLabel45.Enabled := False;
  Conf.sPanel37.Enabled := False;
  Conf.sPanel38.Enabled := False;
  Conf.sPanel39.Enabled := False;
  Conf.sPanel40.Enabled := False;
  Conf.sPanel41.Enabled := False;
  Conf.sComboBox56.Enabled := False;
  Conf.sCheckBox101.Enabled := False;
end;

procedure PressJoy_Keyboard;
begin
  Conf.sLabel29.Enabled := True;
  Conf.sLabel30.Enabled := True;
  Conf.sLabel31.Enabled := True;
  Conf.sLabel44.Enabled := True;
  Conf.sLabel45.Enabled := True;
  Conf.sPanel37.Enabled := True;
  Conf.sPanel38.Enabled := True;
  Conf.sPanel39.Enabled := True;
  Conf.sPanel40.Enabled := True;
  Conf.sPanel41.Enabled := True;
  Conf.sComboBox56.Enabled := False;
  Conf.sCheckBox101.Enabled := False;
end;

procedure PressJoy_RealJoystick;
begin
  Conf.sLabel29.Enabled := False;
  Conf.sLabel30.Enabled := False;
  Conf.sLabel31.Enabled := False;
  Conf.sLabel44.Enabled := False;
  Conf.sLabel45.Enabled := False;
  Conf.sPanel37.Enabled := False;
  Conf.sPanel38.Enabled := False;
  Conf.sPanel39.Enabled := False;
  Conf.sPanel40.Enabled := False;
  Conf.sPanel41.Enabled := False;
  Conf.sComboBox56.Enabled := True;
  Conf.sCheckBox101.Enabled := True;
end;


procedure SetHatari_Mapping;
begin
  gFindFiles := 'hatari_mapping';
  Conf.Find_Files.Execute;
end;

procedure SetUpHatariMapping;
begin
  Conf.sLabel81.Caption := Conf.Find_Files.FileName;
end;

procedure EjectHatari_Mapping;
begin
  Conf.sLabel81.Caption := ' ';
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_hatari_joypanel;
begin
  if (Cmenustate = 'em_computers_hatari_paths') then
    em_hatari_paths_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_roms') then
    em_hatari_roms_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_screen') then
    em_hatari_screen_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_system') then
    em_hatari_system_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_database') then
    em_hatari_database_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn10.Caption,False,True);
  Cmenustate := 'em_computers_hatari_joy';
  em_hatari_joy_ShowDynamicComps;
  ShowButtonDown(10,'EM_COMPUTERS_ATARI_HATARI_JOY');
  ShowHidePanel(CurrentPanel,'Pem_hatari_joy');
end;

procedure em_hatari_joy_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_hatari_joy,'media\confeditor\images\hatari\hatari.png',
              3,586,106,70,i,True);
        2 : Image_Comp(Conf.Pem_hatari_joy,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,True);
        3 : Image_Comp(Conf.Pem_hatari_joy,'media\confeditor\images\hatari\joystick.png',
              431,2,289,71,i,True);
      end;
    end;
end;

procedure em_hatari_joy_FreeDynamicComps;
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

end.
