unit uMain_ListBox;

interface
uses
  Classes, ExtCtrls, Graphics,
  GlScene, GLObjects, GLMaterial,
  GLBitmapFont, GlHudObjects, VectorGeometry, BaseClasses,
  GLRenderContextInfo,GLKeyboard;

type
  TMyTimer = Class(TTimer)
  public
    procedure OnMyTimer(Sender: TObject);
  end;

type
//------------------------------------------------------------------------------
  TSimpleListItem = class
  protected
    fGameName: WideString;
    fZipName: WideString;
    fManufactorName: WideString;
    fYear: WideString;
    fCloneOfName: WideString;
    fNumber: Integer;
    fSelectAlpha: Single;
    fSelected: Boolean;
    fExistRom: Integer;
  public
    property GameName: WideString read fGameName;
    property Number: Integer read fNumber;
    property RomExist: Integer  read fExistRom;
    property GameZip: WideString read fZipName;
    property Manufactor: WideString  read fManufactorName;
    property RYear: WideString read fYear;
    property CloneOf: WideString  read fCloneOfName;
    Constructor Create(aText: WideString);
  end;
//------------------------------------------------------------------------------
  TSimpleListBox = class (TGLBaseSceneObject)
  protected
    fMatLib: TGLMaterialLibrary;
    yFont: TGLCustomBitmapFont;
    nFont: TGLCustomBitmapFont;


    fHeight: Integer;
    fDeltaHeight: Integer; // for each Item
    fMaxVisibleCount: Integer;
  protected
    fMainDummy: TGlDummyCube;
    fPanelBack: TGLHudSprite;
    fPanelFront: TGLHudSprite;
    fPanelSelection: TGLHudSprite;
    fItemExistText: TGLHUDText;
    fItemNoExistText: TGlHudText;

    fKeyPosition: Integer;
    fMousePosition: TVector;
    fMouseInBox: Boolean;
    Procedure InitHuds;
    Function GetItemsCount: integer;
    Procedure MainInit(aMatLib: TGLMaterialLibrary; aFont,bFont: TGLCustomBitmapFont);
  public
    fItems: TList;
    fYPosition: Single; // it's delta y for all list
    Function GetItemByIndex(aIndex: Integer): TSimpleListItem;
    Function GetIndexByItem(aItem: TSimpleListItem): Integer;
    Function GetItemByMouse: TSimpleListItem;
    function GetIndexBySelection: Integer;
    Function GetIndexByMouse: Integer;
    Function AddItem(aItem: TSimpleListItem): Integer;
    Function AddItemTextNum(const aGame,aZip: WideString; aNum,isRomExist: Integer): TSimpleListItem;
    procedure DOClickDown;
    procedure DOClickUp;
    procedure DOClickLeft;
    procedure DOClickRight;
    procedure CancelClick;
    Procedure SetMousePosition(aX, aY: Integer);
    Procedure DoRender(var ARci: TRenderContextInfo; ARenderSelf, ARenderChildren: Boolean); override;
    procedure DoProgress(const progressTime: TProgressTimes); override;
    Constructor Create(AOwner: TComponent; aMatLib: TGLMaterialLibrary; aFont,bFont: TGLCustomBitmapFont); reintroduce;
    Constructor CreateAsChild(aParentOwner: TGLBaseSceneObject; aMatLib: TGLMaterialLibrary; aFont,bFont: TGLCustomBitmapFont);
    Destructor Destroy; override;
  end;

  function CompareNames(Item1, Item2: Pointer): Integer;

  var
    sItem,sleeping : Integer;
    MyTimer: TMyTimer;

//------------------------------------------------------------------------------
implementation
uses
  GLCrossPlatform,
  SysUtils,mame,zinc;
//------------------------------------------------------------------------------
Constructor TSimpleListItem.Create(aText: WideString);
begin
  inherited Create;
  fGameName := aText;
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


function TSimpleListBox.GetIndexBySelection: Integer;
begin
  Result := fKeyPosition + 30;
end;

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
Function TSimpleListBox.AddItemTextNum(const aGame,aZip: WideString; aNum,isRomExist: integer): TSimpleListItem;
begin
  Result := TSimpleListItem.Create(aGame);
  Result.fZipName := aZip;
  Result.fNumber := aNum;
  Result.fExistRom := isRomExist;
  AddItem(result);
end;
//------------------------------------------------------------------------------
Procedure TSimpleListBox.SetMousePosition(aX, aY: Integer);
begin
  fMouseInBox := (aX <= Position.X + 100) and (aX >= Position.X - 100)
              and(aY <= Position.Y + fHeight) and (aY >= Position.Y - fHeight);
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
  fItemExistText.Position.X := Position.X - 172;
  fItemNoExistText.Position.X := Position.X - 172;
//  fPanelBack.DoRender(ARci, true, false);

  
  for i := 0 to fItems.Count - 1 do
    if(i < fItems.Count)
    and(dY + fDeltaHeight * i <  fHeight + fDeltaHeight / 2)
    and(dY + fDeltaHeight * i > -fHeight - fDeltaHeight / 2)
    then
    begin
      item := GetItemByIndex(i);
      fPanelSelection.Position.Y := Position.Y + dY + fDeltaHeight * i;
      if item.fExistRom <> 0 then
        fItemExistText.Position.Y := Position.Y + dY + fDeltaHeight * i
      else
        fItemNoExistText.Position.Y := Position.Y + dY + fDeltaHeight * i;

      if item.fExistRom <> 0 then
        fItemExistText.Text := item.fGameName
      else
        fItemNoExistText.Text := item.fGameName;
      with fPanelSelection.Material.GetActualPrimaryMaterial do
        FrontProperties.Diffuse.Alpha := item.fSelectAlpha;
      fPanelSelection.DoRender(ARci, true, false);
      if item.fExistRom <> 0 then
        fItemExistText.DoRender(ARci, true, false)
      else
        fItemNoExistText.DoRender(ARci,True,False);
    end;

  fPanelFront.DoRender(ARci, true, false);
