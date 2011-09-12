unit mame_dirs;

interface

uses
  SysUtils,StdCtrls,FunctionX,ShellAPI,Classes,sEdit,Types,
  Graphics,Controls;

  procedure SetMame_DirsFromMameIni;
  procedure SaveMame_DirsAtExit;

  procedure GetMame;
  procedure GetMamePath(name:string);
  procedure SetMamePath(name:string);
  procedure ChangeMemoForMame_Dirs(find: string);
  procedure CheckForMameAndCreateIni;
  procedure RightPageDirs;
  procedure LeftPageDirs;
  procedure SelectMameUp;
  procedure SelectMameDown;
  procedure SearchForSelectedMame(num: Integer);
  procedure CheckWin64ForListBox(num:ShortInt;sel:Boolean);
  procedure ListBoxOfSetupedMames(Line:Integer;Position: TRect);
  procedure ShowOnlySetupedMameBuilds;
  procedure MameChooseRomsDirsOrAdd;
  procedure ShowRomPathResults;

  procedure CheckButtonTopicsConfig_MameDirs;
  procedure ResetToDefaultTopic_MameDirs;
  procedure CheckMameDirs_TopicSettings;

  procedure CheckTopicsConfig;
  procedure ResetMameConfig_Global;
  procedure MameDirs_Clear;
  procedure MamePanels_Clear;

  procedure InitGlobal_MameMemo_ForMameIni;

Const
  AllMameBuilds32: array [0..3] of string = ('mame.exe','mamepp.exe','mamep.exe','mamepuiXT_x86.exe');
  AllMameBuilds64: array [0..5] of string = ('mame.exe','mamepp.exe','mame64.exe','mamep.exe','mamepuiXT_x86.exe','mamepuiXT_x64.exe');

var
  component: TComponent;
  foldersMame: array [0..9] of string;
  setupedMame: array [0..5] of string;
  OldDir: String;
  FromMame_DirsToFindDirs,ArrowClick,FromArrows_Mamedirs: Boolean;

implementation

uses
  main,mainconf,menu,global,
  mame_graphics,mame_sound,mame_others,mame_builds,mame_database;

procedure RightPageDirs;
begin
  Conf.sBitBtn18.Enabled := False;
  Conf.sBitBtn17.Enabled := True;
  repeat
    Conf.panel_mame_page1.Left := Conf.panel_mame_page1.Left - 10;
    Conf.panel_mame_page2.Left := conf.panel_mame_page2.Left - 10;
    if conf.panel_mame_page2.Left < 8 then
      conf.panel_mame_page2.Left := 8;
  until conf.panel_mame_page2.Left = 8;
  Conf.sLabel46.Caption := '2';
end;

procedure LeftPageDirs;
begin
  Conf.sBitBtn18.Enabled := True;
  Conf.sBitBtn17.Enabled := False;
  repeat
    Conf.panel_mame_page2.Left := conf.panel_mame_page2.Left + 10;
    Conf.panel_mame_page1.Left := Conf.panel_mame_page1.Left + 10;
    if conf.panel_mame_page1.Left > 8 then
      conf.panel_mame_page1.Left := 8;
  until conf.panel_mame_page1.Left = 8;
  conf.sLabel46.Caption := '1';
end;

procedure SelectMameUp;
begin
  ArrowClick := True;
  if SelectedMame <> 0 then
    begin
      Conf.sCheckListBox1.Checked[SelectedMame] := False;
      SelectedMame := SelectedMame - 1;
      Conf.sBitBtn37.Enabled := True;
    end;
  if SelectedMame = 0 then
    conf.sBitBtn36.Enabled := False;
  SearchForSelectedMame(SelectedMame);
  Conf.sCheckListBox1.Checked[SelectedMame] := True;
  Conf.sCheckListBox1.Selected[SelectedMame] := True;
  MameIni.WriteInteger('SelMame','Selected',SelectedMame);
  if Mame_Exe <> '' then
    begin
      Conf.Enabled := False;
      DisableMenuButtons(False);
      FromArrows_Mamedirs:= True;
      Conf.sLabel112.Visible := True;
      Conf.sGauge_MameChange.Visible := True;
      StartEmuMame;
      Conf.sLabel112.Visible := False;
      Conf.sGauge_MameChange.Visible := False;
      FromArrows_Mamedirs := False;
      SaveMame_DirsAtExit;
      DisableMenuButtons(True);
      Conf.Enabled := True;
    end
  else
    MamePanels_Clear;
