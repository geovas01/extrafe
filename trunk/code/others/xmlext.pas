unit xmlext;

interface

uses
  OmniXML, OmniXMLProperties,OmniXMLUtils;

type
  TRowPath = class(TGpXMLData)
  private
    function GetMameName: WideString;
    procedure SetMameName(const Value: WideString);
    function GetPathId: Integer;
    procedure SetPathId(const Value: Integer);
    function GetRomPath: WideString;
    procedure SetRomPath(const Value: WideString);
    function GetRomsFound: Integer;
    procedure SetRomsFound(const Value: Integer);
  public
    constructor Create(Node: IXMLNode); override;

    property MameName: WideString read GetMameName write SetMameName;
    property PathId: Integer read GetPathId write SetPathId;
    property RomPath: WideString read GetRomPath write SetRomPath;
    property RomsFound: Integer read GetRomsFound write SetRomsFound;
  end;

  TRowsPath = class(TGpXMLList)
  protected
    function GetRowPath(Value: integer): TRowPath;
  public
    constructor Create(ParentNode: IXMLNode); reintroduce;

    function AddPath: TRowPath; reintroduce;

    property RowsPath[Value: integer]: TRowPath read GetRowPath; default;
  end;

  TRow = class(TGpXMLData)
  private
    function GetId: Integer;
    procedure SetId(const Value: Integer);
    function GetGameName: WideString;
    procedure SetGameName(const Value: WideString);
    function GetRomName: WideString;
    procedure SetRomName(const Value: WideString);
    function GetManufactor: WideString;
    procedure SetManufactor(const Value: WideString);
    function GetYear: WideString;
    procedure SetYear(const Value: WideString);
    function GetCloneOf: WideString;
    procedure SetCloneOf(const Value: WideString);
    function GetPathOf: WideString;
    procedure SetPathOf(const Value: WideString);
  public
    constructor Create(Node: IXMLNode); override;

    property Id: integer read GetId write SetId;
    property GameName: WideString read GetGameName write SetGameName;
    property RomName: WideString read GetRomName write SetRomName;
    property Manufactor: WideString read GetManufactor write SetManufactor;
    property Year: WideString read GetYear write SetYear;
    property CloneOf: WideString read GetCloneOf write SetCloneOf;
    property PathOf: WideString read GetPathOf write SetPathOf;
  end;

  TRows = class(TGpXMLList)
  protected
    function GetRow(Value: integer): TRow;
  public
    constructor Create(ParentNode: IXMLNode); reintroduce;

    function Add: TRow; reintroduce;

    property Rows[Value: integer]: TRow read GetRow; default;
  end;

  TMameXML = class(TGpXmlDocList)
  private
    fRows: TRows;
    function GetVer: WideString;
    procedure SetVer(const Value: WideString);
    function GetMameExeName: WideString;
    procedure SetMameExeName(const Value: WideString);
    function GetRomsEmulated: Integer;
    procedure SetRomsEmulated(const Value: Integer);
    function GetFinalRomsFound: Integer;
    procedure SetFinalRomsFound(const Value: Integer);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    property Ver: WideString read GetVer write SetVer;
    property MameExeName: WideString read GetMameExeName write SetMameExeName;
    property RomsEmulated: Integer read GetRomsEmulated write SetRomsEmulated;
    property FinalRomsFound: Integer read GetFinalRomsFound write SetFinalRomsFound;

    property Rows: TRows read fRows;
  end;

  TMameXMLPath = class(TGpXmlDocList)
  private
    fRowsPath: TRowsPath;
    function GetCondition: WideString;
    procedure SetCondition(const Value: WideString);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    property Condition: WideString read GetCondition write SetCondition;

    property RowsPath: TRowsPath read fRowsPath;
  end;

implementation

constructor TRow.Create(Node: IXMLNode);
begin
  inherited;

  InitChildNodes(['id', 'GameName', 'RomName', 'Manufactor', 'Year', 'CloneOf','PathOf'],
    ['', '', '', '', '', '', '']);
end;

//TRow rows properties...
function TRow.GetId;
begin
  Result := GetXMLAttrPropInt(0);
end;

procedure TRow.SetId(const Value: Integer);
begin
  SetXMLAttrPropInt(0, Value);
end;

function TRow.GetGameName;
begin
  Result := GetXMLAttrPropWide(1);
end;

procedure TRow.SetGameName(const Value: WideString);
begin
  SetXMLAttrPropWide(1, Value);
end;

function TRow.GetRomName;
begin
  Result := GetXMLAttrPropWide(2);
end;

procedure TRow.SetRomName(const Value: WideString);
begin
  SetXMLAttrPropWide(2, Value);
end;

function TRow.GetManufactor;
begin
  Result := GetXMLAttrPropWide(3);
end;

procedure TRow.SetManufactor(const Value: WideString);
begin
  SetXMLAttrPropWide(3, Value);
end;

function TRow.GetYear;
begin
  Result := GetXMLAttrPropWide(4);
