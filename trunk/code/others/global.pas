unit global;

interface

uses
  SysUtils,Forms;

  procedure global_Find_FilesCanClose;
  procedure global_Find_FilesClose;
  procedure global_Find_DirsClose;

implementation

uses
  main,menu,
  mame_dirs,mame_graphics,mame_database,mame_builds;

procedure global_Find_FilesCanClose;
begin
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
    Conf.sEdit125.Text := Conf.Find_Files.FileName;

end;

procedure global_Find_FilesClose;
begin
  if gFindFiles = 'mame' then
    begin
      Conf.sComboBox72.Visible := False;
      Conf.grp115.Visible := False;
      RunMameDataBase;
    end;
end;

procedure global_Find_DirsClose;
begin
  if FromMame_DirsToFindDirs = True then
    SetMamePath(gFindDirs)
  else if gFindDirs = 'IPSDir_mameplus' then
    SetTheNewIPSDir_MamePlus
  else if gFindDirs = 'IPSDir_mamext' then
    SetTheNewIPSDir_MameXT;
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
