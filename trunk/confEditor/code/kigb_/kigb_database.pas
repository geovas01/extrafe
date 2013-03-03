unit kigb_database;

interface
uses
  SysUtils,Classes,ExtCtrls,
  NxColumns,NxColumnClasses,NxCustomGridControl,
  NativeXml;

  procedure SetKigb_DatabasefromKigbIni;
  procedure SaveKigb_DatabaseAtExit;

  procedure LoadGameBoyDatabase;
  procedure LoadGameBoyColorDatabase;
  procedure CreateTheGridColumns;

// Menu actions
  procedure Show_kigb_databasespanel;
  procedure em_kigb_database_ShowDynamicComps;
  procedure em_kigb_database_FreeDynamicComps;

var
  fxml_GB: TNativeXml;  

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  kigb_screen,kigb_sound,kigb_paths,kigb_others;

procedure SetKigb_DatabasefromKigbIni;
begin
//
end;

procedure SaveKigb_DatabaseAtExit;
begin
//
end;

procedure LoadGameBoyDatabase;
var
  i,k,TotalGames: Integer;
  node: TXmlNode;
  DataPath: string;
begin
  DataPath := Program_Path + 'media\emulators\handheld\nintendo\gameboy_database\gameboy.xml';
  Conf.nxtgrd_kigb.ClearRows;
  Conf.nxtgrd_kigb.Columns.Clear;
  fxml_GB := TNativeXml.CreateName('GameBoy');
  fxml_GB.XmlFormat := xfReadable;
  fxml_GB.LoadFromFile(DataPath);
  TotalGames := fxml_GB.Root.ReadAttributeInteger('TotalGames');
  k := 0;
  CreateTheGridColumns;
  Conf.nxtgrd_kigb.BeginUpdate;
  Conf.nxtgrd_kigb.AddRow(TotalGames);
  with fxml_GB.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := fxml_GB.Root.Nodes[i];
        if node.Name = 'row' then
          begin
            Conf.nxtgrd_kigb.Cell[1,k].AsString := node.ReadAttributeString('GameName');
            Conf.nxtgrd_kigb.Cell[2,k].AsString := node.ReadAttributeString('Developer');
            Conf.nxtgrd_kigb.Cell[3,k].AsString := node.ReadAttributeString('Released');
            Conf.sGauge_kigb.Progress := (100 * k) div (TotalGames-1);
            k :=  k + 1;          
          end;
      end;
  Conf.nxtgrd_kigb.EndUpdate;
  fxml_GB.Free;
end;

procedure LoadGameBoyColorDatabase;
var
  i,k,TotalGames: Integer;
  node: TXmlNode;
  DataPath: string;
begin
  DataPath := Program_Path + 'media\emulators\handheld\nintendo\gameboycolor_database\gameboycolor.xml';
  Conf.nxtgrd_kigb.ClearRows;
  Conf.nxtgrd_kigb.Columns.Clear;
  fxml_GB := TNativeXml.CreateName('GameBoyColor');
  fxml_GB.XmlFormat := xfReadable;
  fxml_GB.LoadFromFile(DataPath);
  TotalGames := fxml_GB.Root.ReadAttributeInteger('TotalGames');
  k := 0;
  CreateTheGridColumns;
  Conf.nxtgrd_kigb.BeginUpdate;
  Conf.nxtgrd_kigb.AddRow(TotalGames);
  with fxml_GB.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := fxml_GB.Root.Nodes[i];
        if node.Name = 'row' then
          begin
            Conf.nxtgrd_kigb.Cell[1,k].AsString := node.ReadAttributeString('GameName');
            Conf.nxtgrd_kigb.Cell[2,k].AsString := node.ReadAttributeString('Developer');
            Conf.nxtgrd_kigb.Cell[3,k].AsString := node.ReadAttributeString('Released');
            Conf.sGauge_kigb.Progress := (100 * k) div (TotalGames-1);
            k :=  k + 1;          
          end;
      end;
  Conf.nxtgrd_kigb.EndUpdate;
  fxml_GB.Free;
end;

procedure CreateTheGridColumns;
begin
  Conf.nxtgrd_kigb.Columns.Add(TNxIncrementColumn,'ID');
  Conf.nxtgrd_kigb.Columns.Add(TNxTextColumn,'Gama Name');
  Conf.nxtgrd_kigb.Columns.Add(TNxTextColumn,'Developer');
  Conf.nxtgrd_kigb.Columns.Add(TNxTextColumn,'Date Released');
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_kigb_databasespanel;
begin
  if (Cmenustate = 'em_handheld_kigb_paths') then
    em_kigb_paths_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_screen') then
    em_kigb_screen_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_sound') then
    em_kigb_sound_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_others') then
    em_kigb_others_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn10.Caption,False,True);
  Cmenustate := 'em_handheld_kigb_database';
  em_kigb_database_ShowDynamicComps;
  ShowButtonDown(10,'EM_HANDHELDS_NINTENDO_KIGB_DATABASE');
  Conf.Pem_kigb_sound.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_kigb_database');
end;

procedure em_kigb_database_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_kigb_database,'media\confeditor\images\kigb\kigb.png',
              3,590,90,71,i,'',True,False);
        2 : Image_Comp(Conf.Pem_kigb_database,'media\confeditor\images\kigb\kigb_image.png',
              582,538,147,120,i,'',True,False);
        3 : Image_Comp(Conf.Pem_kigb_database,'media\confeditor\images\kigb\database.png',
              577,2,151,71,i,'',True,False);
      end;
    end;
end;

procedure em_kigb_database_FreeDynamicComps;
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
