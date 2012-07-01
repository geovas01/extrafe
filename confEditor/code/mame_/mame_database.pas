unit mame_database;

interface

uses
  Windows, SysUtils,Controls,StdCtrls,Buttons,Variants, Classes, Graphics, Forms,ComCtrls, ExtCtrls,
  comobj,Dialogs,
  NxColumns,NxColumnClasses,NxCustomGridControl,
  OmniXML,OmniXMLUtils,mame_xmlext,
  FunctionX;

type  
  THtmlColClick = class(TObject)
  public
    procedure DoHtmlColClick(Sender: TObject; Href: WideString);
  end;

  procedure SetMame_DatabaseFromMameIni;

  procedure CreateNewMameDataBase;
  procedure GetMameXML;
  procedure SetupNewDatabase;
  procedure CreateAllDirs;

  procedure AddNewRom_Dir;
  procedure EraseMameDir(path: string);
  function SearchIfRomPathExists(path: string): Boolean;

  procedure UrlMame(SetMame: String);
  procedure SetCursorToBusy(AreBusy:Boolean);

  procedure SetTheGridForSetup;
  procedure BestFitForMameGrid;
  procedure AddNewDirTo_MameDirs;

  procedure SetupAndStartData(Active: Boolean);

  procedure ShowDatabaseStatsFor(Dir: string);
  procedure ReloadDatabase(XML_MameInUsepath, XML_MamePaths: string);
  procedure MameDatabase_Clear;

// Menu actions
  procedure Show_mame_databasepanel;
  procedure em_mame_database_ShowDynamicComps;
  procedure em_mame_database_FreeDynamicComps;  

var
  MameXmlUseDoc: IXMLDocument;
  MameXmlConfigDoc: IXMLDocument;
  MameXMLUse: TMameXML;
  MameXMLConfig: TMameXMLPath;
  Row: TRow;
  RowPath: TRowPath;
  RowDir: TRowDir;
  nodegame: IXMLNode;
  gameList : IXMLNodeList;
  PathXmlMame,PathXmlMamePath: string;
  AddNew_RomDir: Boolean;

implementation


uses
  main,mainconf,menu,onflycomponents,
  form_splash,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_builds;

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
      GetMameXML;
      SetupNewDatabase;
      StartEmuMame;
      FromDatabase := False;
      SetupAndStartData(False);
      Screen.Cursor := crDefault;
      Conf.sLabel109.Caption := 'Overall Status';
      Conf.sGauge_MameData.Progress := 100;
    end;
end;

procedure GetMameXML;
begin
  Conf.nxtgrd_mame.Columns.Clear;
  Conf.nxtgrd_mame.ClearRows;
  Conf.sGauge_MameData.Progress := 0;
  PathXmlMame := Program_Path+'media\emulators\arcade\mame\database\'+Mame_Exe;
  Delete(PathXmlMame,Length(PathXmlMame)-3,4);
  Conf.sLabel109.Caption := 'Generating Mame XML...';
  Application.ProcessMessages;
  RunCaptured(ExtractFileDrive(FullPathMame_Exe),Mame_Exe,' -lx',PathXmlMame+'.xml');
end;

procedure SetupNewDatabase;
var
  MameBuildName,TotalRomsFound: String;
  ColInf: array [0..6] of string;
  l: Integer;
