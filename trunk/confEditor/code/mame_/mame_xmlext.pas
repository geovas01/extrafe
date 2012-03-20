unit mame_xmlext;

interface

uses
  OmniXML, OmniXMLProperties,OmniXMLUtils;

type

/// Row dirs for mame config.xml
  TRowDir = class(TGpXMLData)
  private
    function GetMameName: WideString;
    procedure SetMameName(const Value:WideString);
    function GetMamePath: WideString;
    procedure SetMamePath(const Value:WideString);
    function GetSelected: Integer;
    procedure SetSelected(const Value: Integer);
    function GetCabinetName: WideString;
    procedure SetCabinetName(const Value:WideString);
    function GetFlyerName: WideString;
    procedure SetFlyerName(const Value:WideString);
    function GetMarqueesName: WideString;
    procedure SetMarqueesName(const Value:WideString);
    function GetControlPanelName: WideString;
    procedure SetControlPanelName(const Value:WideString);
    function GetPcbName: WideString;
    procedure SetPcbName(const Value:WideString);
    function GetArtworkPreviewName: WideString;
    procedure SetArtworkPreviewName(const Value:WideString);
    function GetTitleName: WideString;
    procedure SetTitleName(const Value:WideString);
    function GetSelectName: WideString;
    procedure SetSelectName(const Value:WideString);
    function GetScoreName: WideString;
    procedure SetScoreName(const Value:WideString);
    function GetBossName: WideString;
    procedure SetBossName(const Value:WideString);
  public
    constructor Create(Node: IXMLNode); override;

    property MameName: WideString read GetMameName write SetMameName;
    property MamePath: WideString  read GetMamePath write SetMamePath;
    property Selected: Integer read GetSelected write SetSelected;
    property Cabinets: WideString read GetCabinetName write SetCabinetName;
    property Flyers: WideString read GetFlyerName write SetFlyerName;
    property Marquees: WideString read GetMarqueesName write SetMarqueesName;
    property Control_Panels: WideString read GetControlPanelName write SetControlPanelName;
    property PCBs: WideString read GetPcbName write SetPcbName;
    property Artwork_Preview: WideString read GetArtworkPreviewName write SetArtworkPreviewName;
    property Titles: WideString read GetTitleName write SetTitleName;
    property Select: WideString read GetSelectName write SetSelectName;
    property Scores: WideString read GetScoreName write SetScoreName;
    property Bosses: WideString read GetBossName write SetBossName;
  end;

  TRowsDir = class(TGpXMLList)
  protected
    function GetRowDir(Value: integer): TRowDir;
  public
    constructor Create(ParentNode: IXMLNode); reintroduce;

    function AddRowDir: TRowDir; reintroduce;

    property RowsDir[Value: integer]: TRowDir read GetRowDir; default;
  end;

/// Row path for mame config.xml
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

/// Row for mame *_efuse.xml  
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
    function GetIpsChecked: WideString;
    procedure SetIpsChecked(const Value: WideString);
    function GetHiScoreChecked: WideString;
    procedure SetHiScoreChecked(const Value: WideString);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    property Ver: WideString read GetVer write SetVer;
    property MameExeName: WideString read GetMameExeName write SetMameExeName;
    property RomsEmulated: Integer read GetRomsEmulated write SetRomsEmulated;
    property FinalRomsFound: Integer read GetFinalRomsFound write SetFinalRomsFound;
    property IpsChecked: WideString read GetIpsChecked write SetIpsChecked;
    property HiScoreChecked: WideString read GetHiScoreChecked write SetHiScoreChecked;    

    property Rows: TRows read fRows;
  end;

  TMameXMLPath = class(TGpXmlDocList)
  private
    fRowsPath: TRowsPath;
    fRowsDirs: TRowsDir;
    function GetCondition: WideString;
    procedure SetCondition(const Value: WideString);
    function GetSelected: Integer;
    procedure SetSelected(const Value: Integer);
    function GetFullPathOfSelectedMame: WideString;
    procedure SetFullPathOfSelectedMame(const Value: WideString);
    function GetSelectedMame: WideString;
    procedure SetSelectedMame(const Value: WideString);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    property Condition: WideString read GetCondition write SetCondition;
    property Selected: Integer read GetSelected write SetSelected;
    property SelectedMame: WideString read GetSelectedMame write SetSelectedMame;
    property FullPathOfSelectedMame: WideString read GetFullPathOfSelectedMame write SetFullPathOfSelectedMame;

    property RowsPath: TRowsPath read fRowsPath;
    property RowsDir: TRowsDir read fRowsDirs;
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

constructor TRowDir.Create(Node: IXMLNode);
begin
  inherited;

  InitChildNodes(['MameName', 'MamePath', 'Selected', 'Cabinets', 'Flyers', 'Marquess', 'Control_Panels', 'Pcbs', 'Artwork_Preview', 'Titles', 'Select', 'Scores', 'Bosses'], ['', '', '', '', '', '', '', '', '', '', '', '', '']);
end;

//TRowDir row properties...
function TRowDir.GetMameName: WideString;
begin
  Result := GetXMLAttrPropWide(0);
end;

procedure TRowDir.SetMameName(const Value: WideString);
begin
  SetXMLAttrPropWide(0, Value);
end;

function TRowDir.GetMamePath: WideString;
begin
  Result := GetXMLAttrPropWide(1);
end;

procedure TRowDir.SetMamePath(const Value:WideString);
begin
  SetXMLAttrPropWide(1, Value);
