unit hatari_database;

interface
uses
  SysUtils,Classes,ExtCtrls,Forms,StdCtrls,
  NxColumns,NxColumnClasses,NxCustomGridControl,
  NativeXml;

  procedure SetHatari_DatabasefromHatariIni;

  procedure SingleGames_Click;
  procedure BigCollections_Click;
  procedure LoadBigCollection(Name: string);
  procedure SmallCollections_Click;
  procedure LoadSmallCollection(Name: string);
  procedure Demos_Click;
  procedure Applications_Click;

  procedure LoadSingleGames_Database;
  function DatabasesPaths(DName: string; Collection,BigOrSmall: Boolean): string;
  procedure SetTheGrid_HatariData(DName: string);
  procedure ClearNextGrid;

// Menu actions
  procedure Show_hatari_databasepanel;
  procedure em_hatari_database_ShowDynamicComps;
  procedure em_hatari_database_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_roms,hatari_screen,hatari_joy,hatari_paths,hatari_system;

var
  FXml_Hatari,FXml_Big,FXml_Small: TNativeXml;

procedure SetHatari_DatabasefromHatariIni;
begin
//
end;

procedure SingleGames_Click;
begin
  if not Conf.sButton10.Down then
    begin
      Conf.sButton11.Down := False;
      Conf.sComboBox40.Enabled := False;
      Conf.sButton12.Down := False;
      Conf.sComboBox41.Enabled := False;
      Conf.sButton13.Down := False;
      Conf.sButton14.Down := False;
      Conf.sButton10.Down := True;
      Conf.nxtgrd_hatari.Height := 1;
      LoadSingleGames_Database;
    end;
end;

procedure BigCollections_Click;
begin
  if not Conf.sButton11.Down then
    begin
      Conf.sButton10.Down := False;
      Conf.sComboBox40.Enabled := True;
      Conf.sButton12.Down := False;
      Conf.sComboBox41.Enabled := False;
      Conf.sButton13.Down := False;
      Conf.sButton14.Down := False;
      Conf.sButton11.Down := True;
    end;
end;

procedure SmallCollections_Click;
begin
  if not Conf.sButton12.Down then
    begin
      Conf.sButton11.Down := False;
      Conf.sComboBox40.Enabled := False;
      Conf.sButton10.Down := False;
      Conf.sComboBox41.Enabled := True;
      Conf.sButton13.Down := False;
      Conf.sButton14.Down := False;
      Conf.sButton12.Down := True;
    end;
end;

procedure Demos_Click;
begin
  if not Conf.sButton13.Down then
    begin
      Conf.sButton11.Down := False;
      Conf.sComboBox40.Enabled := False;
      Conf.sButton12.Down := False;
      Conf.sComboBox41.Enabled := False;
      Conf.sButton10.Down := False;
      Conf.sButton14.Down := False;
      Conf.sButton13.Down := True;
    end;
end;

procedure Applications_Click;
begin
  if not Conf.sButton14.Down then
    begin
      Conf.sButton11.Down := False;
      Conf.sComboBox40.Enabled := False;
      Conf.sButton12.Down := False;
      Conf.sComboBox41.Enabled := False;
      Conf.sButton13.Down := False;
      Conf.sButton10.Down := False;
      Conf.sButton14.Down := True;
    end;
end;

procedure LoadSingleGames_Database;
var
//  F: TFileStream;
  i,k,totalRows: Integer;
  node : Txmlnode;
  AtariSingleDatabase: string;
