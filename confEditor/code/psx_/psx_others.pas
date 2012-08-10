unit psx_others;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetpSX_OthersfrompSXIni;
  procedure SavepSX_OthersAtExit;

  function CNumberToShowString(num: Integer) : string;
  function CStringToWriteNumber(Character: string) : Integer;

// Menu actions
  procedure Show_psx_otherspanel;
  procedure em_psx_others_ShowDynamicComps;
  procedure em_psx_others_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  psx_screen,psx_sound,psx_paths,psx_database;


procedure SetpSX_OthersfrompSXIni;
var
  Others_Int: Integer;
begin
  if pSX_Exe <> '' then
    begin
      Others_Int := pSX_Ini.ReadInteger('CDROM','Driver',Others_Int);
      Conf.sComboBox23.ItemIndex := Others_Int + 1;
      Others_Int := pSX_Ini.ReadInteger('CDROM','SubcodeReading',Others_Int);
      Conf.sComboBox24.ItemIndex := Others_Int + 1;
      Others_Int := pSX_Ini.ReadInteger('Input','KeyStatusDisplay',Others_Int);
      Conf.sPanel21.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyMute',Others_Int);
      Conf.sPanel22.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyIncVolume',Others_Int);
      Conf.sPanel23.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyDecVolume',Others_Int);
      Conf.sPanel24.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyIncXAVolume',Others_Int);
      Conf.sPanel25.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyDecXAVolume',Others_Int);
      Conf.sPanel26.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeySoundStatus',Others_Int);
      Conf.sPanel27.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyFastForward',Others_Int);
      Conf.sPanel28.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyShowVram',Others_Int);
      Conf.sPanel36.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyIncGamma',Others_Int);
      Conf.sPanel29.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyDecGamma',Others_Int);
      Conf.sPanel30.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyIncBrightness',Others_Int);
      Conf.sPanel31.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyDecBrightness',Others_Int);
      Conf.sPanel32.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyIncContrast',Others_Int);
      Conf.sPanel33.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyDecContrast',Others_Int);
      Conf.sPanel34.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Input','KeyScreenShot',Others_Int);
      Conf.sPanel35.Caption := CNumberToShowString(Others_Int);
      Others_Int := pSX_Ini.ReadInteger('Graphics','ScreenshotFormat',Others_Int);
      Conf.sComboBox25.ItemIndex := Others_Int;
      Others_Int := pSX_Ini.ReadInteger('Input','EscapeMode',Others_Int);
      Conf.sComboBox65.ItemIndex := Others_Int;
    end;
end;

procedure SavepSX_OthersAtExit;
var
  let: Integer;
