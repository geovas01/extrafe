unit mame_dirs;

interface

uses
  SysUtils,StdCtrls,ShellAPI,Classes,Types,ExtCtrls,Graphics,Controls,
  FileCtrl,Forms,Windows,
  FunctionX,
  sEdit,
  NativeXml;

  procedure SetMame_DirsFromMameIni;
  procedure SaveMame_DirsAtExit;

  procedure GetMame;
  procedure GetMamePath(name:string);
  procedure OldDirIs(name: string);
  procedure SetMamePath(name:string);
  procedure ChangeMemoForMame_Dirs(find: string);
  procedure GetSelectedMameNum(MameName: string);
  procedure CheckForMameAndCreateIni;
  procedure RightPageDirs;
  procedure LeftPageDirs;
  procedure SelectMameUp;
  procedure SelectMameDown;
  procedure SearchForSelectedMame(num: Integer);
  function NumOfSelectedMame(MameName: string) : Integer;
  procedure CheckWin64ForListBox(num:ShortInt);
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

  procedure Assigned_MameConfiguration;

// Menu actions
  procedure Show_mame_dirspanel;
  procedure em_mame_dirs_ShowDynamicComps;
  procedure em_mame_dirs_FreeDynamicComps;

Const
  AllMameBuilds32: array [0..3] of string = ('mame.exe','mamepp.exe','mamep.exe','mamepuiXT_x86.exe');
  AllMameBuilds64: array [0..5] of string = ('mame.exe','mamepp.exe','mame64.exe','mamep.exe','mamepuiXT_x86.exe','mamepuiXT_x64.exe');

var
  component: TComponent;
  FromMame_DirsToFindDirs,ArrowClick,FromArrows_Mamedirs,CreateNewMame: Boolean;
  NewRomDirectory: String;
  SetupedMame: array [0..5] of string;
  FXml_MameConfing,FXml_MameDatabase: TNativeXml;
  MameConfigFile,MameDatabaseFile,Mame_Exe,FullPathMame_Exe: String;
  SelectedMame: Shortint;
  FromDatabase: Boolean;

implementation

uses
  main,mainconf,menu,global,onflycomponents,
  mame_graphics,mame_sound,mame_others,mame_builds,mame_database;

var
  node: TXmlNode;
  OldDir,NewDir: String;

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
  if FileExists(ExtractFilePath(Application.ExeName)+'media/emulators/arcade/mame/config/config.xml') then
    begin
      SearchForSelectedMame(SelectedMame);
      Conf.sCheckListBox1.Selected[SelectedMame] := True;
      if Mame_Exe <> '' then
        begin
          Conf.sCheckListBox1.Checked[SelectedMame] := True;
          Conf.Enabled := False;
          DisableMenuButtons(False);
          FromArrows_Mamedirs:= True;
          Conf.sLabel112.Visible := True;
          Conf.sGauge_MameChange.Visible := True;
          StartEmuMame;
          Conf.sLabel112.Visible := False;
          Conf.sGauge_MameChange.Visible := False;
          FromArrows_Mamedirs := False;
          DisableMenuButtons(True);
          Conf.Enabled := True;
        end
      else
        MamePanels_Clear;
    end;
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
  if FileExists(ExtractFilePath(Application.ExeName)+'media/emulators/arcade/mame/config/config.xml') then
    begin
      SearchForSelectedMame(SelectedMame);
      Conf.sCheckListBox1.Selected[SelectedMame] := True;
      if Mame_Exe <> '' then
        begin
          Conf.sCheckListBox1.Checked[SelectedMame] := True;
          Conf.Enabled := False;
          DisableMenuButtons(False);
          FromArrows_Mamedirs:= True;
          Conf.sLabel112.Visible := True;
          Conf.sGauge_MameChange.Visible := True;
          StartEmuMame;
          Conf.sLabel112.Visible := False;
          Conf.sGauge_MameChange.Visible := False;
          FromArrows_Mamedirs := False;
          DisableMenuButtons(True);
          Conf.Enabled := True;
        end
      else
        MamePanels_Clear;
    end;
