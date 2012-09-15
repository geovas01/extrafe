unit kigb_sound;

interface
uses
  SysUtils,Classes,ExtCtrls,sLabel,StdCtrls;

  procedure SetKigb_SoundfromKigbIni;
  procedure SaveKigb_SoundAtExit;

  procedure SetKigb_DefaultKeys_Keyboard;

  function Kigb_GetNumAndShowString(num: Integer) : string;
  function Kigb_GetStringAndSetNum(text: string) : Integer;

// Menu actions
  procedure Show_kigb_soundpanel;
  procedure em_kigb_sound_ShowDynamicComps;
  procedure em_kigb_sound_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  kigb_screen,kigb_paths,kigb_others,kigb_database;

procedure SetKigb_SoundfromKigbIni;
var
  KigbCfgFile: TextFile;
  x: Integer;
  text,t1,t2: string;
begin
  if Kigb_Exe <> '' then
    begin
      AssignFile(KigbCfgFile,KigbCfg_File);
      Reset(KigbCfgFile);
      while not Eof(KigbCfgFile) do
        begin
          Readln(KigbCfgFile,text);
          x := Pos('=',text);
          t1 := Trim(Copy(text,0,x - 1));
          t2 := Trim(Copy(text,x + 1,Length(text) - x));
          if t1 = 'SOUND_ON' then
            begin
              if t2 = '1' then
                Conf.rb54.Checked := True
              else
                Conf.rb55.Checked := True;
            end
          else if t1 = 'SOUND_VOLUME' then
            Conf.sbar_kigb_soundvolume.Position := StrToInt(t2)
          else if t1 = 'SOUND_PAN' then
            Conf.sbar_kigb_soundpan.Position := StrToInt(t2)
          else if t1 = 'SOUND_QUALITY' then
            begin
              if t2 = '1' then
                Conf.sComboBox67.ItemIndex := 0
              else if t2 = '2' then
                Conf.sComboBox67.ItemIndex := 1
              else if t2 = '4' then
                Conf.sComboBox67.ItemIndex := 2;
            end
          else if t1 = 'SOUND_CHANNEL' then
            begin
              if t2 = '2' then
                Conf.sCheckBox126.Checked := True;            
            end
          else if t1 = 'SOUND_CHANNEL_1' then
            begin
              if t2 = '1' then
                Conf.sCheckBox121.Checked := True;
            end
          else if t1 = 'SOUND_CHANNEL_2' then
            begin
              if t2 = '1' then
                Conf.sCheckBox122.Checked := True;
            end
          else if t1 = 'SOUND_CHANNEL_3' then
            begin
              if t2 = '1' then
                Conf.sCheckBox123.Checked := True;
            end
          else if t1 = 'SOUND_CHANNEL_4' then
            begin
              if t2 = '1' then
                Conf.sCheckBox124.Checked := True;
            end
          else if t1 = 'SOUND_DIGITAL' then
            begin
              if t2 = '1' then
                Conf.sCheckBox125.Checked := True;
            end
          else if t1 = 'ALT_KEY_EXIT' then
            Conf.sPanel42.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'ALT_KEY_RESET' then
            Conf.sPanel43.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'ALT_KEY_PAUSE' then
            Conf.sPanel44.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'KEY_UP' then
            Conf.sPanel45.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'KEY_DOWN' then
            Conf.sPanel46.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'KEY_LEFT' then
            Conf.sPanel47.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'KEY_RIGHT' then
            Conf.sPanel48.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'KEY_A' then
            Conf.sPanel49.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'KEY_B' then
            Conf.sPanel50.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'KEY_SELECT' then
            Conf.sPanel51.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'KEY_START' then
            Conf.sPanel52.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'MOTION_KEY_UP' then
            Conf.sPanel61.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'MOTION_KEY_DOWN' then
            Conf.sPanel62.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'MOTION_KEY_LEFT' then
            Conf.sPanel63.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
          else if t1 = 'MOTION_KEY_RIGHT' then
            Conf.sPanel64.Caption := Kigb_GetNumAndShowString(StrToInt(t2))
        end;
    end;
end;

procedure SaveKigb_SoundAtExit;
var
  Comp: TComponent;
  k,l: Integer;
  Text,t1,t2: string;