begin
  Conf.sLabel109.Caption := 'Parsing Mame XML File (Please Wait)...';
  Application.ProcessMessages;
  RomFound := False;
  FinalRomsFound := 0;
  Screen.Cursor := AniBusy;
  try
    MameXmlUseDoc := CreateXMLDoc;
    MameXMLUse := TMameXML.Create;
    MameXMLConfig := TMameXMLPath.Create;
    FGa := TGauseStream.Create;
    try
      MameXmlUseDoc.PreserveWhiteSpace := True;
      FGa.LoadFromFile(PathXmlMame+'.xml');
      FGa.Gause := Conf.sGauge_MameData;
      MameXmlUseDoc.LoadFromStream(FGa);
      Conf.sLabel109.Caption := 'Searching for Roms (Please Wait...)';
      SetTheGridForSetup;
      Application.ProcessMessages;
    finally
      nodegame := MameXmlUseDoc.SelectSingleNode('mame');
      MameBuildName := GetNodeAttrStr(nodegame,'build');
      gameList := MameXmlUseDoc.SelectNodes('/mame/game');
      Conf.nxtgrd_mame.AddRow(gameList.Length);
      conf.nxtgrd_mame.BeginUpdate;
      for iNode := 0 to gameList.Length - 1 do
        begin
          for l := 0 to 6 do
            ColInf[l] := '';
          nodegame := gameList.Item[iNode];
          ColInf[0] := GetNodeTextStr(nodegame,'description');
          ColInf[1] := GetNodeAttrStr(nodegame,'name');
          if GetNodeTextStr(nodegame,'manufacturer','') <> '' then
            ColInf[2] := GetNodeTextStr(nodegame,'manufacturer')
          else
            ColInf[2] := '';
          if GetNodeTextStr(nodegame,'year','') <> '' then
            ColInf[3] := GetNodeTextStr(nodegame,'year')
          else
            ColInf[3] := '';
          if GetNodeAttrStr(nodegame,'cloneof','') <> '' then
            ColInf[4] := GetNodeAttrStr(nodegame,'cloneof')
          else
            ColInf[4] := '';
          if FindFirst('roms\*.*' , faAnyFile, Rec) = 0 then
            begin
                repeat
                  if ((Rec.Attr and faDirectory) <> faDirectory) then
                  begin
                    if Rec.Name = ColInf[1]+'.zip' then
                    begin
                      ColInf[5] := '1';
                      ColInf[6] := '32';
                      RomFound := True;
                      FinalRomsFound := FinalRomsFound + 1;
                      Break;
                    end;
                  end;
                until FindNext(Rec) <> 0;
            end;
          if romFound = False then
            begin
              ColInf[5] := '';
              ColInf[6] := '33';
            end;
          RomFound := False;
          Row := MameXMLUse.Rows.Add;
          Row.Id := iNode;
          row.GameName := ColInf[0];
          row.RomName := ColInf[1];
          row.Manufactor := ColInf[2];
          row.Year := ColInf[3];
          row.CloneOf := ColInf[4];
          row.PathOf := ColInf[5];
          Conf.nxtgrd_mame.Cell[0,iNode].AsInteger := iNode + 1;
          Conf.nxtgrd_mame.Cell[1,iNode].AsString := ColInf[0];
          Conf.nxtgrd_mame.Cell[2,iNode].AsString := ColInf[1];
          Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := StrToInt(ColInf[6]);
          Conf.nxtgrd_mame.Cell[4,iNode].AsString := ColInf[2];
          Conf.nxtgrd_mame.Cell[5,iNode].AsString := ColInf[3];
          Conf.nxtgrd_mame.Cell[6,iNode].AsString := ColInf[4];
          Conf.nxtgrd_mame.Cell[7,iNode].AsString := ColInf[5];
          Conf.sGauge_MameData.Progress := (100 * iNode) div (gameList.Length-1);
          Conf.sGauge_MameData.Suffix := '% ('+IntToStr(iNode+1)+'/'+IntToStr(gameList.Length)+')';
          Application.ProcessMessages;
        end;
      TotalRomsFound := IntToStr(iNode);
      MameXMLUse.Ver := MameBuildName;
      MameXMLUse.MameExeName := Mame_Exe;
      MameXMLUse.RomsEmulated := iNode;
      MameXMLUse.FinalRomsFound := FinalRomsFound;
      if (Mame_Exe = 'mamep.exe') or (Mame_Exe = 'mamepuiXT_x86.exe') or (Mame_Exe = 'mamepuiXT_x64.exe') then
        begin
          MameXMLUse.IpsChecked := 'False';
          MameXMLUse.HiScoreChecked := 'False';
        end;
      if (FileExists(MameConfigFile)) and (MameConfigFile <> '') then
        begin
          gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowpath');
          for iNode := 0 to gameList.Length -1 do
            begin
              nodegame := gameList.Item[iNode];
              RowPath := MameXMLConfig.RowsPath.AddPath;
              RowPath.MameName := GetNodeAttrStr(nodegame,'MameName');
              RowPath.PathId := GetNodeAttrInt(nodegame,'PathId');
              RowPath.RomPath := GetNodeAttrStr(nodegame,'RomPath');
              RowPath.RomsFound := GetNodeAttrInt(nodegame,'RomsFound');
            end;
          gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowdir');
          for iNode := 0 to gameList.Length -1 do
            begin
              nodegame := gameList.Item[iNode];
              RowDir := MameXMLConfig.RowsDir.AddRowDir;
              RowDir.MameName := GetNodeAttrStr(nodegame,'MameName');
              Rowdir.MamePath := GetNodeAttrStr(nodegame,'MamePath');
              RowDir.Selected := GetNodeAttrInt(nodegame,'Selected');
              RowDir.Cabinets := GetNodeAttrStr(nodegame,'Cabinets');
              RowDir.Flyers := GetNodeAttrStr(nodegame,'Flyers');
              RowDir.Marquees := GetNodeAttrStr(nodegame,'Marquess');
              RowDir.Control_Panels := GetNodeAttrStr(nodegame,'Control_Panels');
              RowDir.PCBs := GetNodeAttrStr(nodegame,'Pcbs');
              RowDir.Artwork_Preview := GetNodeAttrStr(nodegame,'Artwork_Preview');
              RowDir.Titles := GetNodeAttrStr(nodegame,'Titles');
              RowDir.Select := GetNodeAttrStr(nodegame,'Select');
              RowDir.Scores := GetNodeAttrStr(nodegame,'Scores');
              RowDir.Bosses := GetNodeAttrStr(nodegame,'Bosses');
            end;
        end;
      GetSelectedMameNum(Mame_Exe);
      MameXMLConfig.Condition := 'Active';
      MameXMLConfig.SelectedMame := Mame_Exe;
      MameXMLConfig.FullPathOfSelectedMame := FullPathMame_Exe;
      MameXMLConfig.Selected := SelectedMame;
      RowDir := MameXMLConfig.RowsDir.AddRowDir;
      RowDir.MameName := Mame_Exe;
      RowDir.MamePath := FullPathMame_Exe;
      RowDir.Selected := SelectedMame;
      CreateAllDirs;
      RowPath := MameXMLConfig.RowsPath.AddPath;
      RowPath.MameName := Mame_Exe;
      RowPath.PathId := 1;
      RowPath.RomPath := FullPathMame_Exe+'roms';
      RowPath.RomsFound := FinalRomsFound;
      BestFitForMameGrid;
      Conf.nxtgrd_mame.EndUpdate;
      Conf.sLabel104.Caption := 'Mame Version (Build) : '+MameBuildName;
      Conf.sLabel106.Caption := 'Overall Emulated : '+TotalRomsFound;
      Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(FinalRomsFound);
      UrlMame(Mame_Exe);
      Application.ProcessMessages;
      FGa.Free;
    end;
  finally
    InitGlobal_MameMemo_ForMameIni;
    if (FileExists(MameConfigFile)) and (MameConfigFile <> '') then
      begin
        Conf.sComboBox72.Clear;
        Conf.sComboBox72.Items.Add('Overall Roms');
        Conf.sComboBox72.Items.Add('Missing Roms');
        Conf.sComboBox72.Items.Add(FullPathMame_Exe+'roms');
        Conf.sComboBox72.ItemIndex := 0;
      end
    else
      Conf.sComboBox72.Items.Add(FullPathMame_Exe+'roms');
    Conf.sCheckBox127.Enabled := True;
    AddNewDirTo_MameDirs;
    Conf.sGauge_MameData.Suffix := '%';
    Conf.sLabel109.Caption := 'Saving Database...';
    Application.ProcessMessages;
    MameXMLUse.SaveToFile(PathXmlMame+'_efuse.xml',ofIndent);
    MameXMLConfig.SaveToFile(PathXmlMamePath+'config.xml',ofIndent);
  end;
  ReloadDatabase(PathXmlMame,PathXmlMamePath);
end;

