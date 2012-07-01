unit uBaseButton;

interface
uses
  Classes,
  GlScene, GlObjects, GlMaterial, GlHudObjects,
  GlRenderContextInfo,
  VectorGeometry,
  BaseClasses;
const
  cst_animHide     = 1;
  cst_animShow     = 2;
  cst_animActive   = 3;
  cst_animShowing = 5;
  cst_animHiding  = 6;
  cst_animActivating = 7;
  cst_animDeActivating = 8;

  cst_animTimeHide = 0;
  cst_animTimeShow = 1;
  cst_animTimeActive = 2;
type
//------------------------------------------------------------------------------
  TGUIBaseInteractiveObject = class;
//------------------------------------------------------------------------------
  THitArea = class
    fRectangle: TVector;
    Function IsHit(aPosition: TVector): Boolean;
  end;
//------------------------------------------------------------------------------
  TMouseState = (ms_MouseOut, ms_MouseIn);
  TOnMouseClick = Procedure (aSender: TGUIBaseInteractiveObject) of object;
//------------------------------------------------------------------------------
  TGUIBaseObject = class(TGLCustomSceneObject)
  protected
    fCommand: Word;
  public
    property Command: Word read fCommand;
  end;
//------------------------------------------------------------------------------
  TGUIBaseAnimatedObject = class(TGUIBaseObject)
  protected
    fAnimationTime: Single;
    fFinishState: Byte;
    fAnimationState: Byte;
  protected
    Function GetAnimationSpeed(const aAnimationState: Byte): Single;
  public
    Procedure DoProgress(const progressTime: TProgressTimes); override;
    Procedure Show; virtual;
    Procedure Hide; virtual;
    Procedure Activate; virtual;
    Procedure DeActivate; virtual;
    Constructor Create(AOwner: TComponent); override;
  end;
//------------------------------------------------------------------------------
  TGUIBaseInteractiveObject = class(TGUIBaseAnimatedObject)
  protected
    fHitArea: THitArea;
    fMouseState: TMouseState;
    fMousePressed: Boolean;
    fOnMouseClick: TOnMouseClick;
  protected
    Procedure ApplyMouseState(aState: TMouseState);
  public
    property OnMouseClick: TOnMouseClick read fOnMouseClick write fOnMouseClick;
    Function IsHit(aPosition: TVector): Boolean;
    Procedure SetMouseState(aMouseX, aMouseY: Single; aIsButtonDown: Boolean);
    Constructor Create(AOwner: TComponent); override;
  end;
//------------------------------------------------------------------------------
  TGUIBaseButton = TGUIBaseInteractiveObject;
//------------------------------------------------------------------------------
  TGUICustomHudButton = class(TGUIBaseButton)
  protected
    fHudSprite: TGlHudSprite;
  protected
    Procedure SetRectHitAreaFromTexture(aMaterial: TGlMaterial);
  public
    Constructor Create(AOwner: TComponent); override;
  end;
//------------------------------------------------------------------------------
  TGUIAlphaButton = class(TGUICustomHudButton)
  protected
    fShowMaterial: TGlMaterial;
    fActiveMaterial: TGlMaterial;
  public
    Procedure DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean); override;
    Procedure SetMaterials(aShowMaterialName: String; aActiveMaterialName: String; aMatLib: TGlMaterialLibrary);
  end;
//------------------------------------------------------------------------------
implementation

uses GLTexture;
Function THitArea.IsHit(aPosition: TVector): Boolean;
begin
  result := (aPosition[0] >= fRectangle[0]) and (aPosition[0] <= fRectangle[2])
        and (aPosition[1] >= fRectangle[1]) and (aPosition[1] <= fRectangle[3]);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
Function TGUIBaseAnimatedObject.GetAnimationSpeed(const aAnimationState: Byte): Single;
begin
  case aAnimationState of
    cst_animShowing:      result := 3;
    cst_animActivating:   result := 5;
    cst_animHiding:       result := -6;
    cst_animDeactivating: result := -4;
  else
    result := 0;
  end;
end;
//------------------------------------------------------------------------------
Procedure TGUIBaseAnimatedObject.DoProgress(const progressTime: TProgressTimes);
var
  Speed: Single;
begin
  inherited DoProgress(progressTime);
  Speed := GetAnimationSpeed(fAnimationState);

  if(Speed <> 0)then
  begin
    fAnimationTime := fAnimationTime + Speed * progressTime.deltaTime;
    
    case fAnimationState of
      cst_animShowing:
        if(fAnimationTime >= cst_animTimeShow) then
        begin
          fAnimationState := cst_animShow;
          fAnimationTime := cst_animTimeShow;
        end;
      cst_animHiding:
        if(fAnimationTime <= cst_animTimeHide) then
        begin
          fAnimationState := cst_animHide;
          fAnimationTime := cst_animTimeHide;
        end;
      cst_animActivating:
        if(fAnimationTime >= cst_animTimeActive) then
        begin
          fAnimationState := cst_animActive;
          fAnimationTime := cst_animTimeActive;
        end;
      cst_animDeactivating:
        if(fAnimationTime <= cst_animTimeShow) then
        begin
          fAnimationState := cst_animShow;
          fAnimationTime := cst_animTimeShow;
        end;
    end;
  end;

    case fFinishState of
      cst_animShow:
      begin
        if(fAnimationState = cst_animHide) or (FAnimationState = cst_animHiding) then
          fAnimationState := cst_animShowing;

        if(fAnimationState = cst_animActive) or (FAnimationState = cst_animActivating)then
          fAnimationState := cst_animDeactivating;
      end;
      cst_animHide:
      begin
        if(fAnimationState = cst_animShow) or (fAnimationState = cst_animShowing) then
          fAnimationState := cst_animHiding;

        if(fAnimationState = cst_animActive) or (fAnimationState = cst_animActivating)then
          fAnimationState := cst_animDeactivating;
      end;
      cst_animActive:
      begin
        if(fAnimationState = cst_animShow) or (fAnimationState = cst_animDeactivating) then
          fAnimationState := cst_animActivating;

        if(fAnimationState = cst_animHide) or (fAnimationState = cst_animHiding) then
          fAnimationState := cst_animShowing;
      end;
    end;
