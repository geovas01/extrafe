unit zinc_database;

interface

uses
  SysUtils,Forms,Controls,IniFiles,ExtCtrls,Classes,
  NxGrid,NxColumnClasses,NxCustomGridControl,
  NativeXml,
  slabel;

  procedure CreateFirstTimeZincDatabase;

  procedure SetZinc_DatabaseFromZincIni;
  procedure SetUpTheGrid;
  procedure BestFitForZincGrid;

// Menu actions
  procedure Show_zinc_databasepanel;
  procedure em_zinc_database_ShowDynamicComps;
  procedure em_zinc_database_FreeDynamicComps;


var
  FXml_Zinc: TNativeXml;
  Zinc_Ver: String;
  Zinc_RomsS,Zinc_RomsF: Integer;


implementation

uses
  main,mainconf,menu,onflycomponents,FunctionX,
  zinc_paths,zinc_graphics,zinc_sound;

procedure CreateFirstTimeZincDatabase;
var
  ZincFile: TextFile;
  text,t1,t2,t3: string;
  r,r1 : Integer;
  count,rownum: Byte;
  GameFound: Boolean;
  rec : TSearchRec;
  node: TXmlNode;
begin
  if Started = False then
    begin
      Conf.nxtgrd_zinc.ClearRows;
      Conf.nxtgrd_zinc.Columns.Clear;
    end;
  FXml_Zinc := TNativeXml.CreateName('Zinc');
  FXml_Zinc.XmlFormat := xfReadable;
  RunCaptured(ExtractFileDrive(FullPathZinc_Exe),FullPathZinc_Exe+Zinc_Exe,' --list-games',ZincDatabaseFile+'.txt');
  AssignFile(ZincFile,ZincDatabaseFile+'.txt');
  Reset(ZincFile);
  SetupTheGrid;
  Conf.nxtgrd_zinc.AddRow(71);
  Conf.nxtgrd_zinc.BeginUpdate;
  rownum := 0;
  Zinc_RomsF := 0;
  while not Eof(ZincFile) do
    begin
      Readln(ZincFile,text);
      r := Pos(' ',text);
      t1 := Trim(Copy(text,0,r));
      if t1 <> 'ZiNc' then
        begin
          count := 0;
          GameFound := False;
          node := FXml_Zinc.Root.NodeNew('row');
          t2 := Trim(Copy(text,1,Length(text)));
          r := Pos(' ',t2);
          t1 := Trim(Copy(t2,0,r));
          Conf.nxtgrd_zinc.Cell[4,rownum].AsString := t1;
          node.WriteAttributeInteger('RunGameNumber',StrToInt(t1));
          t1 := Trim(Copy(t2,r,Length(t2)));
          r := Pos('[',t1);
          t2 := Trim(Copy(t1,0,r-1));
          Conf.nxtgrd_zinc.Cell[1,rownum].AsString := t2;
          node.WriteAttributeString('GameName',t2);
          t2 := Trim(Copy(t1,r+1,Length(t1)-(r+1)));
          repeat
            count := count + 1;
            r := Pos(',',t2);
            if r <> 0 then
              t1 := Trim(Copy(t2,0,r-1))
            else
              t1 := t2;
            case count of
              1 : begin
                    node.WriteAttributeString('RomName',t1);
                    node.WriteAttributeString('ParentName',' ');
                    node.WriteAttributeString('BiosName',' ');
                    if FindFirst(Zinc_RomsPath+'\*.*' , faAnyFile, Rec) = 0 then
                      begin
                        repeat
                          if ((Rec.Attr and faDirectory) <> faDirectory) then
                            begin
                              if Rec.Name = t1+'.zip' then
                                begin
                                  node.WriteAttributeString('IfGameExists','ok');
                                  Conf.nxtgrd_zinc.Cell[2,rownum].AsString := t1;
                                  Conf.nxtgrd_zinc.Cell[3,rownum].AsInteger := 32;
                                  GameFound := True;
                                  Zinc_RomsF := Zinc_RomsF + 1;
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
                        node.WriteAttributeString('ParentName',t1);
                        Conf.nxtgrd_zinc.Cell[6,rownum].AsString := t1;
                      end
                    else
                      begin
                        t1 := Trim(Copy(t2,Length(t3)+1,Length(t2) - Length(t3)));
                        node.WriteAttributeString('BiosName',t1);
                        Conf.nxtgrd_zinc.Cell[5,rownum].AsString := t1;
                      end;
                  end;
              3 : begin
                    r1 := Pos(' ',t2);
                    t3 := Trim(Copy(t2,0,r1));
                    t1 := Trim(Copy(t2,r1,Length(t3)));
                    node.WriteAttributeString('BiosName',t1);
                    Conf.nxtgrd_zinc.Cell[5,rownum].AsString := t1;
                  end;
            end;
            t2 := Trim(Copy(t2,r+1,Length(t2)-r));
          until r = 0;
          if GameFound = False then
            begin
              Conf.nxtgrd_zinc.Cell[3,rownum].AsInteger := 33;
              node.WriteAttributeString('IfGameExists',' ');
            end;
          rownum := rownum + 1;
        end
      else
        begin
          t1 := Trim(Copy(text,r,Length(text)-r));
          r := Pos(' ',t1);
          t2 := Trim(Copy(t1,0,r));
          FXml_Zinc.Root.AttributeAdd('ZincVer',t2);
          FXml_Zinc.Root.AttributeAdd('RomsSupported','71');
          Zinc_Ver := t2;
          Zinc_RomsS := 71;
        end;
    end;
  Conf.nxtgrd_zinc.EndUpdate;
  CloseFile(ZincFile);
  DeleteFile(ZincDatabaseFile+'.txt');
  FXml_Zinc.SaveToFile(ZincDatabaseFile+'.xml');
  Zinc_Config := TIniFile.Create(Zinc_ini);
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Exe',Zinc_Exe);
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Path',FullPathZinc_Exe);
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Roms',FullPathZinc_Exe+'roms');
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Snaps',FullPathZinc_Exe+'snaps');
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Renderer',FullPathZinc_Exe+'renderer.cfg');
  Zinc_Config.WriteString('Zinc_Paths','Zinc_Sound',FullPathZinc_Exe+'zinc_sound.cfg');
  if FileExists(FullPathZinc_Exe +'ogl_renderer.znc') then
    Zinc_Config.WriteBool('Zinc_Files','Zinc_OpenGL',True)
  else
    Zinc_Config.WriteBool('Zinc_Files','Zinc_OpenGL',False);
  if FileExists(FullPathZinc_Exe + 'd3d_renderer.znc') then
    Zinc_Config.WriteBool('Zinc_Files','Zinc_D3D',True)
  else
    Zinc_Config.WriteBool('Zinc_Files','Zinc_D3D',False);
  if FileExists(FullPathZinc_Exe + 's11player.dll') then
    Zinc_Config.WriteBool('Zinc_Files','Zinc_SoundDll',True)
  else
     Zinc_Config.WriteBool('Zing_Files','Zinc_SoundDll',False);
  Zinc_Config.WriteString('Zinc_Conf','Graphics','OpenGL');
  Screen.Cursor := crDefault;