procedure CreateAllDirs;
begin
  if not DirectoryExists(FullPathMame_Exe+'cabinets') then
    CreateDir(FullPathMame_Exe+'cabinets');
  RowDir.Cabinets := FullPathMame_Exe+'cabinets';
  if not DirectoryExists(FullPathMame_Exe+'flyers') then
    CreateDir(FullPathMame_Exe+'flyers');
  RowDir.Flyers := FullPathMame_Exe+'flyers';
  if not DirectoryExists(FullPathMame_Exe+'marquees') then
    CreateDir(FullPathMame_Exe+'marquees');
  RowDir.Marquees := FullPathMame_Exe+'marquees';
  if not DirectoryExists(FullPathMame_Exe+'cpanel') then
    CreateDir(FullPathMame_Exe+'control panels');
  RowDir.Control_Panels := FullPathMame_Exe+'cpanel';
  if not DirectoryExists(FullPathMame_Exe+'pcb') then
    CreateDir(FullPathMame_Exe+'pcb');
  RowDir.PCBs := FullPathMame_Exe+'pcbs';
  if not DirectoryExists(FullPathMame_Exe+'artwork preview') then
    CreateDir(FullPathMame_Exe+'artwork preview');
  RowDir.Artwork_Preview := FullPathMame_Exe+'artwork preview';
  if not DirectoryExists(FullPathMame_Exe+'titles') then
    CreateDir(FullPathMame_Exe+'titles');
  RowDir.Titles := FullPathMame_Exe+'titles';
  if not DirectoryExists(FullPathMame_Exe+'select') then
    CreateDir(FullPathMame_Exe+'select');
  RowDir.Select := FullPathMame_Exe+'select';
  if not DirectoryExists(FullPathMame_Exe+'scores') then
    CreateDir(FullPathMame_Exe+'scores');
  RowDir.Scores := FullPathMame_Exe+'scores';
  if not DirectoryExists(FullPathMame_Exe+'bosses') then
    CreateDir(FullPathMame_Exe+'bosses');
  RowDir.Bosses := FullPathMame_Exe+'bosses';
end;

procedure SetTheGridForSetup;
begin
  Conf.nxtgrd_mame.Columns.Add(TNxIncrementColumn,'ID');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Game Name');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Rom Name');
  Conf.nxtgrd_mame.Columns.Add(TNxImageColumn,'Roms');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Manufactor');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Year');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Clone Of');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'PathNum');
  Conf.nxtgrd_mame.Columns[0].Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[0].Header.Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[1].Width := 200;
  Conf.nxtgrd_mame.Columns[3].Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[3].Header.Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[7].Visible := False;
  TNxImageColumn(Conf.nxtgrd_mame.Columns[3]).Images := Conf.InBitBtn_Imagelist;
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

procedure SetCursorToBusy(AreBusy:Boolean);
var
  ThemeNum: Byte;
begin
//  ThemeNum := ConfIni.ReadInteger('Themes','Theme',ThemeNum);
  SetCursors(ThemeNum - 1);
  SetAllCursor(ThemeNum - 1);
  if AreBusy = true then
    begin
      Conf.Pem_mame_database.Cursor := Busy;
      Conf.nxtgrd_mame.Cursor := Busy;
      Conf.sComboBox72.Cursor := Busy;
      Conf.sGauge_MameData.Cursor := Busy;
    end
  else
    begin
      Conf.Pem_mame_database.Cursor := Arrow;
      Conf.nxtgrd_mame.Cursor := Arrow;
      Conf.sComboBox72.Cursor := Arrow;
      Conf.sGauge_MameData.Cursor := Arrow;
    end;
end;

procedure SetMame_DatabaseFromMameIni;
var
  MameBuildVer,MameName: string;
  TotalRoms,TotalEmulated: Integer;
  isThereAnyRomDirSetuped: Boolean;
