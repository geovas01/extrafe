unit mame_database;

interface

uses
  Windows, SysUtils,Controls,StdCtrls,Buttons,Variants,Classes,Graphics,Forms,ComCtrls,ExtCtrls,
  comobj,Dialogs,
  NxColumns,NxColumnClasses,NxCustomGridControl,
  NativeXml,
  sLabel,
  FunctionX,form_Search;

type  
  THtmlColClick = class(TObject)
  public
    procedure DoHtmlColClick(Sender: TObject; Href: WideString);
  end;

  procedure SetMame_DatabaseFromMameIni;

  procedure CreateNewMameDataBase;
  function GetMameVer(FullPath,ExeName,ExtractTo: String): string;
  procedure GetMameGameList;
  procedure SetupNewXmlDatabase;
  procedure CreateRowDir;
  procedure AddNewDirTo_MameDirs(dir: string; add: Boolean);
  procedure ShowDatabaseStatsFor(Dir: string);
  procedure MameDatabase_Clear;
  procedure ShowMameInfo(MameBuild: String; RomsEmul,GamesFound: Integer);

  procedure AddNewRom_Dir;
  procedure EraseMameDir(path: string);
  function SearchIfRomPathExists(path: string): Boolean;

  procedure UrlMame(SetMame: String);

  procedure SetTheGridForSetup;
  procedure BestFitForMameGrid;  

  procedure SetupAndStartData(Active: Boolean);  

  procedure Assigned_MameDatabase;

  procedure ShowMameGameInfoPanel(gameName,romName: String);
  procedure ShowMame_TabGameInfoClick;
  procedure ShowMame_TabMediaClick;
  procedure ShowMame_TabRomClick;
  procedure FreeImagesAndLabelsFromMediaTab;
  procedure BackToDatabaseSheet;

// Menu actions
  procedure Show_mame_databasepanel;
  procedure em_mame_database_ShowDynamicComps;
  procedure em_mame_database_FreeDynamicComps;  

var
  PathXmlMame,PathXmlMamePath: string;
  AddNew_RomDir: Boolean;

implementation


uses
  main,mainconf,menu,onflycomponents,
  form_splash,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_hlsl,
  ce_logsession;

var
  iNode,FinalRomsFound,k: Integer;
  rec : TSearchRec;
  RomFound: Boolean;
  htmlClass: THtmlColClick;

procedure CreateNewMameDataBase;
begin
  if CreateNewMame = True then
    begin
      Conf.sBitBtn36.Enabled := True;
      Conf.sBitBtn37.Enabled := True;      
      SetupAndStartData(True);
      FromDatabase := True;
//      Screen.Cursor := Busy;
      GetMameGameList;
      SetupNewXmlDatabase;
      StartEmuMame;
      FromDatabase := False;
      SetupAndStartData(False);
//      Screen.Cursor := Arrow;
      Conf.sLabel109.Caption := 'Overall Status';
      Conf.sGauge_MameData.Progress := 100;
    end;
end;

procedure GetMameGameList;
begin
  Conf.nxtgrd_mame.Columns.Clear;
  Conf.nxtgrd_mame.ClearRows;
  Conf.sGauge_MameData.Progress := 0;
  PathXmlMame := Program_Path+'media\emulators\arcade\mame\database\'+Mame_Exe;
  Delete(PathXmlMame,Length(PathXmlMame)-3,4);
  Conf.sLabel109.Caption := 'Generating Mame Game List...';
  Application.ProcessMessages;
  RunCaptured(ExtractFileDrive(FullPathMame_Exe),Mame_Exe,' -ll',PathXmlMame+'.txt');
end;

procedure SetupNewXmlDatabase;
var
  mText: TextFile;
  mString,mRom,mDesc: string;
  ttGames: Integer;
  MameRomsFromDir: TStringList;
  MameBuildName: String;
  l,t,count: Integer;
  node: TXmlNode;