end;

procedure SearchForSelectedMame(num: Integer);
var
  node: TXmlNode;
  i: Integer;
  MamePath: string;
  FindMame: Boolean;
begin
  FindMame := False;
  with FXml_MameConfing.Root do
    for i:= 0 to NodeCount - 1 do
      begin
        node := FXml_MameConfing.Root.Nodes[i];
        if node.Name = 'rowDir' then
          if conf.sCheckListBox1.Items.Strings[num] = node.ReadAttributeString('MameName') then
            begin
              FindMame := True;
              Mame_Exe := node.ReadAttributeString('MameName');
              MamePath := node.ReadAttributeString('MamePath');
              FXml_MameConfing.Root.WriteAttributeString('SelectedMame',Mame_Exe);
              FXml_MameConfing.Root.WriteAttributeString('FullPathOfSelectedMame',MamePath);
              FXml_MameConfing.Root.WriteAttributeInteger('Selected',NumOfSelectedMame(Mame_Exe));
              FXml_MameConfing.SaveToFile(MameConfigFile);
              Conf.sEdit64.Text := MamePath+Mame_exe;
            end;
      end;
  if FindMame = False then
    Mame_Exe := '';
end;

function NumOfSelectedMame(MameName: string) : Integer;
begin
  if MameName = 'mame.exe' then
    Result := 0
  else if MameName = 'mamepp.exe' then
    Result := 1
  else if MameName = 'mame64.exe' then
    Result := 2
  else if MameName = 'mamep' then
    begin
      if IsWindows64 = True then
        Result := 3
      else
        Result := 2
      end
  else if MameName = 'mamepuiXT_x86' then
    begin
      if IsWindows64 = True then
        Result := 4
      else
        Result := 3
    end
  else if MameName = 'mamepuiXT_x64' then
    Result := 5;
end;

procedure GetMame;
begin
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
  Conf.Find_Files.Execute
end;

procedure CheckForMameAndCreateIni;
var
  option,foundMame: Boolean;
  i: Integer;
  InMessageBox,NewMameExe,NewMameFullPath: String;

  procedure addNewMame(clear: Boolean);
    begin
      if clear = False then
        SysUtils.DeleteFile(MameDatabaseFile);
      Mame_Exe := ExtractFileName(Conf.Find_Files.FileName);
      FullPathMame_Exe := ExtractFilePath(Conf.Find_Files.FileName);
      ShellExecute(0,'open',PChar(FullPathMame_Exe+Mame_Exe),PChar('-createconfig'),nil,0);
      Conf.sEdit64.Text := FullPathMame_Exe + Mame_Exe;
      CreateNewMame := True;
    end;