begin
  if FromDatabase = false then
    begin
      if FileExists(PathXmlMame+'_efuse.xml') then
        begin
          isThereAnyRomDirSetuped := False;
          SetTheGridForSetup;
          //Add To MameXMLPath
          nodegame := MameXmlConfigDoc.SelectSingleNode('MamePath');
          MameXMLConfig.Condition := GetNodeAttrStr(nodegame,'Condition');
          MameXMLConfig.SelectedMame := GetNodeAttrStr(nodegame,'SelectedMame');
          MameXMLConfig.FullPathOfSelectedMame := GetNodeAttrStr(nodegame,'FullPathOfSelectedMame');
          MameXMLConfig.Selected := GetNodeAttrInt(nodegame,'Selected');
          gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowpath');
          for iNode := 0 to gameList.Length -1 do
            begin
              nodegame := gameList.Item[INode];
              RowPath := MameXMLConfig.RowsPath.AddPath;
              RowPath.MameName := GetNodeAttrStr(nodegame,'MameName');
              RowPath.PathId := GetNodeAttrInt(nodegame,'PathId');
              RowPath.RomPath := GetNodeAttrStr(nodegame,'RomPath');
              RowPath.RomsFound := GetNodeAttrInt(nodegame,'RomsFound');
              if GetNodeAttrStr(nodegame,'MameName','') = Mame_Exe then
                isThereAnyRomDirSetuped := True;
            end;
          gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowdir');
          for iNode := 0 to gameList.Length -1 do
            begin
              nodegame := gameList.Item[iNode];
              RowDir := MameXMLConfig.RowsDir.AddRowDir;
              RowDir.MameName := GetNodeAttrStr(nodegame,'MameName');
              RowDir.MamePath := GetNodeAttrStr(nodegame,'MamePath');
              RowDir.Selected := GetNodeAttrInt(nodegame,'Selected');
              RowDir.Cabinets := GetNodeAttrStr(nodegame,'Cabinets');
              RowDir.Flyers := GetNodeAttrStr(nodegame,'Flyers');
              RowDir.Marquees := GetNodeAttrStr(nodegame,'Marquess');
              RowDir.Control_Panels := GetNodeAttrStr(nodegame,'Control_Panels');
              RowDir.PCBs := GetNodeAttrStr(nodegame,'Pcbs');
              RowDir.Artwork_Preview := GetNodeAttrStr(nodegame,'Artwork_Preview');
              RowDir.Titles := GetNodeAttrStr(nodegame,'Titles');
              RowDir.Select := GetNodeAttrStr(nodegame,'Select');
              RowDir.Scores := GetNodeAttrStr(nodegame,'Scores');
              RowDir.Bosses := GetNodeAttrStr(nodegame,'Bosses');
            end;
          if isThereAnyRomDirSetuped = true then
            begin
              if FromArrows_Mamedirs = False then
                  Splash_Screen.sLabel1.Caption := 'Setting Mame Database...'
              else
                Conf.sLabel112.Caption := 'Setting Mame Database...';
              nodegame := MameXmlUseDoc.SelectSingleNode('MameInfo');
              MameName := GetNodeAttrStr(nodegame,'MameExeName');
              MameBuildVer := GetNodeAttrStr(nodegame,'ver');
              TotalRoms := GetNodeAttrInt(nodegame,'FinalRomsFound');
              TotalEmulated := GetNodeAttrInt(nodegame,'RomsEmulated');
              gameList := MameXmlUseDoc.SelectNodes('/MameInfo/row');
              nodegame := gameList.Item[gameList.Length-1];
              Conf.nxtgrd_mame.AddRow(gameList.Length);
              conf.nxtgrd_mame.BeginUpdate;
              for iNode := 0 to gameList.Length - 1 do
                begin
                  nodegame := gameList.Item[iNode];
                  Conf.nxtgrd_mame.Cell[1,iNode].AsString := GetNodeAttrStr(nodegame,'GameName');
                  Conf.nxtgrd_mame.Cell[2,iNode].AsString := GetNodeAttrStr(nodegame,'RomName');
                  if GetNodeAttrStr(nodegame,'Manufactor','') <> '' then
                    Conf.nxtgrd_mame.Cell[4,iNode].AsString := GetNodeAttrStr(nodegame,'Manufactor');
                  if GetNodeAttrStr(nodegame,'Year','') <> '' then
                    Conf.nxtgrd_mame.Cell[5,iNode].AsString := GetNodeAttrStr(nodegame,'Year');
                  if GetNodeAttrStr(nodegame,'CloneOf','') <> '' then
                    Conf.nxtgrd_mame.Cell[6,iNode].AsString := GetNodeAttrStr(nodegame,'CloneOf');
                  if GetNodeAttrStr(nodegame,'PathOf','') <> '' then
                    Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 32
                  else
                    Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 33;
                  if FromArrows_Mamedirs = False then
                    Splash_Screen.sGauge_Splash.Progress := (100 * iNode) div (gameList.Length-1)
                  else
                    Conf.sGauge_MameChange.Progress := (100 * iNode) div (gameList.Length-1);
                  Application.ProcessMessages;
                end;
              BestFitForMameGrid;
              Conf.nxtgrd_mame.EndUpdate;
              //Add To MameXML
              MameXMLUse.Ver := MameBuildVer;
              MameXMLUse.MameExeName := MameName;
              MameXMLUse.RomsEmulated := TotalEmulated;
              MameXMLUse.FinalRomsFound := TotalRoms;
              //Show Info for Mame
              Conf.sLabel104.Caption := 'Mame Version (Build) : '+MameBuildVer;
              UrlMame(MameName);
              Conf.sLabel106.Caption := 'Overall Emulated : '+IntToStr(TotalEmulated);
              Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(TotalRoms);
              Conf.sComboBox72.ItemIndex := 0;
              Conf.sGauge_MameData.Progress := 100;
              Conf.sLabel109.Caption := 'Overall Status';
            end
          else
            begin
              Conf.nxtgrd_mame.ClearRows;
              Conf.nxtgrd_mame.Columns.Clear;
              Conf.nxtgrd_mame.Columns.Add(TNxHtmlColumn,'');
              Conf.nxtgrd_mame.Columns[0].Alignment := taCenter;
              Conf.nxtgrd_mame.Columns[0].Width := 539;
              Conf.nxtgrd_mame.AddRow();
              Conf.nxtgrd_mame.Columns[0].Options := [coEditing];
              Conf.nxtgrd_mame.Cell[0,Conf.nxtgrd_mame.LastAddedRow].AsString := '<b>Found</b> no setuped rom directory. <font color="red">Please</font> go <a href="mame_dir_panel">here</a> and add a rom directory';
              TNxHtmlColumn(Conf.nxtgrd_mame.Columns[0]).OnClick := htmlClass.DoHtmlColClick;
            end;
        end;
    end;
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
  MissingRoms,CurrentRow: Integer;