begin
  Conf.sLabel109.Caption := 'Parsing Mame Game List (Please Wait)...';
  FinalRomsFound := 0;
  Application.ProcessMessages;
  try
    ttGames:= -1;
    count:= 0;  
    AssignFile(MText,PathXmlMame+'.txt');
    Reset(MText);
    while not Eof(mText) do
      begin
        Readln(mText,mString);
        ttGames := ttGames + 1;
      end;
    Assigned_MameDatabase;
    try
      Conf.sLabel109.Caption := 'Searching for Roms (Please Wait...)';
      SetTheGridForSetup;
      Application.ProcessMessages;
    finally            
      MameRomsFromDir := TStringList.Create;
      if FindFirst('roms\*.*' , faAnyFile, Rec) = 0 then
        begin
          repeat
            if ((Rec.Attr and faDirectory) <> faDirectory) then
              MameRomsFromDir.Add(rec.Name);
          until FindNext(Rec) <> 0;
        end;
      MameRomsFromDir.Sort;
      Conf.nxtgrd_mame.AddRow(ttGames);
      Conf.nxtgrd_mame.BeginUpdate;
      Reset(mText);      
      FXml_MameDatabase.Clear;
      while not Eof(mText) do
        begin        
          Readln(mText,mString);
          t := Pos('"',mString);
          mRom := Trim(Copy(mString,0,t-1));
          mDesc := Trim(Copy(mString,t+1,Length(mString)-(t+1)));
          if mRom <> '' then
            begin
              RomFound := False;
              node := FXml_MameDatabase.Root.NodeNew('row');
              node.WriteAttributeInteger('id',count);
              node.WriteAttributeString('GameName',mDesc);
              Conf.nxtgrd_mame.Cell[1,count].AsString := mDesc;
              node.WriteAttributeString('RomName',mRom + '.zip');
              Conf.nxtgrd_mame.Cell[2,count].AsString := mRom;
              for l:= 0 to MameRomsFromDir.Count - 1 do
                if MameRomsFromDir.Strings[l] = mRom + '.zip' then
                  begin
                    MameRomsFromDir.Delete(l);
                    RomFound := True;
                    node.WriteAttributeString('PathOf','1');
                    Conf.nxtgrd_mame.Cell[3,count].AsInteger := 32;
                    FinalRomsFound := FinalRomsFound + 1;
                    Break;
                  end;
              if romFound = False then
                begin
                  node.WriteAttributeString('PathOf',' ');
                  Conf.nxtgrd_mame.Cell[3,count].AsInteger := 33;
                end;
              count := count + 1;
              Conf.sGauge_MameData.Progress := (100 * count) div (ttGames-1);
              Conf.sGauge_MameData.Suffix := '% ('+IntToStr(count)+'/'+IntToStr(ttGames)+')';
            end;
        end;
      CloseFile(mText);
      SysUtils.DeleteFile(PathXmlMame+'.txt');
      MameBuildName := GetMameVer(FullPathMame_Exe,Mame_Exe,PathXmlMame);
      FXml_MameDatabase.Root.WriteAttributeString('Ver',MameBuildName);
      FXml_MameDatabase.Root.WriteAttributeString('MameExeName',Mame_Exe);
      FXml_MameDatabase.Root.WriteAttributeInteger('RomsEmulated',ttGames);
      FXml_MameDatabase.Root.WriteAttributeInteger('FinalRomsFound',FinalRomsFound);
      if (Mame_Exe = 'mamep.exe') then
        begin
          FXml_MameDatabase.Root.WriteAttributeBool('IpsChecked',False);
          FXml_MameDatabase.Root.WriteAttributeBool('HiScoreChecked',False);
        end;
      GetSelectedMameNum(Mame_Exe);
      FXml_MameConfing.Root.WriteAttributeBool('Active',True);
      FXml_MameConfing.Root.WriteAttributeString('SelectedMame',Mame_Exe);
      FXml_MameConfing.Root.WriteAttributeString('FullPathOfSelectedMame',FullPathMame_Exe);
      FXml_MameConfing.Root.WriteAttributeInteger('Selected',SelectedMame);
      CreateRowDir;
      node := FXml_MameConfing.Root.NodeNew('rowPath');
      node.WriteAttributeString('MameName',Mame_Exe);
      node.WriteAttributeInteger('PathId',1);
      node.WriteAttributeString('RomPath',FullPathMame_Exe + 'roms');
      node.WriteAttributeInteger('RomsFound',FinalRomsFound);
      BestFitForMameGrid;
      Conf.nxtgrd_mame.EndUpdate;
      Conf.sLabel104.Caption := 'Mame Version (Build) : '+MameBuildName;
      Conf.sLabel106.Caption := 'Overall Emulated : '+ IntToStr(ttGames);
      Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(FinalRomsFound);
      UrlMame(Mame_Exe);
      Application.ProcessMessages;
    end;
  finally
    Conf.sCheckBox127.Enabled := True;
    InitGlobal_MameMemo_ForMameIni;    
    AddNewDirTo_MameDirs('First',True);
    Conf.sGauge_MameData.Suffix := '%';
    Conf.sLabel109.Caption := 'Saving Database...';
    Application.ProcessMessages;
    FXml_MameDatabase.SaveToFile(PathXmlMame+'_efuse.xml');
    FXml_MameConfing.SaveToFile(PathXmlMamePath+'config.xml');   
  end;   
end;

procedure CreateRowDir;
var
  node: TXmlNode;
begin
  node := FXml_MameConfing.Root.NodeNew('rowDir');
  node.WriteAttributeString('MameName',Mame_Exe);
  node.WriteAttributeString('MamePath',FullPathMame_Exe);
  if not DirectoryExists(FullPathMame_Exe+'cabinets') then
    CreateDir(FullPathMame_Exe+'cabinets');
  node.WriteAttributeString('Cabinets',FullPathMame_Exe + 'cabinets');
  if not DirectoryExists(FullPathMame_Exe+'flyers') then
    CreateDir(FullPathMame_Exe+'flyers');
  node.WriteAttributeString('Flyers',FullPathMame_Exe + 'flyers');
  if not DirectoryExists(FullPathMame_Exe+'marquees') then
    CreateDir(FullPathMame_Exe+'marquees');
  node.WriteAttributeString('Marquees',FullPathMame_Exe + 'marquees');
  if not DirectoryExists(FullPathMame_Exe+'cpanel') then
    CreateDir(FullPathMame_Exe+'control panels');
  node.WriteAttributeString('Control_Panels',FullPathMame_Exe + 'cpanel');
  if not DirectoryExists(FullPathMame_Exe+'pcb') then
    CreateDir(FullPathMame_Exe+'pcb');
  node.WriteAttributeString('PCBs',FullPathMame_Exe + 'pcb');
  if not DirectoryExists(FullPathMame_Exe+'artwork preview') then
    CreateDir(FullPathMame_Exe+'artwork preview');
  node.WriteAttributeString('Artwork_Preview',FullPathMame_Exe + 'artwork preview');
  if not DirectoryExists(FullPathMame_Exe+'titles') then
    CreateDir(FullPathMame_Exe+'titles');
  node.WriteAttributeString('Titles',FullPathMame_Exe + 'titles');
  if not DirectoryExists(FullPathMame_Exe+'select') then
    CreateDir(FullPathMame_Exe+'select');
  node.WriteAttributeString('Select',FullPathMame_Exe + 'select');
  if not DirectoryExists(FullPathMame_Exe+'scores') then
    CreateDir(FullPathMame_Exe+'scores');
  node.WriteAttributeString('Scores',FullPathMame_Exe + 'scores');
  if not DirectoryExists(FullPathMame_Exe+'bosses') then
    CreateDir(FullPathMame_Exe+'bosses');
  node.WriteAttributeString('Bosses',FullPathMame_Exe + 'bosses');