end;

procedure SelectMameDown;
begin
  ArrowClick := true;
  if SelectedMame < Conf.sCheckListBox1.Count - 1 then
    begin
      Conf.sCheckListBox1.Checked[SelectedMame] := False;
      SelectedMame := SelectedMame + 1;
      Conf.sBitBtn36.Enabled := True;
    end;
  if SelectedMame = Conf.sCheckListBox1.Count - 1 then
    conf.sBitBtn37.Enabled := False;
  SearchForSelectedMame(SelectedMame);
  Conf.sCheckListBox1.Checked[SelectedMame] := True;
  Conf.sCheckListBox1.Selected[SelectedMame] := True;
  MameIni.WriteInteger('SelMame','Selected',SelectedMame);
  if Mame_Exe <> '' then
    begin
      Conf.Enabled := False;
      DisableMenuButtons(False);
      FromArrows_Mamedirs:= True;
      Conf.sLabel112.Visible := True;
      Conf.sGauge_MameChange.Visible := True;
      StartEmuMame;
      Conf.sLabel112.Visible := False;
      Conf.sGauge_MameChange.Visible := False;
      FromArrows_Mamedirs := False;
      SaveMame_DirsAtExit;
      DisableMenuButtons(True);
      Conf.Enabled := True;
    end
  else
    MamePanels_Clear;
end;

procedure SearchForSelectedMame(num: Integer);
var
  k: Integer;
  whatmame: string;
begin
  if IsWindows64 = true then
    begin
      for k := 0 to 6 do
        begin
          whatmame := MameIni.ReadString('MamePaths','Type'+IntToStr(k),whatmame);
          if whatmame = conf.sCheckListBox1.Items[num] then
            begin
              Conf.sEdit64.Text := MameIni.ReadString('MamePaths','Mame'+IntToStr(k),Conf.sEdit64.Text);
              Break;
            end
          else Conf.sEdit64.Text := '';
        end;
    end
   else
    begin
      for k := 0 to 4 do
        begin
          whatmame := MameIni.ReadString('MamePaths','Type'+IntToStr(k),whatmame);
          if whatmame = conf.sCheckListBox1.Items[num] then
            begin
              Conf.sEdit64.Text := MameIni.ReadString('MamePaths','Mame'+IntToStr(k),Conf.sEdit64.Text);
              Break;
            end
          else Conf.sEdit64.Text := '';
        end;
    end;
  Mame_Exe := Conf.sEdit64.Text;
end;

procedure GetMame;
begin
  Mame_Exe := Conf.sEdit64.Text;
  gFindFiles := 'mame';
  Conf.Find_Files.InitialDir := Program_Path+'emulators';
  if IsWindows64 = true then
    begin
      Conf.Find_Files.Filter := 'mame.exe|mame.exe|mamepp.exe|mamepp.exe|mame64.exe|mame64.exe|mamep.exe|mamep.exe|mamepuiXT_x86.exe|mamepuiXT_x86.exe|mamepuiXT_x64.exe|mamepuiXT_x64.exe|'+
      'Execution File Mame (exe)|mame.exe;mamepp.exe;mame64.exe;mamep.exe;mamepuiXT_x86.exe;mamepuiXT_x64.exe';
      Conf.Find_Files.FilterIndex := 7;
    end
  else
    begin
      Conf.Find_Files.Filter := 'mame.exe|mame.exe|mamepp.exe|mamepp.exe|mamep.exe|mamep.exe|mamepuiXT_x86.exe|mamepuiXT_x86.exe|Execution File Mame (exe)|mame.exe;mamepp.exe;mamep.exe;mamepuiXT_x86.exe';
      Conf.Find_Files.FilterIndex := 5;
    end;
  Conf.Find_Files.Execute;
end;

procedure CheckForMameAndCreateIni;
var
  GottenMameExe:String;
  Selected,i: Byte;
