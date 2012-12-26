unit hatari_joy;

interface
uses
  SysUtils,Classes,ExtCtrls,global;

  procedure SetHatari_JoyfromHatariIni;
  procedure SaveHatari_JoyAtExit;

  procedure PressJoy_Disable;
  procedure PressJoy_Keyboard;
  procedure PressJoy_RealJoystick;
  procedure SetHatari_Mapping;
  procedure SetUpHatariMapping;
  procedure EjectHatari_Mapping;
  procedure Change_JoystickType(num: Integer);
  procedure SaveCurrentState_Joy(joyType: Integer);

  function Hatari_GetNumAndShowString(num: Integer) : string;
  function Hatari_GetStringAndSetNum(text: string) : Integer;

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
      Change_JoystickType(0);
      Joy_Int := 0;
      repeat
        Joy_Str := joysticks[joy_int];
        Conf.sComboBox56.Items.Add(Joy_Str);
      until Joy_Str = '';
    end;
end;

procedure SaveHatari_JoyAtExit;
begin
  if Hatari_Exe <> '' then
    begin
      SaveCurrentState_Joy(Conf.sComboBox55.ItemIndex);
      Hatari_ini.WriteInteger('Keyboard','nKeymapType',Conf.sComboBox57.ItemIndex);
      Hatari_ini.WriteString('Keyboard','szMappingFileName',Conf.sLabel81.Caption);
      if Conf.sCheckBox102.Checked = True then
        Hatari_ini.WriteString('Keyboard','bDisableKeyRepeat','TRUE')
      else
        Hatari_ini.WriteString('Keyboard','bDisableKeyRepeat','FALSE');
    end;
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
  if Started = False then
    Conf.grp20.SetFocus;
  Conf.sComboBox56.Enabled := False;
  Conf.sCheckBox101.Enabled := True;
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