end;
//------------------------------------------------------------------------------
Procedure TGUIBaseAnimatedObject.Show;
begin
  fFinishState := cst_animShow;
end;
//------------------------------------------------------------------------------
Procedure TGUIBaseAnimatedObject.Hide;
begin
  fFinishState := cst_animHide;
end;
//------------------------------------------------------------------------------
Procedure TGUIBaseAnimatedObject.Activate;
begin
  fFinishState := cst_animActive;
end;
//------------------------------------------------------------------------------
Procedure TGUIBaseAnimatedObject.DeActivate;
begin
  fFinishState := cst_animShow;
end;
//------------------------------------------------------------------------------
Constructor TGUIBaseAnimatedObject.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fAnimationTime := cst_animTimeHide;
  fAnimationState := cst_animHide;
  fFinishState := cst_animHide;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
Procedure TGUIBaseInteractiveObject.ApplyMouseState(aState: TMouseState);
begin
  if fMouseState <> aState then
  begin
{    if Assigned(fOnMouseEvent) then
      fOnMouseEvent(self, fState, aState);}
    fMouseState := aState;
    if(aState = ms_MouseIn) then
      Activate();

    if(aState = ms_MouseOut) then
      DeActivate();

    
  end;
end;
//------------------------------------------------------------------------------
Function TGUIBaseInteractiveObject.IsHit(aPosition: TVector): Boolean;
var
  Pos: TVector;
begin
  Pos[0] := aPosition[0] - Position.x;
  Pos[1] := aPosition[1] - Position.y;
  result := fHitArea.IsHit(Pos);
end;
//------------------------------------------------------------------------------
Procedure TGUIBaseInteractiveObject.SetMouseState(aMouseX, aMouseY: Single; aIsButtonDown: Boolean);
begin
  if IsHit(VectorMake(aMouseX, aMouseY, 0)) then
  begin
    ApplyMouseState(ms_MouseIn);
    if aIsButtonDown and not fMousePressed and Assigned(fOnMouseClick) then
      fOnMouseClick(self);
  end
  else
    ApplyMouseState(ms_MouseOut);
    
  fMousePressed := aIsButtonDown;
end;
//------------------------------------------------------------------------------
Constructor TGUIBaseInteractiveObject.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fHitArea := THitArea.Create;
  fMouseState := ms_MouseOut;
  fMousePressed := false;
  fOnMouseClick := nil;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
Procedure TGUICustomHudButton.SetRectHitAreaFromTexture(aMaterial: TGlMaterial);
begin
  fHitArea.fRectangle := VectorMake(-aMaterial.Texture.Image.Width / 2,
                                    -aMaterial.Texture.Image.Height / 2,
                                     aMaterial.Texture.Image.Width / 2,
                                     aMaterial.Texture.Image.Height / 2);
end;
//------------------------------------------------------------------------------
Constructor TGUICustomHudButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fHudSprite := TGlHudSprite.CreateAsChild(self);
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
Procedure TGUIAlphaButton.DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean);
begin
  fHudSprite.Position.x := Position.x;
  fHudSprite.Position.y := Position.y;

  fHudSprite.Material := fShowMaterial;
  fHudSprite.Width := fShowMaterial.Texture.Image.Width;
  fHudSprite.Height := fShowMaterial.Texture.Image.Height;
  fShowMaterial.FrontProperties.Diffuse.Alpha := 1;
  //fHudSprite.AlphaChannel := 1;
  fHudSprite.DoRender(ARci, true, false);

  fHudSprite.Material := fActiveMaterial;
  fHudSprite.Width := fActiveMaterial.Texture.Image.Width;
  fHudSprite.Height := fActiveMaterial.Texture.Image.Height;
  fActiveMaterial.FrontProperties.Diffuse.Alpha := (fAnimationTime - cst_animTimeShow) / (cst_animTimeActive - cst_animTimeShow);
  //fHudSprite.AlphaChannel := (fAnimationTime - cst_animTimeShow) / (cst_animTimeActive - cst_animTimeShow);
  fHudSprite.DoRender(ARci, true, false);
end;
//------------------------------------------------------------------------------
Procedure TGUIAlphaButton.SetMaterials(aShowMaterialName: String; aActiveMaterialName: String; aMatLib: TGlMaterialLibrary);
begin
  fShowMaterial := aMatLib.Materials.GetLibMaterialByName(aShowMaterialName).Material;
  fActiveMaterial := aMatLib.Materials.GetLibMaterialByName(aActiveMaterialName).Material;
  SetRectHitAreaFromTexture(fShowMaterial);
end;

end.