Begin
  if Mame_Exe <> Conf.Find_Files.FileName then
    begin
      Mame_Exe := Conf.Find_Files.FileName;
      GottenMameExe := ExtractFileName(Mame_Exe);
      ShellExecute(0,'open',PChar(Mame_Exe),PChar('-createconfig'),nil,0);
      Conf.sEdit64.Text := Mame_Exe;
      if IsWindows64 = true then
        begin
          for i := 0 to 5 do
            Conf.sCheckListBox1.Checked[i] := False;
          if GottenMameExe = 'mame.exe' then
            MameIni.WriteInteger('SelMame','Selected',0)
          else if GottenMameExe = 'mamepp.exe' then
            MameIni.WriteInteger('SelMame','Selected',1)
          else if GottenMameExe = 'mame64.exe' then
            MameIni.WriteInteger('SelMame','Selected',2)
          else if GottenMameExe = 'mamep.exe' then
            MameIni.WriteInteger('SelMame','Selected',3)
          else if GottenMameExe = 'mamepuiXT_x86.exe' then
            MameIni.WriteInteger('SelMame','Selected',4)
          else if GottenMameExe = 'mamepuiXT_x64.exe' then
            MameIni.WriteInteger('SelMame','Selected',5);
          Selected := MameIni.ReadInteger('SelMame','Selected',Selected);
          MameIni.WriteString('MamePaths','Mame'+IntToStr(Selected),Mame_Exe);
          MameIni.WriteString('MamePaths','Type'+IntToStr(Selected),GottenMameExe);
        end
      else
        begin
          for i := 0 to 3 do
            Conf.sCheckListBox1.Checked[i] := False;
          if GottenMameExe = 'mame.exe' then
            MameIni.WriteInteger('SelMame','Selected',0)
          else if GottenMameExe = 'mamepp.exe' then
            MameIni.WriteInteger('SelMame','Selected',1)
          else if GottenMameExe = 'mamep.exe' then
            MameIni.WriteInteger('SelMame','Selected',2)
          else if GottenMameExe = 'mamepuiXT_x86.exe' then
            MameIni.WriteInteger('SelMame','Selected',3);
          Selected := MameIni.ReadInteger('SelMame','Selected',Selected);
          MameIni.WriteString('MamePaths','Mame'+IntToStr(Selected),Mame_Exe);
          MameIni.WriteString('MamePaths','Type'+IntToStr(Selected),GottenMameExe);
        end;
      Conf.sCheckListBox1.Selected[Selected] := True;
      Conf.sCheckListBox1.Checked[Selected] := True;
    end;
end;

procedure SetMame_DirsFromMameIni;
var
  MameIniFile: TextFile;
  value,realNameComp,text,t1,t2: string;
  CComp: Byte;
  i,k,r,r1: Integer;
  CompNotFound: Boolean;
  RomsDirs: TStringList;
begin
  FromMame_DirsToFindDirs := True;
  k:= 0;
  CheckWin64ForListBox(SelectedMame,True);
  if ArrowClick = True then
    Mame_Exe := Conf.sEdit64.Text;
  if Mame_Exe <> '' then
    begin
      if SelectedMame <> -1 then
        begin
          Conf.sCheckListBox1.Checked[SelectedMame] := true;
          if SelectedMame = 0 then
            conf.sBitBtn36.Enabled := False
          else if SelectedMame = Conf.sCheckListBox1.Count -1 then
            conf.sBitBtn37.Enabled := False;
        end
      else
        begin
          Conf.sBitBtn36.Enabled := False;
          Conf.sBitBtn37.Enabled := False;
        end;
      foldersMame[0] := 'Cabinets';
      foldersMame[1] := 'Flyers';
      foldersMame[2] := 'Marquees';
      foldersMame[3] := 'Control_Panels';
      foldersMame[4] := 'PCBs';
      foldersMame[5] := 'Artwork_Preview';
      foldersMame[6] := 'Titles';
      foldersMame[7] := 'Select';
      foldersMame[8] := 'Scores';
      foldersMame[9] := 'Bosses';
      for i := k to 9 do
        begin
          CompNotFound := False;
          value := MameIni.ReadString('MameDirs',foldersMame[i]+'_Dir_'+IntToStr(SelectedMame),value);
          if foldersMame[i] = 'Control_Panels' then
            realNameComp := 'Control Panels'
          else if foldersMame[i] = 'Artwork_Preview' then
            realNameComp := 'Artwork Preview'
          else
            realNameComp := foldersMame[i];
          if (value = 'Default') or (value = '') then
            value := ExtractFilePath(Mame_Exe)+realNameComp;
          if not DirectoryExists(value) then
            CreateDir(value);
          for CComp := 2 to 11 do
            begin
              component := FindComponentEx('Conf.sEdit'+IntToStr(CComp));
              if TsEdit(component).BoundLabel.Caption = realNameComp then
                begin
                  TsEdit(component).Text := value;
                  CompNotFound := True;
                end;
            end;
          if CompNotFound = False then
            begin
              for CComp := 58 to 63 do
                begin
                  component := FindComponentEx('Conf.sEdit'+IntToStr(CComp));
                  if TsEdit(component).BoundLabel.Caption = realNameComp then
                    TsEdit(component).Text := value;
                end;
            end;
        end;
      k:= 0;
