unit uSimplePanel;

interface
uses
  Classes,
  GlScene, GLMaterial, GLRenderContextInfo,
  GlHudObjects,
  VectorGeometry;
type
//==============================================================================
  TNCSizing = (cs_None, cs_Left, cs_Right, cs_Top, cs_Bottom);
//==============================================================================
  TSimplePanel = class (TGLHudSprite)
  protected
    fCorner, fHalfCorner: Integer;
    Procedure MainInit;
  public
    Function NCHitTest(aPosition: TVector): TNCSizing;
    Function IsHit(aPosition: TVector): Boolean;
    Procedure DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean); override;
    Constructor Create(AOwner: TComponent); reintroduce;
    Constructor CreateAsChild(aParentOwner: TGLBaseSceneObject);
  end;
//==============================================================================
implementation
uses
  GlTexture, GLCoordinates;
//==============================================================================
Procedure TSimplePanel.DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean);
var
  left, top: integer;
  eWidth, eHeight: Single;
  ePosition: TVector;
  Procedure RenderHud(x, y, w, h: integer;  a, b, c, d: Single);
  begin
    Position.SetPoint(left + x, top + y, 0);
    with Material.GetActualPrimaryTexture do
    begin
      MappingMode := tmmObjectLinear;
      MappingSCoordinates.SetVector(1 / w * a, 0, 0, b);
      MappingTCoordinates.SetVector(0, 1 / h * c, 0, d);
    end;
    Width := w;
    Height := h;
    inherited DoRender(ARci, true, false);
  end;
var
  w, h: integer;
begin
  eWidth := Width;
  eHeight := Height;
  ePosition := Position.AsVector;
  
  left := Round(Position.x - Trunc(Width / 2));
  top  := Round(Position.y - Trunc(Height / 2));
  w := (Round(Width)  - fCorner * 2) div 2;
  h := (Round(Height) - fCorner * 2) div 2;
  RenderHud(fHalfCorner,                   fHalfCorner, fCorner, fCorner, 1/4, 1/8, 1/4, 7/8);
  RenderHud(fCorner + w,                   fHalfCorner, 2 * w,   fCorner, 1/2, 0.5, 1/4, 7/8);
  RenderHud(fCorner + 2 * w + fHalfCorner, fHalfCorner, fCorner, fCorner, 1/4, 7/8, 1/4, 7/8);

  RenderHud(fHalfCorner,                   h + fCorner, fCorner, 2 * h, 1/4, 1/8, 1/2, 0.5);
  RenderHud(fCorner + w,                   h + fCorner, 2 * w,   2 * h, 0.5, 0.5, 1/2, 0.5);
  RenderHud(fCorner + 2 * w + fHalfCorner, h + fCorner, fCorner, 2 * h, 1/4, 7/8, 1/2, 0.5);

  RenderHud(fHalfCorner,                   2 * h + fCorner + fHalfCorner, fCorner, fCorner, 1/4, 1/8, 1/4, 1/8);
  RenderHud(fCorner + w,                   2 * h + fCorner + fHalfCorner, 2 * w,   fCorner, 1/2, 0.5, 1/4, 1/8);
  RenderHud(fCorner + 2 * w + fHalfCorner, 2 * h + fCorner + fHalfCorner, fCorner, fCorner, 1/4, 7/8, 1/4, 1/8);

  Width := eWidth;
  Height := eHeight;
  Position.SetPoint(ePosition);
end;
//------------------------------------------------------------------------------
Function TSimplePanel.NCHitTest(aPosition: TVector): TNCSizing;
var
  d: integer;
begin
  d := 10;
  if (aPosition[0] >= Position.X - Width / 2) and (aPosition[0] <= Position.X - Width / 2 + d) then
    result := cs_Left
  else if (aPosition[0] >= Position.X + Width / 2 - d) and (aPosition[0] <= Position.X + Width / 2) then
    result := cs_Right
  else if (aPosition[1] >= Position.Y - Height / 2) and (aPosition[1] <= Position.Y - Height / 2 + d) then
    result := cs_Top
  else if (aPosition[1] >= Position.Y + Height / 2 - d) and (aPosition[1] <= Position.Y + Height / 2) then
    result := cs_Bottom
  else
    result := cs_None;
end;
//------------------------------------------------------------------------------
Function TSimplePanel.IsHit(aPosition: TVector): Boolean;
begin
  result := (aPosition[0] >= Position.X - Width / 2) and (aPosition[1] >= Position.Y - Height / 2)
        and (aPosition[0] <= Position.X + Width / 2) and (aPosition[1] <= Position.Y + Height / 2);
end;
//------------------------------------------------------------------------------
Procedure TSimplePanel.MainInit;
begin
  {64x64}
  fCorner := 16;
  fHalfCorner := 8;
end;
//------------------------------------------------------------------------------
Constructor TSimplePanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainInit();
end;
//------------------------------------------------------------------------------
Constructor TSimplePanel.CreateAsChild(aParentOwner: TGLBaseSceneObject);
begin
  inherited CreateAsChild(aParentOwner);
  MainInit();
end;
//==============================================================================
end.
