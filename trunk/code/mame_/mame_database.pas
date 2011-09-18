unit mame_database;

interface

uses
  Windows, SysUtils,Controls,StdCtrls, Buttons,
  Variants, Classes, Graphics, Forms,ComCtrls, ExtCtrls,
  comobj, FunctionX,NxColumnClasses,NxCustomGridControl,
  OmniXML,OmniXMLUtils,mame_xmlext;

  procedure SetMame_DatabaseFromMameIni;

  procedure CreateNewMameDataBase;
  procedure GetMameXML;
  procedure SetupNewDatabase;

  procedure AddNewRom_Dir;

  procedure FindXMLPaths;
  procedure UrlMame(SetMame: String);
  procedure SetCursorToBusy(AreBusy:Boolean);

  procedure SetTheGridForSetup;
  procedure BestFitForMameGrid;
  procedure AddNewDirTo_MameDirs;

  procedure SetupAndStartData(Active: Boolean);

  procedure ShowDatabaseStatsFor(Dir: string);
  procedure ReloadDatabase(XML_MameInUsepath, XML_MamePaths: string);
  procedure MameDatabase_Clear;

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

implementation


uses
  main,mainconf,mame_dirs,menu,form_splash;

var
  iNode,FinalRomsFound,k: Integer;
  rec : TSearchRec;
  FGa: TGauseStream;
  RomFound: Boolean;

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
      Conf.sLabel108.Caption := 'Directory : All';
      Conf.sLabel109.Caption := 'Overall Status';
      Conf.sGauge_MameData.Progress := 100;
    end;
end;

procedure GetMameXML;
begin
  Conf.nxtgrd_mame.Columns.Clear;
  Conf.nxtgrd_mame.ClearRows;
  Conf.sGauge_MameData.Progress := 0;
  Conf.sLabel109.Caption := 'Generating Mame XML...';
  Application.ProcessMessages;
  FindXMLPaths;
  RunCaptured(ExtractFileDrive(FullPathMame_Exe),Mame_Exe,' -lx',PathXmlMame+'.xml');
end;

procedure SetupNewDatabase;
var
  MameBuildName: String;
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
      MameXMLUse.Ver := MameBuildName;
      MameXMLUse.MameExeName := Mame_Exe;
      MameXMLUse.RomsEmulated := iNode;
      MameXMLUse.FinalRomsFound := FinalRomsFound;
      MameXMLConfig.Condition := 'Active';
      MameXMLConfig.SelectedMame := Mame_Exe;
      MameXMLConfig.FullPathOfSelectedMame := FullPathMame_Exe;
      GetSelectedMameNum(Mame_Exe);
      MameXMLConfig.Selected := SelectedMame;
      RowDir := MameXMLConfig.RowsDir.AddRowDir;
      RowDir.MameName := Mame_Exe;
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
      if not DirectoryExists(FullPathMame_Exe+'pcbs') then
        CreateDir(FullPathMame_Exe+'pcbs');
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
      RowPath := MameXMLConfig.RowsPath.AddPath;
      RowPath.MameName := Mame_Exe;
      RowPath.PathId := 1;
      RowPath.RomPath := FullPathMame_Exe+'roms';
      RowPath.RomsFound := FinalRomsFound;
      BestFitForMameGrid;
      Conf.nxtgrd_mame.EndUpdate;
      Conf.sLabel104.Caption := 'Mame Version (Build) : '+MameBuildName;
      Conf.sLabel106.Caption := 'Overall Emulated : '+IntToStr(iNode);
      Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(FinalRomsFound);
      UrlMame(Mame_Exe);
      Application.ProcessMessages;
      FGa.Free;
    end;
  finally
    InitGlobal_MameMemo_ForMameIni;
    Conf.sComboBox72.Items.Add(FullPathMame_Exe+'roms');
    AddNewDirTo_MameDirs;
    Conf.sGauge_MameData.Suffix := '%';
    Conf.sLabel109.Caption := 'Saving Database...';
    Application.ProcessMessages;
    MameXMLUse.SaveToFile(PathXmlMame+'_efuse.xml',ofIndent);
    MameXMLConfig.SaveToFile(PathXmlMamePath+'config.xml',ofIndent);
  end;
  ReloadDatabase(PathXmlMame,PathXmlMamePath);
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
  ThemeNum := ConfIni.ReadInteger('Themes','Theme',ThemeNum);
  SetCursors(ThemeNum - 1);
  SetAllCursor(ThemeNum - 1);
  if AreBusy = true then
    begin
      Conf.Pem_mame_database.Cursor := Busy;
      Conf.img24.Cursor := Busy;
      Conf.img25.Cursor := Busy;
      Conf.img26.Cursor := Busy;
      Conf.nxtgrd_mame.Cursor := Busy;
      Conf.sComboBox72.Cursor := Busy;
      Conf.sGauge_MameData.Cursor := Busy;
    end
  else
    begin
      Conf.Pem_mame_database.Cursor := Arrow;
      Conf.img24.Cursor := Arrow;
      Conf.img25.Cursor := Arrow;
      Conf.img26.Cursor := Arrow;
      Conf.nxtgrd_mame.Cursor := Arrow;
      Conf.sComboBox72.Cursor := Arrow;
      Conf.sGauge_MameData.Cursor := Arrow;    
    end;