begin
  if pSX_Exe <> '' then
    begin
      pSX_Ini.WriteInteger('CDROM','Driver',Conf.sComboBox23.ItemIndex - 1);
      pSX_Ini.WriteInteger('CDROM','SubcodeReading',Conf.sComboBox24.ItemIndex - 1);
      let := CStringToWriteNumber(Conf.sPanel21.Caption);
      pSX_Ini.WriteInteger('Input','KeyStatusDisplay',let);
      let := CStringToWriteNumber(Conf.sPanel22.Caption);
      pSX_Ini.WriteInteger('Input','KeyMute',let);
      let := CStringToWriteNumber(Conf.sPanel23.Caption);
      pSX_Ini.WriteInteger('Input','KeyIncVolume',let);
      let := CStringToWriteNumber(Conf.sPanel24.Caption);
      pSX_Ini.WriteInteger('Input','KeyDecVolume',let);
      let := CStringToWriteNumber(Conf.sPanel25.Caption);
      pSX_Ini.WriteInteger('Input','KeyIncXAVolume',let);
      let := CStringToWriteNumber(Conf.sPanel26.Caption);
      pSX_Ini.WriteInteger('Input','KeyDecXAVolume',let);
      let := CStringToWriteNumber(Conf.sPanel27.Caption);
      pSX_Ini.WriteInteger('Input','KeySoundStatus',let);
      let := CStringToWriteNumber(Conf.sPanel28.Caption);
      pSX_Ini.WriteInteger('Input','KeyFastForward',let);
      let := CStringToWriteNumber(Conf.sPanel36.Caption);
      pSX_Ini.WriteInteger('Input','KeyShowVram',let);
      let := CStringToWriteNumber(Conf.sPanel29.Caption);
      pSX_Ini.WriteInteger('Input','KeyIncGamma',let);
      let := CStringToWriteNumber(Conf.sPanel30.Caption);
      pSX_Ini.WriteInteger('Input','KeyDecGamma',let);
      let := CStringToWriteNumber(Conf.sPanel31.Caption);
      pSX_Ini.WriteInteger('Input','KeyIncBrightness',let);
      let := CStringToWriteNumber(Conf.sPanel32.Caption);
      pSX_Ini.WriteInteger('Input','KeyDecBrightness',let);
      let := CStringToWriteNumber(Conf.sPanel33.Caption);
      pSX_Ini.WriteInteger('Input','KeyIncContrast',let);
      let := CStringToWriteNumber(Conf.sPanel34.Caption);
      pSX_Ini.WriteInteger('Input','KeyDecContrast',let);
      let := CStringToWriteNumber(Conf.sPanel35.Caption);
      pSX_Ini.ReadInteger('Input','KeyScreenShot',let);
      pSX_Ini.WriteInteger('Graphics','ScreenshotFormat',Conf.sComboBox25.ItemIndex);
      pSX_Ini.WriteInteger('Input','EscapeMode',Conf.sComboBox65.ItemIndex);
    end;
end;  

