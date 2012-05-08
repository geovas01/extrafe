unit psx_others;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_psx_otherspanel;
  procedure em_psx_others_ShowDynamicComps;
  procedure em_psx_others_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  psx_screen,psx_sound,psx_paths;

procedure Show_psx_otherspanel;
begin
  if (Cmenustate = 'em_consoles_psx_screen') then
    em_psx_screen_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_sound') then
    em_psx_sound_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_paths') then
    em_psx_paths_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn9.Caption,False,True);
  Cmenustate := 'em_consoles_psx_others';
  em_psx_others_ShowDynamicComps;
  ShowButtonDown(9,'EM_CONSOLES_SONY_PSX_OTHERS');
  Conf.Pem_psx_sound.Tag := 0;
  Conf.Pem_psx_others.Tag := 1;
  ShowHidePanel(CurrentPanel,'Pem_psx_others');
end;

procedure em_psx_others_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_psx_others,'media\confeditor\images\psx\psx.png',
              3,590,100,71,i,True);
        2 : Image_Comp(Conf.Pem_psx_others,'media\confeditor\images\psx\psx_image.png',
              587,381,150,280,i,True);
        3 : Image_Comp(Conf.Pem_psx_others,'media\confeditor\images\psx\others.png',
              609,2,121,71,i,True);
      end;
    end;
end;

procedure em_psx_others_FreeDynamicComps;
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
 