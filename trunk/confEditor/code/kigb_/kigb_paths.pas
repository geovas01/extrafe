unit kigb_paths;

interface
uses
  SysUtils,Classes,ExtCtrls,Forms,IniFiles,StdCtrls;

  procedure SetKigb_PathsfromKigbIni;
  procedure SaveKigb_PathsAtExit;

  procedure Add_Kigb_Exe;
  procedure CreateKigb_settings_firstTime;
  procedure CreateDefaultKigb_Ini;
  procedure Create_KigbMemoIni;
  procedure SetKigb_RomPath;
  procedure SetKigb_SnapshotPath;
  procedure SetKigb_SavePath;
  procedure SetKigb_SaveStatePath;
  procedure SetKigb_InputPath;
  procedure SetKigb_ConfigurePath;
  procedure SetUpKigbRomPath;
  procedure SetUpKigbSnapshotPath;
  procedure SetUpKigbSavePath;
  procedure SetUpKigbSaveStatePath;
  procedure SetUpKigbInputPath;
  procedure SetUPKigbConfigurePath;

// Menu actions
  procedure Show_kigb_pathspanel;
  procedure em_kigb_paths_ShowDynamicComps;
  procedure em_kigb_paths_FreeDynamicComps;

var
  OldKigb_Exe: string;
  
implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  kigb_screen,kigb_sound,kigb_others,kigb_database;


procedure SetKigb_PathsfromKigbIni;
var
  KigbCfgFile: TextFile;
  k,x: Integer;
  text,t1,t2: string;
begin
  if Kigb_Exe <> '' then
    begin
      if Started then
        Conf.sEdit89.Text := FullPathKigb_Exe + Kigb_Exe;
      AssignFile(KigbCfgFile,KigbCfg_File);
      Reset(KigbCfgFile);
      while not Eof(KigbCfgFile) do
        begin
          Readln(KigbCfgFile,text);
          x := Pos('=',text);
          t1 := Trim(Copy(text,0,x - 1));
          t2 := Trim(Copy(text,x + 1,Length(text) - x));
          if t1 = 'ROM_PATH' then
            if t2 = 'rom/' then
              Conf.sEdit90.Text := FullPathKigb_Exe + 'rom/'
            else
              Conf.sEdit90.Text := t2
          else if t1 = 'SNAP_PATH' then
            if t2 = 'snap/' then
              Conf.sEdit91.Text := FullPathKigb_Exe + 'snap/'
            else
              Conf.sEdit91.Text := t2
          else if t1 = 'SAVE_PATH' then
            if t2 = 'save/' then
              Conf.sEdit92.Text := FullPathKigb_Exe + 'save/'
            else
              Conf.sEdit92.Text := t2
          else if t1 = 'STATE_PATH' then
            if t2 = 'state/' then
              Conf.sEdit93.Text := FullPathKigb_Exe + 'state/'
            else
              Conf.sEdit93.Text := t2
          else if t1 = 'INPUT_PATH' then
            if t2 = 'inp/' then
              Conf.sEdit94.Text := FullPathKigb_Exe + 'inp/'
            else
              Conf.sEdit94.Text := t2
          else if t1 = 'CONFIG_PATH' then
            if t2 = 'cfg/' then
              Conf.sEdit95.Text := FullPathKigb_Exe + 'cfg/'
            else
              Conf.sEdit95.Text := t2
          else if t1 = 'EMU_TYPE' then
            case StrToInt(t2) of
              1 : begin
                    Conf.sCheckBox110.Checked := True;
                    Conf.sCheckBox111.Checked := False;
                    Conf.sCheckBox112.Checked := False;
                  end;
              2 : begin
                    Conf.sCheckBox110.Checked := False;
                    Conf.sCheckBox111.Checked := True;
                    Conf.sCheckBox112.Checked := False;
                  end;
              3 : begin
                    Conf.sCheckBox110.Checked := True;
                    Conf.sCheckBox111.Checked := True;
                    Conf.sCheckBox112.Checked := False;
                  end;
              4 : begin
                    Conf.sCheckBox110.Checked := False;
                    Conf.sCheckBox111.Checked := False;
                    Conf.sCheckBox112.Checked := True;
                  end;
              5 : begin
                    Conf.sCheckBox110.Checked := True;
                    Conf.sCheckBox111.Checked := False;
                    Conf.sCheckBox112.Checked := True;
                  end;
              6 : begin
                    Conf.sCheckBox110.Checked := False;
                    Conf.sCheckBox111.Checked := True;
                    Conf.sCheckBox112.Checked := True;
                  end;
              7 : begin
                    Conf.sCheckBox110.Checked := True;
                    Conf.sCheckBox111.Checked := True;
                    Conf.sCheckBox112.Checked := True;
                  end;
            end
          else if t1 = 'EMU_SGB' then
            case StrToInt(t2) of
              0 : Conf.rb1.Checked := True;
              1 : Conf.rb1.Checked := True;
            end
          else if t1 = 'EMU_PREFERENCE' then
            case StrToInt(t2) of
              0 : Conf.rb32.Checked := True;
              1 : Conf.rb33.Checked := True;
              2 : Conf.rb31.Checked := True;
            end
          else if t1 = 'GBA' then
            begin
              if t2 = '1' then
                Conf.sCheckBox113.Checked := True;
            end
          else if t1 = 'EMU_SPEED' then
            Conf.sComboBox66.ItemIndex := StrToInt(t2)
          else if t1 = 'BOOT_GB' then
            begin
              if t2 = '1' then
                Conf.sCheckBox63.Checked := True;
            end
          else if t1 = 'BOOT_GBC' then
            begin
              if t2 = '1' then
                Conf.sCheckBox64.Checked := True;
            end
          else if t1 = 'PER_GAME_CONFIGURE' then
            begin
              if t2 = '1' then
                Conf.sCheckBox115.Checked := True;
            end;
        end;
      CloseFile(KigbCfgFile);
      if Started then
        Create_KigbMemoIni;
    end;
