unit uSimpleListBox;

interface
uses
  Classes, GlScene, GLObjects, GLMaterial,GLWindowsFont,
  GLBitmapFont, GlHudObjects, VectorGeometry, BaseClasses,
  GLRenderContextInfo;
type
//------------------------------------------------------------------------------
  TSimpleListItem = class
  protected
    fText: WideString;
    fSelectAlpha: Single;
    fSelected: Boolean;
  public
    property Text: WideString read fText;
    Constructor Create(aText: WideString);
  end;
//------------------------------------------------------------------------------
  TSimpleListBox = class (TGLBaseSceneObject)
  protected
    fMatLib: TGLMaterialLibrary;
    fFont: TGLWindowsBitmapFont;
    fItems: TList;

    fYPosition: Single; // it's delta y for all list
    fHeight: Integer;
    fDeltaHeight: Integer; // for each Item
    fMaxVisibleCount: Integer;
  protected
    fMainDummy: TGlDummyCube;
    fItemHudText: TGlHudText;
    fPanelBack: TGLHudSprite;
    fPanelFront: TGLHudSprite;
    fPanelSelection: TGLHudSprite;

    fMousePosition: TVector;
    fMouseInBox: Boolean;
    Procedure InitHuds;
    Function GetItemsCount: integer;
    Procedure MainInit(aMatLib: TGLMaterialLibrary; aFont: TGLWindowsBitmapFont);
  public
    Function GetItemByIndex(aIndex: Integer): TSimpleListItem;
    Function GetIndexByItem(aItem: TSimpleListItem): Integer;
    Function GetItemByMouse: TSimpleListItem;
    Function GetIndexByMouse: Integer;
    Function AddItem(aItem: TSimpleListItem): Integer;
    Function AddItemText(const aText: WideString): TSimpleListItem;
    Procedure SetMousePosition(aX, aY: Integer);
    Procedure DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean); override;
    procedure DoProgress(const progressTime: TProgressTimes); override;
    Constructor Create(AOwner: TComponent; aMatLib: TGLMaterialLibrary; aFont: TGLWindowsBitmapFont); reintroduce;
    Constructor CreateAsChild(aParentOwner: TGLBaseSceneObject; aMatLib: TGLMaterialLibrary; aFont: TGLWindowsBitmapFont);
    Destructor Destroy; override;
  end;
//------------------------------------------------------------------------------
implementation
uses
  GLCrossPlatform,
  SysUtils;
//------------------------------------------------------------------------------
Constructor TSimpleListItem.Create(aText: WideString);
begin
  inherited Create;
  fText := aText;
end;
//==============================================================================
Function TSimpleListBox.GetItemByIndex(aIndex: Integer): TSimpleListItem;
begin
  result := fItems[aIndex];
end;
//------------------------------------------------------------------------------
Function TSimpleListBox.GetIndexByItem(aItem: TSimpleListItem): Integer;
begin
  result := fItems.IndexOf(aItem);
end;
//------------------------------------------------------------------------------
Function TSimpleListBox.GetItemByMouse: TSimpleListItem;
var
  Index: Integer;
begin
  Index := GetIndexByMouse;
  if Index <> -1 then
    result := GetItemByIndex(Index)
  else
    result := nil;  
end;
//------------------------------------------------------------------------------
Function TSimpleListBox.AddItem(aItem: TSimpleListItem): Integer;
begin
  result := fItems.Add(aItem);
end;
//------------------------------------------------------------------------------
Function TSimpleListBox.AddItemText(const aText: WideString): TSimpleListItem;
begin
  result := TSimpleListItem.Create(aText);
  AddItem(result);
end;
//------------------------------------------------------------------------------
Procedure TSimpleListBox.SetMousePosition(aX, aY: Integer);
begin
  fMouseInBox := (aX < Position.X + 100) and (aX > Position.X - 100)
              and(aY < Position.Y + fHeight) and (aY > Position.Y - fHeight);
  if fMouseInBox then
    fMousePosition := VectorMake(aX, aY, 0);
end;
//------------------------------------------------------------------------------
Procedure TSimpleListBox.DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean);
var
  i: Integer;
  item: TSimpleListItem;
  dY: Integer;
begin
  dY := Round(-fHeight + fYPosition);
  fPanelFront.Position.X := Position.X;
  fPanelFront.Position.Y := Position.Y;
//  fPanelBack.Position.X := Position.X;
//  fPanelBack.Position.Y := Position.Y - 10;
  fPanelSelection.Position.X := Position.X;
  fItemHudText.Position.X := Position.X - 160;

