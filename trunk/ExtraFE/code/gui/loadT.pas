unit loadT;

interface
uses
  GLKeyboard, GLHUDObjects,GlFilePNG;

  procedure Intro(aTime: Double);
  procedure Progress_Bar_Intro(Progresspercent: real);

    
implementation
uses
  main,used_pro,Controls,Windows, forms,SysUtils,
  bass;


procedure Intro(aTime: Double);
var
  i: integer;
begin
  if MainForm.Background_intro.Tag = 0 then
    begin
      AddMaterial(MatLib, 'media\extrafe\intro\splash.png', 'splash');
      MainForm.Background_intro.Material.Assign(MatLib.Materials.GetLibMaterialByName('splash').Material);
      MainForm.Background_intro.Height := MainForm.GLSceneViewer.Height;
      MainForm.Background_intro.Width := MainForm.GLSceneViewer.Width;
      MainForm.Background_intro.Position.X := CenterX;
      MainForm.Background_intro.Position.Y := CenterY;
      MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := -0.8;
      MainForm.Background_intro.Material.FrontProperties.Ambient.Red := 255;
      MainForm.Background_intro.Material.FrontProperties.Ambient.Green := 255;
      MainForm.Background_intro.Material.FrontProperties.Ambient.Blue := 255;
      MainForm.Background_intro.Tag := 1;
    end;

  if MainForm.Background_intro.Tag = 1 then
    if MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha < 1.5 then
      MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha + 0.3 * dTime
    else
      MainForm.Background_intro.Tag := 2;

  if MainForm.Background_intro.Tag = 2 then
    begin
      MainForm.GLHUDText_ExtraFE_Ver.Position.X := 5;
      MainForm.GLHUDText_ExtraFE_Ver.Position.Y := 710;
      MainForm.GLHUDText_ExtraFE_Ver.Text := 'ExtraFE Ver     : '+ GetVersionInfo('ExtraFE.exe');
      MainForm.GLHUDText_confEditor_Ver.Position.X := 5;
      MainForm.GLHUDText_confEditor_Ver.Position.Y := 730;
      MainForm.GLHUDText_confEditor_Ver.Text := 'confEditor Ver : '+ GetVersionInfo('confEditor.exe');
      MainForm.GLHUDText_ExtraFE_Ver.Visible := True;

      for i := 0 to 100 do
        begin
          Progress_Bar_Intro(i);
          Sleep(30);
        end;
      MainForm.GLHUDText_ExtraFE_Ver.Visible := False;
      MainForm.GLHUDText_confEditor_Ver.Visible := False;
      MainForm.Background_intro.Tag := 3;
    end;

    if MainForm.Background_intro.Tag = 3 then
      if MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha > 0.3 then
        MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha - 0.2 * dTime
      else
        IntroScene := False;

end;

procedure ProgresS_Bar_intro(Progresspercent: real);
var
  NMaskWidth: Single;
begin
  MainForm.Progress.Visible := True;
  with MainForm do
  begin
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
    Progress.Visible := False;
  end
end;


end.

