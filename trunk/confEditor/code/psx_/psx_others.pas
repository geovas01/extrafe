unit psx_others;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetpSX_OthersfrompSXIni;

  function CNumberToShowString(num: Integer) : string;

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

function CNumberToShowString(num: Integer) : string;
begin
  case num of
    -1 : Result := '-/-';
    1 : Result := 'ESC';
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
    14 : Result := 'BACKSPACE';
    //15 : 
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
    26 : Result := '{';
    27 : Result := '}';
    28 : Result := 'ENTER';
    29 : Result := 'CTRL';
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
    40 : Result := '"';
    41 : Result := '`';
    42 : Result := 'SHIFT';
    43 : Result := '\';
    44 : Result := 'Z';
    45 : Result := 'X';
    46 : Result := 'C';
    47 : Result := 'V';
    48 : Result := 'B';
    49 : Result := 'N';
    50 : Result := 'M';
    51 : Result := ',';
    52 : Result := '.';
    53 : Result := '/';
    54 : Result := 'SHIFT';
    55 : Result := '*';
    56 : Result := 'ALT';
    57 : Result := 'SPACE';
    58 : Result := 'CAPS LOCK';
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
    69 : Result := 'NUM LOCK';
    70 : Result := 'SCROLL LOCK';
    71 : Result := 'NUM 7';
    72 : Result := 'NUM 8';
    73 : Result := 'NUM 9';
    74 : Result := 'NUM -';
    75 : Result := 'NUM 4';
    76 : Result := 'NUM 5';
    77 : Result := 'NUM 6';
    78 : Result := 'NUM +';
    79 : Result := 'NUM 1';
    80 : Result := 'NUM 2';
    81 : Result := 'NUM 3';
    82 : Result := 'NUM 0';
    83 : Result := 'NUM .';
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
    96 : Result := 'ENTER';
    97 : Result := 'CTRL';
    98 : Result := 'NUM /';
    //99 : Result := 'ESC';
    100 : Result := 'ALT';
    //101 : Result := 'ESC';
    156 : Result := 'NUMENTER';
    181 : Result := '/';
    210 : Result := 'HOME';
    //103 : Result := 'ESC';
    201 : Result := 'PAGE UP';
    //105 : Result := 'ESC';
    //106 : Result := 'ESC';
    211 : Result := 'END';
    //108 : Result := 'ESC';
    209 : Result := 'PAGE DOWN';
    119 : Result := 'INSERT';
    207 : Result := 'DELETE';
    //112 : Result := 'ESC';
    //113 : Result := 'ESC';
    //114 : Result := 'ESC';
    //115 : Result := 'ESC';
    //116 : Result := 'ESC';
    //117 : Result := 'ESC';
    //118 : Result := 'ESC';
    //119 : Result := 'PAUSE BREAK';
    208 : Result := 'ARROW UP';
    205 : Result := 'ARROW LEFT';
    203 : Result := 'ARROW RIGHT';
    200 : Result := 'ARROW DOWN';
  end;
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
 