function CNumberToShowString(num: Integer) : string;
begin
  case num of
    -1 : Result := 'None';
    1 : Result := 'Esc';
    2 : Result := '1';
    3 : Result := '2';
    4 : Result := '3';
    5 : Result := '4';
    6 : Result := '5';
    7 : Result := '6';
    8 : Result := '7';
    9 : Result := '8';
    10 : Result := '9';
    11 : Result := '0';
    12 : Result := '-';
    13 : Result := '=';
    14 : Result := 'Backspace';
    15 : Result := 'Tab';
    16 : Result := 'Q';
    17 : Result := 'W';
    18 : Result := 'E';
    19 : Result := 'R';
    20 : Result := 'T';
    21 : Result := 'Y';
    22 : Result := 'U';
    23 : Result := 'I';
    24 : Result := 'O';
    25 : Result := 'P';
    26 : Result := '[';
    27 : Result := ']';
    28 : Result := 'Enter';
    29 : Result := 'Ctrl';
    30 : Result := 'A';
    31 : Result := 'S';
    32 : Result := 'D';
    33 : Result := 'F';
    34 : Result := 'G';
    35 : Result := 'H';
    36 : Result := 'J';
    37 : Result := 'K';
    38 : Result := 'L';
    39 : Result := ';';
    40 : Result := '''';
    41 : Result := '~';
    42 : Result := 'Shift';
    43 : Result := '\';
    44 : Result := 'Z';
    45 : Result := 'X';
    46 : Result := 'C';
    47 : Result := 'V';
    48 : Result := 'B';
    49 : Result := 'N';
    50 : Result := 'M';
    51 : Result := '<';
    52 : Result := '>';
    53 : Result := '/';
    54 : Result := 'Shift';
    55 : Result := 'Num *';
    56 : Result := 'Alt';
    57 : Result := 'Space';
    58 : Result := 'Caps Lock';
    59 : Result := 'F1';
    60 : Result := 'F2';
    61 : Result := 'F3';
    62 : Result := 'F4';
    63 : Result := 'F5';
    64 : Result := 'F6';
    65 : Result := 'F7';
    66 : Result := 'F8';
    67 : Result := 'F9';
    68 : Result := 'F10';
    69 : Result := 'Num Lock';
    70 : Result := 'Scroll Lock';
    71 : Result := 'Num 7';
    72 : Result := 'Num 8';
    73 : Result := 'Num 9';
    74 : Result := 'Num -';
    75 : Result := 'Num 4';
    76 : Result := 'Num 5';
    77 : Result := 'Num 6';
    78 : Result := 'Num +';
    79 : Result := 'Num 1';
    80 : Result := 'Num 2';
    81 : Result := 'Num 3';
    82 : Result := 'Num 0';
    83 : Result := 'Num Del';
    //84 : Result := 'ESC';
    //85 : Result := 'ESC';
    //86 : Result := 'ESC';
    87 : Result := 'F11';
    88 : Result := 'F12';
    //89 : Result := 'ESC';
    //90 : Result := 'ESC';
    //91 : Result := 'ESC';
    //92 : Result := 'ESC';
    //93 : Result := 'ESC';
    //94 : Result := 'ESC';
    //95 : Result := 'ESC';
    96 : Result := 'Enter';
    97 : Result := 'Ctrl';
    98 : Result := 'Num /';
    //99 : Result := 'ESC';
    100 : Result := 'Alt';
    //101 : Result := 'ESC';
    156 : Result := 'Enter';
    157 : Result := 'Ctrl';
    181 : Result := '/';
    210 : Result := 'Home';
    //103 : Result := 'ESC';
    201 : Result := 'Page up';
    //105 : Result := 'ESC';
    //106 : Result := 'ESC';
    211 : Result := 'End';
    //108 : Result := 'ESC';
    209 : Result := 'Page down';
    119 : Result := 'Insert';
    207 : Result := 'Delete';
    //112 : Result := 'ESC';
    //113 : Result := 'ESC';
    //114 : Result := 'ESC';
    //115 : Result := 'ESC';
    //116 : Result := 'ESC';
    //117 : Result := 'ESC';
    //118 : Result := 'ESC';
    //119 : Result := 'PAUSE BREAK';
    208 : Result := 'Up';
    205 : Result := 'Left';
    203 : Result := 'Right';
    200 : Result := 'Down';
  end;
end;

function CStringToWriteNumber(Character: string) : Integer;
begin
  if Character = 'None' then
    Result := -1
  else if Character = 'Esc' then
    Result := 1
  else if Character = '1' then
    Result := 2
  else if Character = '2' then
    Result := 3
  else if Character = '3' then
    Result := 4
  else if Character = '4' then
    Result := 5
  else if Character = '5' then
    Result := 6
  else if Character = '6' then
    Result := 7
  else if Character = '7' then
    Result := 8
  else if Character = '8' then
    Result := 9
  else if Character = '9' then
    Result := 10
  else if Character = '0' then
    Result := 11
  else if Character = '-' then
    Result := 12
  else if Character = '=' then
    Result := 13
  else if Character = 'Backspace' then
    Result := 14
  else if Character = 'Tab' then
    Result := 15
  else if Character = 'Q' then
    Result := 16
  else if Character = 'W' then
    Result := 17
  else if Character = 'E' then
    Result := 18
  else if Character = 'R' then
    Result := 19
  else if Character = 'T' then
    Result := 20
  else if Character = 'Y' then
    Result := 21
  else if Character = 'U' then
    Result := 22
  else if Character = 'I' then
    Result := 23
  else if Character = 'O' then
    Result := 24
  else if Character = 'P' then
    Result := 25
  else if Character = '[' then
    Result := 26
  else if Character = ']' then
    Result := 27
  else if Character = 'Enter' then
    Result := 28
  else if Character = 'Ctrl' then
    Result := 29
  else if Character = 'A' then
    Result := 30
  else if Character = 'S' then
    Result := 31
  else if Character = 'D' then
    Result := 32
  else if Character = 'F' then
    Result := 33
  else if Character = 'G' then
    Result := 34
  else if Character = 'H' then
    Result := 35
  else if Character = 'J' then
    Result := 36
  else if Character = 'K' then
    Result := 37
  else if Character = 'L' then
    Result := 38
  else if Character = ';' then
    Result := 39
  else if Character = '''' then
    Result := 40
  else if Character = '~' then
    Result := 41
  else if Character = 'Shift' then
    Result := 42
  else if Character = '\' then
    Result := 43
  else if Character = 'Z' then
    Result := 44
  else if Character = 'X' then
    Result := 45
  else if Character = 'C' then
    Result := 46
  else if Character = 'V' then
    Result := 47
  else if Character = 'B' then
    Result := 48
  else if Character = 'N' then
    Result := 49
  else if Character = 'M' then
    Result := 50
  else if Character = '<' then
    Result := 51
  else if Character = '>' then
    Result := 52
  else if Character = '/' then
    Result := 53
  else if Character = 'Shift' then
    Result := 54
  else if Character = 'Num *' then
    Result := 55
  else if Character = 'Alt' then
    Result := 56
  else if Character = 'Space' then
    Result := 57
  else if Character = 'Caps Lock' then
    Result := 58
  else if Character = 'F1' then
    Result := 59
  else if Character = 'F2' then
    Result := 60
  else if Character = 'F3' then
    Result := 61
  else if Character = 'F4' then
    Result := 62
  else if Character = 'F5' then
    Result := 63
  else if Character = 'F6' then
    Result := 64
  else if Character = 'F7' then
    Result := 65
  else if Character = 'F8' then
    Result := 66
  else if Character = 'F9' then
    Result := 67
  else if Character = 'F10' then
    Result := 68
  else if Character = 'Num Lock' then
    Result := 69
  else if Character = 'Scroll Lock' then
    Result := 70
  else if Character = 'Num 7' then
    Result := 71
  else if Character = 'Num 8' then
    Result := 72
  else if Character = 'Num 9' then
    Result := 73
  else if Character = 'Num -' then
    Result := 74
  else if Character = 'Num 4' then
    Result := 75
  else if Character = 'Num 5' then
    Result := 76
  else if Character = 'Num 6' then
    Result := 77
  else if Character = 'Num +' then
    Result := 78
  else if Character = 'Num 1' then
    Result := 79
  else if Character = 'Num 2' then
    Result := 80
  else if Character = 'Num 3' then
    Result := 81
  else if Character = 'Num 0' then
    Result := 82
  else if Character = 'Num Del' then
    Result := 83
  else if Character = 'F11' then
    Result := 87
  else if Character = 'F12' then
    Result := 88
  else if Character = 'Enter' then
    Result := 96
  else if Character = 'Ctrl' then
    Result := 97
  else if Character = 'Num /' then
    Result := 98
  else if Character = 'Alt' then
    Result := 100
  else if Character = 'Enter' then
    Result := 156
  else if Character = 'Ctrl' then
    Result := 157
  else if Character = 'Insert' then
    Result := 119
  else if Character = 'Down' then
    Result := 200
  else if Character = 'Page up' then
    Result := 201
  else if Character = 'Right' then
    Result := 203
  else if Character = 'Left' then
    Result := 205
  else if Character = 'Delete' then
    Result := 207
  else if Character = 'Up' then
    Result := 208
  else if Character = 'Page Down' then
    Result := 209
  else if Character = 'Home' then
    Result := 210
  else if Character = 'End' then
    Result := 211;
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_psx_otherspanel;
begin
  if (Cmenustate = 'em_consoles_psx_screen') then
    em_psx_screen_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_sound') then
    em_psx_sound_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_paths') then
    em_psx_paths_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_database') then
    em_psx_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn9.Caption,False,True);
  Cmenustate := 'em_consoles_psx_others';
  em_psx_others_ShowDynamicComps;
  ShowButtonDown(9,'EM_CONSOLES_SONY_PSX_OTHERS');
  Conf.Pem_psx_sound.Tag := 0;
  Conf.Pem_psx_others.Tag := 1;
  ShowHidePanel(CurrentPanel,'Pem_psx_others');
end;

procedure em_psx_others_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_psx_others,'media\confeditor\images\psx\psx.png',
              3,590,100,71,i,True);
        2 : Image_Comp(Conf.Pem_psx_others,'media\confeditor\images\psx\psx_image.png',
              587,381,150,280,i,True);
        3 : Image_Comp(Conf.Pem_psx_others,'media\confeditor\images\psx\others.png',
              609,2,121,71,i,True);
      end;
    end;
end;

procedure em_psx_others_FreeDynamicComps;
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
 