begin
  ClearNextGrid;
  AtariSingleDatabase := DatabasesPaths('single',False,False);
  FXml_Hatari := TNativeXml.CreateName('AtariST_SingleGames');
  FXml_Hatari.XmlFormat := xfReadable;
  FXml_Hatari.LoadFromFile(AtariSingleDatabase);
{  FXml_Hatari.OnProgress := Conf.XMLProgress;
  progressComesFrom := 'Hatari_Database';
  F := TFileStream.Create(FFileName, fmOpenRead or fmShareDenyWrite);
  try
    FFileSize := F.Size;
    if IsBinary(F) then
      FXml_Hatari.LoadFromBinaryStream(F)
    else
      FXml_Hatari.LoadFromStream(F);
  finally
    F.Free;
  end;}
  SetTheGrid_HatariData('single');
  totalRows := FXml_Hatari.Root.AttributeByName['TotalGames'].ValueAsInteger;
  Conf.nxtgrd_hatari.BeginUpdate;
  Conf.nxtgrd_hatari.AddRow(totalRows);
  k := 0;
  with FXml_Hatari.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := FXml_Hatari.Root.Nodes[i];
        if node.Name = 'row' then
          begin
            Conf.nxtgrd_hatari.Cell[1,k].AsString := node.ReadAttributeString('GameName');
            Conf.nxtgrd_hatari.Cell[2,k].AsString := node.ReadAttributeString('Year');
            Conf.nxtgrd_hatari.Cell[3,k].AsString := node.ReadAttributeString('Publisher');
            Conf.nxtgrd_hatari.Cell[4,k].AsString := node.ReadAttributeString('Genres');
            Conf.nxtgrd_hatari.Cell[5,k].AsString := node.ReadAttributeString('GenresType');
            Conf.nxtgrd_hatari.Cell[6,k].AsString := node.ReadAttributeString('Musician');
            Conf.nxtgrd_hatari.Cell[7,k].AsString := node.ReadAttributeString('MusicianNickName');
            Conf.nxtgrd_hatari.Cell[8,k].AsString := node.ReadAttributeString('GameDifficulty');
            Conf.nxtgrd_hatari.Cell[9,k].AsString := node.ReadAttributeString('CrackerName');
            Conf.nxtgrd_hatari.Cell[10,k].AsString := node.ReadAttributeString('ProgeammerName');
            Conf.nxtgrd_hatari.Cell[11,k].AsString := node.ReadAttributeString('Language');
            Conf.nxtgrd_hatari.Cell[12,k].AsInteger := node.ReadAttributeInteger('Rate');
            Conf.nxtgrd_hatari.Cell[13,k].AsString := node.ReadAttributeString('PALorNTSC');
            if node.ReadAttributeBool('NeedsTrueDriveEmu') = True then
              Conf.nxtgrd_hatari.Cell[14,k].AsInteger := 32
            else
              Conf.nxtgrd_hatari.Cell[14,k].AsInteger := 33;
            Conf.nxtgrd_hatari.Cell[15,k].AsInteger := node.ReadAttributeInteger('HowManyDisks');
            Conf.nxtgrd_hatari.Cell[16,k].AsInteger := node.ReadAttributeInteger('MaxPlayers');
            if node.ReadAttributeBool('SimultaneouslyPlayers') = True then
              Conf.nxtgrd_hatari.Cell[17,k].AsInteger := 32
            else
              Conf.nxtgrd_hatari.Cell[17,k].AsInteger := 33;
            if node.ReadAttributeBool('Adult') = True then
              Conf.nxtgrd_hatari.Cell[18,k].AsInteger := 32
            else
              Conf.nxtgrd_hatari.Cell[18,k].AsInteger := 33;
            Conf.nxtgrd_hatari.Cell[19,k].AsString := node.ReadAttributeString('SpecialText');
            Conf.nxtgrd_hatari.Cell[20,k].AsString := node.ReadAttributeString('ControlType');
            Conf.sGauge_HatariData.Progress := (100 * k) div (totalRows-1);
            Application.ProcessMessages;
            k := k + 1;
          end;
      end;
  Conf.nxtgrd_hatari.EndUpdate;
  Conf.nxtgrd_hatari.Height := 407;
  FXml_Hatari.Free;
  Conf.nxtgrd_hatari.Cursor := Arrow;
end;

procedure LoadBigCollection(Name: string);
var
  i,k,l,TotalDisks: integer;
  node: TXmlNode;
  AtariBigDatabaseName: string;
begin
  ClearNextGrid;
  AtariBigDatabaseName := DatabasesPaths(Name,True,True);
  FXml_Big := TNativeXml.CreateName(Name);
  FXml_Big.XmlFormat := xfReadable;
  FXml_Big.LoadFromFile(AtariBigDatabaseName);
  SetTheGrid_HatariData('Collections');
  TotalDisks:= FXml_Big.Root.ReadAttributeInteger('TotalDisks');
  k := 0;
  Conf.nxtgrd_hatari.BeginUpdate;
  Conf.nxtgrd_hatari.AddRow(TotalDisks);
  with FXml_Big.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := FXml_Big.Root.Nodes[i];
        if node.Name = 'row' then
          begin
            Conf.nxtgrd_hatari.Cell[1,k].AsString := node.ReadAttributeString('DiskName');
            for l := 1 to 10 do
              Conf.nxtgrd_hatari.Cell[l+1,k].AsString := node.ReadAttributeString('GameNum' + IntToStr(l));
            Conf.nxtgrd_hatari.Cell[12,k].AsString := node.ReadAttributeString('DiskPath');
            Conf.sGauge_HatariData.Progress := (100 * k) div (TotalDisks-1);
            Application.ProcessMessages;
            k := k + 1;
          end;
      end;
  Conf.nxtgrd_hatari.EndUpdate;
  Conf.nxtgrd_hatari.Height := 407;
  FXml_Big.Free;
  Conf.nxtgrd_hatari.Cursor := Arrow;