end;

procedure SetMame_DatabaseFromMameIni;
var
  MameBuildVer,MameName: string;
  TotalRoms,TotalEmulated: Integer;
begin
  FindXMLPaths;  
  if FromDatabase = false then
    begin
      if FileExists(PathXmlMame+'_efuse.xml') then
        begin
          try
            MameXmlUseDoc := CreateXMLDoc;
            MameXmlConfigDoc := CreateXMLDoc;
            MameXMLUse := TMameXML.Create;
            MameXMLConfig := TMameXMLPath.Create;
            FGa := TGauseStream.Create;
            try
              if FromArrows_Mamedirs = False then
                Splash_Screen.sLabel1.Caption := 'Loading Mame Database...'
              else
                Conf.sLabel112.Caption := 'Loading Mame Database...';
              Application.ProcessMessages;
              MameXmlUseDoc.PreserveWhiteSpace := True;
              FGa.LoadFromFile(PathXmlMame+'_efuse.xml');
              MameXmlConfigDoc.Load(PathXmlMamePath+'config.xml');
              if FromArrows_Mamedirs = False then
                FGa.Gause := Splash_Screen.sGauge1
              else
                FGa.Gause := Conf.sGauge_MameChange;
              MameXmlUseDoc.LoadFromStream(FGa);
            finally
              SetTheGridForSetup;
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
                    Splash_Screen.sGauge1.Progress := (100 * iNode) div (gameList.Length-1)
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
                end;
              gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowdir');
              for iNode := 0 to gameList.Length -1 do
                begin
                  nodegame := gameList.Item[iNode];
                  RowDir := MameXMLConfig.RowsDir.AddRowDir;
                  RowDir.MameName := GetNodeAttrStr(nodegame,'MameName');
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
              //Show Info for Mame
              Conf.sLabel104.Caption := 'Mame Version (Build) : '+MameBuildVer;
              UrlMame(MameName);
              Conf.sLabel106.Caption := 'Overall Emulated : '+IntToStr(TotalEmulated);
              Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(TotalRoms);
              Conf.sLabel108.Caption := 'Directory : '+Conf.sComboBox72.Text;
            end;
          finally
            Conf.sComboBox72.ItemIndex := 0;
            Conf.sGauge_MameData.Progress := 100;
            Conf.sLabel109.Caption := 'Overall Status';
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
  Conf.sLabel108.Caption := 'Directory :';
  Conf.sWebLabel3.Caption := '';
  Conf.sWebLabel3.URL := '';
end;

procedure ShowDatabaseStatsFor(Dir: string);
var
  XMLPaths: TStringList;
  NumOfDir,NumOfRoms: Integer;
  MissingRoms,CurrentRow: Integer;
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
      Conf.sLabel108.Caption := 'Directory : '+Dir;
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
      Conf.sLabel108.Caption := 'Directory : '+Dir;
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
      Conf.sLabel108.Caption := 'Directory : '+Dir;
      Conf.sComboBox72.Text := '';
      Conf.sComboBox72.Text := Dir;
      Conf.sLabel109.Caption := 'Single Directory Status';
      SetupAndStartData(False);
    end;
  Conf.sGauge_MameData.Suffix := '%';
end;

procedure AddNewRom_Dir;
var
  PathID,uniqueRomsFound: Integer;
  OldFinalRomsFound: Integer;
  GameRomName,OldText: String;