Begin
  option := False;
  CreateNewMame := False;
  foundMame := False;
  if (Conf.Find_Files.FileName <> '') and (Conf.Find_Files.FileName <> FullPathMame_Exe+Mame_Exe) then
    begin
      if not Assigned(FXml_MameConfing) then
        begin
          FXml_MameConfing := TNativeXml.CreateName('MameConfig');
          FXml_MameConfing.XmlFormat := xfReadable;
        end;
    end
  else
    begin
      with FXml_MameDatabase.Root do
        for i := 0 to NodeCount - 1 do
          begin
            node := FXml_MameDatabase.Root.Nodes[i];
            if node.ReadAttributeString('MameName') = ExtractFileName(Conf.Find_Files.FileName) then
              begin
                foundMame := True;
                Break;
              end;
          end;
    end;
  if foundMame = False then
    begin
      Mame_Exe := ExtractFileName(Conf.Find_Files.FileName);
      FullPathMame_Exe := ExtractFilePath(Conf.Find_Files.FileName);
      ShellExecute(0,'open',PChar(FullPathMame_Exe+Mame_Exe),PChar('-createconfig'),nil,0);
      Conf.sEdit64.Text := FullPathMame_Exe + Mame_Exe;
      CreateNewMame := True;
    end
  else
    begin
      NewMameExe := ExtractFileName(Conf.Find_Files.FileName);
      NewMameFullPath := ExtractFilePath(Conf.Find_Files.FileName);
      if NewMameExe = Mame_Exe then
        begin
          if GetMameVer(FullPathMame_Exe,Mame_Exe,PathXmlMamePath+'ver.txt') = FXml_MameDatabase.Root.ReadAttributeString('Ver') then
            InMessageBox := 'The MAME you try to install is the same version you have already installed' + #13#10 + 'Ver := ' + FXml_MameDatabase.Root.ReadAttributeString('Ver') + #13#10 + 'Do you want to continue?'
          else
            InMessageBox := 'There is an already installed '+ Mame_Exe +' version.(Ver : ' + FXml_MameDatabase.Root.ReadAttributeString('Ver')+'"' + #13#10 + '"Do you want to replace it with the new one (Ver : ' + GetMameVer(NewMameFullPath,NewMameExe,PathXmlMamePath+'ver.txt') +' ?';
          option := True
        end;
      if option = True then
        if MessageBox(0,PChar(InMessageBox),'Replace Mame',+mb_YesNo +mb_ICONWARNING) = 6 then
           addNewMame(False)
        else
          addNewMame(True);
    end;
end;

procedure SetMame_DirsFromMameIni;
var
  MameIniFile: TextFile;
  value,text,t1,t2: string;
  k,r,r1: Integer;
  RomsDirs: TStringList;
  node: TXmlNode;
begin
  FromMame_DirsToFindDirs := True;
  if FromArrows_Mamedirs = False then
    CheckWin64ForListBox(SelectedMame);
  if Mame_Exe <> '' then
    begin
      for k := 0 to 5 do
        SetupedMame[k] := '';
      with FXml_MameConfing.Root do
        for k := 0 to NodeCount - 1 do
          begin
            node := FXml_MameConfing.Root.NodeByName('rowdir');
            if node.ReadAttributeString('MameName') = Mame_Exe then
              begin
                Conf.sEdit3.Text := node.ReadAttributeString('Cabinets');
                Conf.sEdit8.Text :=node.ReadAttributeString('Flyers');
                Conf.sEdit10.Text := node.ReadAttributeString('Marquees');
                Conf.sEdit6.Text := node.ReadAttributeString('Control_Panels');
                Conf.sEdit9.Text := node.ReadAttributeString('Pcbs');
                Conf.sEdit7.Text := node.ReadAttributeString('Artwork_Preview');
                Conf.sEdit11.Text := node.ReadAttributeString('Titles');
                Conf.sEdit5.Text := node.ReadAttributeString('Select');
                Conf.sEdit58.Text := node.ReadAttributeString('Scores');
                Conf.sEdit59.Text := node.ReadAttributeString('Bosses');
              end;
            SetupedMame[k] := node.ReadAttributeString('MameName');
          end;
      k:= 0;
      value := FullPathMame_Exe + 'mame.ini';
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
              if FromDatabase = False then
                begin
                  Conf.sComboBox72.Clear;
                  Conf.sComboBox72.Items.Add('Overall Roms');
                  Conf.sComboBox72.Items.Add('Missing Roms');
                end;
              RomsDirs := TStringList.Create;
              RomsDirs.Delimiter := ';';
              RomsDirs.DelimitedText := '"' + StringReplace(t2, RomsDirs.Delimiter, '"' + RomsDirs.Delimiter + '"', [rfReplaceAll]) + '"';
              for r1 := 0 to RomsDirs.Count - 1 do
                begin
                  if RomsDirs[r1] = 'roms' then
                    begin
                      Conf.sComboBox1.Items.Add(FullPathMame_Exe+'roms');
                      if FromDatabase = False then
                        Conf.sComboBox72.Items.Add(FullPathMame_Exe+'roms');
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
              if FromDatabase = False then
                Conf.sComboBox72.ItemIndex := 0;
              k := k + 1;
              FreeAndNil(RomsDirs);              
            end
          else if t1 = 'samplepath' then
            begin
              if t2 = 'samples' then
                t2 := FullPathMame_Exe+'samples';
              conf.sEdit4.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'artpath' then
            begin
              if t2 = 'artwork' then
                t2 := FullPathMame_Exe+'artwork';
              Conf.sEdit61.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'crosshairpath' then
            begin
              if t2 = 'crosshair' then
                t2 := FullPathMame_Exe+'crosshair';
              Conf.sEdit60.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'input_directory' then
            begin
              if t2 = 'inp' then
                t2 := FullPathMame_Exe+'inp';
              conf.sEdit62.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'state_directory' then
            begin
              if t2 = 'sta' then
                t2 := FullPathMame_Exe+'sta';
              Conf.sEdit63.Text := t2;
              if not DirectoryExists(t2) then
                CreateDir(t2);
              k := k + 1;
            end
          else if t1 = 'snapshot_directory' then
            begin
              if t2 = 'snap' then
                t2 := FullPathMame_Exe+'snap';
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