end;

procedure SetTheGridForSetup;
begin
  Conf.nxtgrd_mame.Columns.Add(TNxIncrementColumn,'ID');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Game Name');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Rom Name');
  Conf.nxtgrd_mame.Columns.Add(TNxImageColumn,'Roms');
  Conf.nxtgrd_mame.Columns[0].Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[0].Header.Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[1].Width := 200;
  Conf.nxtgrd_mame.Columns[3].Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[3].Header.Alignment := taCenter;
  TNxImageColumn(Conf.nxtgrd_mame.Columns[3]).Images := Conf.InBitBtn_Imagelist;
  Conf.nxtgrd_mame.HeaderSize := 30;
  { Edo einai i diadikasia gia to html collumn 
    Tha to xreiasto otan einai na sindeso tin basi mou 
    links gia plirofories sto internet gia ta roms...
  Conf.nxtgrd_mame.AddRow();
  Conf.nxtgrd_mame.Columns.Add(TNxHtmlColumn,'');
  Conf.nxtgrd_mame.Columns[0].Options := [coEditing];
  Conf.nxtgrd_mame.Cell[0,Conf.nxtgrd_mame.LastAddedRow].AsString := '<b>Found</b> no setuped rom directory. <font color="red">Please</font> go <a href="mame_dir_panel">here</a> and add a rom directory';
  TNxHtmlColumn(Conf.nxtgrd_mame.Columns[0]).OnClick := htmlClass.DoHtmlColClick;}
end;

procedure UrlMame(SetMame: String);
begin
  if (SetMame = 'mame.exe') or (SetMame = 'mamepp.exe') or (SetMame = 'mame64.exe') then
    Conf.sWebLabel3.URL := 'http://www.mamedev.org/'
  else if (SetMame = 'mamepuiXT_x86.exe') or (SetMame = 'mamepuiXT_x64.exe') then
    Conf.sWebLabel3.URL := 'http://www.mamext.net'
  else if SetMame = 'mamep.exe' then
    Conf.sWebLabel3.URL := 'http://sourceforge.net/projects/mameplus/';
  Conf.sWebLabel3.Caption := SetMame;
end;

procedure SetMame_DatabaseFromMameIni;
var
  MameName: string;
  node: TXMLNode;
