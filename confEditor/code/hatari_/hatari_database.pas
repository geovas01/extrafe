unit hatari_database;

interface
uses
  SysUtils,Classes,ExtCtrls,OmniXML,OmniXMLUtils,OmniXMLProperties,hatari_xmlext,
  Forms,NxColumns,NxColumnClasses,NxCustomGridControl,StdCtrls;

  procedure SetHatari_DatabasefromHatariIni;

  procedure SingleGames_Click;
  procedure BigCollections_Click;
  procedure SmallCollections_Click;
  procedure Demos_Click;
  procedure Applications_Click;

  procedure LoadSingleGames_Database;
  function DatabasesPaths(DName: string): string;
  procedure SetTheGrid_HatariData(DName: string);

// Menu actions
  procedure Show_hatari_databasepanel;
  procedure em_hatari_database_ShowDynamicComps;
  procedure em_hatari_database_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_roms,hatari_screen,hatari_joy,hatari_paths,hatari_system;

var
  HatariData_XmlDoc: IXMLDocument;
//  HatariData_Xml: TData_Games;
//  RowGame: TRowHatari_Game;
  node_gameHatari: IXMLNode;
  gameList_Hatari : IXMLNodeList;
  inode_Hatari: Integer;

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
    end;
  LoadSingleGames_Database;
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
  DName,MemoText: string;
begin
  DName := DatabasesPaths('single');
  HatariData_XmlDoc := CreateXMLDoc;
  FGa := TGauseStream.Create;
    try
      HatariData_XmlDoc.PreserveWhiteSpace := True;
      FGa.LoadFromFile(DName);
      FGa.Gause := Conf.sGauge_HatariData;
      HatariData_XmlDoc.LoadFromStream(FGa);
      SetTheGrid_HatariData('single');
      gameList_Hatari := HatariData_XmlDoc.SelectNodes('/NxGrid/Row');
      Conf.nxtgrd_hatari.AddRow(gameList_Hatari.Length);
      Conf.nxtgrd_hatari.BeginUpdate;
      for inode_Hatari := 0 to gameList_Hatari.Length - 1 do
        begin
          node_gameHatari := gameList_Hatari.Item[inode_Hatari];
          Conf.nxtgrd_hatari.Cell[1,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'GameName');
          Conf.nxtgrd_hatari.Cell[2,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'Year');
          Conf.nxtgrd_hatari.Cell[3,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'Publisher');
          Conf.nxtgrd_hatari.Cell[4,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'Genres');
          Conf.nxtgrd_hatari.Cell[5,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'GenresType');
          Conf.nxtgrd_hatari.Cell[6,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'Musician');
          Conf.nxtgrd_hatari.Cell[7,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'MusicianNickName');
          Conf.nxtgrd_hatari.Cell[8,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'GameDifficulty');
          Conf.nxtgrd_hatari.Cell[9,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'CrackerName');
          Conf.nxtgrd_hatari.Cell[10,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'DateLastPlayed');
          Conf.nxtgrd_hatari.Cell[11,inode_Hatari].AsInteger := GetNodeTextInt(node_gameHatari,'TimesPlayed');
          if GetNodeTextStr(node_gameHatari,'IsGameExists','') = 'True' then
            Conf.nxtgrd_hatari.Cell[12,inode_Hatari].AsInteger := 32
          else
            Conf.nxtgrd_hatari.Cell[12,inode_Hatari].AsInteger := 33;
          if GetNodeTextStr(node_gameHatari,'Favorite','') = 'True' then
            Conf.nxtgrd_hatari.Cell[13,inode_Hatari].AsInteger := 32
          else
            Conf.nxtgrd_hatari.Cell[13,inode_Hatari].AsInteger := 33;
          Conf.nxtgrd_hatari.Cell[14,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'ProgeammerName');
          Conf.nxtgrd_hatari.Cell[15,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'Language');
          Conf.nxtgrd_hatari.Cell[16,inode_Hatari].AsInteger := GetNodeTextInt(node_gameHatari,'RatingGame');
          Conf.nxtgrd_hatari.Cell[17,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'PALorNTSC');
          if GetNodeTextStr(node_gameHatari,'NeedsTrueDriveEmu','') = 'True' then
            Conf.nxtgrd_hatari.Cell[18,inode_Hatari].AsInteger := 32
          else
            Conf.nxtgrd_hatari.Cell[18,inode_Hatari].AsInteger := 33;
          Conf.nxtgrd_hatari.Cell[19,inode_Hatari].AsInteger := GetNodeTextInt(node_gameHatari,'HowManyDisks');
          Conf.nxtgrd_hatari.Cell[20,inode_Hatari].AsInteger := GetNodeTextInt(node_gameHatari,'MaxPlayers');
          if GetNodeTextStr(node_gameHatari,'SimultaneouslyPlayers','') = 'True' then
            Conf.nxtgrd_hatari.Cell[21,inode_Hatari].AsInteger := 32
          else
            Conf.nxtgrd_hatari.Cell[21,inode_Hatari].AsInteger := 33;
          if GetNodeTextStr(node_gameHatari,'Adult','') = 'True' then
            Conf.nxtgrd_hatari.Cell[22,inode_Hatari].AsInteger := 32
          else
            Conf.nxtgrd_hatari.Cell[22,inode_Hatari].AsInteger := 33;
          MemoText := GetNodeTextStr(node_gameHatari,'SpecialText');
          Conf.nxtgrd_hatari.Cell[23,inode_Hatari].AsString := MemoText;
          Conf.nxtgrd_hatari.Cell[24,inode_Hatari].AsString := GetNodeTextStr(node_gameHatari,'ControlType');
        end;
      Conf.nxtgrd_hatari.EndUpdate;
    finally
    end;