//      CompNotFound := False;
      value := ExtractFilePath(Mame_Exe) + 'mame.ini';
      AssignFile(MameIniFile,value);
      Reset(MameIniFile);
      while not Eof(MameIniFile) do
        begin
          if k = 7 then
            Break;
          Readln(MameIniFile,text);
          r := Pos(' ',text);
          t1 := Trim(Copy(text,0,r));
          t2 := Trim(Copy(text,r,100));
          if t1 = 'rompath' then
            begin
              r1 := Length(text);
              t2 := Trim(Copy(text,r,r1-(r-1)));
              Conf.sComboBox1.Clear;
              Conf.sComboBox1.Items.Add('Choose or Add directory...');
              RomsDirs := TStringList.Create;
              RomsDirs.Delimiter := ';';
              RomsDirs.DelimitedText := '"' + StringReplace(t2, RomsDirs.Delimiter, '"' + RomsDirs.Delimiter + '"', [rfReplaceAll]) + '"';
              for r1 := 0 to RomsDirs.Count - 2 do
                begin
                  if RomsDirs[r1] = 'roms' then
                    begin
                      Conf.sComboBox1.Items.Add(ExtractFilePath(Mame_Exe)+'roms');
                      if FromDatabase = False then
                        Conf.sComboBox72.Items.Add(ExtractFilePath(Mame_Exe)+'roms');
                    end
                  else
                    begin
                      Conf.sComboBox1.Items.Add(RomsDirs[r1]);
                      if FromDatabase = False then
                        Conf.sComboBox72.Items.Add(RomsDirs[r1]);
                    end
                end;
              Conf.sComboBox1.Items.Add('add...');
              Conf.sComboBox1.ItemIndex := 0;
              RomsDirs.Free;
              k := k + 1;
            end
          else if t1 = 'samplepath' then
            begin
              if t2 = 'samples' then
                t2 := ExtractFilePath(Mame_Exe)+'samples';
              conf.sEdit4.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'artpath' then
            begin
              if t2 = 'artwork' then
                t2 := ExtractFilePath(Mame_Exe)+'artwork';
              Conf.sEdit61.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'crosshairpath' then
            begin
              if t2 = 'crosshair' then
                t2 := ExtractFilePath(Mame_Exe)+'crosshair';
              Conf.sEdit60.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'input_directory' then
            begin
              if t2 = 'inp' then
                t2 := ExtractFilePath(Mame_Exe)+'inp';
              conf.sEdit62.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'state_directory' then
            begin
              if t2 = 'sta' then
                t2 := ExtractFilePath(Mame_Exe)+'sta';
              Conf.sEdit63.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'snapshot_directory' then
            begin
              if t2 = 'snap' then
                t2 := ExtractFilePath(Mame_Exe)+'snap';
              conf.sEdit2.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end;
        end;
      CloseFile(MameIniFile);
      CheckMameDirs_TopicSettings;
      CheckTopicsConfig;
    end;
  FromMame_DirsToFindDirs := False;
  ArrowClick := False;
end;

procedure CheckWin64ForListBox(num:ShortInt;sel:Boolean);
var
  FoundMame: string;
  i: Integer;