end;

procedure SaveKigb_PathsAtExit;
var
  Comp: TComponent;
  k,l: Integer;
  Text,t1,t2: string;
begin
  if Kigb_Exe <> '' then
    begin
      Comp := FindComponentEx('Conf.MemoEmu2');
      for k:= 0 to TMemo(Comp).Lines.Count - 1 do
        begin
          Text := TMemo(Comp).Lines.Strings[k];
          l := Pos('=',Text);
          t1 := Trim(Copy(Text,0,l - 1));
          if t1 = 'ROM_PATH' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'ROM_PATH = '+ Conf.sEdit90.Text);
            end
          else if t1 = 'SNAP_PATH' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'SNAP_PATH = '+ Conf.sEdit91.Text);
            end
          else if t1 = 'SAVE_PATH' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'SAVE_PATH = '+ Conf.sEdit92.Text);
            end
          else if t1 = 'STATE_PATH' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'STATE_PATH = '+ Conf.sEdit93.Text);
            end
          else if t1 = 'INPUT_PATH' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'INPUT_PATH = '+ Conf.sEdit94.Text);
            end
          else if t1 = 'CONFIG_PATH' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'CONFIG_PATH = '+ Conf.sEdit95.Text);
            end
          else if t1 = 'EMU_TYPE' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if (Conf.sCheckBox110.Checked = True) and (Conf.sCheckBox111.Checked = False) and (Conf.sCheckBox112.Checked = False) then
                t2 := '1'
              else if (Conf.sCheckBox110.Checked = False) and (Conf.sCheckBox111.Checked = True) and (Conf.sCheckBox112.Checked = False) then
                t2 := '2'
              else if (Conf.sCheckBox110.Checked = True) and (Conf.sCheckBox111.Checked = True) and (Conf.sCheckBox112.Checked = False) then
                t2 := '3'
              else if (Conf.sCheckBox110.Checked = False) and (Conf.sCheckBox111.Checked = False) and (Conf.sCheckBox112.Checked = True) then
                t2 := '4'
              else if (Conf.sCheckBox110.Checked = True) and (Conf.sCheckBox111.Checked = False) and (Conf.sCheckBox112.Checked = True) then
                t2 := '5'
              else if (Conf.sCheckBox110.Checked = False) and (Conf.sCheckBox111.Checked = True) and (Conf.sCheckBox112.Checked = True) then
                t2 := '6'
              else if (Conf.sCheckBox110.Checked = True) and (Conf.sCheckBox111.Checked = True) and (Conf.sCheckBox112.Checked = True) then
                t2 := '7';
              TMemo(Comp).Lines.Insert(k,'EMU_TYPE = '+ t2);
            end
          else if t1 = 'EMU_SGB' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.rb1.Checked = True then
                TMemo(Comp).Lines.Insert(k,'EMU_SGB = 0')
              else if Conf.rb2.Checked = True then
                TMemo(Comp).Lines.Insert(k,'EMU_SGB = 1');
            end
          else if t1 = 'EMU_PREFERENCE' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.rb32.Checked = True then
                TMemo(Comp).Lines.Insert(k,'EMU_PREFERENCE = 0')
              else if Conf.rb33.Checked = True then
                TMemo(Comp).Lines.Insert(k,'EMU_PREFERENCE = 1')
              else if Conf.rb31.Checked = True then
                TMemo(Comp).Lines.Insert(k,'EMU_PREFERENCE = 2');
            end
          else if t1 = 'GBA' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox113.Checked = True then
                TMemo(Comp).Lines.Insert(k,'GBA = 1')
              else
                TMemo(Comp).Lines.Insert(k,'GBA = 0');
            end
          else if t1 = 'EMU_SPEED' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'EMU_SPEED = '+ IntToStr(Conf.sComboBox66.ItemIndex));
            end
          else if t1 = 'BOOT_GB' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox63.Checked = True then
                TMemo(Comp).Lines.Insert(k,'BOOT_GB = 1')
              else
                TMemo(Comp).Lines.Insert(k,'BOOT_GB = 0');
            end
          else if t1 = 'BOOT_GBC' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox64.Checked = True then
                TMemo(Comp).Lines.Insert(k,'BOOT_GBC = 1')
              else
                TMemo(Comp).Lines.Insert(k,'BOOT_GBC = 0');
            end
          else if t1 = 'PER_GAME_CONFIGURE' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox115.Checked = True then
                TMemo(Comp).Lines.Insert(k,'PER_GAME_CONFIGURE = 1')
              else
                TMemo(Comp).Lines.Insert(k,'PER_GAME_CONFIGURE = 0');
            end;
        end;
    end;