begin
  if (AddNew_RomDir = False) and (Mame_Exe <> '') then
    begin
      if Dir = 'Overall Roms' then
        begin
          SetupAndStartData(True);
          Conf.sLabel109.Caption := 'Loading Overall Information...';
          Application.ProcessMessages;
          Conf.nxtgrd_mame.ClearRows;
          gameList := MameXmlUseDoc.SelectNodes('/MameInfo/row');
          Conf.nxtgrd_mame.AddRow(gameList.Length);
          Conf.nxtgrd_mame.BeginUpdate;
          for iNode := 0 to gameList.Length -1 do
            begin
              nodegame := gameList.Item[iNode];
              Conf.nxtgrd_mame.Cell[1,iNode].AsString := GetNodeAttrStr(nodegame,'GameName');
              Conf.nxtgrd_mame.Cell[2,iNode].AsString := GetNodeAttrStr(nodegame,'RomName');
              if GetNodeAttrStr(nodegame,'Manufactor','') <> '' then
                Conf.nxtgrd_mame.Cell[4,iNode].AsString := GetNodeAttrStr(nodegame,'Manufactor');
              if GetNodeAttrStr(nodegame,'Year','') <> '' then
                Conf.nxtgrd_mame.Cell[5,iNode].AsString := GetNodeAttrStr(nodegame,'Year');
              if GetNodeAttrStr(nodegame,'CloneOf','') <> '' then
                Conf.nxtgrd_mame.Cell[6,iNode].AsString := GetNodeAttrStr(nodegame,'CloneOf');
              if GetNodeAttrStr(nodegame,'PathOf','') <> '' then
                Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 32
              else
                Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 33;
              Conf.sGauge_MameData.Progress := (100 * iNode) div (gameList.Length-1);
              Conf.sGauge_MameData.Suffix := '% ('+IntToStr(iNode +1 )+'/'+IntToStr(gameList.Length)+')';
            end;
          nodegame := MameXmlUseDoc.SelectSingleNode('MameInfo');
          Conf.sLabel107.Caption := 'Roms Found : '+GetNodeAttrStr(nodegame,'FinalRomsFound');
          Conf.sLabel109.Caption := 'Overall Roms Status';
          Conf.nxtgrd_mame.EndUpdate;
          SetupAndStartData(False);
        end
      else if Dir = 'Missing Roms' then
        begin
          SetupAndStartData(True);
          MissingRoms := 0;
          CurrentRow := -1;
          Conf.sLabel109.Caption := 'Found Missing Roms...';
          Application.ProcessMessages;
          Conf.nxtgrd_mame.ClearRows;
          nodegame := MameXmlUseDoc.SelectSingleNode('MameInfo');
          Conf.nxtgrd_mame.AddRow(GetNodeAttrInt(nodegame,'RomsEmulated') - GetNodeAttrInt(nodegame,'FinalRomsFound'));
          gameList := MameXmlUseDoc.SelectNodes('/MameInfo/row');
          Conf.nxtgrd_mame.BeginUpdate;
          for iNode := 0 to gameList.Length -1 do
            begin
              nodegame := gameList.Item[iNode];
              if GetNodeAttrStr(nodegame,'PathOf','') = '' then
                begin
                  CurrentRow := CurrentRow + 1;
                  MissingRoms := MissingRoms + 1;
                  Conf.nxtgrd_mame.Cell[1,CurrentRow].AsString := GetNodeAttrStr(nodegame,'GameName');
                  Conf.nxtgrd_mame.Cell[2,CurrentRow].AsString := GetNodeAttrStr(nodegame,'RomName');
                  Conf.nxtgrd_mame.Cell[3,CurrentRow].AsInteger := 33;
                  if GetNodeAttrStr(nodegame,'Manufactor','') <> '' then
                    Conf.nxtgrd_mame.Cell[4,CurrentRow].AsString := GetNodeAttrStr(nodegame,'Manufactor');
                  if GetNodeAttrStr(nodegame,'Year','') <> '' then
                    Conf.nxtgrd_mame.Cell[5,CurrentRow].AsString := GetNodeAttrStr(nodegame,'Year');
                  if GetNodeAttrStr(nodegame,'CloneOf','') <> '' then
                    Conf.nxtgrd_mame.Cell[6,CurrentRow].AsString := GetNodeAttrStr(nodegame,'CloneOf');
                end;
              Conf.sGauge_MameData.Progress := (100 * iNode) div (gameList.Length-1);
              Conf.sGauge_MameData.Suffix := '% ('+IntToStr(iNode +1 )+'/'+IntToStr(gameList.Length)+')';
            end;
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
          CurrentRow := -1;
          Conf.nxtgrd_mame.ClearRows;
          gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowpath');
          for iNode := 0 to gameList.Length -1 do
            begin
              nodegame := gameList.Item[iNode];
              if GetNodeAttrStr(nodegame,'MameName','') = ExtractFileName(Mame_Exe) then
                if GetNodeAttrStr(nodegame,'RomPath','') = Dir then
                  begin
                    NumOfDir := GetNodeAttrInt(nodegame,'PathId');
                    NumOfRoms := GetNodeAttrInt(nodegame,'RomsFound');
                  end;
            end;
          gameList := MameXmlUseDoc.SelectNodes('/MameInfo/row');
          XMLPaths := TStringList.Create;
          Conf.nxtgrd_mame.AddRow(NumOfRoms);
          Conf.nxtgrd_mame.BeginUpdate;
          for iNode := 0 to gameList.Length - 1 do
            begin
              XMLPaths.Clear;
              nodegame := gameList.Item[iNode];
              if GetNodeAttrStr(nodegame,'PathOf','') <> '' then
                begin
                  XMLPaths.Delimiter := ',';
                  XMLPaths.DelimitedText := GetNodeAttrStr(nodegame,'PathOf');
                  for k := 0 to XMLPaths.Count - 1 do
                    begin
                      if XMLPaths[k] = IntToStr(NumOfDir) then
                        begin
                          CurrentRow := CurrentRow +1;
                          Conf.nxtgrd_mame.Cell[3,CurrentRow].AsInteger := 32;
                          Conf.nxtgrd_mame.Cell[1,CurrentRow].AsString := GetNodeAttrStr(nodegame,'GameName');
                          Conf.nxtgrd_mame.Cell[1,CurrentRow].AsString := GetNodeAttrStr(nodegame,'GameName');
                          Conf.nxtgrd_mame.Cell[2,CurrentRow].AsString := GetNodeAttrStr(nodegame,'RomName');
                          if GetNodeAttrStr(nodegame,'Manufactor','') <> '' then
                            Conf.nxtgrd_mame.Cell[4,CurrentRow].AsString := GetNodeAttrStr(nodegame,'Manufactor');
                          if GetNodeAttrStr(nodegame,'Year','') <> '' then
                            Conf.nxtgrd_mame.Cell[5,CurrentRow].AsString := GetNodeAttrStr(nodegame,'Year');
                          if GetNodeAttrStr(nodegame,'CloneOf','') <> '' then
                            Conf.nxtgrd_mame.Cell[6,CurrentRow].AsString := GetNodeAttrStr(nodegame,'CloneOf');
                          Break;
                        end
                    end;
                end;
              Conf.sGauge_MameData.Progress := (100 * iNode) div (gameList.Length-1);
              Conf.sGauge_MameData.Suffix := '% ('+IntToStr(iNode +1)+'/'+IntToStr(gameList.Length)+')';
              Application.ProcessMessages;
            end;
          FreeAndNil(XMLPaths);
          Conf.nxtgrd_mame.EndUpdate;
          Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(NumOfRoms);
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

procedure AddNewRom_Dir;
var
  PathID,uniqueRomsFound: Integer;
  OldFinalRomsFound,k,CountF: Integer;
  GameRomName,OldText: String;