begin
  Conf.sCheckListBox1.Clear;
  for i := 0 to 5 do
    setupedMame[i] := '';
  if IsWindows64 = False then
    begin
      for i := 0 to 3 do
        begin
          FoundMame := '';
          FoundMame := MameIni.ReadString('MamePaths','Mame'+IntToStr(i),FoundMame);
          if FoundMame <> '' then
            setupedMame[i] := 'True'
          else
            setupedMame[i] := 'False';
        end;
      Conf.sCheckListBox1.Items.Add('mame.exe');
      Conf.sCheckListBox1.Items.Add('mamepp.exe');
      Conf.sCheckListBox1.Items.Add('mamep.exe');
      Conf.sCheckListBox1.Items.Add('mamepuiXT_x86.exe');
    end
  else
    begin
      for i := 0 to 5 do
        begin
          FoundMame := '';
          FoundMame := MameIni.ReadString('MamePaths','Mame'+IntToStr(i),FoundMame);
          if FoundMame <> '' then
            setupedMame[i] := 'True'
          else
            setupedMame[i] := 'False';
        end;
      Conf.sCheckListBox1.Items.Add('mame.exe');
      Conf.sCheckListBox1.Items.Add('mamepp.exe');
      Conf.sCheckListBox1.Items.Add('mame64.exe');
      Conf.sCheckListBox1.Items.Add('mamep.exe');
      Conf.sCheckListBox1.Items.Add('mamepuiXT_x86.exe');
      Conf.sCheckListBox1.Items.Add('mamepuiXT_x64.exe');
    end;
  if num = -1 then
    num := 0;
  Conf.sCheckListBox1.Selected[num] := sel;
end;

procedure SaveMame_DirsAtExit;
var
  i,k: Integer;
  CComp: Byte;
  CompNotFound: Boolean;
  value,realNameComp: string;
begin
  k := 0;
  if Conf.sEdit64.Text <> '' then
    begin
      for i := k to 9 do
        begin
          if foldersMame[i] = 'Control_Panels' then
            realNameComp := 'Control Panels'
          else if foldersMame[i] = 'Artwork_Preview' then
            realNameComp := 'Artwork Preview'
          else
            realNameComp := foldersMame[i];
          for CComp := 2 to 11 do
            begin
              component := FindComponentEx('Conf.sEdit'+IntToStr(CComp));
              if TsEdit(component).BoundLabel.Caption = realNameComp then
                begin
                  value := TsEdit(component).Text;
                  CompNotFound := True;
                end;
            end;
          if CompNotFound = False then
            begin
              for CComp := 58 to 63 do
                begin
                  component := FindComponentEx('Conf.sEdit'+IntToStr(CComp));
                  if TsEdit(component).BoundLabel.Caption = realNameComp then
                    value := TsEdit(component).Text;
                end;
            end;
          CompNotFound := False;
          MameIni.WriteString('MameDirs',foldersMame[i]+'_Dir_'+IntToStr(SelectedMame),value);
        end;
      Mame_Global_MemoIni.Lines.SaveToFile(ExtractFilePath(Conf.sEdit64.Text)+'mame.ini');
      FromMame_DirsToFindDirs := False;
    end;
end;

procedure GetMamePath(name:string);
begin
  FromMame_DirsToFindDirs := True;
  OldDir := Conf.sEdit2.Text;
  Conf.Find_Dirs.InitialDir := OldDir;
  gFindDirs := name;
  Conf.Find_Dirs.Execute;
end;

procedure SetMamePath(name:string);
begin
  if (Conf.Find_Dirs.Directory <> '') or (Conf.Find_Dirs.Directory <> OldDir) then 
    begin
      if name = 'mamesnapshots' then
        Conf.sEdit2.Text := Conf.Find_Dirs.Directory
      else if name = 'mamesamples' then
        Conf.sEdit4.Text := Conf.Find_Dirs.Directory
      else if name = 'mamecabinets' then
        Conf.sEdit3.Text := Conf.Find_Dirs.Directory
      else if name = 'mameflyers' then
        conf.sEdit8.Text := Conf.Find_Dirs.Directory
      else if name = 'mamemarquees' then
        conf.sEdit10.Text := Conf.Find_Dirs.Directory
      else if name = 'mamecontrolpanels' then
        conf.sEdit6.Text := Conf.Find_Dirs.Directory
      else if name = 'mamepcbs' then
        Conf.sEdit9.Text := Conf.Find_Dirs.Directory
      else if name = 'mameartworkpreview' then
        Conf.sEdit7.Text := Conf.Find_Dirs.Directory
      else if name = 'mametitles' then
        Conf.sEdit11.Text := Conf.Find_Dirs.Directory
      else if name = 'mameselect' then
        Conf.sEdit5.Text := Conf.Find_Dirs.Directory
      else if name = 'mamescores' then
        Conf.sEdit58.Text := Conf.Find_Dirs.Directory
      else if name = 'mamebosses' then
        Conf.sEdit59.Text := Conf.Find_Dirs.Directory
      else if name = 'mamecrosshair' then
        Conf.sEdit60.Text := Conf.Find_Dirs.Directory
      else if name = 'mameartwork' then
        Conf.sEdit61.Text := Conf.Find_Dirs.Directory
      else if name = 'mameinputfiles' then
        Conf.sEdit62.Text := Conf.Find_Dirs.Directory
      else if name = 'mamestate' then
        conf.sEdit63.Text := Conf.Find_Dirs.Directory;
      ChangeMemoForMame_Dirs(name);
      FromMame_DirsToFindDirs := False;
    end;