begin
  if FromDatabase = false then
    begin
      if FileExists(PathXmlMame+'_efuse.xml') then
        begin
          SetTheGridForSetup;
          if FromArrows_Mamedirs = False then
            Splash_Screen.sLabel1.Caption := 'Setting Mame Database...'
          else
            Conf.sLabel112.Caption := 'Setting Mame Database...';
          MameName:= FXml_MameDatabase.Root.AttributeValueByName['MameExeName'];
          ShowDatabaseStatsFor('Overall Roms');
          Conf.sGauge_MameData.Progress := 100;
        end
      else
        MameDatabase_Clear;
    end;
  Log_NewTextEnter(#9 + 'Found all Settings OK');
  Started := False;
end;

procedure MameDatabase_Clear;
begin
  Conf.sComboBox72.ItemIndex := 0;
  Conf.sGauge_MameData.Progress := 0;
  Conf.sLabel109.Caption := '';
  Conf.nxtgrd_mame.Columns.Clear;
  Conf.nxtgrd_mame.ClearRows;
  Conf.nxtgrd_mame.Caption := 'I Have no Data to Show.';
  Conf.sLabel104.Caption := 'Mame Version (Build) :';
  Conf.sLabel105.Caption := 'Mame Name :';
  Conf.sLabel106.Caption := 'Overall Emulated :';
  Conf.sLabel107.Caption := 'Roms Found :';
  Conf.sWebLabel3.Caption := '';
  Conf.sWebLabel3.URL := '';
end;

procedure ShowDatabaseStatsFor(Dir: string);
var
  XMLPaths: TStringList;
  NumOfDir,NumOfRoms: Integer;
  i,k,TotalRoms,MissingRoms,CurrentRow: Integer;
  node: TXmlNode;
begin
  if (AddNew_RomDir = False) and (Mame_Exe <> '') then
    begin
      if Dir = 'Overall Roms' then
        begin
          SetupAndStartData(True);
          Conf.sLabel109.Caption := 'Loading Overall Information...';
          Application.ProcessMessages;
          Conf.nxtgrd_mame.ClearRows;
          TotalRoms := FXml_MameDatabase.Root.AttributeByName['RomsEmulated'].ValueAsInteger;
          Conf.nxtgrd_mame.AddRow(TotalRoms);
          Conf.nxtgrd_mame.BeginUpdate;          
          k := 0;
          with FXml_MameDatabase.Root do 
            for i := 0 to NodeCount - 1 do 
              begin
                node := FXml_MameDatabase.Root.Nodes[i];
                if node.Name = 'row' then
                  begin
                    Conf.nxtgrd_mame.Cell[1,k].AsString := node.ReadAttributeString('GameName');
                    Conf.nxtgrd_mame.Cell[2,k].AsString := node.ReadAttributeString('RomName');
                    if node.ReadAttributeString('PathOf') = ' ' then
                      Conf.nxtgrd_mame.Cell[3,i-4].AsInteger := 33
                    else
                      Conf.nxtgrd_mame.Cell[3,i-4].AsInteger := 32;
                    Conf.sGauge_MameData.Progress := (100 * k) div TotalRoms;
                    Conf.sGauge_MameData.Suffix := '% ('+IntToStr(k + 1) + '/' + IntToStr(TotalRoms) +')';                
                    k := k + 1;
                  end;
              end;
          BestFitForMameGrid;
          Conf.nxtgrd_mame.EndUpdate;
          ShowMameInfo(FXml_MameDatabase.Root.AttributeByName['Ver'].Value,FXml_MameDatabase.Root.AttributeByName['FinalRomsFound'].ValueAsInteger,FXml_MameDatabase.Root.AttributeByName['FinalRomsFound'].ValueAsInteger);
          Conf.sLabel109.Caption := 'Overall Roms Status';          
          SetupAndStartData(False);          
        end
      else if Dir = 'Missing Roms' then
        begin
          SetupAndStartData(True);
          Conf.sLabel109.Caption := 'Found Missing Roms...';
          Application.ProcessMessages;
          Conf.nxtgrd_mame.ClearRows;
          MissingRoms := (FXml_MameDatabase.Root.AttributeByName['RomsEmulated'].ValueAsInteger) - (FXml_MameDatabase.Root.AttributeByName['FinalRomsFound'].ValueAsInteger);
          TotalRoms := FXml_MameDatabase.Root.AttributeByName['RomsEmulated'].ValueAsInteger;
          Conf.nxtgrd_mame.AddRow(MissingRoms);
          Conf.nxtgrd_mame.BeginUpdate;
          k := 0;
          with FXml_MameDatabase.Root do 
            for i := 0 to NodeCount - 1 do 
              begin
                node := FXml_MameDatabase.Root.Nodes[1];
                if node.Name = 'row' then
                  if node.ReadAttributeString('PathOf') = ' ' then
                    begin
                      Conf.nxtgrd_mame.Cell[1,k].AsString := node.ReadAttributeString('GameName');
                      Conf.nxtgrd_mame.Cell[2,k].AsString := node.ReadAttributeString('RomName');
                      Conf.nxtgrd_mame.Cell[3,k].AsInteger := 33;
                      k := k + 1;
                    end;
                Conf.sGauge_MameData.Progress := (100 * k) div TotalRoms;
                Conf.sGauge_MameData.Suffix := '% (' + IntToStr(k + 1) + '/' + IntToStr(TotalRoms) + ')';
              end;            
          ShowMameInfo(FXml_MameDatabase.Root.AttributeByName['Ver'].Value,0,FXml_MameDatabase.Root.AttributeByName['FinalRomsFound'].ValueAsInteger);
          Conf.sLabel107.Caption := 'Roms Missing : '+IntToStr(MissingRoms);
          Conf.nxtgrd_mame.EndUpdate;
          Conf.sLabel109.Caption := 'Missing Roms Status';
          SetupAndStartData(False);
        end
      else
        begin
          SetupAndStartData(True);
          Conf.sLabel109.Caption := 'Load Directory Information...';
          Application.ProcessMessages;
          Conf.nxtgrd_mame.ClearRows;
          with FXml_MameConfing.Root do
            for i := 0 to NodeCount - 1 do
              begin
                node := FXml_MameConfing.Root.Nodes[i];
                if node.Name = 'rowPath' then
                  if node.ReadAttributeString('RomPath') = Dir then
                    begin
                      NumOfDir := node.ReadAttributeInteger('PathId');
                      NumOfRoms := node.ReadAttributeInteger('RomsFound');
                      Break;
                    end;
              end;
          XMLPaths := TStringList.Create;
          Conf.nxtgrd_mame.AddRow(NumOfRoms);
          Conf.nxtgrd_mame.BeginUpdate;
          CurrentRow := 0;
          with FXml_MameDatabase.Root do
            for i:= 0 to NodeCount - 1 do
              begin
                XMLPaths.Clear;
                node := FXml_MameDatabase.Root.Nodes[i];
                if node.Name = 'row' then
                  if node.ReadAttributeString('PathOf') <> '' then
                    begin
                      XMLPaths.Delimiter := ',';
                      XMLPaths.DelimitedText := node.ReadAttributeString('PathOf');
                      for k := 0 to XMLPaths.Count - 1 do
                        if XMLPaths[k] = IntToStr(NumOfDir) then
                          begin                            
                            Conf.nxtgrd_mame.Cell[3,CurrentRow].AsInteger := 32;
                            Conf.nxtgrd_mame.Cell[1,CurrentRow].AsString := node.ReadAttributeString('GameName');
                            Conf.nxtgrd_mame.Cell[2,CurrentRow].AsString := node.ReadAttributeString('RomName');
                            CurrentRow := CurrentRow + 1;
                            Break;
                          end
                    end;
                Conf.sGauge_MameData.Progress := (100 * i) div (NumOfRoms-1);
                Conf.sGauge_MameData.Suffix := '% ('+IntToStr(i +1)+'/'+IntToStr(NumOfRoms)+')';
                Application.ProcessMessages;
              end;
          FreeAndNil(XMLPaths);
          Conf.nxtgrd_mame.EndUpdate;
          Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(NumOfRoms);
          ShowMameInfo(FXml_MameDatabase.Root.AttributeByName['Ver'].Value,NumOfRoms,FXml_MameDatabase.Root.AttributeByName['FinalRomsFound'].ValueAsInteger);
          Conf.sComboBox72.Text := '';
          Conf.sComboBox72.Text := Dir;
          Conf.sLabel109.Caption := 'Single Directory Status';
          SetupAndStartData(False);
          Conf.sBitBtn102.Visible := True;
        end;
    end;
  AddNew_RomDir := False;
  Conf.sGauge_MameData.Suffix := '%';
end;

procedure ShowMameInfo(MameBuild: String; RomsEmul,GamesFound: Integer);
begin
  Conf.sLabel104.Caption := 'Mame Version (Build) : ' + MameBuild;
  UrlMame(Mame_Exe);
  Conf.sLabel106.Caption := 'Overall Emulated : ' + IntToStr(RomsEmul);
  Conf.sLabel107.Caption := 'Roms Found : ' + IntToStr(GamesFound);
end;

procedure AddNewRom_Dir;
var
  node: TXmlNode;
  i,PathID,uniqueRomsFound,OldFinalRomsFound,TotalRoms:Integer;
  GameRomName: String;
begin
  if SearchIfRomPathExists(NewRomDirectory) = True then
    begin
      ShowMessage('This Directory already setuped.');
      Conf.sComboBox1.ItemIndex := 0;
    end
  else
    begin
      FromDatabase := True;
      SetupAndStartData(True);
      Conf.nxtgrd_mame.ClearRows;
      RomFound := False;
      PathID := 0;
      FinalRomsFound := 0;
      uniqueRomsFound := 0;
      Conf.sLabel109.Caption := 'Adding roms from new directory...';
      Application.ProcessMessages;
      //Get The total next roms number
      OldFinalRomsFound := FXml_MameDatabase.Root.ReadAttributeInteger('FinalRomsFound');
      // Get The Last PathID
      with FXml_MameConfing.Root do
        for i := 0 to NodeCount - 1 do
          begin
            node := FXml_MameDatabase.Root.Nodes[i];
            if node.Name = 'rowPath' then
              PathID := PathID + node.ReadAttributeInteger('PathId');
          end;
      i := CountFilesOrFolders(NewRomDirectory,'files');
      Conf.nxtgrd_mame.AddRow(i);
      Conf.nxtgrd_mame.BeginUpdate;
      TotalRoms := FXml_MameDatabase.Root.ReadAttributeInteger('RomsEmulated');
      with FXml_MameDatabase.Root do
        for i:= 0 to NodeCount - 1 do
          begin
            node := FXml_MameDatabase.Root.Nodes[i];
            if node.Name = 'row' then
              begin
                GameRomName := node.ReadAttributeString('RomName');
                if FileExists(NewRomDirectory + '\' + GameRomName) then
                  begin
                    Conf.nxtgrd_mame.Cell[1,FinalRomsFound].AsString := node.ReadAttributeString('GameName');
                    Conf.nxtgrd_mame.Cell[2,FinalRomsFound].AsString := GameRomName;
                    Conf.nxtgrd_mame.Cell[3,FinalRomsFound].AsInteger := 32;                  
                    if node.ReadAttributeString('PathOf') <> ' ' then
                      node.WriteAttributeString('PathOf',IntToStr(PathID)+ ',' + IntToStr(PathID+1))
                    else
                      begin
                        node.WriteAttributeInteger('PathOf',1);
                        uniqueRomsFound := uniqueRomsFound + 1;
                      end;
                    RomFound := True;
                    FinalRomsFound := FinalRomsFound + 1;
                    Conf.sGauge_MameData.Progress := (100 * i) div (TotalRoms-1);
                    Conf.sGauge_MameData.Suffix := '% ('+IntToStr(i + 1)+'/'+IntToStr(TotalRoms)+')';
                    Application.ProcessMessages;                    
                  end;
              end;
          end;
      for i := conf.nxtgrd_mame.RowCount -1 downto FinalRomsFound do
        Conf.nxtgrd_mame.DeleteRow(i);
      Conf.nxtgrd_mame.EndUpdate;
      node := FXml_MameConfing.Root.NodeNew('rowPath');
      node.WriteAttributeString('MameName',Mame_Exe);
      node.WriteAttributeInteger('PathId',PathID + 1);
      node.WriteAttributeString('RomPath',NewRomDirectory);
      node.WriteAttributeInteger('RomsFound',FinalRomsFound);
      //Add finalroms to Mame xml database...
      FXml_MameDatabase.Root.WriteAttributeInteger('FinalRomsFound',OldFinalRomsFound + uniqueRomsFound);
      Conf.sLabel109.Caption := 'Saving Database...';
      Application.ProcessMessages;
      FXml_MameDatabase.SaveToFile(MameDatabaseFile);
      FXml_MameConfing.SaveToFile(MameConfigFile);
      AddNew_RomDir := True;
      Conf.sGauge_MameData.Suffix := '%';
      AddNewDirTo_MameDirs(NewRomDirectory,True);
      Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(FinalRomsFound);
      Conf.sLabel109.Caption := 'Single Directory Status';
      Conf.sBitBtn102.Visible := True;
      SetupAndStartData(False);
      FromDatabase := False;
    end;
end;

procedure BestFitForMameGrid;
begin
  Conf.nxtgrd_mame.BestFitColumn(0,bfboth);
  Conf.nxtgrd_mame.BestFitColumn(2,bfBoth);
  Conf.nxtgrd_mame.BestFitColumn(3,bfHeader);
end;

procedure AddNewDirTo_MameDirs(dir: string; add: Boolean);
var
  x,l,k: Integer;
  t1,value: string;
  Comp: TComponent;
begin
// add or erase rompath to dir panel in compobox...
  if add = True then
    begin
      x := Conf.sComboBox1.Items.Count - 1;  
      if dir = 'First' then
        Conf.sComboBox1.Items.Insert(x,dir)
      else
        Conf.sComboBox1.Items.Insert(x,dir);
    end
  else
    begin
      x := Conf.sComboBox1.Items.IndexOf(dir);
      Conf.sComboBox1.Items.Delete(x);
      Conf.sComboBox1.ItemIndex := 0;    
    end;
// add or erase rompath to mame.ini...
  if add = True then  
    begin
      if dir <> 'First' then
        begin
          Comp := FindComponentEx('Conf.MemoEmu_Mame');
          for k := 0 to TMemo(Comp).Lines.Count - 1 do
            begin
              value := TMemo(Comp).Lines.Strings[k];
              x := Pos(' ',value);
              t1 := Trim(Copy(value,0,x));
              if t1 = 'rompath' then
                begin
                  value := value + ';' + dir;
                  TMemo(Comp).Lines.Delete(k);
                  TMemo(Comp).Lines.Insert(k,value);
                  Break;
                end;
            end;
        end;
    end 
  else
    begin
      Comp := FindComponentEx('Conf.MemoEmu_Mame');
      for k := 0 to TMemo(Comp).Lines.Count - 1 do
        begin
          value := TMemo(Comp).Lines.Strings[k];
          x := Pos(' ',value);
          t1 := Trim(Copy(value,0,x));
          if t1 = 'rompath' then
            begin
                
            end;
        end;
    end;
// add or erase selected rompath in database's compobox...
  if add = true then 
    if dir = 'First' then
      begin
        Conf.sComboBox72.Clear;
        Conf.sComboBox72.Items.Add('Overall Roms');
        Conf.sComboBox72.Items.Add('Missing Roms');
        Conf.sComboBox72.Items.Add(FullPathMame_Exe+'roms');
        Conf.sComboBox72.ItemIndex := 0;
      end
    else
      begin
        Conf.sComboBox72.Items.Add(dir);
        Conf.sComboBox72.SelText := dir;
      end
  else  
    begin
      x := Conf.sComboBox72.Items.IndexOf(dir);
      Conf.sComboBox72.Items.Delete(x);
      Conf.sComboBox72.ItemIndex := 0;    
    end;
end;

procedure SetupAndStartData(Active: Boolean);
begin
  if Active = True then
    begin
      MenuButton6;
      DisableMenuButtons(False);
      Conf.sComboBox72.Visible := False;
      Conf.grp115.Visible := False;
      Conf.nxtgrd_mame.Height := 1;
      Conf.Mame_GameInfoPanel.Visible := False;
      Conf.sBitBtn102.Visible := False;
    end
  else
    begin
      Conf.nxtgrd_mame.Height := 407;
      Conf.grp115.Visible := True;
      Conf.sComboBox72.Visible := True;
      Conf.Mame_GameInfoPanel.Visible := True;
      DisableMenuButtons(True);
    end;
end;

procedure EraseMameDir(path: string);
var
  PathOf_Mame: TStringList;
  FinalPath: string;
  oldromfound: Boolean;
  i,M_ID,k1,TotalRoms: integer;
  node: TXmlNode;
begin
  if MessageBox(0,'Do you really want to erase this directory from database?','Erase Directory',+mb_YesNo +mb_ICONWARNING) = 6 then
    begin
      SetupAndStartData(True);
      Conf.sLabel109.Caption := 'Delete Rom Directory from Database...';
      Application.ProcessMessages;
      M_ID := 0;
      with FXml_MameConfing.Root do
        for i:= 0 to NodeCount - 1 do
          begin
            node := FXml_MameConfing.Root.Nodes[i];
            if node.Name = 'rowPath' then
              begin
                if node.ReadAttributeString('MameName') = Mame_Exe then
                  begin 
                    if node.ReadAttributeString('RomPath') = path then
                      begin
                        M_ID := node.ReadAttributeInteger('PathId');
                        node.Delete;
                      end
                    else
                      begin
                        if M_ID <> 0 then
                          node.WriteAttributeInteger('PathId',node.ReadAttributeInteger('PathId')-1);
                      end;
                  end;
              end
          end;
      FXml_MameConfing.SaveToFile(MameConfigFile);
      Conf.nxtgrd_mame.ClearRows;
      FinalRomsFound := 0;
      TotalRoms := FXml_MameDatabase.Root.ReadAttributeInteger('FinalRomsFound');
      with FXml_MameDatabase.Root do
        for i:= 0 to NodeCount -1 do
          begin
            node := FXml_MameDatabase.Root.Nodes[i];
            Conf.nxtgrd_mame.Cell[1,i].AsString := node.ReadAttributeString('GameName');
            Conf.nxtgrd_mame.Cell[2,i].AsString := node.ReadAttributeString('RomName');
            if node.ReadAttributeString('PathOf') <> ' ' then
              begin
                PathOf_Mame := TStringList.Create;
                PathOf_Mame.Delimiter := ',';
                PathOf_Mame.DelimitedText := node.ReadAttributeString('PathOf');
                for k1 := 0 to PathOf_Mame.Count - 1 do
                  if PathOf_Mame[k1] = IntToStr(M_ID) then
                    oldromfound:= True;
                if oldromfound = True then
                  begin
                    if PathOf_Mame.Count - 1 = 0 then
                      begin
                        node.WriteAttributeString('PathOf',' ');
                        Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 33;
                      end
                    else if PathOf_Mame.Count - 1 > 0 then
                      begin
                        for k1 := 0 to PathOf_Mame.Count -1 do
                          begin
                            if StrToInt(PathOf_Mame[k1]) < M_ID then
                              if k1 = 0 then
                                FinalPath := PathOf_Mame[k1]
                              else
                                FinalPath := FinalPath + ',' + PathOf_Mame[k1]
                            else if StrToInt(PathOf_Mame[k1]) > M_ID then
                              if k1 = 0 then
                                FinalPath := IntToStr(StrToInt(PathOf_Mame[k1]) - 1)
                              else
                                FinalPath := FinalPath + ',' + IntToStr(StrToInt(PathOf_Mame[k1]) - 1);
                          end;
                        Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 32;
                        node.WriteAttributeString('PathOf',FinalPath);
                        FinalRomsFound := FinalRomsFound + 1;
                      end;
                  end
                else
                  begin
                    Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 32;
                    FinalRomsFound := FinalRomsFound + 1;
                  end;
              end;
            Conf.sGauge_MameData.Progress := (100 * i) div (TotalRoms -1);
            Conf.sGauge_MameData.Suffix := '% ('+IntToStr(i +1)+'/'+IntToStr(TotalRoms)+')';
          end;
      Conf.nxtgrd_mame.EndUpdate;
      FXml_MameDatabase.Root.WriteAttributeInteger('FinalRomsFound',FinalRomsFound);      
      FXml_MameDatabase.SaveToFile(MameDatabaseFile);
      AddNewDirTo_MameDirs(path,False);
      Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(FinalRomsFound);
      Conf.sLabel109.Caption := 'Overall Roms Status';
      SetupAndStartData(False);
    end;
end;

function SearchIfRomPathExists(path: string): Boolean;
var
  i: Integer;
  node: TXmlNode;
begin
  with FXml_MameConfing.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := FXml_MameConfing.Root.Nodes[i];
        if node.Name = 'rowPath' then
          if node.ReadAttributeString('RomPath') = path then
            Result := True;              
      end;
end;

procedure Assigned_MameDatabase;
begin
  if not Assigned(FXml_MameDatabase) then
    begin
      FXml_MameDatabase := TNativeXml.CreateName('MameInfo');
      FXml_MameDatabase.XmlFormat := xfReadable;
    end;
end;

function GetMameVer(FullPath,ExeName,ExtractTo: String): string;
var
  text: TextFile;
  textLine,t1: String;
  i: Integer;
begin
  RunCaptured(ExtractFileDrive(FullPath),ExeName,' -help',ExtractTo+'ver.txt');
  AssignFile(text,ExtractTo + 'ver.txt');
  Reset(text);
  while not Eof(text) do
    begin
      Readln(text,textLine);
      i := Pos('v',textLine);
      t1 := Trim(Copy(textLine,i+1,Length(textLine) - i));
      i := Pos(' ',t1);
      Result := Trim(Copy(t1,0,i));
      Break;
    end;
  CloseFile(text);
  SysUtils.DeleteFile(ExtractTo + 'ver.txt');
end;

procedure ShowMameGameInfoPanel(gameName,romName: String);
var
  node: TXmlNode;
  i,iPos: Integer;
  t1,t2,text: String;  
  procedure Clear_GameInfoPanel;  
  begin
    if fSearch.Showing = true then
      begin
        fSearch.FormStyle := fsNormal;  
        fSearch.SendToBack;
      end;
    Conf.sLabel140.Caption := '';
    Conf.sLabel141.Caption := '';
    Conf.sLabel142.Caption := '';
    Conf.sLabel143.Caption := '';
    Conf.sLabel144.Caption := '';
    Conf.sLabel145.Caption := '';
    Conf.sLabel146.Caption := '';
    Conf.sLabel147.Caption := '';
    Conf.sLabel157.Caption := '';
    Conf.sLabel158.Caption := '';
  end;
begin
  Clear_GameInfoPanel;  
  Conf.nxtgrd_mame.SendToBack;
  Conf.sBitBtn118.Click;
  Conf.sLabel139.Caption := gameName;
  with FXml_CArcade.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := FXml_CArcade.Root.Nodes[i];
        if node.Name = 'row' then
          if (node.ReadAttributeString('RomName') + '.zip')  = romName then
            begin
              Conf.sLabel140.Caption := node.ReadAttributeString('Manufactor');
              Conf.sLabel141.Caption := node.ReadAttributeString('Year');
              Conf.sLabel142.Caption := node.ReadAttributeString('Players');
              Conf.sLabel143.Caption := node.ReadAttributeString('Levels');
              if (node.ReadAttributeString('Sim') <> '') and (node.ReadAttributeString('Sim') <> ' ') then
                Conf.sLabel144.Caption := 'OK'
              else
                Conf.sLabel144.Caption := 'Nope';
              if (node.ReadAttributeString('Alt') <> '') and (node.ReadAttributeString('Alt') <> ' ') then
                Conf.sLabel145.Caption := 'OK'
              else
                Conf.sLabel145.Caption := 'Nope';
              text:= node.ReadAttributeString('Genre');
              iPos := Pos('/',text);
              t1 := Trim(Copy(text,0,iPos - 1));
              t2 := Trim(Copy(text,iPos + 1,Length(text) - iPos));
              Conf.sLabel146.Caption := t1;
              Conf.sLabel147.Caption := t2;
              Conf.sLabel157.Caption := node.ReadAttributeString('Mame_Added');
              Conf.sLabel158.Caption := Trim(Copy(romName,0,length(romName) - 4));
              Break;
            end;
      end; 
end;

procedure ShowMame_TabGameInfoClick;
begin
  if not Conf.sBitBtn118.Down then
    begin
      Conf.mTabGameInfo.BringToFront;
      Conf.sBitBtn118.Down := true;
      Conf.sBitBtn119.Down := false;
      Conf.sBitBtn120.Down := false;
    end;
end;

procedure ShowMame_TabMediaClick;
var
  imgPath,nimgPath,LCaption: string;
  comp: TComponent;
  i,Ximg,YImg: Integer;
  CountPics: Boolean;  
  procedure CreateImageStatus(PImgPath,LabelName: String; X,Y,imgCount: Integer; BCounter: Boolean);
  var
    CImg: Integer;
  begin
    nimgPath := 'media\emulators\arcade\mame\images\not_photos.png';
    if FileExists(PimgPath) then
      pImage_Comp(Conf.mTabMedia,PimgPath,X,Y,80,80,imgCount,'_mTabMedia',True,True)
    else
      Image_Comp(Conf.mTabMedia,nimgPath,X,Y,80,80,imgCount,'_mTabMedia',True,True);    
    Label_Comp(Conf.mTabMedia,LabelName,X,Y - 16,imgCount,'_mTabMedia',True,True,True);  
    if BCounter = true then
      begin
        CImg := CountFilesOrFolders(Trim(Copy(PImgPath,0,length(PImgPath) - 8)),'files');
        if CImg <> 0 then
          Label_Comp(Conf.mTabMedia,'(' + IntToStr(CImg) + ')',X + 32,Y + 80 + 4,imgCount + 20,'_mTabMedia',True,True,True);
      end;
  end;
begin
  if not Conf.sBitBtn119.Down then
    begin
      Conf.mTabMedia.Caption := 'Please Wait...';
      Screen.Cursor := Busy;
      Application.ProcessMessages;
      Conf.mTabMedia.BringToFront;
      Conf.sBitBtn118.Down := false;
      Conf.sBitBtn119.Down := true;
      Conf.sBitBtn120.Down := false;
      comp := FindComponentEx('Conf.Pic_mTabMedia1');
      if not Assigned(TImage(comp)) then
        begin
          for i := 0 to 9 do 
            begin
              Case i of 
                0 : begin
                      imgPath := 'c:\00000000000000.png';
                      LCaption := 'Videos';                                            
                    end;
                1 : begin
                      imgPath := Conf.sEdit2.Text + '\' + Conf.sLabel158.Caption + '\0000.png';
                      LCaption := 'Snapshots';                      
                    end;
                2 : begin
                      imgPath := Conf.sEdit3.Text + '\' + Conf.sLabel158.Caption + '.png';
                      LCaption := 'Cabinets';
                    end;
                3 : begin
                      imgPath := Conf.sEdit8.Text + '\' + Conf.sLabel158.Caption + '.png';
                      LCaption := 'Flyers';                
                    end;
                4 : begin
                      imgPath := Conf.sEdit10.Text + '\' + Conf.sLabel158.Caption + '.png';
                      LCaption := 'Marquees';
                    end;
                5 : begin
                      imgPath := Conf.sEdit6.Text + '\' + Conf.sLabel158.Caption + '.png';
                      LCaption := 'Control Panels';
                    end;
                6 : begin
                      imgPath := Conf.sEdit9.Text + '\' + Conf.sLabel158.Caption + '.png';
                      LCaption := 'PCBs';
                    end;
                7 : begin
                      imgPath := Conf.sEdit11.Text + '\' + Conf.sLabel158.Caption + '.png';
                      LCaption := 'Titles';
                    end;
                8 : begin
                      imgPath := Conf.sEdit58.Text + '\' + Conf.sLabel158.Caption + '.png';
                      LCaption := 'Scores';
                    end;
                9 : begin
                      imgPath := Conf.sEdit59.Text + '\' + Conf.sLabel158.Caption + '.png';
                      LCaption := 'Bosses';
                    end;                              
              end;
              if (i = 0) or (i = 5) then 
                Ximg := 15 
              else
                Ximg := Ximg + 105;
              if i < 5 then 
                Yimg := 40 
              else
                Yimg := 180;
              if i = 1 then 
                CountPics := true
              else 
                CountPics := False;
              CreateImageStatus(imgPath,LCaption,XImg,YImg,i,CountPics);
            end;
        end;
      Conf.mTabMedia.Caption := '';
      Screen.Cursor := Arrow;
    end;
end;

procedure FreeImagesAndLabelsFromMediaTab;
var
  comp: TComponent;
  i: Integer;
begin
  for i := 0 to 9 do 
    begin
      comp := FindComponentEx('Conf.Pic_mTabMedia' + IntToStr(i));
      TImage(Comp).Free;
      comp := FindComponentEx('Conf.Label_mTabMedia' + IntToStr(i));
      TsLabel(comp).Free;
    end;
  comp := FindComponentEx('Conf.Label_mTabMedia' + IntToStr(21));
  TsLabel(comp).Free;
end;

procedure ShowMame_TabRomClick;
begin
  if not Conf.sBitBtn120.Down then
    begin
      Conf.mTabRom.BringToFront;
      Conf.sBitBtn118.Down := false;
      Conf.sBitBtn119.Down := false;
      Conf.sBitBtn120.Down := true;          
    end;
end;

procedure BackToDatabaseSheet;
begin
  FreeImagesAndLabelsFromMediaTab;
  if fSearch.Showing = true then  
    fSearch.FormStyle := fsStayOnTop;
  Conf.Mame_GameInfoPanel.SendToBack;
end;

////////////////////////////////////////////////////////////

procedure Show_mame_databasepanel;
begin
  if (Cmenustate = 'em_arcade_mame_graphics') then
    em_mame_graphics_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_sound') then
    em_mame_sound_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_others') then
    em_mame_others_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_builds') then
    em_mame_hlsl_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_paths') then
    em_mame_dirs_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn11.Caption,False,True);
  Cmenustate := 'em_arcade_mame_database';
  em_mame_database_ShowDynamicComps;
  ShowButtonDown(11,'Em_ARCADE_MAME_DATABASE');
  BackToDatabaseSheet;
  ShowHidePanel(CurrentPanel,'Pem_mame_database');  
end;

procedure em_mame_database_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_mame_database,'media\confeditor\images\mame\mame.png',
              -10,587,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pem_mame_database,'media\confeditor\images\mame\mame_image.png',
              558,381,169,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_mame_database,'media\confeditor\images\mame\database.png',
              577,2,151,71,i,'',True,False);
      end;
    end;
end;

procedure em_mame_database_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
  if fSearch.Showing = true then
    fSearch.Close;
end;

{ THtmlColClick }

procedure THtmlColClick.DoHtmlColClick(Sender: TObject; Href: WideString);
begin
//  MenuButton1;
end;

initialization
  htmlClass := THtmlColClick.Create;
end.
