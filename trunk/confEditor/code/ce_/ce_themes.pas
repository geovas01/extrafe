unit ce_themes;

interface

  procedure click_ce_themes;
  procedure click_apply_ce_themes;
  procedure ThemeCreator(num: Byte);

implementation

uses
  main,mainconf;

procedure click_ce_themes;
var
  i,k : Integer;
begin
  k := conf.sLB_ce_themes.ItemIndex;
  i := ConfIni.ReadInteger('Themes','Theme',i);
  if conf.sLB_ce_themes.Selected[i] = False then
    begin
      conf.sBB_apply_ce_themes.Enabled := true;
      conf.img_ce_theme.Picture.LoadFromFile('media\confeditor\skins\preview\'+conf.sLB_ce_themes.Items.Strings[k]+'.png');
    end
  else
    begin
      conf.sBB_apply_ce_themes.Enabled := False;
      Conf.img_ce_theme.Picture.LoadFromFile('media\confeditor\skins\preview\'+conf.sLB_ce_themes.Items.Strings[i]+'.png');
    end;

end;

procedure click_apply_ce_themes;
var
  i : integer;
begin
  i := Conf.sLB_ce_themes.ItemIndex;
  Conf.skinM.SkinName := Conf.sLB_ce_themes.Items.Strings[i];
  conf.sBB_apply_ce_themes.Enabled := False;
  ConfIni.WriteInteger('Themes','Theme',i);
  Conf.sLabelFX3.Caption := Conf.sLB_ce_themes.Items.Strings[i];
  ThemeCreator(i+1);
  SetAllCursor(i+1);
  GroupBoxColors(i);
end;

procedure ThemeCreator(num: Byte);
begin
  Case num of
    1 : begin
          Conf.sLabelFX11.Caption := 'AC Team';
          Conf.sLabelFX12.Caption := 'Opus';
        end;
    2 : begin
          Conf.sLabelFX11.Caption := 'AC Team';
          Conf.sLabelFX12.Caption := 'The Frog';
        end;
    3 : begin
          Conf.sLabelFX11.Caption := 'Serge Goncharov';
          Conf.sLabelFX12.Caption := 'Beijing Ext';
        end;
    4 : begin
          Conf.sLabelFX11.Caption := 'AC Team';
          Conf.sLabelFX12.Caption := 'Calcium';
        end;
  end;
end;

end.