end;

procedure LoadSmallCollection(Name: string);
var
  i,k,l,TotalDisks: integer;
  node: TXmlNode;
  AtariBigDatabaseName: string;
begin
  ClearNextGrid;
  AtariBigDatabaseName := DatabasesPaths(Name,True,False);
  FXml_Small := TNativeXml.CreateName(Name);
  FXml_Small.XmlFormat := xfReadable;
  FXml_Small.LoadFromFile(AtariBigDatabaseName);
  SetTheGrid_HatariData('Collections');
  TotalDisks:= FXml_Small.Root.ReadAttributeInteger('TotalDisks');
  k := 0;
  Conf.nxtgrd_hatari.BeginUpdate;
  Conf.nxtgrd_hatari.AddRow(TotalDisks);
  with FXml_Small.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := FXml_Small.Root.Nodes[i];
        if node.Name = 'row' then
          begin
            Conf.nxtgrd_hatari.Cell[1,k].AsString := node.ReadAttributeString('DiskName');
            for l := 1 to 10 do
              Conf.nxtgrd_hatari.Cell[l+1,k].AsString := node.ReadAttributeString('GameNum' + IntToStr(l));
            Conf.nxtgrd_hatari.Cell[12,k].AsString := node.ReadAttributeString('DiskPath');
            Conf.sGauge_HatariData.Progress := (100 * k) div (TotalDisks-1);
            Application.ProcessMessages;
            k := k + 1;
          end;
      end;
  Conf.nxtgrd_hatari.EndUpdate;
  Conf.nxtgrd_hatari.Height := 407;
  FXml_Small.Free;
  Conf.nxtgrd_hatari.Cursor := Arrow;
end;

function DatabasesPaths(DName: string; Collection,BigOrSmall: Boolean): string;
const
  big = 'big\';
  Small = 'small\';
var
  DBasePath,CollDatabase: string;
  iPos: Integer;
begin
  DBasePath := Program_Path + 'media\emulators\computers\atari\atari_st_ste_database\';
  if Collection = False then
    begin
      if DName = 'single' then
        Result := DBasePath + 'singlegames.xml';
    end
  else
    begin
      if BigOrSmall = True then
        begin
          iPos := Pos(' ',DName);
          if iPos <> 0 then
            CollDatabase := StringReplace(DName,' ','_',[rfReplaceAll, rfIgnoreCase])
          else
            CollDatabase := DName;
          Result := DBasePath + big + CollDatabase + '.xml';
        end
      else
        begin
          iPos := Pos(' ',DName);
          if iPos <> 0 then
            CollDatabase := StringReplace(DName,' ','_',[rfReplaceAll, rfIgnoreCase])
          else
            CollDatabase := DName;
          Result := DBasePath + small + CollDatabase + '.xml';        
        end;
    
    end;
end;

procedure SetTheGrid_HatariData(DName: string);
begin
  if DName = 'single' then
    begin
      Conf.nxtgrd_hatari.Columns.Add(TNxIncrementColumn,'ID');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Year');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Publisher');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Genres');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Genres Type');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Musician');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Musician Nick Name');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Difficulty');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Cracker Name');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Programmer Name');