begin
  Comp := FindComponentEx('Conf.MemoEmu2');
  for k:= 0 to TMemo(Comp).Lines.Count - 1 do
    begin
      Text := TMemo(Comp).Lines.Strings[k];
      l := Pos('=',Text);
      t1 := Trim(Copy(Text,0,l - 1));
      if t1 = 'SOUND_ON' then
        begin
          TMemo(Comp).Lines.Delete(k);
          if Conf.rb54.Checked = True then
            t2 := '1'
          else
            t2 := '0';
          TMemo(Comp).Lines.Insert(k,'SOUND_ON = '+ t2);
        end
      else if t1 = 'SOUND_VOLUME' then
        begin
          TMemo(Comp).Lines.Delete(k);
          TMemo(Comp).Lines.Insert(k,'SOUND_VOLUME = ' + IntToStr(Conf.sbar_kigb_soundvolume.Position)); 
        end
      else if t1 = 'SOUND_PAN' then
        begin
          TMemo(Comp).Lines.Delete(k);
          TMemo(Comp).Lines.Insert(k,'SOUND_PAN = ' + IntToStr(Conf.sbar_kigb_soundpan.Position));
        end
      else if t1 = 'SOUND_QUALITY' then
        begin
          TMemo(Comp).Lines.Delete(k);
          case Conf.sComboBox67.ItemIndex of
            0 : t2 := '1';
            1 : t2 := '2';
            2 : t2 := '4';
          end;
          TMemo(Comp).Lines.Insert(k,'SOUND_QUALITY = ' + t2);
        end
      else if t1 = 'SOUND_CHANNEL' then
        begin
          TMemo(Comp).Lines.Delete(k);
          if Conf.sCheckBox26.Checked then
            t2 := '2';
          TMemo(Comp).Lines.Insert(k,'SOUND_CHANNEL = ' + t2);
        end
      else if t1 = 'SOUND_CHANNEL_1' then
        begin
          TMemo(Comp).Lines.Delete(k);
          if Conf.sCheckBox121.Checked then
            t2 := '1';
          TMemo(Comp).Lines.Insert(k,'SOUND_CHANNEL_1 = ' + t2);
        end
      else if t1 = 'SOUND_CHANNEL_2' then
        begin
          TMemo(Comp).Lines.Delete(k);
          if Conf.sCheckBox122.Checked then
            t2 := '1';
          TMemo(Comp).Lines.Insert(k,'SOUND_CHANNEL_2 = '+ t2);
        end
      else if t1 = 'SOUND_CHANNEL_3' then
        begin
          TMemo(Comp).Lines.Delete(k);
          if Conf.sCheckBox123.Checked then
            t2 := '1';
          TMemo(Comp).Lines.Insert(k,'SOUND_CHANNEL_3 = ' + t2);
        end
      else if t1 = 'SOUND_CHANNEL_4' then
        begin
          TMemo(Comp).Lines.Delete(k);
          if Conf.sCheckBox124.Checked then
            t2 := '1';
          TMemo(Comp).Lines.Insert(k,'SOUND_CHANNEL_4 = ' + t2);
        end
      else if t1 = 'SOUND_DIGITAL' then
        begin
          TMemo(Comp).Lines.Delete(k);
          if Conf.sCheckBox125.Checked then
            t2 := '1';
          TMemo(Comp).Lines.Insert(k,'SOUND_DIGITAL = ' + t2);
        end
    end
end;

procedure SetKigb_DefaultKeys_Keyboard;
begin
  case Conf.sComboBox68.ItemIndex of
    0 : begin
          Conf.sPanel45.Caption := 'Up';
          Conf.sPanel46.Caption := 'Down';
          Conf.sPanel47.Caption := 'Left';
          Conf.sPanel48.Caption := 'Right';
          Conf.sPanel49.Caption := 'A';
          Conf.sPanel50.Caption := 'S';
          Conf.sPanel51.Caption := 'N';
          Conf.sPanel52.Caption := 'Enter';
        end;
    1 : begin
          Conf.sPanel45.Caption := 'Num 8';
          Conf.sPanel46.Caption := 'Num 2';
          Conf.sPanel47.Caption := 'Num 4';
          Conf.sPanel48.Caption := 'Num 6';
          Conf.sPanel49.Caption := 'Num 0';
          Conf.sPanel50.Caption := 'Enter';
          Conf.sPanel51.Caption := 'Num 9';
          Conf.sPanel52.Caption := 'Num 7';
        end;
    2 : begin
          Conf.sPanel45.Caption := '1';
          Conf.sPanel46.Caption := '2';
          Conf.sPanel47.Caption := '3';
          Conf.sPanel48.Caption := '4';
          Conf.sPanel49.Caption := '5';
          Conf.sPanel50.Caption := '6';
          Conf.sPanel51.Caption := '7';
          Conf.sPanel52.Caption := '8';
        end;
    3 : Begin
          Conf.sPanel45.Caption := 'I';
          Conf.sPanel46.Caption := 'K';
          Conf.sPanel47.Caption := 'J';
          Conf.sPanel48.Caption := 'L';
          Conf.sPanel49.Caption := 'R';
          Conf.sPanel50.Caption := 'T';
          Conf.sPanel51.Caption := 'H';
          Conf.sPanel52.Caption := 'F';
        end;
