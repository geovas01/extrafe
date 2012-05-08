unit zinc_database;

interface

uses
  zinc_xmlext,OmniXML,OmniXMLUtils,OmniXMLProperties,
  SysUtils,Forms,Controls,IniFiles,ExtCtrls,Classes,
  NxGrid,NxColumnClasses,NxCustomGridControl,
  slabel;

  procedure CreateFirstTimeDatabase;

  procedure SetZinc_DatabaseFromZincIni;
  procedure SetUpTheGrid;
  procedure BestFitForZincGrid;

// Menu actions
  procedure Show_zinc_databasepanel;
  procedure em_zinc_database_ShowDynamicComps;
  procedure em_zinc_database_FreeDynamicComps;


var
  ZincData_XmlDoc: IXMLDocument;
  ZincData_Xml: TData_Games;
  RowGame: TRowZinc_Game;
  node_gameZinc: IXMLNode;
  gameList_Zinc : IXMLNodeList;
  inode_zinc: Integer; 
  
implementation

uses
  main,mainconf,menu,onflycomponents,FunctionX,
  zinc_paths,zinc_graphics,zinc_sound;

procedure CreateFirstTimeDatabase;
var
  ZincFile: TextFile;
  text,t1,t2,t3: string;
  r,r1 : Integer;
  count,rownum: Byte;
  GameFound: Boolean;
  rec : TSearchRec;
begin
  ZincData_XmlDoc := CreateXMLDoc;
  ZincData_Xml := TData_Games.Create;
  ZincDatabaseFile := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\database\zinc_efuse';
  RunCaptured(ExtractFileDrive(FullPathZinc_Exe),FullPathZinc_Exe+Zinc_Exe,' --list-games',ZincDatabaseFile+'.txt');
  Screen.Cursor := crDefault;
  AssignFile(ZincFile,ZincDatabaseFile+'.txt');
  Reset(ZincFile);
  SetupTheGrid;
  Conf.nxtgrd_zinc.AddRow(71);
  Conf.nxtgrd_zinc.BeginUpdate;
  rownum := 0;
  while not Eof(ZincFile) do
    begin
      Readln(ZincFile,text);
      r := Pos(' ',text);
      t1 := Trim(Copy(text,0,r));
      if t1 <> 'ZiNc' then
        begin
          count := 0;
          GameFound := False;
          RowGame := ZincData_Xml.Rows.AddRow;
          t2 := Trim(Copy(text,1,Length(text)));
          r := Pos(' ',t2);
          t1 := Trim(Copy(t2,0,r));
          Conf.nxtgrd_zinc.Cell[4,rownum].AsString := t1;
          RowGame.RunGameNumber := StrToInt(t1);
          t1 := Trim(Copy(t2,r,Length(t2)));
          r := Pos('[',t1);
          t2 := Trim(Copy(t1,0,r-1));
          Conf.nxtgrd_zinc.Cell[1,rownum].AsString := t2;
          RowGame.GameName := t2;
          t2 := Trim(Copy(t1,r+1,Length(t1)-(r+1)));
          repeat
            count := count + 1;
            r := Pos(',',t2);
            t1 := Trim(Copy(t2,0,r-1));
            case count of
              1 : begin
                    RowGame.RomName := t1;
                    if FindFirst(Zinc_RomsPath+'\*.*' , faAnyFile, Rec) = 0 then
                      begin
                        repeat
                          if ((Rec.Attr and faDirectory) <> faDirectory) then
                            begin
                              if Rec.Name = t1+'.zip' then
                                begin
                                  RowGame.IfGameExists := 'ok';
                                  Conf.nxtgrd_zinc.Cell[2,rownum].AsString := t1;
                                  Conf.nxtgrd_zinc.Cell[3,rownum].AsInteger := 32;
                                  GameFound := True;
                                  Break
                                end
                            end;
                        until FindNext(Rec) <> 0; 
                      end;
                  end;
              2 : begin
                    r1 := Pos(' ',t2);
                    t3 := Trim(Copy(t2,0,r1));
                    if t3 = 'parent' then
                      begin
                        t1 := Trim(Copy(t1,r1,Length(t3)));
                        RowGame.ParentName := t1;
                        Conf.nxtgrd_zinc.Cell[6,rownum].AsString := t1;
                      end
                    else
                      begin
                        t1 := Trim(Copy(t2,Length(t3)+1,Length(t2) - Length(t3)));
                        RowGame.BiosName := t1;
                        Conf.nxtgrd_zinc.Cell[5,rownum].AsString := t1;
                      end;
                  end;
              3 : begin
                    r1 := Pos(' ',t2);
                    t3 := Trim(Copy(t2,0,r1));
                    t1 := Trim(Copy(t2,r1,Length(t3)));
                    RowGame.BiosName := t1;
                    Conf.nxtgrd_zinc.Cell[5,rownum].AsString := t1;
                  end;
            end;
            t2 := Trim(Copy(t2,r+1,Length(t2)-r));
          until r = 0;
          if GameFound = False then
            Conf.nxtgrd_zinc.Cell[3,rownum].AsInteger := 33;
          rownum := rownum + 1;
        end
      else
        begin
          t1 := Trim(Copy(text,r,Length(text)-r));
          r := Pos(' ',t1);
          t2 := Trim(Copy(t1,0,r));
          ZincData_Xml.ZincVer := t2;
        end;
    end;
  Conf.nxtgrd_zinc.EndUpdate;
  CloseFile(ZincFile);
  DeleteFile(ZincDatabaseFile+'.txt');
  ZincData_Xml.SaveToFile(ZincDatabaseFile+'.xml',ofIndent);
  Zinc_Config := TIniFile.Create(Zinc_ini);
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Exe',Zinc_Exe);
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Path',FullPathZinc_Exe);
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Roms',FullPathZinc_Exe+'roms');
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Snaps',FullPathZinc_Exe+'snaps');
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Renderer',FullPathZinc_Exe+'renderer.cfg');
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Sound',FullPathZinc_Exe+'zinc_sound.cfg');
  if FileExists(FullPathZinc_Exe+'ogl_renderer.znc') then
    Zinc_Config.WriteBool('Zinc_Files','Zinc_OpenGL',True)
  else
    Zinc_Config.WriteBool('Zinc_Files','Zinc_OpenGL',False);
  if FileExists(FullPathZinc_Exe+'d3d_renderer.znc') then
    Zinc_Config.WriteBool('Zinc_Files','Zinc_D3D',True)
  else
    Zinc_Config.WriteBool('Zinc_Files','Zinc_D3D',False);
  if FileExists(FullPathZinc_Exe+'s11player.dll') then
    Zinc_Config.WriteBool('Zinc_Files','Zinc_SoundDll',True)
  else
    Zinc_Config.WriteBool('Zing_Files','Zinc_SoundDll',False);
  Zinc_Config.WriteString('Zinc_Conf','Graphics','OpenGL');