end;


procedure Add_Kigb_Exe;
begin
  gFindFiles := 'Kigb_exe';
  Conf.Find_Files.InitialDir := Program_Path+'emulators';
  Conf.Find_Files.Filter := 'Kigb.exe|kigb.exe';
  Conf.Find_Files.Execute;
  OldKigb_Exe := Conf.sEdit89.Text;
end;

procedure CreateKigb_settings_firstTime;
begin
  if OldKigb_Exe <> Conf.Find_Files.FileName then
    begin
      Kigb_Exe := ExtractFileName(Conf.Find_Files.FileName);
      FullPathKigb_Exe := ExtractFilePath(Conf.Find_Files.FileName);
      Conf.sEdit89.Text := FullPathKigb_Exe + Kigb_Exe;
      Kigb_confEditor_ini := ExtractFilePath(Application.ExeName) + 'media\emulators\handheld\nintendo\kigb\config\config.ini';
      Kigb_Config := TIniFile.Create(Kigb_confEditor_ini);
      Kigb_Config.WriteString('Paths','KigbExe',Kigb_Exe);
      Kigb_Config.WriteString('Paths','FullPathKigbExe',FullPathKigb_Exe);
      CreateDefaultKigb_Ini;
      SetKigb_PathsfromKigbIni;
      SetKigb_ScreenfromKigbIni;
      SetKigb_SoundfromKigbIni;
      SetKigb_OthersfromKigbIni;
      SetKigb_DatabasefromKigbIni;
    end;