//  fPanelBack.DoRender(ARci, true, false);

  for i := 0 to fItems.Count - 1 do
    if(i < fItems.Count)
    and(dY + fDeltaHeight * i <  fHeight + fDeltaHeight / 2)
    and(dY + fDeltaHeight * i > -fHeight - fDeltaHeight / 2)
    then
    begin
      fPanelSelection.Position.Y := Position.Y + dY + fDeltaHeight * i;
      fItemHudText.Position.Y := Position.Y + dY + fDeltaHeight * i;

      item := GetItemByIndex(i);
      fItemHudText.Text := item.fText;
      with fPanelSelection.Material.GetActualPrimaryMaterial do
        FrontProperties.Diffuse.Alpha := item.fSelectAlpha;
      fPanelSelection.DoRender(ARci, true, false);
      fItemHudText.DoRender(ARci, true, false);
    end;

  fPanelFront.DoRender(ARci, true, false);
end;
//------------------------------------------------------------------------------
Procedure TSimpleListBox.DoProgress(const progressTime: TProgressTimes);
var
  dy: Single;
  i, item: Integer;
begin
  dy := (fMousePosition[1] - (Position.Y - fHeight));
  if dY < 0 then
    dY := 0;
  if dY > fHeight * 2 then
    dY := fHeight * 2;

  if fItems.Count >= fMaxVisibleCount then
    fYPosition := fYPosition + progressTime.deltaTime * 3 * (-dY * (fItems.Count - fMaxVisibleCount) * fDeltaheight / fHeight / 2 - fYPosition)
  else
    fYPosition := 0;

  for i := 0 to fItems.Count - 1 do
    with GetItemByIndex(i) do
      fSelectAlpha := fSelectAlpha - progressTime.deltaTime * 2;

  item := GetIndexByMouse;
  if Item <> -1 then
    GetItemByIndex(item).fSelectAlpha := 1;
end;
//------------------------------------------------------------------------------
Procedure TSimpleListBox.InitHuds;
  Function AddPanel(aMaterial: AnsiString): TGLHudSprite;
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
  fMainDummy := TGLDummyCube.CreateAsChild(self);
  fMainDummy.Visible := false;

  fItemHudText := TGlHudText.CreateAsChild(fMainDummy);
  fItemHudText.BitmapFont := fFont;
  fItemHudText.ModulateColor.SetColor(0,0,0,1);
  fItemHudText.Layout := tlCenter;

//  fItemHudText.Alignment := taRightJustify;
//  fItemHudText.Position.X := 400;

//  fPanelBack := AddPanel('back_list');
  fPanelFront := AddPanel('front_list');
  fPanelSelection := AddPanel('selection_list');
  fPanelSelection.Height := 30;
  fPanelSelection.Width := 340;
end;
//------------------------------------------------------------------------------
Function TSimpleListBox.GetItemsCount: integer;
begin
  result := fItems.Count;
end;
//------------------------------------------------------------------------------
Procedure TSimpleListBox.MainInit(aMatLib: TGLMaterialLibrary; aFont: TGLWindowsBitmapFont);
begin
  fItems := TList.Create;
  fFont := aFont;
  fMatLib := aMatLib;
  fDeltaHeight := 30;
  fMaxVisibleCount := 17;
  fYPosition := 0;
  fHeight := 240;
  fMouseInBox := false;
  InitHuds();
end;
//------------------------------------------------------------------------------
Function TSimpleListBox.GetIndexByMouse: Integer;
var
  dY: Single;
begin
  dY := fMousePosition[1] - (Position.Y + fYPosition - fHeight - fDeltaHeight/2);
  result := Round(dY) div fDeltaHeight;
  if (result < 0) or (result >= GetItemsCount) or not fMouseInBox then
    result := -1;
end;
//------------------------------------------------------------------------------
Constructor TSimpleListBox.Create(AOwner: TComponent; aMatLib: TGLMaterialLibrary; aFont: TGLWindowsBitmapFont);
begin
  inherited Create(AOwner);
  MainInit(aMatLib, aFont);
end;
//------------------------------------------------------------------------------
Constructor TSimpleListBox.CreateAsChild(aParentOwner: TGLBaseSceneObject; aMatLib: TGLMaterialLibrary; aFont: TGLWindowsBitmapFont);
begin
  inherited CreateAsChild(aParentOwner);
  MainInit(aMatLib, aFont);
end;
//------------------------------------------------------------------------------
Destructor TSimpleListBox.Destroy;
begin
  while fItems.Count > 0 do
  begin
    GetItemByIndex(0).Free;
    fItems.Delete(0);
  end;
  FreeAndNil(fItems);
  inherited Destroy;
end;
//------------------------------------------------------------------------------
end.