end;

procedure Show_zinc_databasepanel;
begin
  if (Cmenustate = 'em_arcade_zinc_paths') then
    em_zinc_paths_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_zinc_graphics') then
    em_zinc_graphics_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_zinc_sound') then
    em_zinc_sound_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn9.Caption,False,True);
  Cmenustate := 'em_arcade_zinc_database';
  em_zinc_database_ShowDynamicComps;
  ShowButtonDown(9,'EM_ARCADE_ZINC_DATABASE');
  ShowHidePanel(CurrentPanel,'Pem_zinc_database');
end;

procedure em_zinc_database_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_zinc_database,'media\confeditor\images\zinc\zinc.png',
              3,590,97,75,i,True);
        2 : Image_Comp(Conf.Pem_zinc_database,'media\confeditor\images\zinc\zinc_image.png',
              580,483,150,175,i,True);
        3 : Image_Comp(Conf.Pem_zinc_database,'media\confeditor\images\zinc\database.png',
              576,2,151,71,i,True);
      end;
    end;
  for i := 1 to 2 do
    begin
      case i of
        1 : Label_Comp(Conf.Pem_zinc_database,'Rom Path:',24,30,i,True,True,True);
        2 : Label_Comp(Conf.Pem_zinc_database,Conf.sEdit54.Text,30,50,i,True,True,True);
      end;
    end;
end;

procedure em_zinc_database_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
  for i := 1 to 2 do
    begin
      Comp := FindComponentEx('Conf.Label'+IntToStr(i));
      TsLabel(Comp).Free;
    end;
end;

