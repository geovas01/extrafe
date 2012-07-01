unit uSimpleButton;

interface
uses
  Classes,
  GlScene, GlHudObjects, VectorGeometry,
  uTweener;
type
//------------------------------------------------------------------------------
  TSimpleButton = class;
//------------------------------------------------------------------------------
  TButtonState = (bs_MouseOut, bs_MouseIn);
//------------------------------------------------------------------------------
  TOnMouseEvent = Procedure (aSender: TSimpleButton; aOldState, aNewState: TButtonState) of object;
  TOnMouseClick = Procedure (aSender: TSimpleButton) of object;
//------------------------------------------------------------------------------
  TSimpleButton = class (TGLHudSprite)
  protected
    fState: TButtonState;
    fMousePressed: Boolean;
    fOnMouseEvent: TOnMouseEvent;
    fOnMouseClick: TOnMouseClick;
  protected
    Procedure MainInit;
    Procedure SetState(aState: TButtonState);
  public
    property OnMouseEvent: TOnMouseEvent read fOnMouseEvent write fOnMouseEvent;
    property OnMouseClick: TOnMouseClick read fOnMouseClick write fOnMouseClick;
    
    Function IsHit(aPosition: TVector): Boolean;
    Procedure SetMouseState(aMouseX, aMouseY: Single; aIsButtonDown: Boolean);
    Constructor Create(AOwner: TComponent); reintroduce;
    Constructor CreateAsChild(aParentOwner: TGLBaseSceneObject);
  end;
//------------------------------------------------------------------------------
implementation
//------------------------------------------------------------------------------
Procedure TSimpleButton.MainInit;
begin
  fState := bs_MouseOut;
  fMousePressed := false;
  fOnMouseEvent := nil;
  fOnMouseClick := nil;
end;
//------------------------------------------------------------------------------
Procedure TSimpleButton.SetState(aState: TButtonState);
begin
  if fState <> aState then
  begin
    if Assigned(fOnMouseEvent) then
      fOnMouseEvent(self, fState, aState);
    fState := aState;
  end;
end;
//------------------------------------------------------------------------------
Function TSimpleButton.IsHit(aPosition: TVector): Boolean;
begin
  result := (aPosition[0] >= Position.X - Width / 2) and (aPosition[1] >= Position.Y - Height / 2)
        and (aPosition[0] <= Position.X + Width / 2) and (aPosition[1] <= Position.Y + Height / 2);
end;
//------------------------------------------------------------------------------
Procedure TSimpleButton.SetMouseState(aMouseX, aMouseY: Single; aIsButtonDown: Boolean);
begin
  if IsHit(VectorMake(aMouseX, aMouseY, 0)) then
  begin
    SetState(bs_MouseIn);
    if aIsButtonDown and not fMousePressed and Assigned(fOnMouseClick) then
      fOnMouseClick(self);
  end
  else
    SetState(bs_MouseOut);

  fMousePressed := aIsButtonDown;
end;
//------------------------------------------------------------------------------
Constructor TSimpleButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MainInit();
end;
//------------------------------------------------------------------------------
Constructor TSimpleButton.CreateAsChild(aParentOwner: TGLBaseSceneObject);
begin
  inherited CreateAsChild(aParentOwner);
  MainInit();
end;
end.
