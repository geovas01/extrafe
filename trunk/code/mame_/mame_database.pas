unit mame_database;

interface

uses
  Windows, SysUtils,Controls,StdCtrls, Buttons,
  Variants, Classes, Graphics, Forms,ComCtrls, ExtCtrls,
  comobj, FunctionX,NxColumnClasses,NxCustomGridControl,
  OmniXML,OmniXMLUtils;

  procedure SetMame_DatabaseFromMameIni;

  procedure RunMameDataBase;
  procedure GetMameXML;
  procedure GetTheXMLToMemory;
  procedure SetTheGridForSetup;
  procedure UrlMame(SetMame: String);
  procedure SetCursorToBusy(AreBusy:Boolean);
  procedure ShowResults_MameDatabase;

  procedure MameDatabase_Clear;

implementation


uses
  main,mainconf,mame_dirs,menu,form_splash;


procedure RunMameDatabase;
begin
  MenuButton6;
  DisableMenuButtons(False);
  GetMameXML;
  GetTheXMLToMemory;
  FromDatabase := True;
  StartEmuMame;
  FromDatabase := False;
  DisableMenuButtons(True);
  Screen.Cursor := crDefault;
  Conf.grp115.Visible := True;
  Conf.sComboBox72.Visible := True;
  Conf.sComboBox72.Items.Add(ExtractFilePath(Mame_Exe)+'\roms');
  Conf.sLabel108.Caption := 'Directory : All';
  Conf.sLabel109.Caption := 'Overall Status';
  Conf.nxtgrd_mame.Height := 407;
  Conf.sGauge_MameData.Progress := 100;
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
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'RomPath1');
  Conf.nxtgrd_mame.Columns[0].Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[0].Header.Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[1].Width := 200;
  Conf.nxtgrd_mame.Columns[3].Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[3].Header.Alignment := taCenter;
  Conf.nxtgrd_mame.Columns[7].Visible := False;
  TNxImageColumn(Conf.nxtgrd_mame.Columns[3]).Images := Conf.InBitBtn_Imagelist;
  {Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Display Type');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Rotate');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Display Width');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Display Height');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Diplay Refresh');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Sound Channels');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Players');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Players Buttons');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Coins');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Service Mode');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Tilt');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Joystich Type');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Game Status');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Emulation Status');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Color Status');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Sound Status');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Graphics Status');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Coctail');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Save State');
  Conf.nxtgrd_mame.Columns.Add(TNxTextColumn,'Palette Size');}
  {conf.nxtgrd_mame.Cell[3,conf.nxtgrd_mame.LastAddedRow].AsString := GetNodeTextStr(nodegame,'year');
  if node.Attributes.GetNamedItem('cloneof') <> nil then
    conf.nxtgrd_mame.Cell[4,conf.nxtgrd_mame.LastAddedRow].AsString := GetNodeAttrStr(nodegame,'cloneof');
  conf.nxtgrd_mame.Cell[4,conf.nxtgrd_mame.LastAddedRow].AsString := GetNodeAttrStr(nodegame,'manufacturer');
  conf.nxtgrd_mame.Cell[4,conf.nxtgrd_mame.LastAddedRow].AsString := GetNodeAttrStr(nodedisplay,'type');}
end;

procedure GetTheXMLToMemory;
var
  xmlDoc: IXMLDocument;
  mamever,nodegame: IXMLNode;
  gameList : IXMLNodeList;
  iNode,FinalRomsFound,rowCount: Integer;
  RomFound: Boolean;
  GameRomName,PathXmlMame: String;
  rec : TSearchRec;
  FGa: TGauseStream;
