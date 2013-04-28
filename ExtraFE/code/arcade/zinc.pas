unit zinc;

interface
uses
  SysUtils,Windows,Graphics,Classes,Forms,ExtCtrls,
  GLScene,VectorGeometry,GLCrossPlatform,GLObjects,GLHUDObjects,
  GLFilePNG,
  uMain_ListBox,vitru_key,zinc_res,used_pro;

procedure ZincMenu(aTime: Double);

procedure RunGame(gameNum: Integer);

procedure ReturnToMainMenu;

var


  fButtonNow,fNumOfZinc_Games: TGLHUDText;
//  fcube_zinc: TGLCube;
  fcube_zinc: TGLPlane;

implementation
uses
  main,main_menu,GLKeyboard,loadT;

procedure ZincMenu(aTime: Double);
var
  Mpos: TPoint;
  Game: TSimpleListItem;

begin
  if MainForm.zinc_back.Tag = 0 then
    begin
      MainForm.GLCadencer.Scene := MainForm.GLS_zinc;
      MainForm.GLSceneViewer.Camera := MainForm.GLCamera_zinc;
      MainForm.GLCamera_zinc.TargetObject :=  MainForm.zinc_back;

      loadText;
      load3dObjects;

      sItem := 6;
      fListBox_Zinc.fYPosition := 0;

      MainForm.zinc_back.Tag := 1;
    end
  else
    begin
      GetCursorPos(Mpos);
      MPos := MainForm.GLSceneViewer.ScreenToClient(MPos);
      game := fListBox_Zinc.GetItemByIndex(sItem);
      fNumOfZinc_Games.Text := IntToStr(sItem - 5) + '/' + IntToStr(ZincTotalRoms);
      if IsKeyDown(VK_RETURN) then
        RunGame(Game.Number)
      else if IsKeyDown(VK_ESCAPE) then
        ReturnToMainMenu
      else if IsKeyDown(VK_UP) then
        fListBox_Zinc.DOClickUp
      else if IsKeyDown(VK_DOWN) then
        fListBox_Zinc.DOClickDown
      else if IsKeyDown(VK_LEFT) then
        fListBox_Zinc.DOClickLeft
      else if IsKeyDown(VK_RIGHT) then
        fListBox_Zinc.DOClickRight
      else if IsKeyDown('p') then
        begin
          fcube_zinc.Position.y := fcube_zinc.Position.y + 0.1;
          Sleep(30);
        end
      else if IsKeyDown('s') then
        begin
          fcube_zinc.Position.y := fcube_zinc.Position.y - 0.1;
          Sleep(30);
        end
      else
        fListBox_Zinc.CancelClick;
//      if planespining = True then
//        fcube_zinc.TurnAngle := fcube_zinc.TurnAngle + 0.4;
      fButtonNow.Text := 'Plane scale in X axis ' + FloatToStr(fcube_zinc.Position.y);
      MainForm.GLSceneViewer.Invalidate;
    end;
end;

procedure RunGame(gameNum: Integer);
begin
  MainForm.GLSceneViewer.Enabled := False;
  ShellExecAndWait(Zinc_exe,IntToStr(gamenum),zinc_path,0);
  MainForm.GLSceneViewer.Enabled := True;
end;


procedure ReturnToMainMenu;
begin
  MainForm.ActiveScene(1);
  Start := False;
  fromback := True;
  MainForm.zinc_back.Tag := 0;
end;

end.