begin
  if SearchIfRomPathExists(NewRomDirectory) = True then
    begin
      ShowMessage('This row directory already setuped in database');
      Conf.sComboBox1.ItemIndex := 0;
    end
  else
    begin
      SetupAndStartData(True);
      Conf.nxtgrd_mame.ClearRows;
      RomFound := False;
      FinalRomsFound := 0;
      uniqueRomsFound := 0;
      Conf.sLabel109.Caption := 'Adding roms from new directory...';
      Application.ProcessMessages;
      nodegame :=  MameXmlUseDoc.SelectSingleNode('MameInfo');
      OldFinalRomsFound := StrToInt(GetNodeAttrStr(nodegame,'FinalRomsFound'));
      gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowpath');
      for iNode := 0 to gameList.Length - 1 do
      begin
        nodegame := gameList.Item[iNode];
        if GetNodeAttrStr(nodegame,'MameName','') = ExtractFileName(Mame_Exe) then
          PathID := StrToInt(GetNodeAttrStr(nodegame,'PathId'));
      end;
      gameList := MameXmlUseDoc.SelectNodes('/MameInfo/row');
      CountF := CountFilesOrFolders(NewRomDirectory,'files');
      Conf.nxtgrd_mame.AddRow(CountF);
      Conf.nxtgrd_mame.BeginUpdate;
      MameXMLUse.Rows.Clear;
      for iNode := 0 to gameList.Length - 1 do
        begin
          nodegame := gameList.Item[iNode];
          Row := MameXMLUse.Rows.Add;
          Row.Id := iNode;
          Row.GameName := GetNodeAttrStr(nodegame,'GameName');
          GameRomName := GetNodeAttrStr(nodegame,'RomName');
          Row.RomName := GameRomName;
          if GetNodeAttrStr(nodegame,'Manufactor','') <> '' then
            Row.Manufactor := GetNodeAttrStr(nodegame,'Manufactor')
          else
            Row.Manufactor := '';
          if GetNodeAttrStr(nodegame,'Year','') <> '' then
            Row.Year := GetNodeAttrStr(nodegame,'Year')
          else
            Row.Year := '';
          if GetNodeAttrStr(nodegame,'CloneOf','') <> '' then
            Row.CloneOf := GetNodeAttrStr(nodegame,'CloneOf')
          else
            Row.CloneOf := '';
          if FindFirst(NewRomDirectory+'\*.*' , faAnyFile, Rec) = 0 then
            begin
              repeat
                if ((Rec.Attr and faDirectory) <> faDirectory) then
                  begin
                    if Rec.Name = GameRomName+'.zip' then
                      begin
                        Conf.nxtgrd_mame.Cell[1,FinalRomsFound].AsString := GetNodeAttrStr(nodegame,'GameName');
                        Conf.nxtgrd_mame.Cell[2,FinalRomsFound].AsString := GameRomName;
                        Conf.nxtgrd_mame.Cell[4,FinalRomsFound].AsString := GetNodeAttrStr(nodegame,'Manufactor');
                        Conf.nxtgrd_mame.Cell[5,FinalRomsFound].AsString := GetNodeAttrStr(nodegame,'Year');
                        Conf.nxtgrd_mame.Cell[6,FinalRomsFound].AsString := GetNodeAttrStr(nodegame,'CloneOf');
                        Conf.nxtgrd_mame.Cell[3,FinalRomsFound].AsInteger := 32;
                        RomFound := True;
                        if GetNodeAttrStr(nodegame,'PathOf','') = '' then
                          begin
                            Row.PathOf := IntToStr(PathID + 1);
                            uniqueRomsFound := uniqueRomsFound + 1;
                          end
                        else
                          begin
                            OldText := GetNodeAttrStr(nodegame,'PathOf');
                            Row.PathOf := OldText + ','+IntToStr(PathID + 1);
                          end;
                        FinalRomsFound := FinalRomsFound + 1;
                        Break;
                      end;
                  end;
              until FindNext(Rec) <> 0;
            end;
          if RomFound = False then
            begin
              if GetNodeAttrStr(nodegame,'PathOf','') = '' then
                Row.PathOf := ''
              else
                Row.PathOf := GetNodeAttrStr(nodegame,'PathOf');
            end;
          RomFound := False;
          Conf.sGauge_MameData.Progress := (100 * iNode) div (gameList.Length-1);
          Conf.sGauge_MameData.Suffix := '% ('+IntToStr(iNode + 1)+'/'+IntToStr(gameList.Length)+')';
          Application.ProcessMessages;
        end;
      for k := conf.nxtgrd_mame.RowCount -1 downto FinalRomsFound do
        Conf.nxtgrd_mame.DeleteRow(k);
      Conf.nxtgrd_mame.EndUpdate;
      //Add path to XmlPaths
      RowPath := MameXMLConfig.RowsPath.AddPath;
      RowPath.MameName := ExtractFileName(Mame_Exe);
      RowPath.PathId := PathID + 1;
      RowPath.RomPath := NewRomDirectory;
      RowPath.RomsFound := FinalRomsFound;
      //Add finalroms to Mame xml in use...
      MameXMLUse.FinalRomsFound := OldFinalRomsFound + uniqueRomsFound;
      Conf.sLabel109.Caption := 'Saving Database...';
      Application.ProcessMessages;
      MameXMLUse.SaveToFile(PathXmlMame+'_efuse.xml',ofIndent);
      MameXMLConfig.SaveToFile(PathXmlMamePath+'config.xml',ofIndent);
      AddNew_RomDir := True;
      Conf.sComboBox72.Items.Add(NewRomDirectory);
      Conf.sGauge_MameData.Suffix := '%';
      AddNewDirTo_MameDirs;
      ReloadDatabase(PathXmlMame,PathXmlMamePath);
      Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(FinalRomsFound);
      Conf.sComboBox72.Text := '';
      Conf.sComboBox72.SelText := NewRomDirectory;
      Conf.sLabel109.Caption := 'Single Directory Status';
      Conf.sBitBtn102.Visible := True;
      SetupAndStartData(False);
      SetMame_DirsFromMameIni;
      FromDatabase := False;
    end;
end;

procedure BestFitForMameGrid;
begin
  Conf.nxtgrd_mame.BestFitColumn(0,bfboth);
  Conf.nxtgrd_mame.BestFitColumn(2,bfBoth);
  Conf.nxtgrd_mame.BestFitColumn(3,bfHeader);
  Conf.nxtgrd_mame.BestFitColumn(5,bfBoth);
  Conf.nxtgrd_mame.BestFitColumn(6,bfBoth);