function Hatari_GetNumAndShowString(num: Integer) : string;
begin
  case num of
    27 : Result := 'Esc';
    282: Result := 'F1';
    283: Result := 'F2';
    284: Result := 'F3';
    285: Result := 'F4';
    286: Result := 'F5';
    287: Result := 'F6';
    288: Result := 'F7';
    289: Result := 'F8';
    290: Result := 'F9';
    291: Result := 'F10';
    292: Result := 'F11';
    293: Result := 'F12';
    96 : Result := '~';
    49 : Result := '1';
    50 : Result := '2';
    51 : Result := '3';
    52 : Result := '4';
    53 : Result := '5';
    54 : Result := '6';
    55 : Result := '7';
    56 : Result := '8';
    57 : Result := '9';
    48 : Result := '0';
    45 : Result := '-';
    61 : Result := '=';
    8  : Result := 'Backspace';
    9  : Result := 'Tab';
    113: Result := 'Q';
    119: Result := 'W';
    101: Result := 'E';
    114: Result := 'R';
    116: Result := 'T';
    121: Result := 'Y';
    117: Result := 'U';
    105: Result := 'I';
    111: Result := 'O';
    112: Result := 'P';
    91 : Result := '[';
    93 : Result := ']';
    13 : Result := 'Enter';
    301: Result := 'Caps Lock';
    97 : Result := 'A';
    115: Result := 'S';
    100: Result := 'D';
    102: Result := 'F';
    103: Result := 'G';
    104: Result := 'H';
    106: Result := 'J';
    107: Result := 'K';
    108: Result := 'L';
    59 : Result := ';';
    39 : Result := '''';
    92 : Result := '\';
    304: Result := 'Shift'; // Left shift
    122: Result := 'Z';
    120: Result := 'X';
    99 : Result := 'C';
    118: Result := 'V';
    98 : Result := 'B';
    110: Result := 'N';
    109: Result := 'M';
    44 : Result := '<';
    46 : Result := '>';
    47 : Result := '/';
    303: Result := 'Shift';
    306: Result := 'Ctrl';
    311: Result := 'Left Win';
    308: Result := 'Alt';
    32 : Result := 'Space';
    307: Result := 'Alt';
    312: Result := 'Right Win';
    319: Result := 'Application Key';
    305: Result := 'Ctrl';
    316: Result := 'Print Screen';
    302: Result := 'Scroll Lock';
    19 : Result := 'Pause';
    277: Result := 'Insert';
    278: Result := 'Home';
    280: Result := 'Page up';
    127: Result := 'Delete';
    279: Result := 'End';
    281: Result := 'Page down';
    273: Result := 'Up';
    276: Result := 'Left';
    274: Result := 'Down';
    275: Result := 'Right';
//    281: Result := 'Num Lock';
    267: Result := 'Num /';
    268: Result := 'Num *';
    269: Result := 'Num -';
    263: Result := 'Num 7';
    264: Result := 'Num 8';
    265: Result := 'Num 9';
    270: Result := 'Num +';
    260: Result := 'Num 4';
    261: Result := 'Num 5';
    262: Result := 'Num 6';
    257: Result := 'Num 1';
    258: Result := 'Num 2';
    259: Result := 'Num 3';
    256: Result := 'Num 0';
    266: Result := 'Num Del';
    271: Result := 'Enter';
  end;
end;

function Hatari_GetStringAndSetNum(text: string) : Integer;
begin
  if text = 'Esc' then
    Result := 27
  else if text = 'F1' then
    Result := 282
  else if text = 'F2' then
    Result := 283
  else if text = 'F3' then
    Result := 284
  else if text = 'F4' then
    Result := 285
  else if text = 'F5' then
    Result := 286
  else if text = 'F6' then
    Result := 287
  else if text = 'F7' then
    Result := 288
  else if text = 'F8' then
    Result := 289
  else if text = 'F9' then
    Result := 290
  else if text = 'F10' then
    Result := 291
  else if text = 'F11' then
    Result := 292
  else if text = 'F12' then
    Result := 293
  else if text = '~' then
    Result := 96
  else if text = '1' then
    Result := 49
  else if text = '2' then
    Result := 50
  else if text = '3' then
    Result := 51
  else if text = '4' then
    Result := 52
  else if text = '5' then
    Result := 53
  else if text = '6' then
    Result := 54
  else if text = '7' then
    Result := 55
  else if text = '8' then
    Result := 56
  else if text = '9' then
    Result := 57
  else if text = '0' then
    Result := 48
  else if text = '-' then
    Result := 45
  else if text = '=' then
    Result := 61
  else if text = 'Backspace' then
    Result := 8
  else if text = 'Tab' then
    Result := 9
  else if text = 'Q' then
    Result := 113
  else if text = 'W' then
    Result := 119
  else if text = 'E' then
    Result := 101
  else if text = 'R' then
    Result := 114
  else if text = 'T' then
    Result := 116
  else if text = 'Y' then
    Result := 121
  else if text = 'U' then
    Result := 117
  else if text = 'I' then
    Result := 105
  else if text = 'O' then
    Result := 111
  else if text = 'P' then
    Result := 112
  else if text = '[' then
    Result := 91
  else if text = ']' then
    Result := 93
  else if text = 'Enter' then
    Result := 13
  else if text = 'Caps Lock' then
    Result := 301
  else if text = 'A' then
    Result := 97
  else if text = 'S' then
    Result := 115
  else if text = 'D' then
    Result := 100
  else if text = 'F' then
    Result := 102
  else if text = 'G' then
    Result := 103
  else if text = 'H' then
    Result := 104
  else if text = 'J' then
    Result := 106
  else if text = 'K' then
    Result := 107
  else if text = 'L' then
    Result := 108
  else if text = ';' then
    Result := 59
  else if text = '''' then
    Result := 39
  else if text = '\' then
    Result := 92
  else if text = 'Shift' then
    Result := 304
  else if text = 'Z' then
    Result := 122
  else if text = 'X' then
    Result := 120
  else if text = 'C' then
    Result := 99
  else if text = 'V' then
    Result := 118
  else if text = 'B' then
    Result := 98
  else if text = 'N' then
    Result := 110
  else if text = 'M' then
    Result := 109
  else if text = '<' then
    Result := 44
  else if text = '>' then
    Result := 46
  else if text = '/' then
    Result := 47
  else if text = 'Shift' then
    Result := 303
  else if text = 'Ctrl' then
    Result := 306
  else if text = 'Left Win' then
    Result := 311
  else if text = 'Alt' then
    Result := 308
  else if text = 'Space' then
    Result := 32
  else if text = 'Alt' then
    Result := 307
  else if text = 'Right Win' then
    Result := 312
  else if text = 'Application Key' then
    Result := 319
  else if text = 'Ctrl' then
    Result := 305
  else if text = 'Print Screen' then
    Result := 316
  else if text = 'Scroll Lock' then
    Result := 302
  else if text = 'Pause' then
    Result := 19
  else if text = 'Insert' then
    Result := 277
  else if text = 'Home' then
    Result := 278
  else if text = 'Page up' then
    Result := 280
  else if text = 'Delete' then
    Result := 127
  else if text = 'End' then
    Result := 279
  else if text = 'Page down' then
    Result := 281
  else if text = 'Up' then
    Result := 273
  else if text = 'Left' then
    Result := 276
  else if text = 'Down' then
    Result := 274
  else if text = 'Right' then
    Result := 275
  else if text = 'Num Lock' then
    Result := 281
  else if text = 'Num /' then
    Result := 267
  else if text = 'Num *' then
    Result := 268
  else if text = 'Num -' then
    Result := 269
  else if text = 'Num 7' then
    Result := 263
  else if text = 'Num 8' then
    Result := 264
  else if text = 'Num 9' then
    Result := 265
  else if text = 'Num +' then
    Result := 270
  else if text = 'Num 4' then
    Result := 260
  else if text = 'Num 5' then
    Result := 261
  else if text = 'Num 6' then
    Result := 262
  else if text = 'Num 1' then
    Result := 257
  else if text = 'Num 2' then
    Result := 258
  else if text = 'Num 3' then
    Result := 259
  else if text = 'Num 0' then
    Result := 256
  else if text = 'Num Del' then
    Result := 266
  else if text = 'Enter' then
    Result := 271;