end;

function TRowDir.GetSelected: Integer;
begin
  Result := GetXMLAttrPropInt(2);
end;

procedure TRowDir.SetSelected(const Value:Integer);
begin
  SetXMLAttrPropInt(2 ,Value);
end;

function TRowDir.GetCabinetName: WideString;
begin
  Result := GetXMLAttrPropWide(3);
end;

procedure TRowDir.SetCabinetName(const Value: WideString);
begin
  SetXMLAttrPropWide(3, Value);
end;

function TRowDir.GetFlyerName: WideString;
begin
  Result := GetXMLAttrPropWide(4);
end;

procedure TRowDir.SetFlyerName(const Value: WideString);
begin
  SetXMLAttrPropWide(4, Value);
end;

function TRowDir.GetMarqueesName: WideString;
begin
  Result := GetXMLAttrPropWide(5);
end;

procedure TRowDir.SetMarqueesName(const Value: WideString);
begin
  SetXMLAttrPropWide(5, Value);
end;

function TRowDir.GetControlPanelName: WideString;
begin
  Result := GetXMLAttrPropWide(6);
end;

procedure TRowDir.SetControlPanelName(const Value: WideString);
begin
  SetXMLAttrPropWide(6, Value);
end;

function TRowDir.GetPcbName: WideString;
begin
  Result := GetXMLAttrPropWide(7);
end;

procedure TRowDir.SetPcbName(const Value: WideString);
begin
  SetXMLAttrPropWide(7, Value);
end;

function TRowDir.GetArtworkPreviewName: WideString;
begin
  Result := GetXMLAttrPropWide(8);
end;

procedure TRowDir.SetArtworkPreviewName(const Value: WideString);
begin
  SetXMLAttrPropWide(8, Value);
end;

function TRowDir.GetTitleName: WideString;
begin
  Result := GetXMLAttrPropWide(9);
end;

procedure TRowDir.SetTitleName(const Value: WideString);
begin
  SetXMLAttrPropWide(9, Value);
end;

function TRowDir.GetSelectName: WideString;
begin
  Result := GetXMLAttrPropWide(10);
end;

procedure TRowDir.SetSelectName(const Value: WideString);
begin
  SetXMLAttrPropWide(10, Value);
end;

function TRowDir.GetScoreName: WideString;
begin
  Result := GetXMLAttrPropWide(11);
end;

procedure TRowDir.SetScoreName(const Value: WideString);
begin
  SetXMLAttrPropWide(11, Value);
end;

function TRowDir.GetBossName: WideString;
begin
  Result := GetXMLAttrPropWide(12);
end;

procedure TRowDir.SetBossName(const Value: WideString);
begin
  SetXMLAttrPropWide(12, Value);
end;

constructor TRowsDir.Create(parentNode: IXMLNode);
begin
  inherited Create(parentNode, '', 'rowdir', TRowDir);
end;

function TRowsDir.AddRowDir: TRowDir;
begin
  result := TRowDir(inherited Add);
end;

function TRowsDir.GetRowDir(Value: Integer): TRowDir;
begin
  Result := TRowDir(inherited Items[Value]);
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

  InitChildNodes(['ver', 'MameExeName', 'RomsEmulated', 'FinalRomsFound','IpsChecked','HiScoreChecked'], ['', '', '', '', '', '']);

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

function TMameXML.GetIpsChecked: WideString;
begin
  Result := GetXMLAttrPropWide(4);
end;

procedure TMameXML.SetIpsChecked(const Value: WideString);
begin
  SetXMLAttrPropWide(4 ,Value);
end;

function TMameXML.GetHiScoreChecked: WideString;
begin
  Result := GetXMLAttrPropWide(5);
end;

procedure TMameXML.SetHiScoreChecked(const Value: WideString);
begin
  SetXMLAttrPropWide(5 ,Value);
end;


constructor TMameXMLPath.Create;
var
  xmlPI: IXMLProcessingInstruction;
begin
  inherited Create('MamePath', '', '', nil);

  xmlPI := XMLDoc.CreateProcessingInstruction('xml', 'version="1.0" encoding="utf-8"');
  XMLDoc.InsertBefore(xmlPI, node);

  InitChildNodes(['Condition', 'Selected', 'SelectedMame', 'FullPathOfSelectedMame'], ['', '', '', '']);

  fRowsPath := TRowsPath.Create(node);
  fRowsDirs := TRowsDir.Create(node);
end;

function TMameXMLPath.GetCondition;
begin
  Result := GetXMLAttrPropWide(0);
end;

procedure TMameXMLPath.SetCondition(const Value: WideString);
begin
  SetXMLAttrPropWide(0, Value);
end;

function TMameXMLPath.GetSelected;
begin
  Result := GetXMLAttrPropInt(1);
end;

procedure TMameXMLPath.SetSelected(const Value: Integer);
begin
  SetXMLAttrPropInt(1, Value);  
end;

function TMameXMLPath.GetSelectedMame;
begin
  Result := GetXMLAttrPropWide(2);
end;

procedure TMameXMLPath.SetSelectedMame(const Value: WideString);
begin
  SetXMLAttrPropWide(2, Value);
end;

function TMameXMLPath.GetFullPathOfSelectedMame;
begin
  Result := GetXMLAttrPropWide(3);
end;

procedure TMameXMLPath.SetFullPathOfSelectedMame(const Value: WideString);
begin
  SetXMLAttrPropWide(3, Value);
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
