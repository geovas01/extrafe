unit uSimpleAnimationsObjects;

interface
uses
  Classes,
  BaseClasses, GlScene, GLCoordinates, GlMaterial, GlHudObjects,
  GlRenderContextInfo,
  VectorGeometry;
type
//------------------------------------------------------------------------------
  TLoaderBar = class (TGlHudSprite)
  protected
    fLoaderFront: TGlHudSprite;
    Procedure MainInit;
  public
    Procedure CoordinateChanged(Sender: TGLCustomCoordinates); override;
    Function IsHit(aPosition: TVector): Boolean;
    Procedure SetMaterials(aMatLib: TGLMaterialLibrary; aLinesName: String; aFrontName: String);
    Procedure DoProgress(const progressTime: TProgressTimes); override;
    Constructor Create(AOwner: TComponent); override;
  end;
//------------------------------------------------------------------------------
  TSimpleImageHint = class (TGlHudSprite)
  protected
    fShowSpeed, fHideSpeed: Single;
    fAnimationTime: Single;
    fIsShow: Boolean;
    fShowPos: TVector;
    fHidePos: TVector;
  public
    property ShowSpeed: Single read fShowSpeed write fShowSpeed;
    property HideSpeed: Single read fHideSpeed write fHideSpeed;
    Procedure Show;
    Procedure Hide;
    Procedure SetPositions(aShow, aHide: TVector);
    Procedure DoProgress(const progressTime: TProgressTimes); override;
    Constructor Create(AOwner: TComponent); override;
  end;
//------------------------------------------------------------------------------
  TWaitAnimation = class (TGlHudSprite)
  protected
    fAnimationTime: Single;
  public
    Procedure DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean); override;
    Procedure DoProgress(const progressTime: TProgressTimes); override;
    Constructor Create(AOwner: TComponent); override;
  end;
//------------------------------------------------------------------------------
  TOnMouseOver = Procedure (aSelf: TGlHudSprite) of object;
  TOnMouseOut  = Procedure (aSelf: TGlHudSprite) of object;
  TPlanetButton = class (TGlHudSprite)
  protected
    fMousePos: TVector;
    fSelected: Boolean;
    fOverRadius: Single;
    fOutRadius: Single;
    fAnimationTime: Single;
  protected  
    fOnMouseOver: TOnMouseOver;
    fOnMouseOut: TOnMouseOut;
  public
    property OnMouseOver: TOnMouseOver read fOnMouseOver write fOnMouseOver;
    property OnMouseOut: TOnMouseOut read fOnMouseOut write fOnMouseOut;

    property OverRadius: Single read fOverRadius write fOverRadius;
    property OutRadius: Single read fOutRadius write fOutRadius;
    Function IsHit(aPosition: TVector): Boolean;
    Procedure SetMousePos(aMousePos: TVector);
    Procedure DoProgress(const progressTime: TProgressTimes); override;
    Constructor Create(AOwner: TComponent); override;
  end;
//------------------------------------------------------------------------------
implementation
//------------------------------------------------------------------------------
Procedure TLoaderBar.MainInit;
begin
  fLoaderFront := TGlHudSprite.CreateAsChild(self);
end;
//------------------------------------------------------------------------------
procedure TLoaderBar.CoordinateChanged(Sender: TGLCustomCoordinates);
begin
  inherited CoordinateChanged(Sender);
  with fLoaderFront do
    Position.SetPoint(self.Position.X + 2, self.Position.Y + 1, 0);
end;
//------------------------------------------------------------------------------
Function TLoaderBar.IsHit(aPosition: TVector): Boolean;
begin
  result := (aPosition[0] >= Position.X - Width / 2) and (aPosition[1] >= Position.Y - Height / 2)
        and (aPosition[0] <= Position.X + Width / 2) and (aPosition[1] <= Position.Y + Height / 2);
end;
//------------------------------------------------------------------------------
Procedure TLoaderBar.SetMaterials(aMatLib: TGLMaterialLibrary; aLinesName: String; aFrontName: String);
begin
  Material.LibMaterialName := 'loaderlines';
  Material.MaterialLibrary := aMatLib;
  with Material.GetLibMaterial do
    TextureScale.X := 203/256;

  with fLoaderFront do
  begin
    Material.LibMaterialName := 'loaderfront';
    Material.MaterialLibrary := aMatLib;
    Width := Material.GetActualPrimaryTexture.Image.Width;
    Height := Material.GetActualPrimaryTexture.Image.Height;
  end;

  Width := 203;
  Height := Material.GetActualPrimaryTexture.Image.Height;
