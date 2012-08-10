unit exf_themes;

interface

uses
  SysUtils,OmniXML,OmniXMLUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_ExtraFe_themespanel;
  procedure exf_themes_ShowDynamicComps;
  procedure exf_themes_FreeDynamicComps;
    
implementation
uses
  main,mainconf,onflycomponents,FunctionX,menu,
  exf_config;

////////////////////////////////////////////////////////////////////////////////
procedure Show_ExtraFe_themespanel;
begin
  if Cmenustate = 'exf_configuration' then
    exf_config_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'exf_themes';
  exf_themes_ShowDynamicComps;
  ShowButtonDown(7,'EXTRAFE_THEMES');
  ShowHidePanel(CurrentPanel,'Pexf_themes');
end;

procedure exf_themes_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pexf_themes,'media\confeditor\images\extrafe\extrafe.png',
              3,586,155,85,i,True);
        2 : Image_Comp(Conf.Pexf_themes,'media\confeditor\images\extrafe\extrafe_image.png',
              602,381,150,280,i,True);
        3 : Image_Comp(Conf.Pexf_themes,'media\confeditor\images\extrafe\themes.png',
              603,2,136,71,i,True);
      end;
    end;
end;

procedure exf_themes_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
end;

end.
