unit main_menu;

interface
  uses
    SysUtils,Classes,Windows,Forms,uBaseButton,uTweener,GLKeyboard;

  procedure LSMainMenu(aTime: Double);


  var
    EmuButton : TGUIAlphaButton;
    WinGetButton: TGUIAlphaButton; 
    Start: Boolean;
//    fTweener: TTweener;
implementation

uses
  main,used_pro;

procedure LSMainMenu(aTime: Double);
var
  MPos: TPoint;
begin
  if MainForm.Tag = 0 then
    begin
      if Start = False then
        begin
          AddMaterials(MatLib,'media\extrafe\main_menu\',['emu_btn1','emu_btn2','wg_btn1','wg_btn2'],['emu_btn1','emu_btn2','wg_btn1','wg_btn2']);

          EmuButton := TGUIAlphaButton.CreateAsChild(MainForm.Dummy_mainmenu);
          EmuButton.SetMaterials('emu_btn1','emu_btn2',MatLib);
          EmuButton.Position.SetPoint(120,CenterY - 30,0);
          EmuButton.Tag := 0;
          EmuButton.Show;

          WinGetButton := TGUIAlphaButton.CreateAsChild(MainForm.Dummy_mainmenu);
          WinGetButton.SetMaterials('wg_btn1','wg_btn2',MatLib);
          WinGetButton.Position.SetPoint(120,CenterY+40,0);
          WinGetButton.Tag := 1;
          WinGetButton.Show;
          Start := True;
        end
      else
        begin
          GetCursorPos(Mpos);
          MPos := MainForm.GLSceneViewer.ScreenToClient(MPos);

          EmuButton.SetMouseState(MPos.X, MPos.Y, IsKeyDown(VK_LBUTTON) );
          WinGetButton.SetMouseState(MPos.X, MPos.Y, IsKeyDown(vk_LButton) );

          MainForm.GLSceneViewer.Invalidate;
        end;
    end;
end;

end.