end;
//------------------------------------------------------------------------------
Procedure TLoaderBar.DoProgress(const progressTime: TProgressTimes);
begin
  with Material.GetLibMaterial do
    TextureOffset.x := TextureOffset.x + progressTime.deltaTime / 6;
end;
//------------------------------------------------------------------------------
Constructor TLoaderBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainInit();
end;
//------------------------------------------------------------------------------
Procedure TSimpleImageHint.Show;
begin
  fIsShow:= true;
end;
//------------------------------------------------------------------------------
Procedure TSimpleImageHint.Hide;
begin
  fIsShow := false;
end;
//------------------------------------------------------------------------------
Procedure TSimpleImageHint.SetPositions(aShow, aHide: TVector);
begin
  fShowPos := aShow;
  fHidePos := aHide;
end;
//------------------------------------------------------------------------------
Procedure TSimpleImageHint.DoProgress(const progressTime: TProgressTimes);
begin
  Position.SetPoint(VectorLerp(fHidePos, fShowPos, sin(fAnimationTime * pi /2)));
  Material.GetActualPrimaryMaterial.FrontProperties.Diffuse.Alpha := fAnimationTime;

  if fAnimationTime < 0 then
    fAnimationTime := 0
  else if fAnimationTime > 1 then
    fAnimationTime := 1;

  if fIsShow then
    fAnimationTime := fAnimationTime + progressTime.deltaTime * fShowSpeed
  else
    fAnimationTime := fAnimationTime - progressTime.deltaTime * fHideSpeed;
end;
//------------------------------------------------------------------------------
Constructor TSimpleImageHint.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fAnimationTime := 0;
  fShowSpeed := 2;
  fHideSpeed := 2;
end;
//------------------------------------------------------------------------------
Procedure TWaitAnimation.DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean);
var
  alpha: single;
  i: integer;
  pos: TVector;
begin
  pos := Position.AsVector;
  for i := 0 to 11 do
  begin
    alpha := i * pi * 2 / 12;
    Position.x := pos[0] + 15 * cos(alpha);
    Position.y := pos[1] + 15 * sin(alpha);
    Rotation := 90 - alpha * 180 / pi;
    with Material.GetActualPrimaryMaterial.FrontProperties.Diffuse do
      Alpha := cos((fAnimationTime - i)) + 1;
    inherited DoRender(ARci, true, false);
  end;
  Position.SetPoint(pos);
end;
//------------------------------------------------------------------------------
Procedure TWaitAnimation.DoProgress(const progressTime: TProgressTimes);
begin
  fAnimationTime := fAnimationTime + progressTime.deltaTime * 5;
end;
//------------------------------------------------------------------------------
Constructor TWaitAnimation.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fAnimationTime := 0;
end;
//------------------------------------------------------------------------------
Function TPlanetButton.IsHit(aPosition: TVector): Boolean;
begin
  result := VectorNorm(VectorSubtract(aPosition, Position.AsVector)) <= fOverRadius * fOverRadius;
end;
//------------------------------------------------------------------------------
Procedure TPlanetButton.SetMousePos(aMousePos: TVector);
begin
  fMousePos := aMousePos;
end;
//------------------------------------------------------------------------------
Procedure TPlanetButton.DoProgress(const progressTime: TProgressTimes);
begin
  if VectorNorm(VectorSubtract(fMousePos, Position.AsVector)) <= fOverRadius * fOverRadius then
  begin
    if not fSelected then
      OnMouseOver(self);
    fSelected := true;
  end
  else if VectorNorm(VectorSubtract(fMousePos, Position.AsVector)) >= fOutRadius * fOutRadius then
  begin
    if fSelected then
      OnMouseOut(self);
    fSelected := false;
  end;
end;
//------------------------------------------------------------------------------
Constructor TPlanetButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fSelected := false;
  fOverRadius := 0;
  fOutRadius := 0;
end;
//------------------------------------------------------------------------------
end.
