unit hatari_xmlext;

interface

uses
  OmniXML, OmniXMLProperties,OmniXMLUtils;

{type
  TRowHatari_Game = class(TGpXMLData)
    private
      function GetGameName: WideString;
      procedure SetGameName(const Value: WideString);
      function GetRomName: WideString;
      procedure SetRomName(const Value: WideString);
      function GetParentName: WideString;
      procedure SetParentName(const Value: WideString);
      function GetBiosName: WideString;
      procedure SetBiosName(const Value: WideString);
      function GetIfGameExists: WideString;
      procedure SetIfGameExists(const Value: WideString);
    public
      constructor Create(Node: IXMLNode); override;

      property GameName : WideString  read GetGameName write SetGameName;
      property RomName: WideString read GetRomName write SetRomName;
      property ParentName: WideString read GetParentName write SetParentName;
      property BiosName: WideString read GetBiosName write SetBiosName;
      property IfGameExists: WideString  read GetIfGameExists write SetIfGameExists;
  end;

  TRowsZinc_AddGames = class(TGpXMLList)
  protected
    function GetRowZinc_Game(Value: integer): TRowZinc_Game;
  public
    constructor Create(ParentNode: IXMLNode); reintroduce;

    function AddRow: TRowZinc_Game; reintroduce;

    property RowsZinc_AddGames[Value: integer]: TRowZinc_Game read GetRowZinc_Game; default;
  end;

  TData_Games = class(TGpXmlDocList)
  private
    fRows: TRowsZinc_AddGames;
    function GetZincVer: WideString;
    procedure SetZincVer(const Value: WideString);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    property ZincVer: WideString read GetZincVer write SetZincVer;

    property Rows: TRowsZinc_AddGames read fRows;
  end;}

implementation

{//TRowZinc_Game rows properties...
constructor TRowZinc_Game.Create(Node: IXMLNode);
begin
  inherited;

  InitChildNodes(['RunGameNumber', 'GameName', 'RomName', 'ParentName', 'BiosName','IfGameExists'],['', '', '', '', '','']);
end;

function TRowZinc_Game.GetRunGameNummber;
begin
  Result := GetXMLAttrPropInt(0);
end;

procedure TRowZinc_Game.SetRunGameNumber(const Value: Integer);
begin
  SetXMLAttrPropInt(0, Value);
end;

function TRowZinc_Game.GetGameName;
begin
  Result := GetXMLAttrPropWide(1);
end;

procedure TRowZinc_Game.SetGameName(const Value: WideString);
begin
  SetXMLAttrPropWide(1, Value);
end;

function TRowZinc_Game.GetRomName;
begin
  Result := GetXMLAttrPropWide(2);
end;

procedure TRowZinc_Game.SetRomName(const Value: WideString);
begin
  SetXMLAttrPropWide(2, Value);
end;

function TRowZinc_Game.GetParentName;
begin
  Result := GetXMLAttrPropWide(3);
end;

procedure TRowZinc_Game.SetParentName(const Value: WideString);
begin
  SetXMLAttrPropWide(3, Value);
end;

function TRowZinc_Game.GetBiosName;
begin
  Result := GetXMLAttrPropWide(4);
end;

procedure TRowZinc_Game.SetBiosName(const Value: WideString);
begin
  SetXMLAttrPropWide(4, Value);
end;

function TRowZinc_Game.GetIfGameExists;
begin
  Result := GetXMLAttrPropWide(5);
end;

procedure TRowZinc_Game.SetIfGameExists(const Value: WideString);
begin
  SetXMLAttrPropWide(5, Value);
end;

//TRowsZinc_AddGames properties...
constructor TRowsZinc_AddGames.Create(parentNode: IXMLNode);
begin
  inherited Create(parentNode, '', 'rowgamestatus', TRowZinc_Game);
end;

function TRowsZinc_AddGames.AddRow: TRowZinc_Game;
begin
  result := TRowZinc_Game(inherited Add);
end;

function TRowsZinc_AddGames.GetRowZinc_Game(Value: Integer): TRowZinc_Game;
begin
  Result := TRowZinc_Game(inherited Items[Value]);
end;

//TData_Games properties
constructor TData_Games.Create;
var
  xmlPI: IXMLProcessingInstruction;
begin
  inherited Create('ZincDatabase', '', '', nil);

  xmlPI := XMLDoc.CreateProcessingInstruction('xml', 'version="1.0" encoding="utf-8"');
  XMLDoc.InsertBefore(xmlPI, node);

  InitChildNodes(['Zinc_Version'], ['']);

  fRows := TRowsZinc_AddGames.Create(Node);
end;

function TData_Games.GetZincVer;
begin
  Result := GetXMLAttrPropWide(0);
end;

procedure TData_Games.SetZincVer(const Value: WideString);
begin
  SetXMLAttrPropWide(0, Value);
end;

destructor TData_Games.Destroy;
begin
  fRows.Free;

  inherited;
end;}

end.