procedure CheckWin64ForListBox(num:ShortInt);
var
  ko: Integer;
begin
  Conf.sCheckListBox1.Clear;
  if IsWindows64 = False then
    begin
      for ko := 0 to 3 do
        Conf.sCheckListBox1.Items.Add(AllMameBuilds32[ko]);
    end
  else
    begin
      for ko := 0 to 5 do
        Conf.sCheckListBox1.Items.Add(AllMameBuilds64[ko]);
    end;
  if Mame_Exe <> '' then
    begin
      Conf.sCheckListBox1.Selected[SelectedMame] := True;
      Conf.sCheckListBox1.Checked[SelectedMame] := True;
    end
  else
    begin
      if (Started = True) and (SelectedMame <> -2) then
        Conf.sCheckListBox1.Selected[FXml_MameConfing.Root.ReadAttributeInteger('Selected')] := True
      else
        Conf.sCheckListBox1.Selected[0] := True;
    end;
  if SelectedMame = -2 then
    begin
      Conf.sBitBtn36.Enabled := False;
      Conf.sBitBtn37.Enabled := False;
      Conf.sCheckBox127.Enabled := False;
    end
  else if SelectedMame = 0 then
    conf.sBitBtn36.Enabled := False
  else if SelectedMame = Conf.sCheckListBox1.Count -1 then
    conf.sBitBtn37.Enabled := False;
end;

procedure SaveMame_DirsAtExit;
var
  node: TXmlNode;
  i: Integer;
begin
  if FromDatabase = False then
    if Mame_Exe <> '' then
      for i := 0 to FXml_MameConfing.Root.NodeCount - 1 do
        begin
          node := FXml_MameConfing.Root.Nodes[i];
          if node.Name = 'rowDir' then
            if node.ReadAttributeString('MameName') = Mame_Exe then
              begin
                node.WriteAttributeString('Cabinets',Conf.sEdit3.Text);
                node.WriteAttributeString('Flyers',Conf.sEdit8.Text);
                node.WriteAttributeString('Marquees',Conf.sEdit10.Text);
                node.WriteAttributeString('Control_Panels',Conf.sEdit6.Text);
                node.WriteAttributeString('PCBs',Conf.sEdit9.Text);
                node.WriteAttributeString('Artwork_Preview',Conf.sEdit7.Text);
                node.WriteAttributeString('Titles',Conf.sEdit11.Text);
                node.WriteAttributeString('Select',Conf.sEdit5.Text);
                node.WriteAttributeString('Scores',Conf.sEdit58.Text);
                node.WriteAttributeString('Bosses',Conf.sEdit59.Text);
              end;
        end;
  FXml_MameConfing.SaveToFile(MameConfigFile);
  FromMame_DirsToFindDirs := False;
end;