end;

procedure ChangeMemoForMame_Dirs(find: string);
var
  k,x: Integer;
  text,t1,value: string;
begin
  if find = 'mamesnapshots' then
    begin
      find := 'snapshot_directory';
      value := Conf.sEdit2.Text;
    end
  else if find = 'mamesamples' then
    begin
      find := 'samplepath';
      value := Conf.sEdit4.Text;
    end
  else if find = 'mamecrosshair' then
    begin
      find := 'crosshairpath';
      value := conf.sEdit60.Text;
    end
  else if find = 'mameartwork' then
    begin
      find := 'artpath';
      value := Conf.sEdit61.Text;
    end
  else if find = 'mameinputfiles' then
    begin
      find := 'input_directory';
      value := Conf.sEdit62.Text;
    end
  else if find = 'mamestate' then
    begin
      find := 'state_directory';
      value := Conf.sEdit63.Text;
    end;
  for k := 0 to Mame_Global_MemoIni.Lines.Count do
    begin
      text := Mame_Global_MemoIni.Lines.Strings[k];
      x := Pos(' ',text);
      t1 := Trim(Copy(text,0,x));
      if t1 = find then
        begin
          Mame_Global_MemoIni.Lines.Delete(k);
          Mame_Global_MemoIni.Lines.Insert(k,find +'          '+value);
        end;
    end;
end;

procedure ShowOnlySetupedMameBuilds;
var
  SelectedMameExe: string;
  k,l: Integer;
begin
  l := 0;
  if conf.sCheckBox127.Checked = true then
    begin
      k := Conf.sCheckListBox1.ItemIndex;
      if k = -1 then
        SelectedMameExe := ''
      else
        SelectedMameExe := Conf.sCheckListBox1.Items.Strings[k];
      Conf.sCheckListBox1.Clear;
      if IsWindows64 = False then
        begin
          for k := l to 3 do
            begin
              if setupedMame[k] = 'True' then
                Conf.sCheckListBox1.Items.Add(AllMameBuilds32[k]);
            end;
        end
      else
        begin
          for k := 0 to 5 do
            begin
              if setupedMame[k] = 'True' then
                Conf.sCheckListBox1.Items.Add(AllMameBuilds64[k]);
            end;
        end;
    end
  else
    begin
      if Conf.sCheckListBox1.Count - 1 > - 1 then
        begin
          k := Conf.sCheckListBox1.ItemIndex;
          SelectedMameExe := Conf.sCheckListBox1.Items.Strings[k];
        end;
      Conf.sCheckListBox1.Clear;
      if IsWindows64 = False then
        for k := l to 3 do
          Conf.sCheckListBox1.Items.Add(AllMameBuilds32[k])
      else
        begin
          for k := 0 to 5 do
            Conf.sCheckListBox1.Items.Add(AllMameBuilds64[k]);
        end;
    end;
  if (Conf.sCheckListBox1.Count - 1 = -1) or (Conf.sCheckListBox1.Count - 1 = 0) then
    begin
      Conf.sBitBtn36.Enabled := False;
      Conf.sBitBtn37.Enabled := False;
    end;
  if Conf.sCheckListBox1.Count - 1 > - 1 then
    begin
      for k := l to conf.sCheckListBox1.Count - 1 do
        begin
          if conf.sCheckListBox1.Items.Strings[k] = SelectedMameExe then
            begin
              Conf.sCheckListBox1.Selected[k] := True;
              Conf.sCheckListBox1.Checked[k] := True;
              Break;
            end;
        end;
      if (Conf.sCheckListBox1.ItemIndex = 0) and (Conf.sCheckListBox1.Count - 1 <> 0) then
        begin
          Conf.sBitBtn36.Enabled := False;
          Conf.sBitBtn37.Enabled := True;
        end
      else if (Conf.sCheckListBox1.ItemIndex = Conf.sCheckListBox1.Count - 1) and (Conf.sCheckListBox1.Count - 1 > 0) then
        begin
          Conf.sBitBtn36.Enabled := True;
          Conf.sBitBtn37.Enabled := False;
        end
      else if ((Conf.sCheckListBox1.ItemIndex > 0) and (Conf.sCheckListBox1.ItemIndex < Conf.sCheckListBox1.Count - 1)) or
        (Conf.sCheckListBox1.Count -1 > 0) then
        begin
          Conf.sBitBtn36.Enabled := True;
          Conf.sBitBtn37.Enabled := True;
        end;
    end;
