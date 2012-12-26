unit vitru_key;

interface

uses
  Classes,Graphics,
  GLScene,GLHUDObjects,GLObjects,GLMaterial,GLBitmapFont,
  VectorGeometry,
  uBaseButton,
  used_pro,main;

type
  TSimpleButton = class
  protected
    fPosX: Integer;
    fPosY: Integer;
    fState: Boolean;
    fWidth: Integer;
    fHeight: Integer;
    fCarryLetter: WideChar;
  public
    property state: Boolean read fState;
    property CarryLetter: WideChar read fCarryLetter;
    constructor Create(LetterName: WideChar);
  end;

  TVirtualKeyboard = class(TGLBaseSceneObject)
  protected
    fMatlib: TGLMaterialLibrary;
    fKeyFont: TGLCustomBitmapFont;
    fVK_Text: TGLHUDText;
    fvisible: Boolean;
    fButtonsList: TList;

    fMousePosition: TVector;
    fMouseInBox: Boolean;
    fMainDummy: TGlDummyCube;
    fPanelBack: TGLHudSprite;
    fPanelSelection: TGLHudSprite;
    procedure MainInitVK(Matlib: TGLMaterialLibrary; VKFont: TGLCustomBitmapFont);
    procedure InitHuds;

  public
    property VK_visible: Boolean read fvisible;

    function GetItemByIndex(aIndex: Integer): TSimpleButton;
    function GetIndexByItem(aItem: TSimpleButton): Integer;

    procedure AddNewKey(matlib: TGLMaterialLibrary; KeyFont: TGLCustomBitmapFont; pX,pY: Integer; Kstate: Boolean; Letter: WideChar);
    constructor Create(AOwner: TComponent; aMatLib: TGLMaterialLibrary; aVK_Key: TGLCustomBitmapFont); reintroduce;
    constructor CreateAsChild(aParentOwner: TGLBaseSceneObject; aMatLib: TGLMaterialLibrary; aVK_Key: TGLCustomBitmapFont);
    destructor Destroy; override;

  end;

  procedure LoadTextForKey;

implementation

uses
  GLCrossPlatform;

procedure LoadTextForKey;
begin
//
end;

{ TSimpleButton }

constructor TSimpleButton.Create(LetterName: WideChar);
begin
  inherited Create;
  fCarryLetter := LetterName;
end;

{ TVirtualKeyboard }

procedure TVirtualKeyboard.AddNewKey(matlib: TGLMaterialLibrary;
  KeyFont: TGLCustomBitmapFont; pX, pY: Integer; Kstate: Boolean;
  Letter: WideChar);
begin

end;

constructor TVirtualKeyboard.Create(AOwner: TComponent;
  aMatLib: TGLMaterialLibrary; aVK_Key: TGLCustomBitmapFont);
begin
  inherited Create(AOwner);
  MainInitVK(aMatLib,aVK_Key);
end;

constructor TVirtualKeyboard.CreateAsChild(
  aParentOwner: TGLBaseSceneObject; aMatLib: TGLMaterialLibrary;
  aVK_Key: TGLCustomBitmapFont);
begin
  inherited Create(aParentOwner);
  MainInitVK(aMatLib,aVK_Key);
end;

destructor TVirtualKeyboard.Destroy;
begin
  while fButtonsList.Count > 0 do
    begin
      GetItemByIndex(0).Free;
      fButtonsList.Delete(0);
    end;
  inherited Destroy;
end;

function TVirtualKeyboard.GetIndexByItem(aItem: TSimpleButton): Integer;
begin
  Result := fButtonsList.IndexOf(aItem);
end;

function TVirtualKeyboard.GetItemByIndex(aIndex: Integer): TSimpleButton;
begin
  Result := fButtonsList[aIndex];
end;

procedure TVirtualKeyboard.InitHuds;
function AddPanel(aMaterial: AnsiString): TGLHudSprite;
  begin
    result := TGLHudSprite.CreateAsChild(fMainDummy);
    result.Material.MaterialLibrary := fMatLib;
    result.Material.LibMaterialName := aMaterial;
    if result.Material.GetActualPrimaryTexture <> nil then
      with result.Material.GetActualPrimaryTexture do
      begin
        result.Width := Image.Width;
        result.Height := Image.Height;
      end;
  end;
begin
  fMainDummy := TGLDummyCube.CreateAsChild(Self);
  fMainDummy.Visible := False;

  fVK_Text := TGLHUDText.CreateAsChild(fMainDummy);
  fVK_Text.BitmapFont := fKeyFont;
  fVK_Text.ModulateColor.AsWinColor := clWhite;
  fVK_Text.Layout := tlCenter;

  fPanelBack:= AddPanel('back_key');
end;

procedure TVirtualKeyboard.MainInitVK(Matlib: TGLMaterialLibrary;
  VKFont: TGLCustomBitmapFont);
begin
  fButtonsList := TList.Create;
  fKeyFont := VKFont;
  fMatlib := MatLib;
  InitHuds();  
end;

end.