end;

procedure CreateDefaultKigb_Ini;
var
  rf: TStringList;
begin
  rf := TStringList.Create;
  rf.Add('KEY_UP = 84');
  rf.Add('KEY_DOWN = 85');
  rf.Add('KEY_LEFT = 82');
  rf.Add('KEY_RIGHT = 83');
  rf.Add('KEY_START = 67');
  rf.Add('KEY_SELECT = 14');
  rf.Add('KEY_A = 1');
  rf.Add('KEY_B = 19');
  rf.Add('SAVE_PATH = save/');
  rf.Add('ROM_PATH = rom/');
  rf.Add('SIZE_FACTOR = 2');
  rf.Add('FRAME_SKIP = 0');
  rf.Add('PALETTE = 0');
  rf.Add('SNAP_PATH = snap/');
  rf.Add('STATE_PATH = state/');
  rf.Add('INPUT_PATH = inp/');
  rf.Add('NET_ADDR =');
  rf.Add('SGB_BORDER = 1');
  rf.Add('P2_KEY_UP = 45');
  rf.Add('P2_KEY_DOWN = 39');
  rf.Add('P2_KEY_LEFT = 41');
  rf.Add('P2_KEY_RIGHT = 43');
  rf.Add('P2_KEY_START = 44');
  rf.Add('P2_KEY_SELECT = 46');
  rf.Add('P2_KEY_A = 37');
  rf.Add('P2_KEY_B = 91');
  rf.Add('P3_KEY_UP = 28');
  rf.Add('P3_KEY_DOWN = 29');
  rf.Add('P3_KEY_LEFT = 30');
  rf.Add('P3_KEY_RIGHT = 31');
  rf.Add('P3_KEY_START = 34');
  rf.Add('P3_KEY_SELECT = 35');
  rf.Add('P3_KEY_A = 32');
  rf.Add('P3_KEY_B = 33');
  rf.Add('P4_KEY_UP = 9');
  rf.Add('P4_KEY_DOWN = 11');
  rf.Add('P4_KEY_LEFT = 10');
  rf.Add('P4_KEY_RIGHT = 12');
  rf.Add('P4_KEY_START = 6');
  rf.Add('P4_KEY_SELECT = 8');
  rf.Add('P4_KEY_A = 18');
  rf.Add('P4_KEY_B = 20');
  rf.Add('J1_INDEX = 0');
  rf.Add('J1_F_UP_STICK = 1');
  rf.Add('J1_F_DOWN_STICK = 1');
  rf.Add('J1_F_LEFT_STICK = 1');
  rf.Add('J1_F_RIGHT_STICK = 1');
  rf.Add('J1_F_BUT_A_STICK = 0');
  rf.Add('J1_F_BUT_B_STICK = 0');
  rf.Add('J1_F_BUT_START_STICK = 0');
  rf.Add('J1_F_BUT_SELECT_STICK = 0');
  rf.Add('J1_UP_STICK = 0');
  rf.Add('J1_DOWN_STICK = 0');
  rf.Add('J1_LEFT_STICK = 0');
  rf.Add('J1_RIGHT_STICK = 0');
  rf.Add('J1_BUT_A_STICK = -1');
  rf.Add('J1_BUT_B_STICK = -1');
  rf.Add('J1_BUT_START_STICK = -1');
  rf.Add('J1_BUT_SELECT_STICK = -1');
  rf.Add('J1_UP_AXIS = 1');
  rf.Add('J1_DOWN_AXIS = 1');
  rf.Add('J1_LEFT_AXIS = 0');
  rf.Add('J1_RIGHT_AXIS = 0');
  rf.Add('J1_BUT_A_AXIS = -1');
  rf.Add('J1_BUT_B_AXIS = -1');
  rf.Add('J1_BUT_START_AXIS = -1');
  rf.Add('J1_BUT_SELECT_AXIS = -1');
  rf.Add('J1_UP_POS = 0');
  rf.Add('J1_DOWN_POS = 1');
  rf.Add('J1_LEFT_POS = 0');
  rf.Add('J1_RIGHT_POS = 1');
  rf.Add('J1_BUT_A_POS = -1');
  rf.Add('J1_BUT_B_POS = -1');
  rf.Add('J1_BUT_START_POS = -1');
  rf.Add('J1_BUT_SELECT_POS = -1');
  rf.Add('J1_BUT_UP = -1');
  rf.Add('J1_BUT_DOWN = -1');
  rf.Add('J1_BUT_LEFT = -1');
  rf.Add('J1_BUT_RIGHT = -1');
  rf.Add('J1_BUT_A = 0');
  rf.Add('J1_BUT_B = 1');
  rf.Add('J1_BUT_START = 2');
  rf.Add('J1_BUT_SELECT = 3');
  rf.Add('J2_INDEX = -1');
  rf.Add('J2_F_UP_STICK = 1');
  rf.Add('J2_F_DOWN_STICK = 1');
  rf.Add('J2_F_LEFT_STICK = 1');
  rf.Add('J2_F_RIGHT_STICK = 1');
  rf.Add('J2_F_BUT_A_STICK = 0');
  rf.Add('J2_F_BUT_B_STICK = 0');
  rf.Add('J2_F_BUT_START_STICK = 0');
  rf.Add('J2_F_BUT_SELECT_STICK = 0');
  rf.Add('J2_UP_STICK = 0');
  rf.Add('J2_DOWN_STICK = 0');
  rf.Add('J2_LEFT_STICK = 0');
  rf.Add('J2_RIGHT_STICK = 0');
  rf.Add('J2_BUT_A_STICK = -1');
  rf.Add('J2_BUT_B_STICK = -1');
  rf.Add('J2_BUT_START_STICK = -1');
  rf.Add('J2_BUT_SELECT_STICK = -1');
  rf.Add('J2_UP_AXIS = 1');
  rf.Add('J2_DOWN_AXIS = 1');
  rf.Add('J2_LEFT_AXIS = 0');
  rf.Add('J2_RIGHT_AXIS = 0');
  rf.Add('J2_BUT_A_AXIS = -1');
  rf.Add('J2_BUT_B_AXIS = -1');
  rf.Add('J2_BUT_START_AXIS = -1');
  rf.Add('J2_BUT_SELECT_AXIS = -1');
  rf.Add('J2_UP_POS = 0');
  rf.Add('J2_DOWN_POS = 1');
  rf.Add('J2_LEFT_POS = 0');
  rf.Add('J2_RIGHT_POS = 1');
  rf.Add('J2_BUT_A_POS = -1');
  rf.Add('J2_BUT_B_POS = -1');
  rf.Add('J2_BUT_START_POS = -1');
  rf.Add('J2_BUT_SELECT_POS = -1');
  rf.Add('J2_BUT_UP = -1');
  rf.Add('J2_BUT_DOWN = -1');
  rf.Add('J2_BUT_LEFT = -1');
  rf.Add('J2_BUT_RIGHT = -1');
  rf.Add('J2_BUT_A = 0');
  rf.Add('J2_BUT_B = 1');
  rf.Add('J2_BUT_START = 2');
  rf.Add('J2_BUT_SELECT = 3');
  rf.Add('J3_INDEX = -1');
  rf.Add('J3_F_UP_STICK = 1');
  rf.Add('J3_F_DOWN_STICK = 1');
  rf.Add('J3_F_LEFT_STICK = 1');
  rf.Add('J3_F_RIGHT_STICK = 1');
  rf.Add('J3_F_BUT_A_STICK = 0');
  rf.Add('J3_F_BUT_B_STICK = 0');
  rf.Add('J3_F_BUT_START_STICK = 0');
  rf.Add('J3_F_BUT_SELECT_STICK = 0');
  rf.Add('J3_UP_STICK = 0');
  rf.Add('J3_DOWN_STICK = 0');
  rf.Add('J3_LEFT_STICK = 0');
  rf.Add('J3_RIGHT_STICK = 0');
  rf.Add('J3_BUT_A_STICK = -1');
  rf.Add('J3_BUT_B_STICK = -1');
  rf.Add('J3_BUT_START_STICK = -1');
  rf.Add('J3_BUT_SELECT_STICK = -1');
  rf.Add('J3_UP_AXIS = 1');
  rf.Add('J3_DOWN_AXIS = 1');
  rf.Add('J3_LEFT_AXIS = 0');
  rf.Add('J3_RIGHT_AXIS = 0');
  rf.Add('J3_BUT_A_AXIS = -1');
  rf.Add('J3_BUT_B_AXIS = -1');
  rf.Add('J3_BUT_START_AXIS = -1');
  rf.Add('J3_BUT_SELECT_AXIS = -1');
  rf.Add('J3_UP_POS = 0');
  rf.Add('J3_DOWN_POS = 1');
  rf.Add('J3_LEFT_POS = 0');
  rf.Add('J3_RIGHT_POS = 1');
  rf.Add('J3_BUT_A_POS = -1');
  rf.Add('J3_BUT_B_POS = -1');
  rf.Add('J3_BUT_START_POS = -1');
  rf.Add('J3_BUT_SELECT_POS = -1');
  rf.Add('J3_BUT_UP = -1');
  rf.Add('J3_BUT_DOWN = -1');
  rf.Add('J3_BUT_LEFT = -1');
  rf.Add('J3_BUT_RIGHT = -1');
  rf.Add('J3_BUT_A = 0');
  rf.Add('J3_BUT_B = 1');
  rf.Add('J3_BUT_START = 2');
  rf.Add('J3_BUT_SELECT = 3');
  rf.Add('J4_INDEX = -1');
  rf.Add('J4_F_UP_STICK = 1');
  rf.Add('J4_F_DOWN_STICK = 1');
  rf.Add('J4_F_LEFT_STICK = 1');
  rf.Add('J4_F_RIGHT_STICK = 1');
  rf.Add('J4_F_BUT_A_STICK = 0');
  rf.Add('J4_F_BUT_B_STICK = 0');
  rf.Add('J4_F_BUT_START_STICK = 0');
  rf.Add('J4_F_BUT_SELECT_STICK = 0');
  rf.Add('J4_UP_STICK = 0');
  rf.Add('J4_DOWN_STICK = 0');
  rf.Add('J4_LEFT_STICK = 0');
  rf.Add('J4_RIGHT_STICK = 0');
  rf.Add('J4_BUT_A_STICK = -1');
  rf.Add('J4_BUT_B_STICK = -1');
  rf.Add('J4_BUT_START_STICK = -1');
  rf.Add('J4_BUT_SELECT_STICK = -1');
  rf.Add('J4_UP_AXIS = 1');
  rf.Add('J4_DOWN_AXIS = 1');
  rf.Add('J4_LEFT_AXIS = 0');
  rf.Add('J4_RIGHT_AXIS = 0');
  rf.Add('J4_BUT_A_AXIS = -1');
  rf.Add('J4_BUT_B_AXIS = -1');
  rf.Add('J4_BUT_START_AXIS = -1');
  rf.Add('J4_BUT_SELECT_AXIS = -1');
  rf.Add('J4_UP_POS = 0');
  rf.Add('J4_DOWN_POS = 1');
  rf.Add('J4_LEFT_POS = 0');
  rf.Add('J4_RIGHT_POS = 1');
  rf.Add('J4_BUT_A_POS = -1');
  rf.Add('J4_BUT_B_POS = -1');
  rf.Add('J4_BUT_START_POS = -1');
  rf.Add('J4_BUT_SELECT_POS = -1');
  rf.Add('J4_BUT_UP = -1');
  rf.Add('J4_BUT_DOWN = -1');
  rf.Add('J4_BUT_LEFT = -1');
  rf.Add('J4_BUT_RIGHT = -1');
  rf.Add('J4_BUT_A = 0');
  rf.Add('J4_BUT_B = 1');
  rf.Add('J4_BUT_START = 2');
  rf.Add('J4_BUT_SELECT = 3');
  rf.Add('DEF_BORDER = border.pcx');
  rf.Add('BORDER_INTERPOLATION = 0');
  rf.Add('SOUND_VOLUME = 128');
  rf.Add('GB_DEVICE = 1');
  rf.Add('SOUND_PAN = 128');
  rf.Add('SOUND_CHANNEL = 2');
  rf.Add('SOUND_QUALITY = 4');
  rf.Add('SOUND_ON = 1');
  rf.Add('SOUND_CHANNEL_1 = 1');
  rf.Add('SOUND_CHANNEL_2 = 1');
  rf.Add('SOUND_CHANNEL_3 = 1');
  rf.Add('SOUND_CHANNEL_4 = 1');
  rf.Add('SOUND_DIGITAL = 1');
  rf.Add('RECENT_0 = ');
  rf.Add('RECENT_1 = ');
  rf.Add('RECENT_2 = ');
  rf.Add('RECENT_3 = ');
  rf.Add('RECENT_4 = ');
  rf.Add('RECENT_5 = ');
  rf.Add('RECENT_6 = ');
  rf.Add('RECENT_7 = ');
  rf.Add('CONFIG_PATH = cfg/');
  rf.Add('FULL_SCREEN = 0');
  rf.Add('CUSTOM_PALETTE_RED = 1346383904');
  rf.Add('CUSTOM_PALETTE_GREEN = -811634881');
  rf.Add('CUSTOM_PALETTE_BLUE = 1346383904');
  rf.Add('EMU_SPEED = 2');
  rf.Add('EMU_TYPE = 7');
  rf.Add('EMU_SGB = 0');
  rf.Add('EMU_PREFERENCE = 2');
  rf.Add('VIDEO_FILTER = 0');
  rf.Add('GBC_REAL_COLOR = 0');
  rf.Add('SPRITE_SHADOW = 0');
  rf.Add('MIX_FRAME = 1');
  rf.Add('GBA = 0');
  rf.Add('THEME = 0');
  rf.Add('ALT_KEY_EXIT = 0');
  rf.Add('ALT_KEY_RESET = 0');
  rf.Add('ALT_KEY_PAUSE = 0');
  rf.Add('USE_WIN32_OPEN_FILE = 0');
  rf.Add('MOTION_KEY_UP = 45');
  rf.Add('MOTION_KEY_DOWN = 39');
  rf.Add('MOTION_KEY_LEFT = 41');
  rf.Add('MOTION_KEY_RIGHT = 43');
  rf.Add('MOTION_JOY_INDEX = 0');
  rf.Add('MOTION_JOY_F_UP_STICK = 0');
  rf.Add('MOTION_JOY_F_DOWN_STICK = 0');
  rf.Add('MOTION_JOY_F_LEFT_STICK = 0');
  rf.Add('MOTION_JOY_F_RIGHT_STICK = 0');
  rf.Add('MOTION_JOY_UP_STICK = 0');
  rf.Add('MOTION_JOY_DOWN_STICK = 0');
  rf.Add('MOTION_JOY_LEFT_STICK = 0');
  rf.Add('MOTION_JOY_RIGHT_STICK = 0');
  rf.Add('MOTION_JOY_UP_AXIS = 0');
  rf.Add('MOTION_JOY_DOWN_AXIS = 0');
  rf.Add('MOTION_JOY_LEFT_AXIS = 0');
  rf.Add('MOTION_JOY_RIGHT_AXIS = 0');
  rf.Add('MOTION_JOY_UP_POS = 0');
  rf.Add('MOTION_JOY_DOWN_POS = 0');
  rf.Add('MOTION_JOY_LEFT_POS = 0');
  rf.Add('MOTION_JOY_RIGHT_POS = 0');
  rf.Add('MOTION_JOY_BUT_UP = 4');
  rf.Add('MOTION_JOY_BUT_DOWN = 5');
  rf.Add('MOTION_JOY_BUT_LEFT = 6');
  rf.Add('MOTION_JOY_BUT_RIGHT = 7');
  rf.Add('AUTO_FIRE_A = 0');
  rf.Add('AUTO_FIRE_B = 0');
  rf.Add('AUTO_FIRE_A_SPEED = 4');
  rf.Add('AUTO_FIRE_B_SPEED = 4');
  rf.Add('PER_GAME_CONFIGURE = 1');
  rf.Add('BOOT_GB = 0');
  rf.Add('BOOT_GBC = 0');
  rf.SaveToFile(FullPathKigb_Exe + 'kigb.cfg');
  rf.Free;
  Create_KigbMemoIni;