end;

procedure MameChooseRomsDirsOrAdd;
begin
  if Conf.sComboBox1.ItemIndex <> 0 then
    begin
      if Conf.sComboBox1.ItemIndex <> Conf.sComboBox1.Items.Count - 1 then
          Conf.sBitBtn42.Visible := true
      else
        begin
          gFindDirs := 'NewRom_Dir';
          FromMame_DirsToFindDirs := False;
          Conf.Find_Dirs.InitialDir := ExtractFilePath(Mame_Exe);
          Conf.Find_Dirs.Execute;
        end;
    end
  else
    Conf.sBitBtn42.Visible := False;
end;

procedure ShowRomPathResults;
begin
  MenuButton6;
  ShowDatabaseStatsFor(Conf.sComboBox1.Text);
end;

procedure ListBoxOfSetupedMames(Line:Integer;Position: TRect);
var
  s: string;
begin
  s := Conf.sCheckListBox1.Items[Line];
  if Conf.sCheckBox127.Checked = False then
    begin
      if setupedMame[Line] = 'True' then
        begin
          Conf.sCheckListBox1.Canvas.Font.Style := Conf.sCheckListBox1.Canvas.Font.Style + [fsBold];
          Conf.sCheckListBox1.Canvas.Font.Color := clHotLight;
        end
      else
        Conf.sCheckListBox1.Canvas.Font.Color := clMedGray;
      Conf.sCheckListBox1.Canvas.TextRect(Position,Position.Left,Position.Top,s);
    end
  else
    begin
      Conf.sCheckListBox1.Canvas.Font.Style := Conf.sCheckListBox1.Canvas.Font.Style + [fsBold];
      Conf.sCheckListBox1.Canvas.Font.Color := clHotLight;
      Conf.sCheckListBox1.Canvas.TextRect(Position,Position.Left,Position.Top,s);
    end;
end;

procedure MameDirs_Clear;
var
  k: Integer;
begin
  for k := 2 to 11 do
    begin
      component := FindComponentEx('Conf.sEdit'+IntToStr(k));
      TsEdit(component).Text := '';
    end;
  for k := 58 to 63 do
    begin
      component := FindComponentEx('Conf.sEdit'+IntToStr(k));
      TsEdit(component).Text := '';
    end;
  Conf.sComboBox1.Clear;
  Conf.sComboBox1.Items.Add('Choose or Add directory...');
  Conf.sComboBox1.Items.Add('add...');
  Conf.sComboBox1.ItemIndex := 0;
end;

procedure MamePanels_Clear;
begin
  MameDirs_Clear;
  MameGraphics_Clear;
  MameSound_Clear;
  MameOthers_Clear;
  MameBuilds_Clear;
  MameDatabase_Clear;
end;

procedure ResetToDefaultTopic_MameDirs;
begin
  Conf.sEdit2.Text := ExtractFilePath(Mame_Exe)+'snap';
  ChangeMemoForMame_Dirs('mamesnapshots');
  Conf.sEdit4.Text := ExtractFilePath(Mame_Exe)+'samples';
  ChangeMemoForMame_Dirs('mamesamples');
  Conf.sEdit3.Text := ExtractFilePath(Mame_Exe)+'cabinets';
  Conf.sEdit8.Text := ExtractFilePath(Mame_Exe)+'flyers';
  Conf.sEdit10.Text := ExtractFilePath(Mame_Exe)+'marquees';
  Conf.sEdit6.Text := ExtractFilePath(Mame_Exe)+'cpanel';
  Conf.sEdit9.Text := ExtractFilePath(Mame_Exe)+'pcbs';
  Conf.sEdit7.Text := ExtractFilePath(Mame_Exe)+'artwork preview';
  Conf.sEdit11.Text := ExtractFilePath(Mame_Exe)+'titles';
  Conf.sEdit5.Text := ExtractFilePath(Mame_Exe)+'select';
  Conf.sEdit58.Text := ExtractFilePath(Mame_Exe)+'scores';
  Conf.sEdit59.Text := ExtractFilePath(Mame_Exe)+'bosses';
  Conf.sEdit60.Text := ExtractFilePath(Mame_Exe)+'crosshair';
  ChangeMemoForMame_Dirs('mamecrosshair');
  Conf.sEdit61.Text := ExtractFilePath(Mame_Exe)+'artwork';
  ChangeMemoForMame_Dirs('mameartwork');
  Conf.sEdit62.Text := ExtractFilePath(Mame_Exe)+'inp';
  ChangeMemoForMame_Dirs('mameinputfiles');
  Conf.sEdit63.Text := ExtractFilePath(Mame_Exe)+'sta';
  ChangeMemoForMame_Dirs('mamestate');
  Conf.sButton4.Enabled := False;
  CheckTopicsConfig;