//      Conf.nxtgrd_hatari.Columns.Add(TNxNumberColumn,'Times Played');
//      Conf.nxtgrd_hatari.Columns.Add(TNxImageColumn,'Is Game Exists');
//      Conf.nxtgrd_hatari.Columns.Add(TNxImageColumn,'Favorite?');
//      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Programmers Names');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Language');
      Conf.nxtgrd_hatari.Columns.Add(TNxRateColumn,'Rating');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Pal or Ntsc');
      Conf.nxtgrd_hatari.Columns.Add(TNxImageColumn,'Needs True Drive?');
      Conf.nxtgrd_hatari.Columns.Add(TNxRateColumn,'Disks');
      Conf.nxtgrd_hatari.Columns.Add(TNxRateColumn,'Max Players');
      Conf.nxtgrd_hatari.Columns.Add(TNxImageColumn,'Players Simultaneously');
      Conf.nxtgrd_hatari.Columns.Add(TNxImageColumn,'Adult?');
      Conf.nxtgrd_hatari.Columns.Add(TNxMemoColumn,'Special');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Control Type');
      Conf.nxtgrd_hatari.Columns[0].Alignment := taCenter;
      Conf.nxtgrd_hatari.Columns[0].Header.Alignment := taCenter;
      Conf.nxtgrd_hatari.Columns[0].Width := 40;

      TNxRateColumn(Conf.nxtgrd_hatari.Columns[12]).Max := 5;
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[12]).Glyph.LoadFromFile('media\confeditor\images\hatari\star.bmp');
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[12]).EmptyGlyph.LoadFromFile('media\confeditor\images\hatari\star_grey.bmp');
      TNxImageColumn(Conf.nxtgrd_hatari.Columns[14]).Images := Conf.InBitBtn_Imagelist;
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[15]).Max := 8;
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[15]).Glyph.LoadFromFile('media\confeditor\images\hatari\disk.bmp');
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[15]).EmptyGlyph.LoadFromFile('media\confeditor\images\hatari\disk_grey.bmp');
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[16]).Max := 20;
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[16]).Glyph.LoadFromFile('media\confeditor\images\hatari\player.bmp');
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[16]).EmptyGlyph.LoadFromFile('media\confeditor\images\hatari\player_grey.bmp');
      TNxImageColumn(Conf.nxtgrd_hatari.Columns[17]).Images := Conf.InBitBtn_Imagelist;
      TNxImageColumn(Conf.nxtgrd_hatari.Columns[18]).Images := Conf.InBitBtn_Imagelist;
//      TNxImageColumn(Conf.nxtgrd_hatari.Columns[13]).Images := Conf.InBitBtn_Imagelist;
//      TNxImageColumn(Conf.nxtgrd_hatari.Columns[18]).Images := Conf.InBitBtn_Imagelist;
//      TNxImageColumn(Conf.nxtgrd_hatari.Columns[21]).Images := Conf.InBitBtn_Imagelist;
//      TNxImageColumn(Conf.nxtgrd_hatari.Columns[22]).Images := Conf.InBitBtn_Imagelist;
//
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[16]).Max := 5;
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[16]).Glyph.LoadFromFile('media\confeditor\images\hatari\star.bmp');
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[16]).EmptyGlyph.LoadFromFile('media\confeditor\images\hatari\star_grey.bmp');
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[19]).Max := 8;
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[19]).Glyph.LoadFromFile('media\confeditor\images\hatari\disk.bmp');
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[19]).EmptyGlyph.LoadFromFile('media\confeditor\images\hatari\disk_grey.bmp');
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[20]).Max := 20;
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[20]).Glyph.LoadFromFile('media\confeditor\images\hatari\player.bmp');
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[20]).EmptyGlyph.LoadFromFile('media\confeditor\images\hatari\player_grey.bmp');
//
//      TNxMemoColumn(Conf.nxtgrd_hatari.Columns[22]).MultiLine := True;
//      TNxMemoColumn(Conf.nxtgrd_hatari.Columns[22]).ScrollBars := ssBoth;
    end
  else if DName = 'Collections' then
    begin
      Conf.nxtgrd_hatari.Columns.Add(TNxIncrementColumn,'ID');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Disk Name');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 1');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 2');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 3');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 4');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 5');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 6');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 7');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 8');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 9');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Game Name No 10');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Disk Directory');
    end;
end;

procedure ClearNextGrid;
begin
  Conf.nxtgrd_hatari.ClearRows;
  Conf.nxtgrd_hatari.Columns.Clear;
  Conf.nxtgrd_hatari.Height := 1;
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_hatari_databasepanel;
begin
  if (Cmenustate = 'em_computers_hatari_paths') then
    em_hatari_paths_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_system') then
    em_hatari_system_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_roms') then
    em_hatari_roms_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_screen') then
    em_hatari_screen_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_joy') then
    em_hatari_joy_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn11.Caption,False,True);
  Cmenustate := 'em_computers_hatari_database';
  em_hatari_database_ShowDynamicComps;
  ShowButtonDown(11,'EM_COMPUTERS_ATARI_HATARI_DATABASE');
  Conf.Pem_hatari_joy.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_hatari_database');
end;

procedure em_hatari_database_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_hatari_database,'media\confeditor\images\hatari\hatari.png',
              3,586,106,70,i,'',True,False);
        2 : Image_Comp(Conf.Pem_hatari_database,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,'',True,False);
        3 : Image_Comp(Conf.Pem_hatari_database,'media\confeditor\images\hatari\database.png',
              577,2,151,71,i,'',True,False);
      end;
    end;
end;

procedure em_hatari_database_FreeDynamicComps;
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
