unit loadT;

interface
uses
  GLmaterial,GLTexture, GLKeyboard, GLHUDObjects,GlFilePNG, GlCompositeImage;

  procedure main_menu(aTime: Double);
  procedure Progress_Bar_Intro(Progresspercent: real);

  function AddMaterial(aMatLib: TGlMaterialLibrary; aFileName, aMaterialName: string): TGlLibMaterial;

implementation
uses
  main,Controls,Windows, forms,SysUtils,
  bass;


procedure main_menu(aTime: Double);
var
  i: integer;
begin
  AddMaterial(MatLib, 'media\extrafe\intro\splash.png', 'splash');
  MainForm.Background_intro.Material.Assign(MatLib.Materials.GetLibMaterialByName('splash').Material);
  MainForm.Background_intro.Height := MainForm.GLSceneViewer.Height;
  MainForm.Background_intro.Width := MainForm.GLSceneViewer.Width;
  MainForm.Background_intro.Position.X := CenterX;
  MainForm.Background_intro.Position.Y := CenterY;


  MainForm.GLHUDText_ExtraFE_Ver.Position.X := 1050;
  MainForm.GLHUDText_ExtraFE_Ver.Position.Y := 700;
  MainForm.GLHUDText_ExtraFE_Ver.Text := 'ExtraFE Ver     : 0.2.5.100';
  MainForm.GLHUDText_confEditor_Ver.Position.X := 1050;
  MainForm.GLHUDText_confEditor_Ver.Position.Y := 730;
  MainForm.GLHUDText_confEditor_Ver.Text := 'confEditor Ver : 0.2.5.100';
  MainForm.GLHUDText_ExtraFE_Ver.Visible := True;

  for i := 0 to 100 do
    begin
      Progress_Bar_Intro(i);
      Sleep(30);
    end;
end;

procedure ProgresS_Bar_intro(Progresspercent: real);
var
  NMaskWidth: Single;
begin
  with MainForm do
  begin
    if MatLib=nil then
      MatLib := TGLMaterialLibrary.Create(MainForm);

    if Progresspercent < 100 then
    begin
      if Progress.Tag <> 1 then
      begin
        AddMaterial(MatLib, 'media\extrafe\intro\progress.png', 'Progress');
        Progress.Material.Assign(MatLib.Materials.GetLibMaterialByName('Progress').Material);
        Progress.Height := 57;
        Progress.Width := 488;
        Progress.Position.X := CenterX - 20;
        Progress.Position.y := CenterY + 30;
        Progress.Tag := 1;

        AddMaterial(MatLib, 'media\extrafe\intro\mask.png', 'Mask');
        mask.Material.Assign(MatLib.Materials.GetLibMaterialByName('Mask').Material);
      end;

      if Bar.Tag <> 1 then
      begin
        AddMaterial(MatLib, 'media\extrafe\intro\bar.png', 'bar');
        bar.Material.Assign(MatLib.Materials.GetLibMaterialByName('bar').Material);
        Bar.Height := 57;
        Bar.Width := 488;
        Bar.Position.X := CenterX - 20;
        Bar.Position.y := CenterY + 30;
        Bar.Tag := 1;
      end;
      mask.Width := (Bar.Width - 16);
      mask.Height := (Bar.Height - 12);
      mask.Position := Bar.Position;
      mask.Position.X := mask.Position.X + ((mask.Width / 100 * Progresspercent)/2);
      NMaskWidth:=mask.Width - mask.Width / 100 * Progresspercent;
      mask.Width:=NMaskWidth;
      MainForm.GLHUDText_Progress.Position.X := CenterX-20;
      MainForm.GLHUDText_Progress.Position.Y := CenterY+18;
      MainForm.GLHUDText_Progress.Text := FloatToStr(Progresspercent) + '%';
      Progress_Bar.Visible := true;
      Application.ProcessMessages;
    end
    else
      Progress_Bar.Visible := false;
  end
end;

function AddMaterial(aMatLib: TGlMaterialLibrary; aFileName, aMaterialName: string): TGlLibMaterial;

begin
  result := aMatLib.Materials.Add;
  with result do
  begin
    with Material do
    begin
      MaterialOptions := [moIgnoreFog, moNoLighting];
      Texture.Disabled := false;
      BlendingMode := bmTransparency;
      Texture.TextureMode := tmModulate;
      with FrontProperties do
      begin
        Ambient.SetColor(1, 1, 1, 1);
        Diffuse.SetColor(1, 1, 1, 1);
        Emission.SetColor(1, 1, 1, 1);
        Specular.SetColor(1, 1, 1, 1);
      end;
      Texture.ImageClassName := 'TGLCompositeImage';
      TGLCompositeImage(Texture.Image).LoadFromFile(aFileName);
      {здесь ещё должно быть Texture.AllacoteHandle, но я его затёр ибо из-за него ничего ним хочет работать}
    end;
    Name := aMaterialName;
  end;
end;

end.
