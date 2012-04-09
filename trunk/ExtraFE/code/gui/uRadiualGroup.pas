{$O-}
unit uRadiualGroup;

interface
uses
  Classes, BaseClasses,
  GlRenderContextInfo,
  GlHudObjects, GLMaterial,
  VectorGeometry,
  
  uTweener;
type
//------------------------------------------------------------------------------
  TRadialGroup = class;
  TRadialElement = class
    fMaterialName: String;
    fScale: Single;
    fAlpha: Single;
  end;
//------------------------------------------------------------------------------
  TOnMouseClick = Procedure (aSelf: TRadialGroup; aItem: TRadialElement; aItemIndex: Integer) of object;
//------------------------------------------------------------------------------
  TRadialGroup = class (TGlHudSprite)
  protected
    fElements: TList;
    fShowSpeed: Single;
    fHideSpeed: Single;
    fVisible: Boolean;

    fMousePos: TVector;
    fSelected: Integer;
    fBasePosition: TVector;
    fGroupRadius: Single;

    fOnMouseClick: TOnMouseClick;
    fLButtonDown: Boolean;

    fTweener: TTweener;
  protected
    Function GetItem(aIndex: Integer): TRadialElement;
    Function GetItemRect(aIndex: Integer): TVector;
  public
    property ShowSpeed: Single read fShowSpeed write fShowSpeed;
    property HideSpeed: Single read fHideSpeed write fHideSpeed;
    property GroupRadius: Single read fGroupRadius write fGroupRadius;
    property OnMouseClick: TOnMouseClick read fOnMouseClick write fOnMouseClick;

    Procedure Show;
    Procedure Hide;
    Procedure AddElements(fMaterialNames: Array of String);
    procedure RemoveElements(fMaterialNames: array of string);
    Function  GetSelected: Integer;
    Procedure SetMousePos(aMousePos: TVector);
    Procedure DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean); override;
    Procedure DoProgress(const progressTime: TProgressTimes); override;
    Constructor Create(AOwner: TComponent); override;
  end;
//------------------------------------------------------------------------------
implementation
uses
  Windows, GlKeyboard,main_menu;
//------------------------------------------------------------------------------
Function TRadialGroup.GetItem(aIndex: Integer): TRadialElement;
begin
  result := TRadialElement(fElements[aIndex]);
end;
//------------------------------------------------------------------------------
Function TRadialGroup.GetItemRect(aIndex: Integer): TVector;
var
  w, h, Angle: Single;
begin
  Material.LibMaterialName := GetItem(aIndex).fMaterialName;
  Angle := pi/2 + aIndex * pi * 2 / fElements.Count;
  w := Material.GetActualPrimaryTexture.Image.Width;
  h := Material.GetActualPrimaryTexture.Image.Height;
  Result[0] := fBasePosition[0] + fGroupRadius * cos(Angle) - w/2;
  Result[1] := fBasePosition[1] + fGroupRadius * sin(Angle) - h/2;
  Result[2] := Result[0] + w;
  Result[3] := Result[1] + h;
end;
//------------------------------------------------------------------------------
Procedure TRadialGroup.Show;
var
  i: integer;
  DeltaTime: Single;
begin
  if not fVisible then
    for i := 0 to fElements.Count - 1 do
      with GetItem(i) do
      begin
        fTweener.DeletePSingle(@fScale);
        fTweener.DeletePSingle(@fAlpha);
        DeltaTime := i / fElements.Count / 2.5;
        fTweener.AddTweenPSingle(@fScale, ts_ExpoEaseIn, fScale, 0.8, 1.3, DeltaTime);
        fTweener.AddTweenPSingle(@fAlpha, ts_ExpoEaseIn, fAlpha, 1, 1, DeltaTime);
      end;
  fVisible := true;
end;
//------------------------------------------------------------------------------
Procedure TRadialGroup.Hide;
var
  i: integer;
  DeltaTime: Single;
begin
  if fVisible then
  begin
    for i := 0 to fElements.Count - 1 do
      with GetItem(i) do
      begin
        fTweener.DeletePSingle(@fScale);
        fTweener.DeletePSingle(@fAlpha);
        DeltaTime := (fElements.Count - i) / fElements.Count / 2.5;
        fTweener.AddTweenPSingle(@fScale, ts_ExpoEaseIn, fScale, 0, 1, DeltaTime);
        fTweener.AddTweenPSingle(@fAlpha, ts_ExpoEaseIn, fAlpha, 0, 1, DeltaTime);
      end;
    fSelected := -1;  
  end;
  fVisible := false;
