unit psx_database;

interface
uses
  SysUtils,Classes,ExtCtrls,
  NxColumns,NxColumnClasses,NxCustomGridControl,
  NativeXml;


  procedure SetpSX_DatabasefrompSXIni;
  procedure LoadPsxDatabase;
  procedure CreateTheGridColumns;

// Menu actions
  procedure Show_psx_databasepanel;
  procedure em_psx_database_ShowDynamicComps;
  procedure em_psx_database_FreeDynamicComps;

var
  fxml_psx: TNativeXml;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  psx_screen,psx_sound,psx_others,psx_paths;

procedure SetpSX_DatabasefrompSXIni;
var
  DataOK: Boolean;
begin
  DataOK := pSX_Config.ReadBool('Paths','FoundDatabase',DataOK);
  if DataOK = True then
    LoadPsxDatabase;
end;

procedure LoadPsxDatabase;
var
  F: TFileStream;
  i,k,TotalGames: Integer;
  node: TXmlNode;
  DataPath: string;
begin
  DataPath := pSX_Config.ReadString('Paths','DatabasePath',DataPath);
  fxml_psx := TNativeXml.CreateName('Playstation');
  fxml_psx.XmlFormat := xfReadable;
  fxml_psx.OnProgress := Conf.XMLProgress;
  progressComesFrom := 'Playstation_Database';
  F := TFileStream.Create(DataPath, fmOpenRead or fmShareDenyWrite);
  try
    FFileSize := F.Size;
    if IsBinary(F) then
      fxml_psx.LoadFromBinaryStream(F)
    else
      fxml_psx.LoadFromStream(F);
  finally
    F.Free;
  end;
  k := 0;
  TotalGames := fxml_psx.Root.ReadAttributeInteger('TotalGames');
  CreateTheGridColumns;
  Conf.nxtgrd_pSX.BeginUpdate;
  Conf.nxtgrd_pSX.AddRow(TotalGames);
  with fxml_psx.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := fxml_psx.Root.Nodes[i];
        if node.Name = 'row' then
          begin
            Conf.nxtgrd_pSX.Cell[1,k].AsString := LowerCase(node.ReadAttributeString('GameName'));
            Conf.nxtgrd_pSX.Cell[2,k].AsString := node.ReadAttributeString('Region');
            Conf.nxtgrd_pSX.Cell[3,k].AsString := node.ReadAttributeString('DisksSerialNumbers');
            Conf.nxtgrd_pSX.Cell[4,k].AsString := node.ReadAttributeString('Genres/Styles');
            Conf.nxtgrd_pSX.Cell[5,k].AsString := node.ReadAttributeString('Developer');
            Conf.nxtgrd_pSX.Cell[6,k].AsString := node.ReadAttributeString('Publisher');
            Conf.nxtgrd_pSX.Cell[7,k].AsString := node.ReadAttributeString('DateReleased');
            Conf.nxtgrd_pSX.Cell[8,k].AsString := node.ReadAttributeString('NumOfPlayers');
            Conf.nxtgrd_pSX.Cell[9,k].AsString := node.ReadAttributeString('NumOfBlockCards');
            k:= k + 1;
          end;
      end;
  Conf.nxtgrd_pSX.EndUpdate;
  fxml_psx.Free;
end;

procedure CreateTheGridColumns;
begin
  Conf.nxtgrd_pSX.Columns.Add(TNxIncrementColumn,'ID');
  Conf.nxtgrd_pSX.Columns.Add(TNxTextColumn,'Game Name');
  Conf.nxtgrd_pSX.Columns.Add(TNxTextColumn,'Region');
  Conf.nxtgrd_pSX.Columns.Add(TNxTextColumn,'Disks Serial Numbers');
  Conf.nxtgrd_pSX.Columns.Add(TNxTextColumn,'Gernes / Styles');
  Conf.nxtgrd_pSX.Columns.Add(TNxTextColumn,'Developer');
  Conf.nxtgrd_pSX.Columns.Add(TNxTextColumn,'Publisher');
  Conf.nxtgrd_pSX.Columns.Add(TNxTextColumn,'DateReleased');
  Conf.nxtgrd_pSX.Columns.Add(TNxTextColumn,'NumOfPlayers');
  Conf.nxtgrd_pSX.Columns.Add(TNxTextColumn,'NumOfBlockCards');
end;

//////////////////////////////////////////////////////////////////////////////

procedure Show_psx_databasepanel;
begin
  if (Cmenustate = 'em_consoles_psx_paths') then
    em_psx_paths_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_screen') then
    em_psx_screen_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_sound') then
    em_psx_sound_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_others') then
    em_psx_others_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn10.Caption,False,True);
  Cmenustate := 'em_consoles_psx_database';
  em_psx_database_ShowDynamicComps;
  ShowButtonDown(6,'EM_CONSOLES_SONY_PSX_DATABASE');
  Conf.Pem_psx_sound.Tag := 0;
  Conf.Pem_psx_others.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_psx_database');
end;

procedure em_psx_database_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_psx_database,'media\confeditor\images\psx\psx.png',
              3,590,100,71,i,'',True,False);
        2 : Image_Comp(Conf.Pem_psx_database,'media\confeditor\images\psx\psx_image.png',
              587,381,150,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_psx_database,'media\confeditor\images\psx\database.png',
              577,2,151,71,i,'',True,False);
      end;
    end;
end;

procedure em_psx_database_FreeDynamicComps;
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
