unit mame;

interface
uses
  SysUtils,Windows,
  uSimpleListBox,used_pro;

const
  MameMats: array [1..4] of String = ('front_list','back_list','selection_list','back_mame');

  procedure MameMenu(aTime: Double);

var
  fListBox: TSimpleListBox;
  fMousePressed: Boolean;


implementation

uses
  main,GLKeyboard;


procedure MameMenu(aTime: Double);
var
  Mpos: TPoint;
  i: Integer;
begin
  if MainForm.Tag = 0 then
    begin
// Load the materials
      if MainForm.Mame_Background.Tag = 0 then
        begin
          AddMaterials(MatLib, 'media\emulators\arcade\mame\extrafe\', MameMats, MameMats);
          fListBox := TSimpleListBox.CreateAsChild(MainForm.GLDummyCube1,MatLib,MainForm.Font_Mame);
          fListBox.Position.X := 250;
          fListBox.Position.Y := 340;
          for i := 1 to 30 do
            fListBox.AddItemText(inttostr(i) + '. Arcade Game');
          MainForm.Mame_Background.Material.Assign(MatLib.Materials.GetLibMaterialByName('back_mame').Material);
          MainForm.Mame_Background.Height := MainForm.GLSceneViewer.Height;
          MainForm.Mame_Background.Width := MainForm.GLSceneViewer.Width;
          MainForm.Mame_Background.Position.X := CenterX;
          MainForm.Mame_Background.Position.Y := CenterY;
//          MainForm.Back_List_Mame.Material.Assign(MatLib.Materials.GetLibMaterialByName('back_list').Material);
//          MainForm.Back_List_Mame.Width := 398;
//          MainForm.Back_List_Mame.Height := 598;
//          MainForm.Back_List_Mame.Position.X := CenterX-1;
//          MainForm.Back_List_Mame.Position.Y := CenterY-1;
//          MainForm.Front_List_Mame.Material.Assign(MatLib.Materials.GetLibMaterialByName('front_list').Material);
//          MainForm.Front_List_Mame.Width := 400;
//          MainForm.Front_List_Mame.Height := 600;
//          MainForm.Front_List_Mame.Position.X := 220;
//          MainForm.Front_List_Mame.Position.Y := 320;
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