procedure OldDirIs(name: string);
begin
  if name = 'mamesnapshots' then
    OldDir := Conf.sEdit2.Text
  else if name = 'mamesamples' then
    OldDir := Conf.sEdit4.Text
  else if name = 'mamecabinets' then
    OldDir := Conf.sEdit3.Text
  else if name = 'mameflyers' then
    OldDir := conf.sEdit8.Text
  else if name = 'mamemarquees' then
    OldDir := conf.sEdit10.Text
  else if name = 'mamecontrolpanels' then
    OldDir := conf.sEdit6.Text
  else if name = 'mamepcbs' then
    OldDir := Conf.sEdit9.Text
  else if name = 'mameartworkpreview' then
    OldDir := Conf.sEdit7.Text
  else if name = 'mametitles' then
    OldDir := Conf.sEdit11.Text
  else if name = 'mameselect' then
    OldDir := Conf.sEdit5.Text
  else if name = 'mamescores' then
    OldDir := Conf.sEdit58.Text
  else if name = 'mamebosses' then
    OldDir := Conf.sEdit59.Text
  else if name = 'mamecrosshair' then
    OldDir := Conf.sEdit60.Text
  else if name = 'mameartwork' then
    OldDir := Conf.sEdit61.Text
  else if name = 'mameinputfiles' then
    OldDir :=  Conf.sEdit62.Text
  else if name = 'mamestate' then
    OldDir := Conf.sEdit63.Text;
end;

procedure GetMamePath(name:string);
begin
  FromMame_DirsToFindDirs := True;
  OldDirIs(name);
  gFindDirs := name;
  if Mame_Exe <> '' then
    if SelectDirectory('Select Dir',OldDir,NewDir) then
      global_Find_DirsClose;
end;

procedure SetMamePath(name:string);
begin
  if name = 'mamesnapshots' then
    Conf.sEdit2.Text := NewDir
  else if name = 'mamesamples' then
    Conf.sEdit4.Text := NewDir
  else if name = 'mamecabinets' then
    Conf.sEdit3.Text := NewDir
  else if name = 'mameflyers' then
    conf.sEdit8.Text := NewDir
  else if name = 'mamemarquees' then
    conf.sEdit10.Text := NewDir
  else if name = 'mamecontrolpanels' then
    conf.sEdit6.Text := NewDir
  else if name = 'mamepcbs' then
    Conf.sEdit9.Text := NewDir
  else if name = 'mameartworkpreview' then
    Conf.sEdit7.Text := NewDir
  else if name = 'mametitles' then
    Conf.sEdit11.Text := NewDir
  else if name = 'mameselect' then
    Conf.sEdit5.Text := NewDir
  else if name = 'mamescores' then
    Conf.sEdit58.Text := NewDir
  else if name = 'mamebosses' then
    Conf.sEdit59.Text := NewDir
  else if name = 'mamecrosshair' then
    Conf.sEdit60.Text := NewDir
  else if name = 'mameartwork' then
    Conf.sEdit61.Text := NewDir
  else if name = 'mameinputfiles' then
    Conf.sEdit62.Text := NewDir
  else if name = 'mamestate' then
    conf.sEdit63.Text := NewDir;
  ChangeMemoForMame_Dirs(name);
  FromMame_DirsToFindDirs := False;
end;

procedure ChangeMemoForMame_Dirs(find: string);
var
  k,x: Integer;
  text,t1,value: string;
  Comp: TComponent;
begin
  Comp := FindComponentEx('Conf.MemoEmu_Mame');
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
  for k := 0 to TMemo(Comp).Lines.Count do
    begin
      text := TMemo(Comp).Lines.Strings[k];
      x := Pos(' ',text);
      t1 := Trim(Copy(text,0,x));
      if t1 = find then
        begin
          TMemo(Comp).Lines.Delete(k);
          TMemo(Comp).Lines.Insert(k,find +'          '+value);
        end;
    end;
end;

procedure ShowOnlySetupedMameBuilds;
var
  oldMameName: string;
  itemNum,i,countMame: Integer;
  node: TXmlNode;
  Mame_Name: array [0..5] of string;