begin
  SetupAndStartData(True);
  Conf.nxtgrd_mame.ClearRows;
  RomFound := False;
  FinalRomsFound := 0;
  uniqueRomsFound := 0;
  Conf.sLabel109.Caption := 'Adding roms from new directory...';
  Application.ProcessMessages;
  FindXMLPaths;
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
  Conf.nxtgrd_mame.AddRow(gameList.Length);
  Conf.nxtgrd_mame.BeginUpdate;
  MameXMLUse.Rows.Clear;
  for iNode := 0 to gameList.Length - 1 do
    begin
      nodegame := gameList.Item[iNode];
      Row := MameXMLUse.Rows.Add;
      Row.Id := iNode;
      Row.GameName := GetNodeAttrStr(nodegame,'GameName');
      Conf.nxtgrd_mame.Cell[1,iNode].AsString := GetNodeAttrStr(nodegame,'GameName');
      GameRomName := GetNodeAttrStr(nodegame,'RomName');
      Conf.nxtgrd_mame.Cell[2,iNode].AsString := GameRomName;
      Row.RomName := GameRomName;
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
        Row.CloneOf := '';
      if FindFirst(Conf.Find_Dirs.Directory+'\*.*' , faAnyFile, Rec) = 0 then
        begin
          repeat
            if ((Rec.Attr and faDirectory) <> faDirectory) then
              begin
                if Rec.Name = GameRomName+'.zip' then
                  begin
                    Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 32;
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
          Conf.nxtgrd_mame.Cell[3,iNode].AsInteger := 33;
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
  Conf.nxtgrd_mame.EndUpdate;
  //Add path to XmlPaths
  RowPath := MameXMLConfig.RowsPath.AddPath;
  RowPath.MameName := ExtractFileName(Mame_Exe);
  RowPath.PathId := PathID + 1;
  RowPath.RomPath := Conf.Find_Dirs.Directory;
  RowPath.RomsFound := FinalRomsFound;
  //Add finalroms to Mame xml in use...
  MameXMLUse.FinalRomsFound := OldFinalRomsFound + uniqueRomsFound;
  Conf.sLabel109.Caption := 'Saving Database...';
  Application.ProcessMessages;
  MameXMLUse.SaveToFile(PathXmlMame+'_efuse.xml',ofIndent);
  MameXMLConfig.SaveToFile(PathXmlMamePath+'config.xml',ofIndent);
  Conf.sComboBox72.Items.Add(Conf.Find_Dirs.Directory);
  Conf.sGauge_MameData.Suffix := '%';
  AddNewDirTo_MameDirs;
  ReloadDatabase(PathXmlMame,PathXmlMamePath);
  Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(FinalRomsFound);
  Conf.sLabel108.Caption := 'Directory : '+Conf.Find_Dirs.Directory;
  Conf.sComboBox72.Text := '';
  Conf.sComboBox72.SelText := Conf.Find_Dirs.Directory;
  Conf.sLabel109.Caption := 'Single Directory Status';
  SetupAndStartData(False);
  FromMame_DirsToFindDirs := True;
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
begin
  totalRomPathString := '';
  for k := 0 to Mame_Global_MemoIni.Lines.Count - 1 do
    begin
      value := Mame_Global_MemoIni.Lines.Strings[k];
      x := Pos(' ',value);
      t1 := Trim(Copy(value,0,x));
      if t1 = 'rompath' then
        begin
          Mame_Global_MemoIni.Lines.Delete(k);
          for l := 3 to Conf.sComboBox72.Items.Count do
            totalRomPathString := totalRomPathString+Conf.sComboBox72.Items.Strings[l-1]+';';
          Mame_Global_MemoIni.Lines.Insert(k,'rompath          '+totalRomPathString);
          Break;
        end;
    end;
  FromDatabase := True;
  SaveMame_DirsAtExit;
//  SetMame_DirsFromMameIni;
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
    end
  else
    begin
      Conf.nxtgrd_mame.Height := 407;
      Conf.grp115.Visible := True;
      Conf.sComboBox72.Visible := True;
      DisableMenuButtons(True);
    end;
end;

procedure FindXMLPaths;
begin
  PathXmlMamePath := Program_Path+'media\emulators\arcade\mame\config\';
  PathXmlMame := Program_Path+'media\emulators\arcade\mame\database\'+ExtractFileName(Mame_Exe);
  Delete(PathXmlMame,Length(PathXmlMame)-3,4);
end;

end.
