unit exf_config;

interface
uses
  SysUtils,OmniXML,OmniXMLUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_ExtraFe_configurationpanel;
  procedure exf_config_ShowDynamicComps;
  procedure exf_config_FreeDynamicComps;

implementation
uses
  main,mainconf,onflycomponents,FunctionX,menu,
  exf_themes;

////////////////////////////////////////////////////////////////////////////////  
procedure Show_ExtraFe_configurationpanel;
begin
  if Cmenustate = 'exf_themes' then
    exf_themes_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn6.Caption,False,True);
  Cmenustate := 'exf_configuration';
  exf_config_ShowDynamicComps;
  ShowButtonDown(6,'EXTRAFE_CONFIG');
  ShowHidePanel(CurrentPanel,'Pexf_configuration');
end;

procedure exf_config_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pexf_configuration,'media\confeditor\images\extrafe\extrafe.png',
              3,586,135,75,i,'',True,False);
        2 : Image_Comp(Conf.Pexf_configuration,'media\confeditor\images\extrafe\extrafe_image.png',
              602,381,150,280,i,'',True,False);
        3 : Image_Comp(Conf.Pexf_configuration,'media\confeditor\images\extrafe\configuration.png',
              499,2,230,71,i,'',True,False);
      end;
    end;
end;

procedure exf_config_FreeDynamicComps;
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
