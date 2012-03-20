unit ce_xmlext;


interface

uses
  OmniXML, OmniXMLProperties,OmniXMLUtils;

type
  TRowCe_Themes = class(TGpXMLData)
    private
      function GetThemeNumber: Integer;
      procedure SetThemeNumber(const Value:Integer);
    public
      constructor Create(Node: IXMLNode); override;

      property ThemeNumber: Integer read GetThemeNumber write SetThemeNumber;
  end;

  TRowsCe_Themes = class(TGpXMLList)
  protected
    function GetRowCe_Themes(Value: integer): TRowCe_Themes;
  public
    constructor Create(ParentNode: IXMLNode); reintroduce;

    function AddRow: TRowCe_Themes; reintroduce;

    property RowsCe_Themes[Value: integer]: TRowCe_Themes read GetRowCe_Themes; default;
  end;

  TRowCe_Config = class(TGpXMLData)
    private
      function GetHelpInCaption: Boolean;
      procedure SetHelpInCaption(const Value:Boolean);
      function GetHelpInMainMenu: Boolean;
      procedure SetHelpInMainMenu(const Value:Boolean);
      function GetWindowsEffect: WideString;
      procedure SetWindowsEffect(const Value:WideString);
      function GetEffectsTime: Integer;
      procedure SetEffectsTime (const Value:Integer);
    public
      constructor Create(Node: IXMLNode); override;

      property HelpInCaption: Boolean read GetHelpInCaption write SetHelpInCaption;
      property HelpInMainMenu: Boolean read GetHelpInMainMenu write SetHelpInMainMenu;
      property WindowsEffects: WideString read GetWindowsEffect write SetWindowsEffect;
      property EffectsTime: Integer  read GetEffectsTime write SetEffectsTime;
  end;

  TRowsCe_Config = class(TGpXMLList)
  protected
    function GetRowCe_Config(Value: integer): TRowCe_Config;
  public
    constructor Create(ParentNode: IXMLNode); reintroduce;

    function AddRow: TRowCe_Config; reintroduce;

    property RowsCe_Config[Value: integer]: TRowCe_Config read GetRowCe_Config; default;
  end;

  TCE_Configuration = class(TGpXmlDocList)
  private
    fRows: TRowsCe_Themes;
    fRows_Conf: TRowsCe_Config;
    function GetVer: WideString;
    procedure SetVer(const Value: WideString);
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    property Ver: WideString read GetVer write SetVer;

    property Rows: TRowsCe_Themes read fRows;
    property Rows_Conf: TRowsCe_Config  read fRows_Conf;
  end;

implementation

//TRowCe_Themes rows properties...
constructor TRowCe_Themes.Create(Node: IXMLNode);
begin
  inherited;

  InitChildNodes(['ThemeNumber'],['']);
end;

function TRowCe_Themes.GetThemeNumber;
begin
  Result := GetXMLAttrPropInt(0);
end;

procedure TRowCe_Themes.SetThemeNumber(const Value: Integer);
begin
  SetXMLAttrPropInt(0, Value);
end;

//TRowsCe_Themes properties...
constructor TRowsCe_Themes.Create(parentNode: IXMLNode);
begin
  inherited Create(parentNode, '', 'rowtheme', TRowCe_Themes);
end;

function TRowsCe_Themes.AddRow: TRowCe_Themes;
begin
  result := TRowCe_Themes(inherited Add);
end;

function TRowsCe_Themes.GetRowCe_Themes(Value: Integer): TRowCe_Themes;
begin
  Result := TRowCe_Themes(inherited Items[Value]);
end;

//TRowCe_Config properties...
constructor TRowCe_Config.Create(Node: IXMLNode);
begin
  inherited;

  InitChildNodes(['HelpInCaption', 'HelpInMainMenu', 'WindowsEffects', 'EffectsTime'],['', '', '', '']);
end;

function TRowCe_Config.GetHelpInCaption;
begin
  Result := GetXMLAttrPropBool(0);
end;

procedure TRowCe_Config.SetHelpInCaption(const Value: Boolean);
begin
  SetXMLAttrPropBool(0, Value);
end;

function TRowCe_Config.GetHelpInMainMenu;
begin
  Result := GetXMLAttrPropBool(1);
end;

procedure TRowCe_Config.SetHelpInMainMenu(const Value: Boolean);
begin
  SetXMLAttrPropBool(1, Value);
end;

function TRowCe_Config.GetWindowsEffect;
begin
  Result := GetXMLAttrPropWide(2);
end;

procedure TRowCe_Config.SetWindowsEffect(const Value: WideString);
begin
  SetXMLAttrPropWide(2, Value);
end;

function TRowCe_Config.GetEffectsTime;
begin
  Result := GetXMLAttrPropInt(3);
end;

procedure TRowCe_Config.SetEffectsTime(const Value: Integer);
begin
  SetXMLAttrPropInt(3, Value);
end;

//TRowsCe_Config properties...
constructor TRowsCe_Config.Create(parentNode: IXMLNode);
begin
  inherited Create(parentNode, '', 'rowconfig', TRowCe_Config);
end;

function TRowsCe_Config.AddRow: TRowCe_Config;
begin
  result := TRowCe_Config(inherited Add);
end;

function TRowsCe_Config.GetRowCe_Config(Value: Integer): TRowCe_Config;
begin
  Result := TRowCe_Config(inherited Items[Value]);
end;

//CE_Configuration properties
constructor TCe_Configuration.Create;
var
  xmlPI: IXMLProcessingInstruction;
begin
  inherited Create('confEditor', '', '', nil);

  xmlPI := XMLDoc.CreateProcessingInstruction('xml', 'version="1.0" encoding="utf-8"');
  XMLDoc.InsertBefore(xmlPI, node);

  InitChildNodes(['Ver'], ['']);

  fRows := TRowsCe_Themes.Create(Node);
  fRows_Conf := TRowsCe_Config.Create(Node);
end;

function TCE_Configuration.GetVer;
begin
  Result := GetXMLAttrPropWide(0);
end;

procedure TCE_Configuration.SetVer(const Value: WideString);
begin
  SetXMLAttrPropWide(0, Value);
end;

destructor TCE_Configuration.Destroy;
begin
  fRows.Free;

  inherited;
end;
end.
 