end;
//------------------------------------------------------------------------------
Procedure TRadialGroup.SetMousePos(aMousePos: TVector);
begin
  fMousePos := aMousePos;
end;
//------------------------------------------------------------------------------
Procedure TRadialGroup.AddElements(fMaterialNames: Array of String);
var
  Element: TRadialElement;
  i: integer;
begin
  for i := low(fMaterialNames) to high(fMaterialNames) do
  begin
    Element := TRadialElement.Create;
    Element.fMaterialName := fMaterialNames[i];
    Element.fScale := 0;
    Element.fAlpha := 0;
    fElements.Add(Element);
  end;
end;
//------------------------------------------------------------------------------
Function  TRadialGroup.GetSelected: Integer;
var
  i: integer;
  r: TVector;
begin
  result := -1;

  for i := 0 to fElements.Count - 1 do
  begin
    r := GetItemRect(i);
    if(fMousePos[0] >= r[0]) and (fMousePos[1] >= r[1]) and
      (fMousePos[0] <= r[2]) and (fMousePos[1] <= r[3])then
    begin
      result := i;
      break;
    end;
  end;

  if not fVisible then
    result := -1
  else if result <> -1 then
  begin
    GetItem(result).fAlpha := 1;
    fTweener.DeletePSingle(@GetItem(result).fAlpha);
  end;
end;
//------------------------------------------------------------------------------
Procedure TRadialGroup.DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean);
var
  i: integer;
  r: TVector;
begin
  fBasePosition := Position.AsVector;
  for i := 0 to fElements.Count - 1  do
  begin
    r := GetItemRect(i);
    Position.x := (r[0] + r[2]) / 2;
    Position.y := (r[1] + r[3]) / 2;
    Width  := (r[2] - r[0]) * GetItem(i).fScale;
    Height := (r[3] - r[1]) * GetItem(i).fScale;
    Material.GetActualPrimaryMaterial.FrontProperties.Diffuse.Alpha := GetItem(i).fAlpha;
    inherited DoRender(ARci, true, false);
  end;
  Position.SetPoint(fBasePosition);
end;
//------------------------------------------------------------------------------
Procedure TRadialGroup.DoProgress(const progressTime: TProgressTimes);
var
  NewSelect: Integer;
begin
  fTweener.Update(progressTime.deltaTime);

  NewSelect := GetSelected;
  if (NewSelect <> fSelected) then
  begin
    if fSelected > -1 then
    begin
      fTweener.DeletePSingle(@GetItem(fSelected).fScale);
      fTweener.AddTweenPSingle(@GetItem(fSelected).fScale, ts_ExpoEaseIn, GetItem(fSelected).fScale, 0.8, 1, 0);
      fClickedText.Text := '';
    end;

    if NewSelect > -1 then
    begin
      fTweener.DeletePSingle(@GetItem(NewSelect).fScale);
      fTweener.AddTweenPSingle(@GetItem(NewSelect).fScale, ts_ElasticEaseOut, GetItem(NewSelect).fScale, 1.2, 2, 0);
      fClickedText.Text := GetItem(NewSelect).fMaterialName;
    end;

    fSelected := NewSelect;
  end;

  if (fSelected > -1) and (IsKeyDown(VK_LBUTTON) and not fLButtonDown) and Assigned(fOnMouseClick) then
    fOnMouseClick(self, GetItem(fSelected), fSelected);

  fLButtonDown := IsKeyDown(VK_LBUTTON);

end;
//------------------------------------------------------------------------------
Constructor TRadialGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fTweener := TTweener.Create;
  fElements := TList.Create;
  fSelected := -1;
  fGroupRadius := 60;
  fLButtonDown := false;
end;
//------------------------------------------------------------------------------
procedure TRadialGroup.RemoveElements(fMaterialNames: array of string);
var
  Element: TRadialElement;
  i: integer;
begin
  for i := low(fMaterialNames) to high(fMaterialNames) do
  begin
    Element := TRadialElement.Create;
    Element.fMaterialName := fMaterialNames[i];
    Element.fScale := 0;
    Element.fAlpha := 0;
    fElements.Delete(0);
  end;
end;

end.