end;

procedure Change_JoystickType(num: Integer);
  procedure set_radio_checked(numof_Joy: Integer);
    var
      Joy_Int: Integer;
      AutoFire: string;
    begin
      Joy_Int := Hatari_ini.ReadInteger('Joystick' + IntToStr(numof_Joy),'nJoystickMode',Joy_Int);
      case Joy_Int of
        0 : Conf.rb28.Checked := True;
        1 : Conf.rb30.Checked := True;
        2 : Conf.rb29.Checked := True;
      end;
      AutoFire := Hatari_ini.ReadString('Joystick' + IntToStr(numof_Joy),'bEnableAutoFire',AutoFire);
      Conf.sCheckBox101.Checked := StrToBool(AutoFire);
    end;
  procedure show_keys_inpanel(numof_Joy: Integer);
    var
      CharKey:  string;
      IntKey: Integer;
    begin
      IntKey := Hatari_ini.ReadInteger('Joystick' + IntToStr(numof_Joy),'nKeyCodeUp',IntKey);
      CharKey := Hatari_GetNumAndShowString(IntKey);
      Conf.sPanel37.Caption := CharKey;
      IntKey := Hatari_ini.ReadInteger('Joystick' + IntToStr(numof_Joy),'nKeyCodeDown',IntKey);
      CharKey := Hatari_GetNumAndShowString(IntKey);
      Conf.sPanel38.Caption := CharKey;
      IntKey := Hatari_ini.ReadInteger('Joystick' + IntToStr(numof_Joy),'nKeyCodeLeft',IntKey);
      CharKey := Hatari_GetNumAndShowString(IntKey);
      Conf.sPanel39.Caption := CharKey;
      IntKey := Hatari_ini.ReadInteger('Joystick' + IntToStr(numof_Joy),'nKeyCodeRight',IntKey);
      CharKey := Hatari_GetNumAndShowString(IntKey);
      Conf.sPanel40.Caption := CharKey;
      IntKey := Hatari_ini.ReadInteger('Joystick' + IntToStr(numof_Joy),'nKeyCodeFire',IntKey);
      CharKey := Hatari_GetNumAndShowString(IntKey);
      Conf.sPanel41.Caption := CharKey;
    end;
