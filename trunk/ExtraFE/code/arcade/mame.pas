unit mame;

interface
uses
  SysUtils,Windows,used_pro,loadT,
  uSimplePanel,
  VectorGeometry;

  procedure MameMenu(aTime: Double);

const
  SkinsNames: array [1..8] of String = ('white', 'blue', 'shadow', 'transparent', 'marene', 'orange', 'green', 'bloody');  

var
  fMousePressed: Boolean;

  {Panels}
  fPanel: TSimplePanel;
  fSizing: TNCSizing;
  fStartPosSizing: TVector;
  fDoSizing: Boolean;


implementation

uses
  main,GLKeyboard;


procedure MameMenu(aTime: Double);
var
  Mpos: TPoint;
begin
  if MainForm.Tag = 0 then
    begin
// Init objects
      if MainForm.Mame_Background.Tag = 0 then
        begin
          AddMaterials(MatLib,'media\emulators\arcade\mame\extrafe\',SkinsNames,SkinsNames);
          fPanel := TSimplePanel.CreateAsChild(MainForm.Dummy_mame);
          fPanel.Material.MaterialLibrary := MatLib;
          fPanel.Position.SetPoint(CenterX, CenterY, 0);
          fPanel.Width := 100;
          fPanel.Height := 100;
          fPanel.Material.LibMaterialName := 'blue';
          MainForm.Mame_Background.Tag := 1;
        end;
// Start the loop
      if MainForm.Mame_Background.Tag = 1 then
        begin
          MainForm.GLSceneViewer.Invalidate;
          GetCursorPos(MPos);
          MPos := MainForm.GLSceneViewer.ScreenToClient(MPos);
          fListBox.SetMousePosition(MPos.x, MPos.y);
          fMousePressed := IsKeyDown(vk_LButton);
        end;

    end;
end;

end.