end;

procedure Create_KigbMemoIni;
var
  KigbCfgFile: TextFile;
  text,value: string;
  Comp: TComponent;
begin
  MemoEmu_Comp(Conf,2);
  Comp := FindComponentEx('Conf.MemoEmu2');
  value := FullPathKigb_Exe + 'kigb.cfg';
  AssignFile(KigbCfgFile,value);
  Reset(KigbCfgFile);
    while not Eof(KigbCfgFile) do
      begin
        Readln(KigbCfgFile,text);
        TMemo(Comp).Lines.Add(text);
      end;
  CloseFile(KigbCfgFile);
end;

procedure SetKigb_RomPath;
begin
  gFindFiles := 'Kigb_rom';
  Conf.Find_Files.Execute;
end;

procedure SetKigb_SnapshotPath;
begin
  gFindFiles := 'Kigb_snap';
  Conf.Find_Files.Execute;
end;

procedure SetKigb_SavePath;
begin
  gFindFiles := 'Kigb_save';
  Conf.Find_Files.Execute;
end;

procedure SetKigb_SaveStatePath;
begin
  gFindFiles := 'Kigb_savestate';
  Conf.Find_Files.Execute;
end;

procedure SetKigb_InputPath;
begin
  gFindFiles := 'Kigb_input';
  Conf.Find_Files.Execute;