begin
  Conf.sLabel109.Caption := 'Please Wait Getting XML File To Memory...';
  Application.ProcessMessages;
  RomFound := False;
  FinalRomsFound := 0;
  rowCount := 0;
  Screen.Cursor := AniBusy;
  try
    XMLDoc := CreateXMLDoc;
    FGa := TGauseStream.Create;
    try
      XMLDoc.PreserveWhiteSpace := True;
      PathXmlMame := Program_Path+'media\emulators\arcade\mame\xmlfiles\'+ExtractFileName(Mame_Exe);
      Delete(PathXmlMame,Length(PathXmlMame)-3,4);
      FGa.LoadFromFile(PathXmlMame+'.xml');
      FGa.Gause := Conf.sGauge_MameData;
      XMLDoc.LoadFromStream(FGa);
    finally
      Conf.sLabel109.Caption := 'Getting Results from MameXML and Default rom directory (Please Wait...)';
      SetTheGridForSetup;
      mamever := xmlDoc.SelectSingleNode('mame');
      Conf.sLabel104.Caption := 'Mame Version (Build) : '+GetNodeAttrStr(mamever,'build');
      gameList := xmlDoc.SelectNodes('/mame/game');
      Conf.nxtgrd_mame.AddRow(gameList.Length+1);
      conf.nxtgrd_mame.BeginUpdate;
      for iNode := 0 to gameList.Length - 1 do
        begin
          Application.ProcessMessages;
          nodegame := gameList.Item[iNode];
          conf.nxtgrd_mame.Cell[1,rowCount].AsString := GetNodeTextStr(nodegame,'description');
          GameRomName := GetNodeAttrStr(nodegame,'name');
          conf.nxtgrd_mame.Cell[2,rowCount].AsString := GameRomName;
          if GetNodeTextStr(nodegame,'manufacturer','') <> '' then
            Conf.nxtgrd_mame.Cell[4,rowCount].AsString := GetNodeTextStr(nodegame,'manufacturer');
          if GetNodeTextStr(nodegame,'year','') <> '' then
            Conf.nxtgrd_mame.Cell[5,rowCount].AsString := GetNodeTextStr(nodegame,'year');
          if GetNodeAttrStr(nodegame,'cloneof','') <> '' then
            Conf.nxtgrd_mame.Cell[6,rowCount].AsString := GetNodeAttrStr(nodegame,'cloneof');
          if FindFirst(ExtractFilePath(Mame_Exe)+'\roms\*.*' , faAnyFile, Rec) = 0 then
            begin
              repeat
                if ((Rec.Attr and faDirectory) <> faDirectory) then
                begin
                  if Rec.Name = GameRomName+'.zip' then
                  begin
                    Conf.nxtgrd_mame.Cell[3,rowCount].AsInteger := 32;
                    RomFound := True;
                    FinalRomsFound := FinalRomsFound + 1;
                    Break;
                  end;
                end;
              until FindNext(Rec) <> 0;
            end;
          if RomFound = False then
          Conf.nxtgrd_mame.Cell[3,rowCount].AsInteger := 33;
          Conf.nxtgrd_mame.Cell[7,rowCount].AsString := ExtractFilePath(Mame_Exe)+'roms';
          RomFound := False;
          rowCount := rowCount + 1;
          Conf.sGauge_MameData.Progress := (100 * iNode) div (gameList.Length-1);
          Conf.sGauge_MameData.Suffix := '% ('+IntToStr(iNode)+'/'+IntToStr(gameList.Length -1)+')';
        end;
      Conf.nxtgrd_mame.Cell[1,rowCount].AsString := Conf.sLabel104.Caption;
      Conf.nxtgrd_mame.Cell[2,rowCount].AsString := 'Overall Emulated : '+IntToStr(iNode);
      Conf.nxtgrd_mame.Cell[4,rowCount].AsString := 'Roms Found : '+IntToStr(FinalRomsFound);
      Conf.nxtgrd_mame.Row[rowCount].Visible := False;
      Conf.nxtgrd_mame.EndUpdate;
      Conf.nxtgrd_mame.BestFitColumn(0,bfboth);
      Conf.nxtgrd_mame.BestFitColumn(2,bfBoth);
      Conf.nxtgrd_mame.BestFitColumn(3,bfHeader);
      Conf.nxtgrd_mame.BestFitColumn(5,bfBoth);
      Conf.nxtgrd_mame.BestFitColumn(6,bfBoth);
      Conf.sLabel106.Caption := 'Overall Emulated : '+IntToStr(iNode);
      Conf.sLabel107.Caption := 'Roms Found : '+IntToStr(FinalRomsFound);
      UrlMame(ExtractFileName(Mame_Exe));
      Application.ProcessMessages;
      XMLDoc := nil;
    end;
  finally
    Conf.sGauge_MameData.Suffix := '%';
    Conf.sLabel109.Caption := 'Saving the Mame Database...';
    Application.ProcessMessages;
    Conf.nxtgrd_mame.SaveToXMLFile(PathXmlMame+'_efuse.xml');
  end;
end;

procedure GetMameXML;
var
  PathXmlMame: String;
