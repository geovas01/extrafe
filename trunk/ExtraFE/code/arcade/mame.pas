unit mame;

interface
uses
  SysUtils,Windows,used_pro,loadT,
  uMain_ListBox,
  VectorGeometry;

  procedure MameMenu(aTime: Double);

const
  SkinsNames: array [1..8] of String = ('white', 'blue', 'shadow', 'transparent', 'marene', 'orange', 'green', 'bloody');  

var
  fMousePressed: Boolean;

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
          MainForm.GLCadencer.Scene := MainForm.GLS_mame;
          MainForm.GLSceneViewer.Camera := MainForm.GlCamera_mame;
          AddMaterials(MatLib,'media\emulators\arcade\mame\extrafe\',SkinsNames,SkinsNames);
          MainForm.Mame_Background.Tag := 1;
          sItem := 6;
        end;
// Start the loop
      if MainForm.Mame_Background.Tag = 1 then
        begin
          MainForm.GLSceneViewer.Invalidate;
          if IsKeyDown(VK_DOWN) then
            fListBox.DoClickDown
          else if IsKeyDown(VK_UP ) then
            fListBox.DOClickUp
          else if IsKeyDown(VK_LEFT) then
            fListBox.DOClickLeft
          else if IsKeyDown(VK_RIGHT) then
            fListBox.DOClickRight
          else
            fListBox.CancelClick;
        end;

    end;
end;

end.