//    Save the current position // na kano diadikasia.
  end;
end;

function Kigb_GetNumAndShowString(num: Integer) : string;
begin
  case num of
     0 : Result := '';
    47 : Result := 'F1';
    48 : Result := 'F2';
    49 : Result := 'F3';
    50 : Result := 'F4';
    51 : Result := 'F5';
    52 : Result := 'F6';
    53 : Result := 'F7';
    54 : Result := 'F8';
    55 : Result := 'F9';
    56 : Result := 'F10';
    57 : Result := 'F11';
    58 : Result := 'F12';
    60 : Result := '~';
    28 : Result := '1';
    29 : Result := '2';
    30 : Result := '3';
    31 : Result := '4';
    32 : Result := '5';
    33 : Result := '6';
    34 : Result := '7';
    35 : Result := '8';
    36 : Result := '9';
    27 : Result := '0';
    61 : Result := '-';
    62 : Result := '=';
    63 : Result := 'Backspace';
    64 : Result := 'Tab';
    17 : Result := 'Q';
    23 : Result := 'W';
    5 : Result := 'E';
    18 : Result := 'R';
    20 : Result := 'T';
    25 : Result := 'Y';
    21 : Result := 'U';
    9 : Result := 'I';
    15 : Result := 'O';
    16 : Result := 'P';
    65 : Result := '[';
    66 : Result := ']';
    67 : Result := 'Enter';
    114 : Result := 'Caps Lock';
    1 : Result := 'A';
    19 : Result := 'S';
    4 : Result := 'D';
    6 : Result := 'F';
    7 : Result := 'G';
    8 : Result := 'H';
    10 : Result := 'J';
    11 : Result := 'K';
    12 : Result := 'L';
    68 : Result := ';';
    69 : Result := '''';
    70 : Result := '\';
    103 : Result := 'Shift'; // Left Shift
    26 : Result := 'Z';
    24 : Result := 'X';
    3 : Result := 'C';
    22 : Result := 'V';
    2 : Result := 'B';
    14 : Result := 'N';
    13 : Result := 'M';
    72 : Result := '<';
    73 : Result := '>';
    74 : Result := '/';
    104 : Result := 'Shift'; // Right Shift
    105 : Result := 'Ctrl';  // Left Ctrl
    109 : Result := 'Left Win';
    107 : Result := 'Alt'; // Left Alt
    75 : Result := 'Space';
    108 : Result := 'Alt'; // Right Alt
    110 : Result := 'Right Win';
    111 : Result := 'Application Key';
    106 : Result := 'Ctrl'; // Right Ctrl
    92 : Result := 'Print Screen';
    112 : Result := 'Scroll Lock';
    76 : Result := 'Insert';
    78 : Result := 'Home';
    80 : Result := 'Page up';
    77 : Result := 'Delete';
    79 : Result := 'End';
    81 : Result := 'Page down';
    84 : Result := 'Up';
    82 : Result := 'Left';
    85 : Result := 'Down';
    83 : Result := 'Right';
    113 : Result := 'Num Lock';
    86 : Result := 'Num /';
    87 : Result := 'Num *';
    88 : Result := 'Num -';
    44 : Result := 'Num 7';
    45 : Result := 'Num 8';
    46 : Result := 'Num 9';
    89 : Result := 'Num +';
    41 : Result := 'Num 4';
    42 : Result := 'Num 5';
    43 : Result := 'Num 6';
    38 : Result := 'Num 1';
    39 : Result := 'Num 2';
    40 : Result := 'Num 3';
    91 : Result := 'Enter';
    37 : Result := 'Num 0';
    90 : Result := 'Num Del';
  end;
end;

function Kigb_GetStringAndSetNum(text: string) : Integer;
begin
  if text = '' then
    Result := 0
  else if text = 'F1' then
    Result := 47
  else if text = 'F2' then
    Result := 48
  else if text = 'F3' then
    Result := 49
  else if text = 'F4' then
    Result := 50
  else if text = 'F5' then
    Result := 51
  else if text = 'F6' then
    Result := 52
  else if text = 'F7' then
    Result := 53
  else if text = 'F8' then
    Result := 54
  else if text = 'F9' then
    Result := 55
  else if text = 'F10' then
    Result := 56
  else if text = 'F11' then
    Result := 57
  else if text = 'F12' then
    Result := 58
  else if text = '~' then
    Result := 60
  else if text = '1' then
    Result := 28
  else if text = '2' then
    Result := 29
  else if text = '3' then
    Result := 30
  else if text = '4' then
    Result := 31
  else if text = '5' then
    Result := 32
  else if text = '6' then
    Result := 33
  else if text = '7' then
    Result := 34
  else if text = '8' then
    Result := 35
  else if text = '9' then
    Result := 36
  else if text = '0' then
    Result := 27
  else if text = '-' then
    Result := 61
  else if text = '=' then
    Result := 62
  else if text = 'Backspace' then
    Result := 63
  else if text = 'Tab' then
    Result := 64
  else if text = 'Q' then
    Result := 17
  else if text = 'W' then
    Result := 23
  else if text = 'E' then
    Result := 5
  else if text = 'R' then
    Result := 18
  else if text = 'T' then
    Result := 20
  else if text = 'Y' then
    Result := 25
  else if text = 'U' then
    Result := 21
  else if text = 'I' then
    Result := 9
  else if text = 'O' then
    Result := 15
  else if text = 'P' then
    Result := 16
  else if text = '[' then
    Result := 65
  else if text = ']' then
    Result := 66
  else if text = 'Enter' then
    Result := 67
  else if text = 'Caps Lock' then
    Result := 114
  else if text = 'A' then
    Result := 1
  else if text = 'S' then
    Result := 19
  else if text = 'D' then
    Result := 4
  else if text = 'F' then
    Result := 6
  else if text = 'G' then
    Result := 7
  else if text = 'H' then
    Result := 8
  else if text = 'J' then
    Result := 10
  else if text = 'K' then
    Result := 11
  else if text = 'L' then
    Result := 12
  else if text = ';' then
    Result := 68
  else if text = '''' then
    Result := 69
  else if text = '\' then
    Result := 70
  else if text = 'Shift' then
    Result := 103 // Left Shift
  else if text = 'Z' then
    Result := 26
  else if text = 'X' then
    Result := 24
  else if text = 'C' then
    Result := 3
  else if text = 'V' then
    Result := 22
  else if text = 'B' then
    Result := 2
  else if text = 'N' then
    Result := 14
  else if text = 'M' then
    Result := 13
  else if text = '<' then
    Result := 72
  else if text = '>' then
    Result := 73
  else if text = '/' then
    Result := 74
  else if text = 'Shift' then
    Result := 104 // Right Shift
  else if text = 'Ctrl' then
    Result := 105 // Left Ctrl
  else if text = 'Left Win' then
    Result := 109
  else if text = 'Alt' then
    Result := 107 // Left Alt
  else if text = 'Space' then
    Result := 75
  else if text = 'Alt' then
    Result := 108 // Right Alt
  else if text = 'Right Win' then
    Result := 110
  else if text = 'Application Key' then
    Result := 111
  else if text = 'Ctrl' then
    Result := 106 // Right Ctrl
  else if text = 'Print Screen' then
    Result := 92
  else if text = 'Scroll Lock' then
    Result := 112
  else if text = 'Insert' then
    Result := 76
  else if text = 'Home' then
    Result := 78
  else if text = 'Page up' then
    Result := 80
  else if text = 'Delete' then
    Result := 77
  else if text = 'End' then
    Result := 79
  else if text = 'Page down' then
    Result := 81
  else if text = 'Up' then
    Result := 84
  else if text = 'Left' then
    Result := 82
  else if text = 'Down' then
    Result := 85
  else if text = 'Right' then
    Result := 83
  else if text = 'Num Lock' then
    Result := 113
  else if text = 'Num /' then
    Result := 86
  else if text = 'Num *' then
    Result := 87
  else if text = 'Num -' then
    Result := 88
  else if text = 'Num 7' then
    Result := 44
  else if text = 'Num 8' then
    Result := 45
  else if text = 'Num 9' then
    Result := 46
  else if text = 'Num +' then
    Result := 89
  else if text = 'Num 4' then
    Result := 41
  else if text = 'Num 5' then
    Result := 42
  else if text = 'Num 6' then
    Result := 43
  else if text = 'Num 1' then
    Result := 38
  else if text = 'Num 2' then
    Result := 39
  else if text = 'Num 3' then
    Result := 40
  else if text = 'Enter' then
    Result := 91
  else if text = 'Num 0' then
    Result := 37
  else if text = 'Num Del' then
    Result := 90
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_kigb_soundpanel;
begin
  if (Cmenustate = 'em_handheld_kigb_screen') then
    em_kigb_screen_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_paths') then
    em_kigb_paths_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_others') then
    em_kigb_others_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_database') then
    em_kigb_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,True);
  Cmenustate := 'em_handheld_kigb_sound';
  em_kigb_sound_ShowDynamicComps;
  ShowButtonDown(8,'EM_HANDHELDS_NINTENDO_KIGB_SOUND');
  Conf.Pem_kigb_sound.Tag := 1;
  ShowHidePanel(CurrentPanel,'Pem_kigb_sound');