begin
  Conf.nxtgrd_mame.Height := 1;
  Conf.nxtgrd_mame.Columns.Clear;
  Conf.nxtgrd_mame.ClearRows;
  Conf.nxtgrd_mame.Caption := 'I Have no Data to Show.';
  Conf.sGauge_MameData.Progress := 0;
  Conf.sLabel109.Caption := 'Generating Mame XML...';
  Application.ProcessMessages;
  PathXmlMame := Program_Path+'media\emulators\arcade\mame\xmlfiles\'+ExtractFileName(Mame_Exe);
  Delete(PathXmlMame,Length(PathXmlMame)-3,4);
  RunCaptured(ExtractFileDrive(Mame_Exe),Mame_Exe,' -lx',PathXmlMame+'.xml');
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
  xmlDoc: IXMLDocument;
  nodegame: IXMLNode;
  gameList : IXMLNodeList;
  iNode,rowCount: Integer;
  PathXmlMame: String;
  FGa: TGauseStream;
begin
  PathXmlMame := Program_Path+'media\emulators\arcade\mame\xmlfiles\'+ExtractFileName(Mame_Exe);
  Delete(PathXmlMame,Length(PathXmlMame)-3,4);
  if FromDatabase = false then
    begin
      if FileExists(PathXmlMame+'_efuse.xml') then
        begin
          try
            XMLDoc := CreateXMLDoc;
            FGa := TGauseStream.Create;
            try
              Splash_Screen.sLabel1.Caption := 'Loading Mame Database...';
              Application.ProcessMessages;
              XMLDoc.PreserveWhiteSpace := True;
              FGa.LoadFromFile(PathXmlMame+'_efuse.xml');
              FGa.Gause := Splash_Screen.sGauge1;
              XMLDoc.LoadFromStream(FGa);
            finally
              SetTheGridForSetup;
              Splash_Screen.sLabel1.Caption := 'Setting Mame Database...';
              gameList := xmlDoc.SelectNodes('/NxGrid/Row');
              Conf.nxtgrd_mame.AddRow(gameList.Length);
              conf.nxtgrd_mame.BeginUpdate;
              for iNode := 0 to gameList.Length - 1 do
                begin
                  nodegame := gameList.Item[iNode];
                  Conf.nxtgrd_mame.Cell[1,rowCount].AsString := GetNodeTextStr(nodegame,'GameName');
                  Conf.nxtgrd_mame.Cell[2,rowCount].AsString := GetNodeTextStr(nodegame,'RomName');
                  Conf.nxtgrd_mame.Cell[3,rowCount].AsInteger := GetNodeTextInt(nodegame,'Roms');
                  Conf.nxtgrd_mame.Cell[4,rowCount].AsString := GetNodeTextStr(nodegame,'Manufactor');
                  Conf.nxtgrd_mame.Cell[5,rowCount].AsString := GetNodeTextStr(nodegame,'Year');
                  if GetNodeTextStr(nodegame,'CloneOf','') <> '' then
                    Conf.nxtgrd_mame.Cell[6,rowCount].AsString := GetNodeTextStr(nodegame,'CloneOf');
                  rowCount := rowCount + 1;
                  Splash_Screen.sGauge1.Progress := (100 * iNode) div (gameList.Length-1);
                  Application.ProcessMessages;
                end;
              Conf.sLabel104.Caption := Conf.nxtgrd_mame.Cell[1,rowCount-1].AsString;
              UrlMame(ExtractFileName(Mame_Exe));
              Conf.sLabel106.Caption := Conf.nxtgrd_mame.Cell[2,rowCount-1].AsString;
              Conf.sLabel107.Caption := Conf.nxtgrd_mame.Cell[4,rowCount-1].AsString;
              Conf.sLabel108.Caption := 'Directory : All';
              Conf.nxtgrd_mame.Row[rowCount-1].Visible := False;
              Conf.nxtgrd_mame.EndUpdate;
              Conf.nxtgrd_mame.BestFitColumn(0,bfboth);
              Conf.nxtgrd_mame.BestFitColumn(2,bfBoth);
              Conf.nxtgrd_mame.BestFitColumn(3,bfHeader);
              Conf.nxtgrd_mame.BestFitColumn(5,bfBoth);
              Conf.nxtgrd_mame.BestFitColumn(6,bfBoth);
            end;
            XMLDoc := nil;
          finally
            Conf.sComboBox72.ItemIndex := 0;
            Conf.sGauge_MameData.Progress := 100;
          end;
        end;
    end;
  Started := False;
end;

procedure ShowResults_MameDatabase;
var
  xmlDoc: IXMLDocument;
  nodegame: IXMLNode;
  gameList : IXMLNodeList;
  k: Integer;
begin
  if Conf.sComboBox72.Text = 'Overall Roms' then
    SetMame_DatabaseFromMameIni
  else if Conf.sComboBox72.Text = 'Missing Roms' then
    begin

    end
  else
    begin
    
    end;
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

end.