end;

procedure TRow.SetYear(const Value: WideString);
begin
  SetXMLAttrPropWide(4, Value);
end;

function TRow.GetCloneOf;
begin
  Result := GetXMLAttrPropWide(5);
end;

procedure TRow.SetCloneOf(const Value:WideString);
begin
  SetXMLAttrPropWide(5, Value);
end;

function TRow.GetPathOf;
begin
  Result := GetXMLAttrPropWide(6);
end;

procedure TRow.SetPathOf(const Value: WideString);
begin
  SetXMLAttrPropWide(6, Value);
end;

constructor TRowPath.Create(Node: IXMLNode);
begin
  inherited;

  InitChildNodes(['MameName', 'PathId', 'RomPath', 'RomsFound'], ['', '', '', '']);

end;

//TRowPath rows properties...
function TRowPath.GetMameName: WideString;
begin
  Result := GetXMLAttrPropWide(0);
end;
procedure TRowPath.SetMameName(const Value: WideString);
begin
  SetXMLAttrPropWide(0, Value);
end;

function TRowPath.GetPathId: Integer;
begin
  Result := GetXMLAttrPropInt(1);
end;
procedure TRowPath.SetPathId(const Value: Integer);
begin
  SetXMLAttrPropInt(1, Value);
end;
function TRowPath.GetRomPath: WideString;
begin
  Result := GetXMLAttrPropWide(2);
end;

procedure TRowPath.SetRomPath(const Value: WideString);
begin
  SetXMLAttrPropWide(2, Value);
end;

function TRowPath.GetRomsFound: Integer;
begin
  Result := GetXMLAttrPropInt(3);
end;

procedure TRowPath.SetRomsFound(const Value: Integer);
begin
  SetXMLAttrPropInt(3, Value);
end;

constructor TRows.Create(parentNode: IXMLNode);
begin
  inherited Create(parentNode, '', 'row', TRow);
end;

constructor TRowsPath.Create(parentNode: IXMLNode);
begin
  inherited Create(parentNode, '', 'rowpath', TRowPath);
end;

function TRows.Add: TRow;
begin
  result := TRow(inherited Add);
end;

function TRowsPath.AddPath: TRowPath;
begin
  result := TRowPath(inherited Add);
end;

function TRows.GetRow(Value: Integer): TRow;
begin
  Result := TRow(inherited Items[Value]);
end;

function TRowsPath.GetRowPath(Value: Integer): TRowPath;
begin
  Result := TRowPath(inherited Items[Value]);
end;

constructor TMameXML.Create;
var
  xmlPI: IXMLProcessingInstruction;
begin
  inherited Create('MameInfo', '', '', nil);

  xmlPI := XMLDoc.CreateProcessingInstruction('xml', 'version="1.0" encoding="utf-8"');
  XMLDoc.InsertBefore(xmlPI, node);

  InitChildNodes(['ver', 'MameExeName', 'RomsEmulated', 'FinalRomsFound'], ['', '', '', '']);

  fRows := TRows.Create(node);
end;

function TMameXml.GetVer: WideString;
begin
  Result := GetXMLAttrPropWide(0);
end;

procedure TMameXml.SetVer(const Value: WideString);
begin
  SetXMLAttrPropWide(0, Value);
end;

function TMameXML.GetMameExeName: WideString;
begin
  Result := GetXMLAttrPropWide(1);
end;

procedure TMameXML.SetMameExeName(const Value: WideString);
begin
  SetXMLAttrPropWide(1,Value);
end;

function TMameXML.GetRomsEmulated: Integer;
begin
  Result := GetXMLAttrPropInt(2);
end;

procedure TMameXML.SetRomsEmulated(const Value: Integer);
begin
  SetXMLAttrPropInt(2, Value);
end;

function TMameXML.GetFinalRomsFound: Integer;
begin
  Result := GetXMLAttrPropInt(3);
end;

procedure TMameXML.SetFinalRomsFound(const Value: Integer);
begin
  SetXMLAttrPropInt(3, Value);
end;

constructor TMameXMLPath.Create;
var
  xmlPI: IXMLProcessingInstruction;
begin
  inherited Create('MamePath', '', '', nil);

  xmlPI := XMLDoc.CreateProcessingInstruction('xml', 'version="1.0" encoding="utf-8"');
  XMLDoc.InsertBefore(xmlPI, node);

  InitChildNodes(['Condition'], ['']);

  fRowsPath := TRowsPath.Create(node);
end;

function TMameXMLPath.GetCondition;
begin
  Result := GetXMLAttrPropWide(0);
end;

procedure TMameXMLPath.SetCondition(const Value: WideString);
begin
  SetXMLAttrPropWide(0, Value);
end;

destructor TMameXML.Destroy;
begin
  fRows.free;

  inherited;
end;

destructor TMameXMLPath.Destroy;
begin
  fRowsPath.free;

  inherited;
end;

end.
