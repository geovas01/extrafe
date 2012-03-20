unit psxdata;

interface

uses
  Inifiles,Forms,SysUtils,NxColumnClasses,Classes;

{  procedure CreatepSXDatabasefromdat;
  procedure pSXUpDateDatabase;
  procedure pSXGamesFind;
  procedure listGamseCountry(country: String);}


implementation

uses
  main,mame_database,FunctionX,mainconf;

{procedure CreatepSXDatabasefromdat;
var
  pSXDat: TIniFile;
  nGameTitle,nGameId,nVersionTested,nRegion,nWorks,nComments,nGenre,nDeveloper,nPublisher,nReleaseDay,nPlayers : String;
  games,games1,i,psxi,times,k: Integer;
  gamespal,gamesusa,gamesjapan: Integer;
  GetpSXExe,GetpSXPath,GetVer: String;
  ifpsxfind: Variant;
begin
  GetpSXExe := pSXIni.ReadString('Path','ExeName',GetpSXExe);
  GetpSXPath := pSXIni.ReadString('Path','FullDir',GetpSXPath);
  GetVer := pSXIni.ReadString('Path','psxVer',GetVer);
  psxi := 0;
  Conf.sGauge1.Visible := True;
  Conf.sGauge1.Progress := 0;
  Conf.sGauge1.Suffix := '...';
  Conf.sLabel4.Visible := true;
  Conf.sLabel4.Caption := 'Adding Games to Database... (This will take some time)';
  Application.ProcessMessages;
  StartDatabase;
  Conf.ZTable.TableName := 'Emulators';
  Conf.ZTable.Open;
  Conf.ZTable.First;
  While Not Conf.ZTable.Eof do
    begin
      ifpsxfind := Conf.ZTable.FieldByName('Name').Value;
      if ifpsxfind = 'pSX' then
        psxi := 1;
      Conf.ZTable.Next;
    end;
  Conf.ZTable.First;
  if psxi = 1 then
    begin
      While Not Conf.ZTable.Eof do
        begin
          Conf.ZTable.Edit;
          ifpsxfind := Conf.ZTable.FieldByName('Name').Value;
          if ifpsxfind = 'pSX' then
            begin
              Conf.ZTable.FieldByName('Name').Value := 'pSX';
              Conf.ZTable.FieldByName('NameExe').Value := GetpSXExe;
              Conf.ZTable.FieldByName('Path').Value := GetpSXPath;
              Conf.ZTable.FieldByName('Ver').Value := GetVer;
              Conf.ZTable.FieldByName('SortDesc1').Value := 'pSX - Great Playstation 1 emulator';
              Conf.ZTable.Post;
            end;
          Conf.ZTable.Next;
        end;
    end
  else
    begin
      Conf.ZTable.Last;
      with Conf.ZTable do
        begin
          Insert;
          FieldByName('Name').Value := 'pSX';
          FieldByName('NameExe').Value := GetpSXExe;
          FieldByName('Path').Value := GetpSXPath;
          FieldByName('Ver').Value := GetVer;
          FieldByName('SortDesc1').Value := 'pSX - Great Playstation 1 emulator';
          Post;
        end;
    end;
  Conf.ZTable.Close;
  k := 0;
  for times := 0 to 2 do
    begin
      case times of
        0 : begin
              pSXDat := TIniFile.Create(Program_Path+'media\emulators\consoles\playstation\psxemulator\datfiles\playstationpal.dat');
              gamespal := pSXDat.ReadInteger('Totalgames','Total',gamespal);
            end;
        1 : begin
              pSXDat := TIniFile.Create(Program_Path+'media\emulators\consoles\playstation\psxemulator\datfiles\playstationus.dat');
              gamesusa := pSXDat.ReadInteger('Totalgames','Total',gamesusa);
            end;
        2 : begin
              pSXDat := TIniFile.Create(Program_Path+'media\emulators\consoles\playstation\psxemulator\datfiles\playstationjapan.dat');
              gamesjapan := pSXDat.ReadInteger('Totalgames','Total',gamesjapan);
            end;
      end;
      games := pSXDat.ReadInteger('TotalGames','Total',games);
      Conf.ZTable.TableName := 'pSXRoms';
      Conf.ZTable.Open;
      For i := 0 to games do
        begin
          nGameTitle := pSXDat.ReadString(IntToStr(i),'GameTitle',nGameTitle);
          nGameId := pSXDat.ReadString(IntToStr(i),'GameId',nGameId);
          nDeveloper := pSXDat.ReadString(IntToStr(i),'Developer',nDeveloper);
          nPublisher := pSXDat.ReadString(IntToStr(i),'Publisher',nPublisher);
          nReleaseDay := pSXDat.ReadString(IntToStr(i),'ReleaseDay',nReleaseDay);
          nRegion := pSXDat.ReadString(IntToStr(i),'Region',nRegion);
          nGenre := pSXDat.ReadString(IntToStr(i),'Genre',nGenre);
          nPlayers := pSXDat.ReadString(IntToStr(i),'Players',nPlayers);
          nVersionTested := pSXDat.ReadString(IntToStr(i),'versiontested',nVersionTested);
          nWorks := pSXDat.ReadString(IntToStr(i),'works',nWorks);
          nComments := pSXDat.ReadString(IntToStr(i),'comments',nComments);
          k := k + 1;
          with Conf.ZTable do
            begin
              Insert;
              FieldByName('id').Text := IntToStr(k);
              FieldByName('GameTitle').Text := nGameTitle;
              FieldByName('GameDir').Text := '';
              FieldByName('GameId').Text := nGameId;
              FieldByName('Region').Text := nRegion;
              FieldByName('Genre').Text := nGenre;
              FieldByName('Players').Text := nPlayers;
              FieldByName('Developer').Text := nDeveloper;
              FieldByName('Publisher').Text := nPublisher;
              FieldByName('ReleaseDay').Text := nReleaseDay;
              FieldByName('VersionTested').Text := nVersionTested;
              FieldByName('Works').Text := nWorks;
              FieldByName('Comments').Text := nComments;
              post;
            end;
          Conf.sGauge1.Progress := (100 * i) div (games);
          Conf.sGauge1.Suffix := '% ('+IntToStr(i)+'/'+IntToStr(games)+')';
          Application.ProcessMessages;
        end;
    end;
  Times := 0;
  PsxIni.WriteInteger('Totalgames','Total',(gamespal+gamesusa+gamesjapan));
  Conf.ZTable.Close;
  pSXDat.Free;
//  CloseDatabase;
  Compact(Program_Path+'ExtraFE.efe');
  Conf.sLabel4.Caption := 'Find More Information just click on Database Statistics for pSX.';
  Application.ProcessMessages;
  Conf.Close;
  Conf.ShowModal;
end;

procedure pSXUpDateDatabase;
var
  i,k,l: Integer;
  aD,bD,cD,a,b,c,d: String;
begin
  Application.ProcessMessages;
//  i := Conf.Grid1.RowCount;
//  StartDatabase;
//  Conf.sGauge13.Visible := true;
  DatabaseData('pSXRoms','SELECT id,GameTitle,GameDir,Region,GameId FROM pSXRoms','ORDER BY id ASC');
  While Not Conf.ZTable.Eof do
    begin
      aD := Conf.ZTable.FieldByName('GameTitle').Text;
      bD := Conf.ZTable.FieldByName('Region').Text;
      cD := Conf.ZTable.FieldByName('GameId').Text;
      for k := 0 to i-1 do
        begin
//          b := Conf.Grid1.Cell[1,k].AsString;
//          c := Conf.Grid1.Cell[2,k].AsString;
//          d := Conf.Grid1.Cell[4,k].AsString;
//          a := Conf.Grid1.Cell[5,k].AsString;
          if (b = aD) and (a = bD) and (cD = d) then
            begin
              Conf.ZTable.Edit;
              if c = '<<Click to set the game>>' then
                c := '';
              Conf.ZTable.FieldByName('GameDir').AsString := c;
              Conf.ZTable.Post;
            end;
        end;
      l := l + 1;
//      Conf.sGauge13.Progress := (100 * l) div (i-1);
      Application.ProcessMessages;
      Conf.ZTable.Next;
    end;
//  CloseDatabase;
//  Conf.sGauge13.Visible := false;
  pSXGamesFind;
//  Conf.sGauge3.Progress := (i * pSXGF) div (i-1);
//  if pSXGF = 0 then
//    Conf.sGauge3.Suffix := ' Games found please add some'
//  else if pSXGF = 1 then
//    Conf.sGauge3.Suffix := ' Game ready to play from Database'
//  else if pSXGF > 1 then
//    Conf.sGauge3.Suffix := ' Games ready to play from Database';
  {if Conf.N2.Checked = true then
    Conf.N2.Click;
//  Conf.Grid1.ClearRows;
//  Conf.Grid1.Columns.Clear;
end;

procedure pSXGamesFind;
var
  a: String;
  i: Integer;
begin

//      StartDatabase;
      DatabaseData('pSXRoms','Select GameDir From pSXRoms ','');
      i := 0;
      While Not Conf.ZTable.Eof do
        begin
          a := Conf.ZTable.FieldByName('GameDir').Text;
          if a <> '' then
            i := i + 1;
          Conf.ZTable.Next;
        end;
//      CloseDatabase;
//      pSXGF := i;

end;

procedure listGamseCountry(country: String);
var
  a,b: String;
  i,k: Integer;
begin

//      StartDatabase;
      DatabaseData('pSXRoms','SELECT Works,Region FROM pSXRoms','');
      i := 0;
      k := 0;
      While Not Conf.ZTable.Eof do
        begin
          a := Conf.ZTable.FieldByName('Works').Text;
          b := Conf.ZTable.FieldByName('Region').Text;
          if b = country then
            begin
              i := i + 1;
              if a = 'YES' then
                k := k + 1;
            end;
          Conf.ZTable.Next;
        end;
//      CloseDatabase;
//      pSXGFC := i;
//      pSXGFCW := k;
end;
}
end.