end;  

procedure CheckTopicsConfig;
var
  state: Boolean;
begin
  if (Conf.sButton4.Enabled = True) or (Conf.sButton5.Enabled = True) or (Conf.sButton6.Enabled = True) or
    (conf.sButton7.Enabled = True) or (Conf.sButton8.Enabled = True) then
    state := True
  else
    state := False;
  Conf.sButton22.Enabled := state;
  Conf.sButton1.Enabled := state;
  Conf.sButton2.Enabled := state;
  Conf.sButton3.Enabled := state;
  Conf.sButton9.Enabled := state;
end;

procedure CheckMameDirs_TopicSettings;
begin
  Conf.sButton4.Enabled := False;
  if Conf.sEdit2.Text <> ExtractFilePath(Mame_Exe)+'snap' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit4.Text <> ExtractFilePath(Mame_Exe)+'samples' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit3.Text <> ExtractFilePath(Mame_Exe)+'cabinets' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit8.Text <> ExtractFilePath(Mame_Exe)+'flyers' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit10.Text <> ExtractFilePath(Mame_Exe)+'marquees' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit6.Text <> ExtractFilePath(Mame_Exe)+'cpanel' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit9.Text <> ExtractFilePath(Mame_Exe)+'pcbs' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit7.Text <> ExtractFilePath(Mame_Exe)+'artwork preview' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit11.Text <> ExtractFilePath(Mame_Exe)+'titles' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit5.Text <> ExtractFilePath(Mame_Exe)+'select' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit58.Text <> ExtractFilePath(Mame_Exe)+'scores' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit59.Text <> ExtractFilePath(Mame_Exe)+'bosses' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit60.Text <> ExtractFilePath(Mame_Exe)+'crosshair' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit61.Text <> ExtractFilePath(Mame_Exe)+'artwork' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit62.Text <> ExtractFilePath(Mame_Exe)+'inp' then
    Conf.sButton4.Enabled := True;
  if Conf.sEdit63.Text <> ExtractFilePath(Mame_Exe)+'sta' then
    Conf.sButton4.Enabled := True;
end;

procedure CheckButtonTopicsConfig_MameDirs;
begin
  FromMame_DirsToFindDirs := True;
  CheckMameDirs_TopicSettings;
  CheckTopicsConfig;
end;

procedure ResetMameConfig_Global;
begin
  ResetToDefaultTopic_MameDirs;
  ResetToDefaultTopic_MameGraphics;
  ResetToDefaultTopic_MameSound;
  ResetToDefaultTopic_MameOthers;
  ResetToDefaultTopic_MameBuilds;
  CheckTopicsConfig;
end;

procedure InitGlobal_MameMemo_ForMameIni;
var
  MameIniFile: TextFile;
  text,value: string;
begin
  Mame_Global_MemoIni.Free;
  Mame_Global_MemoIni := TMemo.Create(Conf);
  Mame_Global_MemoIni.Parent := Conf;
  Mame_Global_MemoIni.Visible := False;
  Mame_Global_MemoIni.Align := alClient;
  Mame_Global_MemoIni.WordWrap := False;
  value := ExtractFilePath(Mame_Exe) + 'mame.ini';
  AssignFile(MameIniFile,value);
  Reset(MameIniFile);
    while not Eof(MameIniFile) do
      begin
        Readln(MameIniFile,text);
        Mame_Global_MemoIni.Lines.Add(text);
      end;
  CloseFile(MameIniFile);
end;

end.
