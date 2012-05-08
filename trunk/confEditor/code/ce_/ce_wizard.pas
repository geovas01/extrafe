unit ce_wizard;

interface
  uses
    SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_confEditor_wizardpanel;
  procedure ce_wizard_ShowDynamicComps;
  procedure ce_wizard_FreeDynamicComps;

implementation

uses
  main,mainconf,onflycomponents,FunctionX,menu,
  ce_config,ce_themes;

procedure Show_confEditor_wizardpanel;
begin
  if Cmenustate = 'ce_configuration' then
    ce_config_FreeDynamicComps
  else if Cmenustate = 'ce_themes' then
    ce_themes_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn6.Caption,False,True);
  Cmenustate := 'startwizard';
  ce_wizard_ShowDynamicComps;
  ShowButtonDown(6,'CONFEDITOR_WIZARD');
  ShowHidePanel(CurrentPanel,'Pce_wizard');
end;

procedure ce_wizard_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pce_wizard,'media\confeditor\images\confeditor\confeditor.png',
              3,571,155,85,i,True);
        2 : Image_Comp(Conf.Pce_wizard,'media\confeditor\images\confeditor\confeditor_image.png',
              600,381,126,280,i,True);
        3 : Image_Comp(Conf.Pce_wizard,'media\confeditor\images\confeditor\wizard.png',
              595,2,136,71,i,True);
      end;
    end;
end;

procedure ce_wizard_FreeDynamicComps;
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