end;

procedure AddNewDirTo_MameDirs;
var
  x,l,k: Integer;
  t1,value,totalRomPathString: string;
  Comp: TComponent;
begin
  totalRomPathString := '';
  Comp := FindComponentEx('Conf.MemoEmu1');
  for k := 0 to TMemo(Comp).Lines.Count - 1 do
    begin
      value := TMemo(Comp).Lines.Strings[k];
      x := Pos(' ',value);
      t1 := Trim(Copy(value,0,x));
      if t1 = 'rompath' then
        begin
          TMemo(Comp).Lines.Delete(k);
          for l := 3 to Conf.sComboBox72.Items.Count do
            totalRomPathString := totalRomPathString+Conf.sComboBox72.Items.Strings[l-1]+';';
          TMemo(Comp).Lines.Insert(k,'rompath          '+totalRomPathString);
          Break;
        end;
    end;
  FromDatabase := True;
  SaveMame_DirsAtExit;
end;

procedure ReloadDatabase(XML_MameInUsepath, XML_MamePaths: string);
begin
  try
    Conf.sLabel109.Caption := 'Reload Database...';
    Application.ProcessMessages;
    MameXmlUseDoc := CreateXMLDoc;
    MameXmlConfigDoc := CreateXMLDoc;
    FGa := TGauseStream.Create;
    MameXmlUseDoc.PreserveWhiteSpace := True;
    FGa.LoadFromFile(XML_MameInUsepath+'_efuse.xml');
    FGa.Gause := Conf.sGauge_MameData;
    MameXmlUseDoc.LoadFromStream(FGa);
    MameXmlConfigDoc.Load(XML_MamePaths+'config.xml');
  finally
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
      Conf.sBitBtn102.Visible := False;
    end
  else
    begin
      Conf.nxtgrd_mame.Height := 407;
      Conf.grp115.Visible := True;
      Conf.sComboBox72.Visible := True;
      DisableMenuButtons(True);
    end;
end;

procedure EraseMameDir(path: string);
var
  M_Exe,M_Path,M_ID,FinalPath: string;
  PathOf_Mame: TStringList;
  k1,k2: Integer;
  oldromfound: Boolean;
