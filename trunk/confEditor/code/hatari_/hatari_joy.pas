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
  Conf.sPanel37.Caption := '';
  Conf.sPanel38.Caption := '';
  Conf.sPanel39.Caption := '';
  Conf.sPanel40.Caption := '';
  Conf.sPanel41.Caption := '';
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
  Conf.grp20.SetFocus;
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
  Conf.sPanel37.Caption := '';
  Conf.sPanel38.Caption := '';
  Conf.sPanel39.Caption := '';
  Conf.sPanel40.Caption := '';
  Conf.sPanel41.Caption := '';
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
    27 : Result := 'ESC';
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
    96 : Result := '`';
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
    8  : Result := 'BSPACE';
    9  : Result := 'TAB';
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
    13 : Result := 'ENTER';
    301: Result := 'CLOCK';
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
    39 : Result := '"';
    92 : Result := '\';
    304: Result := 'LSHIFT';
    122: Result := 'Z';
    120: Result := 'X';
    99 : Result := 'C';
    118: Result := 'V';
    98 : Result := 'B';
    110: Result := 'N';
    109: Result := 'M';
    44 : Result := ',';
    46 : Result := '.';
    47 : Result := '/';
    303: Result := 'RSHIFT';
    306: Result := 'LCTRL';
    311: Result := 'LWIN';
    308: Result := 'LALT';
    32 : Result := 'SPACE';
    307: Result := 'RALT';
    312: Result := 'RWIN';
    319: Result := 'SPECIAL';
    305: Result := 'RCTRL';
    316: Result := 'PRNTSCR';
    302: Result := 'SCRLOCK';
    19 : Result := 'PAUSE';
    277: Result := 'INSERT';
    278: Result := 'HOME';
    280: Result := 'PAGEUP';
    127: Result := 'DELETE';
    279: Result := 'END';
    281: Result := 'PAGEDOWN';
    273: Result := 'UP';
    276: Result := 'LEFT';
    274: Result := 'DOWN';
    275: Result := 'RIGHT';
//    281: Result := 'NUMLOCK';
    267: Result := 'NUM_/';
    268: Result := 'NUM_*';
    269: Result := 'NUM_-';
    263: Result := 'NUM_7';
    264: Result := 'NUM_8';
    265: Result := 'NUM_9';
    270: Result := 'NUM_+';
    260: Result := 'NUM_4';
    261: Result := 'NUM_5';
    262: Result := 'NUM_6';
    257: Result := 'NUM_1';
    258: Result := 'NUM_2';
    259: Result := 'NUM_3';
    256: Result := 'NUM_0';
    266: Result := 'NUM_.';
    271: Result := 'NUM_ENTER';
  end;
end;

function Hatari_GetStringAndSetNum(text: string) : Integer;
begin
  if text = 'ESC' then
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
  else if text = '`' then
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
  else if text = 'BSPACE' then
    Result := 8
  else if text = 'TAB' then
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
  else if text = 'ENTER' then
    Result := 13
  else if text = 'CLOCK' then
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
  else if text = '"' then
    Result := 39
  else if text = '\' then
    Result := 92
  else if text = 'LSHIFT' then
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
  else if text = ',' then
    Result := 44
  else if text = '.' then
    Result := 46
  else if text = '/' then
    Result := 47
  else if text = 'RSHIFT' then
    Result := 303
  else if text = 'LCTRL' then
    Result := 306
  else if text = 'LWIN' then
    Result := 311
  else if text = 'LALT' then
    Result := 308
  else if text = 'SPACE' then
    Result := 32
  else if text = 'RALT' then
    Result := 307
  else if text = 'RWIN' then
    Result := 312
  else if text = 'SPECIAL' then
    Result := 319
  else if text = 'RCTRL' then
    Result := 305
  else if text = 'PRNTSCR' then
    Result := 316
  else if text = 'SCRLOCK' then
    Result := 302
  else if text = 'PAUSE' then
    Result := 19
  else if text = 'INSERT' then
    Result := 277
  else if text = 'HOME' then
    Result := 278
  else if text = 'PAGEUP' then
    Result := 280
  else if text = 'DELETE' then
    Result := 127
  else if text = 'END' then
    Result := 279
  else if text = 'PAGEDOWN' then
    Result := 281
  else if text = 'UP' then
    Result := 273
  else if text = 'LEFT' then
    Result := 276
  else if text = 'DOWN' then
    Result := 274
  else if text = 'RIGHT' then
    Result := 275
  else if text = 'NUMLOCK' then
    Result := 281
  else if text = 'NUM_/' then
    Result := 267
  else if text = 'NUM_*' then
    Result := 268
  else if text = 'NUM_-' then
    Result := 269
  else if text = 'NUM_7' then
    Result := 263
  else if text = 'NUM_8' then
    Result := 264
  else if text = 'NUM_9' then
    Result := 265
  else if text = 'NUM_+' then
    Result := 270
  else if text = 'NUM_4' then
    Result := 260
  else if text = 'NUM_5' then
    Result := 261
  else if text = 'NUM_6' then
    Result := 262
  else if text = 'NUM_1' then
    Result := 257
  else if text = 'NUM_2' then
    Result := 258
  else if text = 'NUM_3' then
    Result := 259
  else if text = 'NUM_0' then
    Result := 256
  else if text = 'NUM_.' then
    Result := 266
  else if text = 'NUM_ENTER' then
    Result := 271;
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