end;

function DatabasesPaths(DName: string): string;
var
  DBasePath: string;
begin
  DBasePath := ExtractFilePath(Application.ExeName) + 'media\emulators\computers\atari\hatari\database\st_';
  if DName = 'single' then
    Result := DBasePath + 'singlegames.xml';
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
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Date Last Played');
      Conf.nxtgrd_hatari.Columns.Add(TNxNumberColumn,'Times Played');
      Conf.nxtgrd_hatari.Columns.Add(TNxImageColumn,'Is Game Exists');
      Conf.nxtgrd_hatari.Columns.Add(TNxImageColumn,'Favorite?');
      Conf.nxtgrd_hatari.Columns.Add(TNxTextColumn,'Programmers Names');
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

      TNxImageColumn(Conf.nxtgrd_hatari.Columns[12]).Images := Conf.InBitBtn_Imagelist;
      TNxImageColumn(Conf.nxtgrd_hatari.Columns[13]).Images := Conf.InBitBtn_Imagelist;
      TNxImageColumn(Conf.nxtgrd_hatari.Columns[18]).Images := Conf.InBitBtn_Imagelist;
      TNxImageColumn(Conf.nxtgrd_hatari.Columns[21]).Images := Conf.InBitBtn_Imagelist;
      TNxImageColumn(Conf.nxtgrd_hatari.Columns[22]).Images := Conf.InBitBtn_Imagelist;

      TNxRateColumn(Conf.nxtgrd_hatari.Columns[16]).Max := 5;
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[16]).Glyph.LoadFromFile('media\confeditor\images\hatari\star.bmp');
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[16]).EmptyGlyph.LoadFromFile('media\confeditor\images\hatari\star_grey.bmp');
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[19]).Max := 8;
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[19]).Glyph.LoadFromFile('media\confeditor\images\hatari\disk.bmp');
//      TNxRateColumn(Conf.nxtgrd_hatari.Columns[19]).EmptyGlyph.LoadFromFile('media\confeditor\images\hatari\disk_grey.bmp');
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[20]).Max := 20;
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[20]).Glyph.LoadFromFile('media\confeditor\images\hatari\player.bmp');
      TNxRateColumn(Conf.nxtgrd_hatari.Columns[20]).EmptyGlyph.LoadFromFile('media\confeditor\images\hatari\player_grey.bmp');

      TNxMemoColumn(Conf.nxtgrd_hatari.Columns[22]).MultiLine := True;
      TNxMemoColumn(Conf.nxtgrd_hatari.Columns[22]).ScrollBars := ssBoth;
    end;
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
              3,586,106,70,i,True);
        2 : Image_Comp(Conf.Pem_hatari_database,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,True);
        3 : Image_Comp(Conf.Pem_hatari_database,'media\confeditor\images\hatari\database.png',
              577,2,151,71,i,True);
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