end;
//------------------------------------------------------------------------------
Procedure TSimpleListBox.DoProgress(const progressTime: TProgressTimes);
var
  dy: Single;
  i: Integer;
begin
  dy := (fMousePosition[1] - (Position.Y - fHeight));
  if dY < 0 then
    dY := 0;
  if dY > fHeight * 2 then
    dY := fHeight * 2;

  if fItems.Count >= fMaxVisibleCount then
    fYPosition := fYPosition
  else
    fYPosition := 0;

  for i := 0 to fItems.Count - 1 do
    with GetItemByIndex(i) do
      fSelectAlpha := fSelectAlpha - progressTime.deltaTime * 2;

//  GetItemByIndex(sItem).fSelectAlpha := 1;
//  item := GetIndexByMouse;
  if sItem <> -1 then
    GetItemByIndex(sItem).fSelectAlpha := 1;
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
  fMainDummy.Visible := True;

  fItemExistText := TGlHudText.CreateAsChild(fMainDummy);
  fItemExistText.BitmapFont := yFont;
  fItemExistText.ModulateColor.AsWinColor := clWhite; 
  fItemExistText.Layout := tlCenter;

  fItemNoExistText := TGLHUDText.CreateAsChild(fMainDummy);
  fItemNoExistText.BitmapFont := yFont;
  fItemNoExistText.ModulateColor.AsWinColor := clRed;
  fItemNoExistText.Layout := tlCenter;

//  fPanelBack := AddPanel('back_list');
  fPanelFront := AddPanel('front_list');
  fPanelSelection := AddPanel('selection_list');
  fPanelSelection.Height := 30;
  fPanelSelection.Width := 380;

end;
//------------------------------------------------------------------------------
Function TSimpleListBox.GetItemsCount: integer;
begin
  result := fItems.Count;
end;
//------------------------------------------------------------------------------
Procedure TSimpleListBox.MainInit(aMatLib: TGLMaterialLibrary; aFont,bFont: TGLCustomBitmapFont);
begin
  fItems := TList.Create;
  yFont := aFont;
  nFont := bFont;
  fMatLib := aMatLib;
  fDeltaHeight := 30;
  fMaxVisibleCount := 17;
  fYPosition := 0;
  fHeight := 240;
//  fMouseInBox := false;
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
Constructor TSimpleListBox.Create(AOwner: TComponent; aMatLib: TGLMaterialLibrary; aFont,bFont: TGLCustomBitmapFont);
begin
  inherited Create(AOwner);
  MainInit(aMatLib, aFont, bFont);
end;
//------------------------------------------------------------------------------
Constructor TSimpleListBox.CreateAsChild(aParentOwner: TGLBaseSceneObject; aMatLib: TGLMaterialLibrary; aFont,bFont: TGLCustomBitmapFont);
begin
  inherited CreateAsChild(aParentOwner);
  MainInit(aMatLib, aFont, bFont);
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


procedure TSimpleListBox.DOClickDown;
begin
  if sItem <= fItems.Count - 2 then
    begin
      MyTimer.Enabled := True;
      fYPosition := fYPosition - 30;
      sItem := sItem + 1;
      Sleep(sleeping);
      mame.IsImgShowed := False;
    end;
end;

procedure TSimpleListBox.DOClickLeft;
begin
  if sItem - 16 >= 7 then
    begin
      MyTimer.Enabled := True;
      fYPosition := fYPosition + (30 * 16);
      sItem := sItem - 16;
      Sleep(sleeping);
      mame.IsImgShowed := False;
    end
  else
    begin
      fYPosition := 0;
      sItem := 6;
      mame.IsImgShowed := False;
    end;
end;

procedure TSimpleListBox.DOClickRight;
begin
  if sItem + 16 <= fItems.Count - 2 then
    begin
      MyTimer.Enabled := True;
      fYPosition := fYPosition - (30 * 16);
      sItem := sItem + 16;
      Sleep(sleeping);
      mame.IsImgShowed := False;
    end
  else
    begin
      fYPosition := -(30 * (fItems.Count - 7));
      sItem := fItems.Count - 1;
      mame.IsImgShowed := False;
    end;
end;

procedure TSimpleListBox.DOClickUp;
begin
  if sItem >= 7 then
    begin
      MyTimer.Enabled := True;
      fYPosition := fYPosition + 30;
      sItem := sItem - 1;
      Sleep(sleeping);
      mame.IsImgShowed := False;
    end;
end;

procedure TSimpleListBox.CancelClick;
begin
  MyTimer.Enabled := False;
  sleeping := 120;
end;

function CompareNames(Item1, Item2: Pointer): Integer;
var
  sItem1,sItem2: TSimpleListItem;
begin
  sItem1 := TSimpleListItem(Item1);
  sItem2 := TSimpleListItem(Item2);

  if   sItem1.GameName > sItem2.GameName
  then Result := 1
  else if sItem1.GameName = sItem2.GameName
  then Result := 0
  else Result := -1;
end;

{ TMyTimer }

procedure TMyTimer.OnMyTimer(Sender: TObject);
begin
  if sleeping = 5 then
    sleeping := 5
  else
    sleeping := sleeping - 5;
end;


initialization

MyTimer := TMyTimer.Create(nil);
with MyTimer do
begin
  Interval := 100;
  OnTimer := OnMyTimer;
end;

finalization
  FreeAndNil(MyTimer);

end.