begin
  set_radio_checked(num);
  show_keys_inpanel(num);
end;

procedure SaveCurrentState_Joy(joyType: Integer);
  procedure joymode(numof_Joy: Integer);
    begin
      if Conf.rb28.Checked = True then
        Hatari_ini.WriteInteger('Joystick' + IntToStr(numof_Joy) ,'nJoystickMode',0)
      else if Conf.rb30.Checked = True then
        Hatari_ini.WriteInteger('Joystick' + IntToStr(numof_Joy) ,'nJoystickMode',1)
      else if Conf.rb29.Checked = True then
        Hatari_ini.WriteInteger('Joystick' + IntToStr(numof_Joy) ,'nJoystickMode',2);
      if Conf.sCheckBox101.Checked = True then
        Hatari_ini.WriteString('Joystick' + IntToStr(numof_Joy) ,'bEnableAutoFire','TRUE')
      else
        Hatari_ini.WriteString('Joystick' + IntToStr(numof_Joy) ,'bEnableAutoFire','FALSE');
    end;

  procedure SaveJoyKeys(numof_Joy: Integer);
    var
      keyCode: Integer;
    begin
      if Conf.sPanel37.Caption <> '' then
        keyCode := Hatari_GetStringAndSetNum(Conf.sPanel37.Caption);
      Hatari_ini.WriteInteger('Joystick' + IntToStr(numof_Joy) ,'nKeyCodeUp',keyCode);
      if Conf.sPanel37.Caption <> '' then
        keyCode := Hatari_GetStringAndSetNum(Conf.sPanel38.Caption);
      Hatari_ini.WriteInteger('Joystick' + IntToStr(numof_Joy) ,'nKeyCodeDown',keyCode);
      if Conf.sPanel37.Caption <> '' then
        keyCode := Hatari_GetStringAndSetNum(Conf.sPanel39.Caption);
      Hatari_ini.WriteInteger('Joystick' + IntToStr(numof_Joy) ,'nKeyCodeLeft',keyCode);
      if Conf.sPanel37.Caption <> '' then
        keyCode := Hatari_GetStringAndSetNum(Conf.sPanel40.Caption);
      Hatari_ini.WriteInteger('Joystick' + IntToStr(numof_Joy) ,'nKeyCodeRight',keyCode);
      if Conf.sPanel37.Caption <> '' then
        keyCode := Hatari_GetStringAndSetNum(Conf.sPanel41.Caption);
      Hatari_ini.WriteInteger('Joystick' + IntToStr(numof_Joy) ,'nKeyCodeFire',keyCode);
    end;
begin
  joymode(joyType);
  SaveJoyKeys(joyType);
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
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn10.Caption,False,True);
  Cmenustate := 'em_computers_hatari_joy';
  em_hatari_joy_ShowDynamicComps;
  ShowButtonDown(10,'EM_COMPUTERS_ATARI_HATARI_JOY');
  Conf.Pem_hatari_joy.Tag := 1;
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
              3,586,106,70,i,'',True,False);
        2 : Image_Comp(Conf.Pem_hatari_joy,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,'',True,False);
        3 : Image_Comp(Conf.Pem_hatari_joy,'media\confeditor\images\hatari\joystick.png',
              431,2,289,71,i,'',True,False);
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

