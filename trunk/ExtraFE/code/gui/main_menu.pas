{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit main_menu;

interface
  uses
    SysUtils,Classes,Windows,Forms,Dialogs,Controls,
    uBaseButton,uTweener,uSimpleButton,
    GLHUDObjects,GLKeyboard,GLFilePNG;

  type
    TEmu = class
    fSprite: TGlHudSprite;
//    fEmuButton: TGUIAlphaButton;
    fX: Single;
    fAlpha: Single;
  end;

  procedure LSMainMenu(aTime: Double);
  procedure InitTweener;
  procedure UpdateEmulators;
  procedure ActivateEmulator(aIndex: integer; aDirection: integer);
  procedure runSelectedEmu(numOfEmu: Integer);
  procedure clickLeftKey(x,y:Integer);
  procedure clickRightKey(x,y:Integer);

  procedure UpDateWidGets;

  type
    fRight_btn = class(TGUIAlphaButton)
    public
      Procedure OnNextClick(aSender: TGUIBaseInteractiveObject);
  end;
  type
    fLeft_Btn = class(TGUIAlphaButton)
    public
      Procedure OnPrevClick(aSender: TGUIBaseInteractiveObject);
  end;

  procedure begin_Mame;
  procedure begin_Zinc;
  procedure begin_Hatari;
  procedure begin_psxEmulator;
  procedure begin_Kigb;

  var
    RightButton : fRight_Btn;
    LeftButton : fLeft_Btn;
    fRightBtn1,fLeftBtn1: TGUIAlphaButton;
    fWidgetsBtn: TGLHUDSprite;
    Start: Boolean;

    fActiveEmulator: integer;
    fEmulators: TList;


implementation

uses
  main,used_pro;

procedure LSMainMenu(aTime: Double);
var
  MPos: TPoint;
  IsKeyP: Boolean;

  Function AddEmulator(aMatName: String; aAlpha: Single = 1): TEmu;
  begin
    result := TEmu.Create;
    result.fSprite := TGlHudSprite.CreateAsChild(MainForm.Dummy_mainmenu);
    with result.fSprite do
    begin
      Material.LibMaterialName := aMatName;
      Material.MaterialLibrary := MatLib;
      Width  := Material.GetActualPrimaryTexture.Image.Width;
      Height := Material.GetActualPrimaryTexture.Image.Height;
      Position.SetPoint(500, 380, 0);
      AlphaChannel := aAlpha;
      Material.GetActualPrimaryMaterial.FrontProperties.Diffuse.Alpha := aAlpha;
      result.fX := 500;
      result.fAlpha := aAlpha;
      fEmulators.Add(result);
    end;
  end;

begin
  if MainForm.Tag = 0 then
    begin
      if Start = False then
        begin
          MainForm.GLCadencer.Scene := MainForm.GLS_MainMenu;
          MainForm.GLSceneViewer.Camera := MainForm.GlCamera_MainMenu;
          MainForm.GLSceneViewer.Cursor := crDefault;

          if fromback = False then
            begin
              AddMaterials(MatLib,'media\extrafe\main_menu\',['background','left_button','left_button_p','right_button','right_button_p'],['background','leftB','leftBP','rightB','rightBP']);
              AddMaterials(MatLib,'media\extrafe\main_menu\',['mame_cab','zinc_cab','hatari_cab','psxemulator_cab','kigb_cab','widgets'],['mameC','zincC','hatariC','psxemulatorC','kigbC','widgets']);
              AddMaterials(MatLib,'media\extrafe\main_menu\',['mame_cab_p','zinc_cab_p','hatari_cab_p','psxemulator_cab_p','kigb_cab_p'],['mameCA','ZincCA','hatariCA','psxemulatorCA','kigbCA']);
              AddMaterials(MatLib,'media\extrafe\main_menu\',['widgets','widgets_p'],['wid','wid_p']);

              InitTweener;

              AddEmulator('mameC',0);
              AddEmulator('zincC',0);
              AddEmulator('hatariC',0);
              AddEmulator('psxemulatorC',0);
              AddEmulator('kigbC',0);

              fRightBtn1 := TGUIAlphaButton.CreateAsChild(MainForm.Dummy_mainmenu);
              fRightBtn1.SetMaterials('rightB','rightBP',MatLib);
              fRightBtn1.Position.SetPoint(900,380,0);
              fRightBtn1.OnMouseClick := RightButton.OnNextClick;
              fRightBtn1.Show;

              fLeftBtn1 := TGUIAlphaButton.CreateAsChild(MainForm.Dummy_mainmenu);
              fLeftBtn1.SetMaterials('leftB','leftBP',MatLib);
              fLeftBtn1.Position.SetPoint(100,380,0);
              fLeftBtn1.OnMouseClick := LeftButton.OnPrevClick;
              fLeftBtn1.Show;

              fWidgetsBtn := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mainmenu);
              AddMaterial(MatLib, 'media\extrafe\main_menu\widgets.png', 'widgets');
              fWidgetsBtn.Material.Assign(MatLib.Materials.GetLibMaterialByName('widgets').Material);
              fWidgetsBtn.Height := 100;
              fWidgetsBtn.Width := 100;
              fWidgetsBtn.Position.X := 950;
              fWidgetsBtn.Position.Y := 700;
              fWidgetsBtn.Material.FrontProperties.Diffuse.Alpha := 0.8;
              
//              fWidgetsBtn := TSimpleButton.CreateAsChild(MainForm.Dummy_mainmenu);
//              fWidgetsBtn('wid',MatLib);
//              fWidgetsBtn.Position.SetPoint(950,700,0);
//              fWidgetsBtn.Show;
            end;
          ActivateEmulator(0, -1);
          fromback := False;
          Start := True;
        end
      else
        begin

          fTweener.Update(dTime);
          UpdateEmulators;
          UpDateWidGets;

          GetCursorPos(Mpos);
          MPos := MainForm.GLSceneViewer.ScreenToClient(MPos);

          fRightBtn1.SetMouseState(MPos.X, MPos.Y, IsKeyDown(VK_LBUTTON));
          fLeftBtn1.SetMouseState(MPos.X, MPos.Y, IsKeyDown(VK_LBUTTON));

          if IsKeyDown(VK_LEFT) then
            clickLeftKey(110, 390);
          if IsKeyDown(VK_RIGHT) then
            clickRightKey(910, 390);
          if IsKeyDown(VK_RETURN) then
            runSelectedEmu(fActiveEmulator);

          MainForm.GLSceneViewer.Invalidate;
        end;
    end;
end;

procedure InitTweener;
begin
  fTweener := TTweener.Create;
  fEmulators := TList.Create;
end;

procedure runSelectedEmu(numOfEmu: Integer);
begin
  case numOfEmu of
    0 : begin_Mame;
    1 : begin_Zinc;
    2 : begin_Hatari;
    3 : begin_psxEmulator;
    4 : begin_Kigb;
  end;
end;

procedure begin_Mame;
var
  i: Integer;
begin
  MainForm.ActiveScene(2);
end;

procedure begin_Zinc;
begin
  
end;

procedure begin_Hatari;
begin

end;

procedure begin_psxEmulator;
begin

end;

procedure begin_Kigb;
begin

end;

procedure clickLeftKey(x,y:Integer);
begin
  MainForm.GLSceneViewer.Cursor := crNone;
  fLeftBtn1.SetMouseState(x, y, IsKeyDown(VK_LEFT));
  Sleep(200);
end;

procedure clickRightKey(x,y:Integer);
begin
  MainForm.GLSceneViewer.Cursor := crNone;
  fRightBtn1.SetMouseState(x, y, IsKeyDown(VK_RIGHT));
  Sleep(200);
end;

Procedure UpdateEmulators;
var
  i: integer;
begin
  for i := 0 to fEmulators.Count - 1 do
    with TEmu(fEmulators[i]) do
    begin
      fSprite.Position.SetPoint(fX, fSprite.Position.y, 0);
      fSprite.AlphaChannel := fAlpha;
      fSprite.Material.GetActualPrimaryMaterial.FrontProperties.Diffuse.Alpha := fAlpha;
    end;
end;

Procedure ActivateEmulator(aIndex: integer; aDirection: integer);
begin
  if (fActiveEmulator >= 0) then
    with TEmu(fEmulators[fActiveEmulator]) do
    begin
      fTweener.DeletePSingle(@fX);
      fTweener.DeletePSingle(@fAlpha);
      fTweener.AddTweenPSingle(@fX, ts_ExpoEaseIn, fX, 500 + aDirection * 100, 2);
      fTweener.AddTweenPSingle(@fAlpha, ts_ExpoEaseIn, fAlpha, 0, 0.7);
    end;

  if(aIndex >= 0) then
    with TEmu(fEmulators[aIndex]) do
    begin
      fTweener.DeletePSingle(@fX);
      fTweener.DeletePSingle(@fAlpha);
      fTweener.AddTweenPSingle(@fX, ts_ExpoEaseIn, 500 - aDirection * 100, 500, 2, 0.5);
      fTweener.AddTweenPSingle(@fAlpha, ts_ExpoEaseIn, 0, 1, 0.7, 0.5);
    end;

  fActiveEmulator := aIndex;
end;

procedure UpDateWidGets;
begin
  fWidgetsBtn.Rotation := fWidgetsBtn.Rotation + 0.2;
end;

{ fRight_btn }

procedure fRight_btn.OnNextClick(aSender: TGUIBaseInteractiveObject);
begin
  if(fActiveEmulator = fEmulators.Count - 1)then
    ActivateEmulator(0, -1)
  else
    ActivateEmulator(fActiveEmulator + 1, -1);
end;

{ fLeft_Btn }

procedure fLeft_Btn.OnPrevClick(aSender: TGUIBaseInteractiveObject);
begin
  if(fActiveEmulator = 0)then
    ActivateEmulator(fEmulators.Count - 1, 1)
  else
    ActivateEmulator(fActiveEmulator - 1, 1);
end;

end.

