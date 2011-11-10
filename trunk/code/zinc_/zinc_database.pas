unit zinc_database;

interface

uses
  zinc_xmlext,OmniXML,OmniXMLUtils,OmniXMLProperties,FunctionX,SysUtils,Forms,Controls;

  procedure CreateFirstTimeDatabase;


var
  ZincData_XmlDoc: IXMLDocument;
  ZincData_Xml: TData_Games;
  RowGame: TRowZinc_Game;
  node_gameZinc: IXMLNode;
  gameList_Zinc : IXMLNodeList; 
  
implementation

uses
  main,mainconf,zinc_paths;

procedure CreateFirstTimeDatabase;
var
  ZincFile: TextFile;
  text,t1,t2,t3: string;
  r,r1 : Integer;
  count: Byte;
begin
  ZincData_XmlDoc := CreateXMLDoc;
  ZincData_Xml := TData_Games.Create;
  RunCaptured(ExtractFileDrive(FullPathZinc_Exe),Zinc_Exe,' --list-games',ZincDatabaseFile+'.txt');
  Screen.Cursor := crDefault;
  AssignFile(ZincFile,ZincDatabaseFile+'.txt');
  Reset(ZincFile);
  while not Eof(ZincFile) do
    begin
      Readln(ZincFile,text);
      r := Pos(' ',text);
      t1 := Trim(Copy(text,0,r));
      if t1 <> 'ZiNc' then
        begin
          count := 0;
          RowGame := ZincData_Xml.Rows.AddRow;
          t2 := Trim(Copy(text,1,Length(text)));
          r := Pos(' ',t2);
          t1 := Trim(Copy(t2,0,r));
          RowGame.RunGameNumber := StrToInt(t1);
          t1 := Trim(Copy(t2,r,Length(t2)));
          r := Pos('[',t1);
          t2 := Trim(Copy(t1,0,r-1));
          RowGame.GameName := t2;
          t2 := Trim(Copy(t1,r+1,Length(t1)-(r+1)));
          repeat
            count := count + 1;
            r := Pos(',',t2);
            t1 := Trim(Copy(t2,0,r-1));
            case count of
              1 : RowGame.RomName := t1;
              2 : begin
                    r1 := Pos(' ',t2);
                    t3 := Trim(Copy(t2,0,r1));
                    if t3 = 'parent' then
                      begin
                        t1 := Trim(Copy(t1,r1,Length(t3)));
                        RowGame.ParentName := t1
                      end
                    else
                      begin
                        t1 := Trim(Copy(t2,Length(t3)+1,Length(t2) - Length(t3)));
                        RowGame.BiosName := t1;
                      end;
                  end;
              3 : begin
                    r1 := Pos(' ',t2);
                    t3 := Trim(Copy(t2,0,r1));
                    t1 := Trim(Copy(t2,r1,Length(t3)));
                    RowGame.BiosName := t1;
                  end;
            end;
            t2 := Trim(Copy(t2,r+1,Length(t2)-r));
          until r = 0;
        end
      else
        begin
          t1 := Trim(Copy(text,r,Length(text)-r));
          r := Pos(' ',t1);
          t2 := Trim(Copy(t1,0,r));
          ZincData_Xml.ZincVer := t2;
        end;
    end;
  CloseFile(ZincFile);
  DeleteFile(ZincDatabaseFile+'.txt');
  ZincData_Xml.SaveToFile(ZincDatabaseFile+'.xml',ofIndent);
end;

end.