begin
  for itemNum := 0 to 5 do
    Mame_Name[itemNum] := '';
  countMame := 0;
  itemNum := Conf.sCheckListBox1.ItemIndex;
  oldMameName := Conf.sCheckListBox1.Items.Strings[itemNum];
  Conf.sCheckListBox1.Clear;
  with FXml_MameConfing.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := FXml_MameConfing.Root.Nodes[i];
        if node.Name = 'rowDir' then
          begin
            Mame_Name[countMame] := node.ReadAttributeString('MameName');
            countMame := countMame + 1;
          end;
      end;
  if Conf.sCheckBox127.Checked = True then
    begin
      for i := 0 to 5 do
        if Mame_Name[i] <> '' then
          Conf.sCheckListBox1.Items.Add(Mame_Name[i]);
      for i := 0 to 5 do
        if Conf.sCheckListBox1.Items.Strings[i] = oldMameName then
          begin
            Conf.sCheckListBox1.Checked[i] :=  True;
            Conf.sCheckListBox1.Selected[i] := True;
            Break;
          end;
    end
  else
    Checkwin64ForListBox(SelectedMame);
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
          NewRomDirectory := FullPathMame_Exe;
          if Mame_Exe <> '' then
            begin
              if SelectDirectory(NewRomDirectory, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
                global_Find_DirsClose
              else
                Conf.sComboBox1.ItemIndex := 0;
            end;
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
  k: Integer;
  foundMame: Boolean;
begin
  foundMame := False;
  s := Conf.sCheckListBox1.Items[Line];
  for k := 0 to 5 do
    if SetupedMame[k] = s then
      foundMame := True;
  Conf.sCheckListBox1.Canvas.Font.Color := clMedGray;
  if foundMame = True then
    begin
      Conf.sCheckListBox1.Canvas.Font.Style := Conf.sCheckListBox1.Canvas.Font.Style + [fsBold];
      Conf.sCheckListBox1.Canvas.Font.Color := clHotLight;
    end;
  Conf.sCheckListBox1.Canvas.TextRect(Position,Position.Left,Position.Top,s);
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
  Conf.sEdit2.Text := FullPathMame_Exe+'snap';
  ChangeMemoForMame_Dirs('mamesnapshots');
  Conf.sEdit4.Text := FullPathMame_Exe+'samples';
  ChangeMemoForMame_Dirs('mamesamples');
  Conf.sEdit3.Text := FullPathMame_Exe+'cabinets';
  Conf.sEdit8.Text := FullPathMame_Exe+'flyers';
  Conf.sEdit10.Text := FullPathMame_Exe+'marquees';
  Conf.sEdit6.Text := FullPathMame_Exe+'cpanel';
  Conf.sEdit9.Text := FullPathMame_Exe+'pcbs';
  Conf.sEdit7.Text := FullPathMame_Exe+'artwork preview';
  Conf.sEdit11.Text := FullPathMame_Exe+'titles';
  Conf.sEdit5.Text := FullPathMame_Exe+'select';
  Conf.sEdit58.Text := FullPathMame_Exe+'scores';
  Conf.sEdit59.Text := FullPathMame_Exe+'bosses';
  Conf.sEdit60.Text := FullPathMame_Exe+'crosshair';
  ChangeMemoForMame_Dirs('mamecrosshair');
  Conf.sEdit61.Text := FullPathMame_Exe+'artwork';
  ChangeMemoForMame_Dirs('mameartwork');
  Conf.sEdit62.Text := FullPathMame_Exe+'inp';
  ChangeMemoForMame_Dirs('mameinputfiles');
  Conf.sEdit63.Text := FullPathMame_Exe+'sta';
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
  if Mame_Exe <> '' then
    begin
      if LowerCase(Conf.sEdit2.Text) <> LowerCase(FullPathMame_Exe+'snap') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit4.Text) <> LowerCase(FullPathMame_Exe+'samples') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit3.Text) <> LowerCase(FullPathMame_Exe+'cabinets') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit8.Text) <> LowerCase(FullPathMame_Exe+'flyers') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit10.Text) <> LowerCase(FullPathMame_Exe+'marquees') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit6.Text) <> LowerCase(FullPathMame_Exe+'cpanel') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit9.Text) <> LowerCase(FullPathMame_Exe+'pcbs') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit7.Text) <> LowerCase(FullPathMame_Exe+'artwork preview') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit11.Text) <> LowerCase(FullPathMame_Exe+'titles') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit5.Text) <> LowerCase(FullPathMame_Exe+'select') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit58.Text) <> LowerCase(FullPathMame_Exe+'scores') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit59.Text) <> LowerCase(FullPathMame_Exe+'bosses') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit60.Text) <> LowerCase(FullPathMame_Exe+'crosshair') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit61.Text) <> LowerCase(FullPathMame_Exe+'artwork') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit62.Text) <> LowerCase(FullPathMame_Exe+'inp') then
        Conf.sButton4.Enabled := True;
      if LowerCase(Conf.sEdit63.Text) <> LowerCase(FullPathMame_Exe+'sta') then
        Conf.sButton4.Enabled := True;
    end;
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
  value: string;
  Comp: TComponent;