procedure SetZinc_DatabaseFromZincIni;
begin
  SetUpTheGrid;
  gameList_Zinc := ZincData_XmlDoc.SelectNodes('/ZincDatabase/rowgamestatus');
  Conf.nxtgrd_zinc.AddRow(gameList_Zinc.Length);
  Conf.nxtgrd_zinc.BeginUpdate;
  for inode_zinc := 0 to gameList_Zinc.Length - 1 do
    begin
      node_gameZinc := gameList_Zinc.Item[inode_zinc];
      Conf.nxtgrd_zinc.Cell[1,inode_zinc].AsString := GetNodeAttrStr(node_gameZinc,'GameName');
      if GetNodeAttrStr(node_gameZinc,'RomName','') <> '' then
        Conf.nxtgrd_zinc.Cell[2,inode_zinc].AsString := GetNodeAttrStr(node_gameZinc,'RomName')
      else
        Conf.nxtgrd_zinc.Cell[2,inode_zinc].AsString := '';
      if GetNodeAttrStr(node_gameZinc,'IfGameExists','') <> '' then
        Conf.nxtgrd_zinc.Cell[3,inode_zinc].AsInteger := 32
      else
        Conf.nxtgrd_zinc.Cell[3,inode_zinc].AsInteger := 33;
      Conf.nxtgrd_zinc.Cell[4,inode_zinc].AsString := GetNodeAttrStr(node_gameZinc,'RunGameNumber');
      if GetNodeAttrStr(node_gameZinc,'BiosName','') <> '' then
        Conf.nxtgrd_zinc.Cell[5,inode_zinc].AsString := GetNodeAttrStr(node_gameZinc,'BiosName')
      else
        Conf.nxtgrd_zinc.Cell[5,inode_zinc].AsString := '';
      if GetNodeAttrStr(node_gameZinc,'Parent','') <> '' then
        Conf.nxtgrd_zinc.Cell[6,inode_zinc].AsString := GetNodeAttrStr(node_gameZinc,'Parent')
      else
        Conf.nxtgrd_zinc.Cell[6,inode_zinc].AsString := '';
    end;
  BestFitForZincGrid;
  Conf.nxtgrd_zinc.EndUpdate;
end;

procedure SetUpTheGrid;
begin
  Conf.nxtgrd_zinc.Columns.Add(TNxIncrementColumn,'ID');
  Conf.nxtgrd_zinc.Columns.Add(TNxTextColumn,'Game Name');
  Conf.nxtgrd_zinc.Columns.Add(TNxTextColumn,'Rom Name');
  Conf.nxtgrd_zinc.Columns.Add(TNxImageColumn,'Roms');
  Conf.nxtgrd_zinc.Columns.Add(TNxTextColumn,'Run ID');
  Conf.nxtgrd_zinc.Columns.Add(TNxTextColumn,'Bios Name');
  Conf.nxtgrd_zinc.Columns.Add(TNxTextColumn,'Parent');
  Conf.nxtgrd_zinc.Columns[0].Alignment := taCenter;
  Conf.nxtgrd_zinc.Columns[0].Header.Alignment := taCenter;
  Conf.nxtgrd_zinc.Columns[0].Width := 40;
  Conf.nxtgrd_zinc.Columns[1].Width := 200;
  Conf.nxtgrd_zinc.Columns[3].Alignment := taCenter;
  Conf.nxtgrd_zinc.Columns[3].Header.Alignment := taCenter;
  Conf.nxtgrd_zinc.Columns[4].Alignment := taCenter;
  Conf.nxtgrd_zinc.Columns[4].Header.Alignment := taCenter;
  TNxImageColumn(Conf.nxtgrd_zinc.Columns[3]).Images := Conf.InBitBtn_Imagelist;
end;

procedure BestFitForZincGrid;
begin
  Conf.nxtgrd_zinc.BestFitColumn(0,bfboth);
  Conf.nxtgrd_zinc.BestFitColumn(1,bfboth);
  Conf.nxtgrd_zinc.BestFitColumn(2,bfBoth);
  Conf.nxtgrd_zinc.BestFitColumn(3,bfHeader);
  Conf.nxtgrd_zinc.BestFitColumn(4,bfBoth);
  Conf.nxtgrd_zinc.BestFitColumn(5,bfBoth);
end;

end.
