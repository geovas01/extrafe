unit global;

interface

uses
  SysUtils,Forms,GLKeyboard,StdCtrls,sPanel,Graphics,Classes;

  procedure global_Find_FilesCanClose;
  procedure global_Find_FilesClose;
  procedure global_Find_DirsClose;

  //Configures keys global to Extrafe
  procedure CheckForHittingKey;

  procedure RestoreTheOriginalColor;

var
  CheckedTimes: Integer;

implementation

uses
  main,menu,FunctionX,
  mame_dirs,mame_graphics,mame_database,mame_builds,
  zinc_paths;

procedure global_Find_FilesCanClose;
begin
// Mame
  if gFindFiles = 'mame' then
    CheckForMameAndCreateIni
  else if gFindFiles = 'visual_effect' then
    Conf.sEdit1.Text := Conf.Find_Files.FileName
  else if gFindFiles = 'joystick_map' then
    Conf.sEdit15.Text := Conf.Find_Files.FileName
  else if gFindFiles = 'hiscoredat_mameplus' then
    FindHiScoreDat_MamePlusReturn
  else if gFindFiles = 'hiscoredat_mamext' then
    FindHiScoreDat_MameXTReturn
  else if gFindFiles = 'MameTools_FontName' then
    Conf.sEdit125.Text := Conf.Find_Files.FileName
// Zinc
  else if gFindFiles = 'zinc' then
    SetUpTheNewZincExe;

end;

procedure global_Find_FilesClose;
begin
  if gFindFiles = 'mame' then
    CreateNewMameDataBase;          
end;

procedure global_Find_DirsClose;
begin
// Mame
  if FromMame_DirsToFindDirs = True then
    SetMamePath(gFindDirs)
  else if gFindDirs = 'NewRom_Dir' then
    AddNewRom_Dir
  else if gFindDirs = 'IPSDir_mameplus' then
    SetTheNewIPSDir_MamePlus
  else if gFindDirs = 'IPSDir_mamext' then
    SetTheNewIPSDir_MameXT
// ZInc  
  else if gFindDirs = '' then
    SetTheNewZincRomDirectory
  else if gFindDirs = '' then
    SetTheNewZincSnapsDirectory;
end;


procedure CheckForHittingKey;
var
  component: TComponent;
  i : integer;

  procedure CheckPanel(Panel : TsPanel);
    begin
      if IsKeyDown(KeyNameToVirtualKeyCode(Panel.Caption)) then
      begin
        Panel.Color:=clRed;
        CheckedTimes := CheckedTimes + 1;
      end;
    end;
begin
  if (Conf.Pem_psx_sound.Tag = 1) or (Conf.Pem_psx_others.Tag = 1) then
    begin
      component := FindComponentEx('Conf.sPanel');
      CheckPanel(TsPanel(component));
      for i := 2 to 36 do
        begin
          component := FindComponentEx('Conf.sPanel'+inttostr(i));
          CheckPanel(TsPanel(component));
        end;
    end
end;

procedure RestoreTheOriginalColor;
var
  component: TComponent;
  i: Integer;
begin
  if (Conf.Pem_psx_sound.Tag = 1) or (Conf.Pem_psx_others.Tag = 1) then
    begin
      component := FindComponentEx('Conf.sPanel');
      TsPanel(component).Color := clBtnFace;
      for i := 2 to 36 do
        begin
          component := FindComponentEx('Conf.sPanel'+inttostr(i));
          TsPanel(component).Color := clBtnFace;
        end;
    end;
end;

{ The procedure to put png image from resource to tsbitbtn
var
//  PngImage: TPNGObject;
//  rs: TResourceStream;
begin
//      PngImage := TPNGObject.Create;
//      rs := TResourceStream.Create(HInstance,MenuBitBtnIcons[i],RT_RCDATA);
//      PngImage.LoadFromStream(rs);
//      rs.Free;
//      TsBitBtn(component).Glyph.Assign(PngImage);
//      PngImage.LoadFromResourceName(HInstance,MenuBitBtnIcons[i]);
//      TsBitBtn(component).Glyph.LoadFromResourceName(HInstance,MenuBitBtnIcons[i]);
//      TsBitBtn(component).Glyph
//      PngImage.Free;
//      TsBitBtn(component).ImageIndex := MenuBitBtnIcons[i];
end;
}
end.