end;

procedure em_kigb_sound_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_kigb_sound,'media\confeditor\images\kigb\kigb.png',
              3,590,90,71,i,'',True,False);
        2 : Image_Comp(Conf.Pem_kigb_sound,'media\confeditor\images\kigb\kigb_image.png',
              582,538,147,120,i,'',True,False);
        3 : Image_Comp(Conf.Pem_kigb_sound,'media\confeditor\images\kigb\sound.png',
              450,2,278,71,i,'',True,False);
      end;
    end;
  for i := 1 to 27 do
    begin
      case i of
        1 : Label_Comp(Conf.grp94,'Exit',90,24,i,'',True,True,True);
        2 : Label_Comp(Conf.grp94,'Reset',78,72,i,'',True,True,True);
        3 : Label_Comp(Conf.grp94,'Pause',76,120,i,'',True,True,True);
        4 : Label_Comp(Conf.grp89,'Up',74,20,i,'',True,True,True);
        5 : Label_Comp(Conf.grp89,'Down',60,55,i,'',True,True,True);
        6 : Label_Comp(Conf.grp89,'Left',69,90,i,'',True,True,True);
        7 : Label_Comp(Conf.grp89,'Right',61,125,i,'',True,True,True);
        8 : Label_Comp(Conf.grp89,'Button A',130,20,i,'',True,True,True);
        9 : Label_Comp(Conf.grp89,'Button B',131,55,i,'',True,True,True);
        10 : Label_Comp(Conf.grp89,'Select',144,90,i,'',True,True,True);
        11 : Label_Comp(Conf.grp89,'Start',150,125,i,'',True,True,True);
        12 : Label_Comp(Conf.grp91,'Up',74,20,i,'',True,True,True);
        13 : Label_Comp(Conf.grp91,'Down',60,55,i,'',True,True,True);
        14 : Label_Comp(Conf.grp91,'Left',69,90,i,'',True,True,True);
        15 : Label_Comp(Conf.grp91,'Right',61,125,i,'',True,True,True);
        16 : Label_Comp(Conf.grp91,'Button A',130,20,i,'',True,True,True);
        17 : Label_Comp(Conf.grp91,'Button B',131,55,i,'',True,True,True);
        18 : Label_Comp(Conf.grp91,'Select',144,90,i,'',True,True,True);
        19 : Label_Comp(Conf.grp91,'Start',150,125,i,'',True,True,True);
        20 : Label_Comp(Conf.grp92,'Up',110,30,i,'',True,True,True);
        21 : Label_Comp(Conf.grp92,'Down',94,65,i,'',True,True,True);
        22 : Label_Comp(Conf.grp92,'Left',103,100,i,'',True,True,True);
        23 : Label_Comp(Conf.grp92,'Right',95,135,i,'',True,True,True);
        24 : Label_Comp(Conf.grp93,'Up',110,30,i,'',True,True,True);
        25 : Label_Comp(Conf.grp93,'Down',94,65,i,'',True,True,True);
        26 : Label_Comp(Conf.grp93,'Left',103,100,i,'',True,True,True);
        27 : Label_Comp(Conf.grp93,'Right',95,135,i,'',True,True,True);
      end;
    end;
end;

procedure em_kigb_sound_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
  for i := 1 to 27 do
    begin
      Comp := FindComponentEx('Conf.Label' + IntToStr(i));
      TsLabel(Comp).Free;      
    end;
end;

end.
 