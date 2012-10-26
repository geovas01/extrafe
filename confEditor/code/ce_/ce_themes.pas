unit ce_themes;

interface

uses
  SysUtils,ExtCtrls,Classes,
  NativeXml,
  sLabel;

  procedure click_ce_themes;
  procedure click_apply_ce_themes;
  procedure ThemeCreator(num: Byte);

// Menu actions
  procedure Show_confEditor_themespanel;
  procedure ce_themes_ShowDynamicComps;
  procedure ce_themes_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,onflycomponents,FunctionX,
  ce_config,ce_wizard;

var
  node: TXmlNode;

procedure click_ce_themes;
var
  k : Integer;
begin
  k := conf.sLB_ce_themes.ItemIndex;
  if conf.sLB_ce_themes.Selected[ThemeNumber] = False then
    begin
      conf.sBB_apply_ce_themes.Enabled := true;
      conf.img_ce_theme.Picture.LoadFromFile('media\confeditor\skins\preview\'+conf.sLB_ce_themes.Items.Strings[k]+'.png');
    end
  else
    begin
      conf.sBB_apply_ce_themes.Enabled := False;
      Conf.img_ce_theme.Picture.LoadFromFile('media\confeditor\skins\preview\'+conf.sLB_ce_themes.Items.Strings[ThemeNumber]+'.png');
    end;
end;

procedure click_apply_ce_themes;
begin
  ThemeNumber := Conf.sLB_ce_themes.ItemIndex;
  Conf.skinM.SkinName := Conf.sLB_ce_themes.Items.Strings[ThemeNumber];
  conf.sBB_apply_ce_themes.Enabled := False;
  if not Assigned(FXml_CE) then
    begin
      FXml_CE := TNativeXml.CreateName('confeditor');
      FXml_CE.XmlFormat := xfReadable;
    end;
  node := FXml_CE.Root.NodeByName('rowtheme');
  node.WriteAttributeInteger('ThemeNumber',ThemeNumber);
  FXml_CE.SaveToFile(Ce_XMLPath);
  Conf.sLabelFX3.Caption := Conf.sLB_ce_themes.Items.Strings[ThemeNumber];
  ThemeCreator(ThemeNumber+1);
  SetAllCursor(ThemeNumber+1);
  GroupBoxColors(ThemeNumber);
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

/////////////////////////////////////////////////////////////////////////////////
procedure Show_confEditor_themespanel;
begin
  if Cmenustate = 'ce_configuration' then
    ce_config_FreeDynamicComps
  else if  Cmenustate = 'startwizard' then
    ce_wizard_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,True);
  Cmenustate := 'ce_themes';
  ce_themes_ShowDynamicComps;
  ShowButtonDown(8,'CONFEDITOR_THEMES');
  ShowHidePanel(CurrentPanel,'Pce_themes');
end;

procedure ce_themes_ShowDynamicComps;
var
  i: Integer;
begin
// Image Components
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pce_themes,'media\confeditor\images\confeditor\confeditor.png',
              3,571,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pce_themes,'media\confeditor\images\confeditor\confeditor_image.png',
              600,381,126,280,i,'',True,False);
        3 : Image_Comp(Conf.Pce_themes,'media\confeditor\images\confeditor\themes.png',
              587,2,136,71,i,'',True,False);
      end;
    end;
// Label Components
  for i := 1 to 5 do
    begin
      case i of
        1 : Label_Comp(Conf.Pce_themes,'Choose Theme :',23,51,i,'',True,True,True);
        2 : Label_Comp(Conf.Pce_themes,'Preview',238,51,i,'',True,True,True);
        3 : Label_Comp(Conf.Pce_themes,'Theme used :',23,290,i,'',True,True,True);
        4 : Label_Comp(Conf.Pce_themes,'Constructed by :',600,294,i,'',True,True,True);
        5 : Label_Comp(Conf.Pce_themes,'Theme real name :',600,338,i,'',True,True,True);
      end;
    end;
end;

procedure ce_themes_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
  for i := 1 to 5 do
    begin
      Comp := FindComponentEx('Conf.Label'+IntToStr(i));
      TsLabel(Comp).Free;
    end;
end;


end.