end;

procedure SetKigb_ConfigurePath;
begin
  gFindFiles := 'Kigb_configure';
  Conf.Find_Files.Execute;
end;

procedure SetUpKigbRomPath;
begin
  Conf.sEdit90.Text := Conf.Find_Files.FileName+'/';
end;

procedure SetUpKigbSnapshotPath;
begin
  Conf.sEdit91.Text := Conf.Find_Files.FileName+'/';
end;

procedure SetUpKigbSavePath;
begin
  Conf.sEdit92.Text := Conf.Find_Files.FileName+'/';
end;

procedure SetUpKigbSaveStatePath;
begin
  Conf.sEdit93.Text := Conf.Find_Files.FileName+'/';
end;

procedure SetUpKigbInputPath;
begin
  Conf.sEdit94.Text := Conf.Find_Files.FileName+'/';
end;

procedure SetUPKigbConfigurePath;
begin
  Conf.sEdit95.Text := Conf.Find_Files.FileName+'/';
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_kigb_pathspanel;
begin
  if (Cmenustate = 'em_handheld_kigb_screen') then
    em_kigb_screen_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_sound') then
    em_kigb_sound_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_others') then
    em_kigb_others_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_database') then
    em_kigb_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn6.Caption,False,True);
  Cmenustate := 'em_handheld_kigb_paths';
  em_kigb_paths_ShowDynamicComps;
  ShowButtonDown(6,'EM_HANDHELDS_NINTENDO_KIGB_DIRS');
  Conf.Pem_kigb_sound.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_kigb_paths');
end;

procedure em_kigb_paths_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_kigb_paths,'media\confeditor\images\kigb\kigb.png',
              3,590,90,71,i,'',True,False);
        2 : Image_Comp(Conf.Pem_kigb_paths,'media\confeditor\images\kigb\kigb_image.png',
              582,538,147,120,i,'',True,False);
        3 : Image_Comp(Conf.Pem_kigb_paths,'media\confeditor\images\kigb\paths.png',
              517,2,270,71,i,'',True,False);
      end;
    end;
end;

procedure em_kigb_paths_FreeDynamicComps;
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
 