begin
  if FindComponentEx('Conf.MemoEmu_Mame') <> nil then
    begin
      Comp := FindComponentEx('Conf.MemoEmu_Mame');
      TMemo(Comp).Free;
    end;
  MemoEmu_Comp(Conf,'Mame');
  Comp := FindComponentEx('Conf.MemoEmu_Mame');
  value := FullPathMame_Exe + 'mame.ini';
  TMemo(Comp).Lines.LoadFromFile(value);
end;

procedure GetSelectedMameNum(MameName: string);
begin
  if IsWindows64 = true then
    begin
      if MameName = 'mame.exe' then
        SelectedMame := 0
      else if MameName = 'mamepp.exe' then
        SelectedMame := 1
      else if MameName = 'mame64.exe' then
        SelectedMame := 2
      else if MameName = 'mamep.exe' then
        SelectedMame := 3
      else if MameName = 'mamepuiXT_x86.exe' then
        SelectedMame := 4
      else if MameName = 'mamepuiXT_x64.exe' then
        SelectedMame := 5;
    end
  else
    begin
      if MameName = 'mame.exe' then
        SelectedMame := 0
      else if MameName = 'mamepp.exe' then
        SelectedMame := 1
      else if MameName = 'mamep.exe' then
        SelectedMame := 2
      else if MameName = 'mamepuiXT_x86.exe' then
        SelectedMame := 3;
    end;
end;

procedure Assigned_MameConfiguration;
begin
  if not Assigned(FXml_MameConfing) then
    begin
      FXml_MameConfing := TNativeXml.CreateName('MameConfig');
      FXml_MameConfing.XmlFormat := xfReadable;
    end;
end;

////////////////////////////////////////////////////////////

procedure Show_mame_dirspanel;
begin
  if (Cmenustate = 'em_arcade_mame_graphics') then
    em_mame_graphics_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_sound') then
    em_mame_sound_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_others') then
    em_mame_others_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_builds') then
    em_mame_builds_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_database') then
    em_mame_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn6.Caption,False,True);
  Cmenustate := 'em_arcade_mame_paths';
  em_mame_dirs_ShowDynamicComps;
  ShowButtonDown(6,'EM_ARCADE_MAME_DIRS');
  CheckButtonTopicsConfig_MameDirs;
  ShowHidePanel(CurrentPanel,'Pem_mame_dirs');
end;

procedure em_mame_dirs_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_mame_dirs,'media\confeditor\images\mame\mame.png',
              -10,587,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pem_mame_dirs,'media\confeditor\images\mame\mame_image.png',
              558,381,169,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_mame_dirs,'media\confeditor\images\mame\paths.png',
              611,2,156,71,i,'',True,False);
      end;
    end;
end;

procedure em_mame_dirs_FreeDynamicComps;
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