end;

procedure SetZinc_DatabaseFromZincIni;
var
  i,count: Integer;
begin
  SetUpTheGrid;
  Count:= 0;
  Conf.nxtgrd_zinc.AddRow(71);
  Zinc_RomsS := 71;
  Zinc_RomsF := 0;
  Conf.nxtgrd_zinc.BeginUpdate;
  with FXml_Zinc.Root do
    for i := 2 to NodeCount - 1 do
      begin
        Conf.nxtgrd_zinc.Cell[1,count].AsString := Nodes[i].Nodes[1].Value;
        Conf.nxtgrd_zinc.Cell[2,count].AsString := Nodes[i].Nodes[2].Value;
        if Nodes[i].Nodes[5].Value <> ' ' then
          begin
            Conf.nxtgrd_zinc.Cell[3,count].AsInteger := 32;
            Zinc_RomsF := Zinc_RomsF + 1;
          end
        else
          Conf.nxtgrd_zinc.Cell[3,count].AsInteger := 33;
        Conf.nxtgrd_zinc.Cell[4,count].AsString := Nodes[i].Nodes[0].Value;
        Conf.nxtgrd_zinc.Cell[5,count].AsString := Nodes[i].Nodes[3].Value;
        Conf.nxtgrd_zinc.Cell[6,count].AsString := Nodes[i].Nodes[4].Value;
        count := count + 1;
      end;
  Zinc_Ver := FXml_Zinc.Root.ReadAttributeString('ZincVer');
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

///////////////////////////////////////////////////////////////////

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
              3,590,97,75,i,'',True,False);
        2 : Image_Comp(Conf.Pem_zinc_database,'media\confeditor\images\zinc\zinc_image.png',
              580,483,150,175,i,'',True,False);
        3 : Image_Comp(Conf.Pem_zinc_database,'media\confeditor\images\zinc\database.png',
              576,2,151,71,i,'',True,False);
      end;
    end;
  for i := 1 to 5 do
    begin
      case i of
        1 : Label_Comp(Conf.Pem_zinc_database,'Rom Path: ' + Conf.sEdit54.Text,20,50,i,'',True,True,True);
        2 : Label_Comp(Conf.grp35,'Zinc Ver : ' + Zinc_Ver,10,30,i,'',True,True,True);
        3 : Label_Comp(Conf.grp35,'Zinc Name : ' + Zinc_Exe,10,50,i,'',True,True,True);
        4 : Label_Comp(Conf.grp35,'Zinc Roms Supported : ' + IntToStr(Zinc_RomsS),10,70,i,'',True,True,True);
        5 : Label_Comp(Conf.grp35,'Zinc Roms Found : ' + IntToStr(Zinc_RomsF),10,90,i,'',True,True,True);
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
  for i := 1 to 5 do
    begin
      Comp := FindComponentEx('Conf.Label'+IntToStr(i));
      TsLabel(Comp).Free;
    end;
end;

end.
