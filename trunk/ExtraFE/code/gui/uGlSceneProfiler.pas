unit uGlSceneProfiler;

interface
uses
  Classes,
  BaseClasses,
  GlScene, GlObjects, GLRenderContextInfo, GlCanvas,
  GlHudObjects;
type
//------------------------------------------------------------------------------
  TSimpleGraph = class
    fX0, fY0: Single;
    fScaleX, fScaleY: Single;
    fPointsCount: Integer;
    fPoints: array of Single;
    Function GetX(aXValue: Single): Single;
    Function GetY(aYValue: Single): Single;
    Function GetMaxValue: Single;
    Procedure Step(aNewValue: Single);
  public
    property Count: Integer read fPointsCount;
    Procedure RenderGraph(aCanvas: TGlCanvas);
    Procedure SetPoint(aIndex: Integer; aValue: Single);
    Function GetPoint(aIndex: Integer): Single;
    Constructor Create(const aPointsCount: Integer);
  end;
//------------------------------------------------------------------------------
  TGlSceneProfiler = class (TGLHudSprite)
  protected
    fPointsCount: Integer;
    fFPSGraph: TSimpleGraph;
    fLastFPS: Single;
    fFramesCount: Integer;
    fFPSTime: Single;
    fKeyPressed: Boolean;
    
    fVisible: Boolean;
    Procedure SetVisible(aValue: Boolean);
    Procedure RenderLines(var ARci: TRenderContextInfo; aWidth, aHeight: integer);
  public
    Procedure DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean); override;
    Procedure DoProgress(const progressTime: TProgressTimes); override;
    Constructor Create(AOwner: TComponent); override;
  end;
//------------------------------------------------------------------------------
  Function InitGlSceneProfiler(aParent: TGLBaseSceneObject): TGlSceneProfiler;
//------------------------------------------------------------------------------
implementation
uses
  Windows,
  SysUtils,
  GlMaterial, GlKeyboard;
var
  fGlSceneProfiler: TGlSceneProfiler;
//------------------------------------------------------------------------------
Function TSimpleGraph.GetX(aXValue: Single): Single;
begin
  result := fX0 + aXValue * fScaleX;
end;
//------------------------------------------------------------------------------
Function TSimpleGraph.GetY(aYValue: Single): Single;
begin
  result := fY0 - aYValue * fScaleY;
end;
//------------------------------------------------------------------------------
Function TSimpleGraph.GetMaxValue: Single;
var
  i: integer;
begin
  result := 1;
  for i := 0 to fPointsCount - 1 do
    if result < fPoints[i] then
      result := fPoints[i];
end;
//------------------------------------------------------------------------------
Procedure TSimpleGraph.Step(aNewValue: Single);
var
  i: integer;
begin
  for i := fPointsCount - 1 downto 1 do
    fPoints[i] := fPoints[i - 1];
  fPoints[0] := aNewValue;
end;
//------------------------------------------------------------------------------
Procedure TSimpleGraph.SetPoint(aIndex: Integer; aValue: Single);
begin
  fPoints[aIndex] := aValue;
end;
//------------------------------------------------------------------------------
Function TSimpleGraph.GetPoint(aIndex: Integer): Single;
begin
  result := fPoints[aIndex];
end;
//------------------------------------------------------------------------------
Procedure TSimpleGraph.RenderGraph(aCanvas: TGlCanvas);
var
  i: integer;
  MaxValue: Single;
begin
  MaxValue := GetMaxValue();
  
  aCanvas.PenWidth := 1;
  aCanvas.PenColor := $6F6F6F;
  aCanvas.PenAlpha := 1;

  aCanvas.Line(GetX(0), GetY(0), GetX(fPointsCount - 1), GetY(0));
  aCanvas.Line(GetX(0), GetY(0), GetX(0), GetY(1));

  aCanvas.PenColor := $00FF00;
  aCanvas.PenAlpha := 1;
  aCanvas.MoveTo(GetX(0), GetY(fPoints[0]/MaxValue));
  for i := 1 to fPointsCount - 1 do
    aCanvas.LineTo(GetX(i), GetY(fPoints[i]/MaxValue));
end;
//------------------------------------------------------------------------------
Constructor TSimpleGraph.Create(const aPointsCount: Integer);
var
  i: Integer;
begin
  fX0 := 65;
  fY0 := 45;
  fScaleX := 8.5;
  fScaleY := 40;

  fPointsCount := aPointsCount;
  SetLength(fPoints, fPointsCount);
  for i := 0 to fPointsCount - 1 do
    fPoints[i] := 0;
end;
//------------------------------------------------------------------------------
Procedure TGlSceneProfiler.RenderLines(var ARci: TRenderContextInfo; aWidth, aHeight: integer);
var
  glc: TGlCanvas;
begin
  glc := TGlCanvas.Create(ARci.viewPortSize.cx, ARci.viewPortSize.cy);
  glc.PenWidth := 1;
  glc.PenColor := $FFFFFF;
  glc.PenAlpha := 0.5;
  glc.FrameRect(1, 1, aWidth, aHeight);
  fFPSGraph.RenderGraph(glc);
  glc.Free;
end;
//------------------------------------------------------------------------------
Procedure TGlSceneProfiler.SetVisible(aValue: Boolean);
begin
  fVisible := aValue;
end;
//------------------------------------------------------------------------------
Procedure TGlSceneProfiler.DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean);
begin
  inc(fFramesCount);
  if (ARci.buffer is TGLSceneBuffer) then
  begin
    Width := TGLSceneBuffer(ARci.buffer).Width;
    Height := 120;
    Position.SetPoint(Width / 2, Height / 2, 0);
  end;
  
  if fVisible then
  begin
    inherited;
    RenderLines(ARci, Round(Width), Round(Height));
  end;
end;
//------------------------------------------------------------------------------
Procedure TGlSceneProfiler.DoProgress(const progressTime: TProgressTimes);
var
  NewKeyPressed: Boolean;
begin
  fFPSTime := fFPSTime + progressTime.deltaTime;
  if (fFPSTime > 1) then
  begin
    fLastFPS := fFramesCount / fFPSTime;
    fFramesCount := 0;
    fFPSTime := 0;
    fFPSGraph.Step(fLastFPS);
  end;

  NewKeyPressed := IsKeyDown(VK_F1);
  if NewKeyPressed and not fKeyPressed then
    SetVisible(not fVisible);
  fKeyPressed := NewKeyPressed;
end;
//------------------------------------------------------------------------------
Constructor TGlSceneProfiler.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fVisible := false;
  fKeyPressed := false;
  fFramesCount := 0;
  fFPSTime := 0;
  fLastFPS := 0;
  with Material do
  begin
    BlendingMode := bmTransparency;
    MaterialOptions := [moIgnoreFog, moNoLighting];
    Texture.Disabled := true;
    with FrontProperties do
    begin
      Ambient. SetColor(1, 1, 1, 1);
      Diffuse. SetColor(1, 1, 1, 0.6);
      Emission.SetColor(1, 1, 1, 1);
      Specular.SetColor(1, 1, 1, 1);
    end;
  end;
  
  fFPSGraph := TSimpleGraph.Create(60);
end;
//------------------------------------------------------------------------------
Function InitGlSceneProfiler(aParent: TGLBaseSceneObject): TGlSceneProfiler;
begin
  result := TGlSceneProfiler.CreateAsChild(aParent);
  fGlSceneProfiler := result;
end;
//------------------------------------------------------------------------------
end.
