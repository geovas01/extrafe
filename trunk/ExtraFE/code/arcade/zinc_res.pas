unit zinc_res;

interface
uses
  SysUtils,Windows,Graphics,Classes,Forms,ExtCtrls,
  used_pro,loadT,uMain_ListBox,vitru_key,
  GLScene,VectorGeometry,GLCrossPlatform,GLObjects,GLHUDObjects,
  GLFilePNG;

procedure loadText;
procedure loadImages;
procedure load3dObjects;


implementation
uses
  main,zinc;
  
procedure loadText;
begin
  if not Assigned(fButtonNow) then
    begin
      fButtonNow := TGLHUDText.CreateAsChild(MainForm.GLDummy_zinc);
      fButtonNow.BitmapFont := loadT.fnonexistFont;
      fButtonNow.ModulateColor.AsWinColor := clWhite;
      fButtonNow.Layout := tlCenter;
      fButtonNow.Alignment := taRightJustify;
      fButtonNow.Position.X := 1000;
      fButtonNow.Position.Y := 20;
    end;
  if not Assigned(fNumOfZinc_Games) then
    begin
      fNumOfZinc_Games := TGLHUDText.CreateAsChild(MainForm.GLDummy_zinc);
      fNumOfZinc_Games.BitmapFont := loadT.fnonexistFont;
      fNumOfZinc_Games.ModulateColor.AsWinColor := clWhite;
      fNumOfZinc_Games.Layout := tlCenter;
      fNumOfZinc_Games.Alignment := taRightJustify;
      fNumOfZinc_Games.Position.X := 440;
      fNumOfZinc_Games.Position.Y := 20;
    end;
end;

procedure loadImages;
begin

end;

procedure load3dObjects;
begin
  if not Assigned(fcube_zinc) then
    begin
      fcube_zinc := TGLPlane.CreateAsChild(MainForm.GLDummy_zinc);
//      AddMaterial(MatLib,'media\extrafe\intro\cubeback1.png','cubeback');
      fcube_zinc.Material.MaterialLibrary := MatLib;
      fcube_zinc.Material.LibMaterialName := 'cubeback';
      fcube_zinc.Width := 1;
      fcube_zinc.Height := 1;
      fcube_zinc.TurnAngle := - 135;
      fcube_zinc.Scale.X := 0.5;
      fcube_zinc.Scale.Y := 0.5;
      fcube_zinc.Position.X := - 0.8;
      fcube_zinc.Position.Y := - 0.19;
      fcube_zinc.Position.Z := 0;
      fcube_zinc.Visible := True;
    end;
end;


end.
