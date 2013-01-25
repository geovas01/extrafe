unit vitru_key;

interface

uses
  Classes,Graphics,SysUtils,
  GLScene,GLHUDObjects,GLObjects,GLMaterial,GLBitmapFont,
  VectorGeometry,GLRenderContextInfo,BaseClasses,
  uBaseButton,
  used_pro,main;

const
  fKeys: array [0..35] of string = ('1','2','3','4','5','6','7','8','9','0','Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z','X','C','V','B','N','M');

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
    constructor Create(LetterName: WideChar; width,height,PosX,PosY: Integer; PressedState: Boolean);
  end;

  TVirtualKeyboard = class(TGLBaseSceneObject)
  protected
    fMatlib: TGLMaterialLibrary;
    fKeyFont: TGLCustomBitmapFont;
    fVK_Text: TGLHUDText;
    fVK_SearchText: TGLHUDText;
    fvisible: Boolean;
    fButtonsList: TList;

    fMousePosition: TVector;
    fMouseInBox: Boolean;
    fMainDummy: TGlDummyCube;
    fPanelBack: TGLHudSprite;
    fPanelSelection: TGLHudSprite;
    fPanelSearch: TGLHUDSprite;

    procedure MainInitVK(Matlib: TGLMaterialLibrary; VKFont: TGLCustomBitmapFont);
    procedure InitHuds;

  public
    property VK_visible: Boolean read fvisible;

    function GetItemByIndex(aIndex: Integer): TSimpleButton;
    function GetIndexByItem(aItem: TSimpleButton): Integer;

    procedure CreteKeyboard;

    procedure DoProgress(const progressTime: TProgressTimes); override;
    Procedure DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean); override;
    constructor Create(AOwner: TComponent; aMatLib: TGLMaterialLibrary; aVK_Key: TGLCustomBitmapFont); reintroduce;
    constructor CreateAsChild(aParentOwner: TGLBaseSceneObject; aMatLib: TGLMaterialLibrary; aVK_Key: TGLCustomBitmapFont);
    destructor Destroy; override;

  end;

var
  MyButton: TGUIAlphaButton;
  MyText: TGLHUDText;

implementation

uses
  GLCrossPlatform;


{ TVirtualKeyboard }

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

//procedure TVirtualKeyboard.CreateVKeyboard;
//const
//
//begin
//
//end;

procedure TVirtualKeyboard.CreteKeyboard;
const
  breakLines: array [0..2] of Integer = (9,19,28);
var
  i,x,y,k: integer;
begin
  for i := 0 to 35 do
    begin
      if i < breakLines[0] then
        k := 0
      else if i < breakLines[1] then
        k := 1
      else if i < breakLines[2] then
        k := 2
      else
        k := 3;
      case k of
        0 : y := 2;
        1 : y := 38;
        2 : y := 74;
        3 : y := 110;
      end;
      x := (i * 34) + (2 * i);
      MyButton := TGUIAlphaButton.CreateAsChild(fMainDummy);
      MyButton.Name := 'MyButton_' +  IntToStr(i); 
      MyButton.SetMaterials('VK_ButtonUp','VK_ButtonDown',MatLib);
      MyButton.Position.SetPoint(x,y,0);
      MyButton.Visible := True;

      y := y + 17;
      x := x + 17;
      MyText := TGLHUDText.CreateAsChild(fMainDummy);
      MyText.Name := 'MyText_' + IntToStr(i);
      MyText.Text := fkeys[i];
      MyText.Position.SetPoint(x,y,0);
      MyText.Visible := True;
    end;
end;

destructor TVirtualKeyboard.Destroy;
var
  i: integer;
  comp: TComponent;
begin
  while fButtonsList.Count > 0 do
    begin
      GetItemByIndex(0).Free;
      fButtonsList.Delete(0);
    end;
//  for i := 0 to 35 do
//    begin
//
//    end;
  inherited Destroy;
end;

procedure TVirtualKeyboard.DoProgress(const progressTime: TProgressTimes);
begin
  inherited;
  
end;

procedure TVirtualKeyboard.DoRender(var ARci: TRenderContextInfo;
  ARenderSelf, ARenderChildren: Boolean);
begin
  inherited;
  fPanelBack.Position.X := Position.X;
  fPanelBack.Position.Y := Position.Y;
  fPanelBack.DoRender(ARci,True,False);
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
  fMainDummy.Visible := True;

  fVK_Text := TGLHUDText.CreateAsChild(fMainDummy);
  fVK_Text.BitmapFont := fKeyFont;
  fVK_Text.ModulateColor.AsWinColor := clWhite;
  fVK_Text.Layout := tlCenter;

  fPanelBack:= AddPanel('VK_BackGround');
  CreteKeyboard;
end;

procedure TVirtualKeyboard.MainInitVK(Matlib: TGLMaterialLibrary;
  VKFont: TGLCustomBitmapFont);
var
  i: integer;
begin
  fButtonsList := TList.Create;
  for i := 0 to 35 do
    fButtonsList.Add(@fKeys[i]);
  fKeyFont := VKFont;
  fMatlib := MatLib;
  InitHuds();
end;

{ TSimpleButton }

constructor TSimpleButton.Create(LetterName: WideChar; width, height, PosX,
  PosY: Integer; PressedState: Boolean);
begin
  inherited Create;
  fWidth := width;
  fHeight := height;
  fPosX := PosX;
  fPosY := PosY;
  fState := PressedState;
  fCarryLetter := LetterName;
end;

end.