begin
  if MessageBox(0,'Do you really want to erase this directory from database?','Erase Directory',+mb_YesNo +mb_ICONWARNING) = 6 then
    begin
      SetupAndStartData(True);
      Conf.sLabel109.Caption := 'Delete Rom Directory from Database...';
      Application.ProcessMessages;
      gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowpath');
      for iNode := 0 to gameList.Length - 1 do
        begin
          nodegame := gameList.Item[iNode];
          if GetNodeAttrStr(nodegame,'RomPath') = path then
            begin
              M_Exe := GetNodeAttrStr(nodegame,'MameName');
              M_Path := GetNodeAttrStr(nodegame,'RomPath');
              M_ID := GetNodeAttrStr(nodegame,'PathId');
            end
        end;
      nodegame := MameXmlConfigDoc.SelectSingleNode('/MamePath');
      DeleteNode(nodegame, 'rowpath[@RomPath="'+path+'"]');
      MameXmlConfigDoc.Save(MameConfigFile,ofIndent);
      MameXMLConfig.Clear;
      k1 := 1;
      gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowpath');
      for iNode := 0 to gameList.Length - 1 do
        begin
          nodegame := gameList.Item[iNode];
          RowPath := MameXMLConfig.RowsPath.AddPath;
          if GetNodeAttrStr(nodegame,'MameName','') = M_Exe then
            begin
              RowPath.MameName := GetNodeAttrStr(nodegame,'MameName');
              if GetNodeAttrStr(nodegame,'PathId','') <> IntToStr(k1) then
                RowPath.PathId := GetNodeAttrInt(nodegame,'PathId')-1
              else
                RowPath.PathId := GetNodeAttrInt(nodegame,'PathId');
              RowPath.RomPath := GetNodeAttrStr(nodegame,'RomPath');
              RowPath.RomsFound := GetNodeAttrInt(nodegame,'RomsFound');
              k1 := k1 + 1;
            end
          else
            begin
              RowPath.MameName := GetNodeAttrStr(nodegame,'MameName');
              RowPath.PathId := GetNodeAttrInt(nodegame,'PathId');
              RowPath.RomPath := GetNodeAttrStr(nodegame,'RomPath');
              RowPath.RomsFound := GetNodeAttrInt(nodegame,'RomsFound');            
            end;
        end;
      gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowdir');
      for iNode := 0 to gameList.Length -1 do
        begin
          nodegame := gameList.Item[iNode];
          RowDir := MameXMLConfig.RowsDir.AddRowDir;
          RowDir.MameName := GetNodeAttrStr(nodegame,'MameName');
          Rowdir.MamePath := GetNodeAttrStr(nodegame,'MamePath');
          RowDir.Selected := GetNodeAttrInt(nodegame,'Selected');
          RowDir.Cabinets := GetNodeAttrStr(nodegame,'Cabinets');
          RowDir.Flyers := GetNodeAttrStr(nodegame,'Flyers');
          RowDir.Marquees := GetNodeAttrStr(nodegame,'Marquess');
          RowDir.Control_Panels := GetNodeAttrStr(nodegame,'Control_Panels');
          RowDir.PCBs := GetNodeAttrStr(nodegame,'Pcbs');
          RowDir.Artwork_Preview := GetNodeAttrStr(nodegame,'Artwork_Preview');
          RowDir.Titles := GetNodeAttrStr(nodegame,'Titles');
          RowDir.Select := GetNodeAttrStr(nodegame,'Select');
          RowDir.Scores := GetNodeAttrStr(nodegame,'Scores');
          RowDir.Bosses := GetNodeAttrStr(nodegame,'Bosses');
        end;
      MameXMLConfig.SaveToFile(MameConfigFile,ofIndent);
      Conf.nxtgrd_mame.ClearRows;
      FinalRomsFound := 0;
      gameList := MameXmlUseDoc.SelectNodes('/MameInfo/row');
      Conf.nxtgrd_mame.AddRow(gameList.Length);
      Conf.nxtgrd_mame.BeginUpdate;
      for iNode := 0 to gameList.Length - 1 do
        begin
          Row := MameXMLUse.Rows.Add;
          nodegame := gameList.Item[iNode];
          Conf.nxtgrd_mame.Cell[1,iNode].AsString := GetNodeAttrStr(nodegame,'GameName');
          Row.GameName := GetNodeAttrStr(nodegame,'GameName');
          Conf.nxtgrd_mame.Cell[2,iNode].AsString := GetNodeAttrStr(nodegame,'RomName');
          Row.RomName := GetNodeAttrStr(nodegame,'RomName');
          if GetNodeAttrStr(nodegame,'Manufactor','') <> '' then
            begin
              Conf.nxtgrd_mame.Cell[4,iNode].AsString := GetNodeAttrStr(nodegame,'Manufactor');
              Row.Manufactor := GetNodeAttrStr(nodegame,'Manufactor');
            end
          else
            Row.Manufactor := '';
          if GetNodeAttrStr(nodegame,'Year','') <> '' then
            begin
              Conf.nxtgrd_mame.Cell[5,iNode].AsString := GetNodeAttrStr(nodegame,'Year');
              Row.Year := GetNodeAttrStr(nodegame,'Year');
            end
          else
            Row.Year := '';
          if GetNodeAttrStr(nodegame,'CloneOf','') <> '' then
            begin
              Conf.nxtgrd_mame.Cell[6,iNode].AsString := GetNodeAttrStr(nodegame,'CloneOf');
              Row.CloneOf := GetNodeAttrStr(nodegame,'CloneOf');
            end
          else
            row.CloneOf := '';
          if GetNodeAttrStr(nodegame,'PathOf','') <> '' then
            begin
              oldromfound := False;
              PathOf_Mame := TStringList.Create;
              PathOf_Mame.Delimiter := ',';
              PathOf_Mame.DelimitedText := GetNodeAttrStr(nodegame,'PathOf');
              for k1 := 0 to PathOf_Mame.Count - 1 do
                if PathOf_Mame[k1] = M_ID then
                  oldromfound:= True;
              if PathOf_Mame.Count - 1 = 0 then
                if oldromfound = True then
                  FinalPath := ''
                else
                  FinalPath := IntToStr(StrToInt(GetNodeAttrStr(nodegame,'PathOf'))-1);
              if PathOf_Mame.Count - 1 > 0 then
                begin
                  for k1 := 0 to PathOf_Mame.Count -1 do
                    if PathOf_Mame[k1] < M_ID then
                      if k1 = 0 then
                        FinalPath := PathOf_Mame[k1]
                      else
                        FinalPath := FinalPath + ',' + PathOf_Mame[k1]
                    else if PathOf_Mame[k1] > M_ID then
                      if k1 = 0 then
                        FinalPath := IntToStr(StrToInt(PathOf_Mame[k1]) - 1)
                      else
                        FinalPath := FinalPath + ',' + IntToStr(StrToInt(PathOf_Mame[k1]) - 1);
                end;
              if oldromfound = False then
                begin
                  Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 32;
                  Row.PathOf := FinalPath;
                  FinalRomsFound := FinalRomsFound + 1;
                end
              else if (FinalPath = '') and (oldromfound = True) then
                begin
                  Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 33;
                  Row.PathOf := '';
                end
              else if (FinalPath <> '') and (oldromfound = True) then
                begin
                  Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 32;
                  Row.PathOf := FinalPath;
                  FinalRomsFound := FinalRomsFound + 1;
                end;
            end
          else
            begin
              Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 33;
              Row.PathOf := '';
            end;
          Conf.sGauge_MameData.Progress := (100 * iNode) div (gameList.Length-1);
          Conf.sGauge_MameData.Suffix := '% ('+IntToStr(iNode +1)+'/'+IntToStr(gameList.Length)+')';
          Application.ProcessMessages;
        end;
      Conf.nxtgrd_mame.EndUpdate;
      nodegame := MameXmlUseDoc.SelectSingleNode('MameInfo');
      MameXMLUse.FinalRomsFound := FinalRomsFound; 
      k2 := Conf.sComboBox72.Items.IndexOf(path);
      MameXMLUse.SaveToFile(MameDatabaseFile,ofIndent);
      Conf.sComboBox72.Items.Delete(k2);
      Conf.sComboBox72.ItemIndex := 0;
      AddNewDirTo_MameDirs;
      Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(FinalRomsFound);
      Conf.sLabel109.Caption := 'Overall Roms Status';
      SetupAndStartData(False);
      SetMame_DirsFromMameIni;
    end;
end;

function SearchIfRomPathExists(path: string): Boolean;
begin
  Result := False;
  gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowpath');
  for iNode := 0 to gameList.Length - 1 do
    begin
      nodegame := gameList.Item[iNode];
      if GetNodeAttrStr(nodegame,'RomPath') = path then
        Result := True;
    end;
end;

procedure Show_mame_databasepanel;
begin
  if (Cmenustate = 'em_arcade_mame_graphics') then
    em_mame_graphics_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_sound') then
    em_mame_sound_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_others') then
    em_mame_others_ShowDynamicComps
  else if (Cmenustate = 'em_arcade_mame_builds') then
    em_mame_builds_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_paths') then
    em_mame_dirs_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn11.Caption,False,True);
  Cmenustate := 'em_arcade_mame_database';
  em_mame_database_ShowDynamicComps;
  ShowButtonDown(11,'Em_ARCADE_MAME_DATABASE');
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
              -10,587,155,85,i,True);
        2 : Image_Comp(Conf.Pem_mame_database,'media\confeditor\images\mame\mame_image.png',
              558,381,169,280,i,True);
        3 : Image_Comp(Conf.Pem_mame_database,'media\confeditor\images\mame\database.png',
              577,2,151,71,i,True);
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
end;

{ THtmlColClick }

procedure THtmlColClick.DoHtmlColClick(Sender: TObject; Href: WideString);
begin
  MenuButton1;
end;

initialization
  htmlClass := THtmlColClick.Create;
end.
