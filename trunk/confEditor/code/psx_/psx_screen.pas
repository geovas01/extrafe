unit psx_screen;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_psx_screenpanel;
  procedure em_psx_screen_ShowDynamicComps;
  procedure em_psx_screen_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  psx_paths,psx_sound,psx_others;

procedure Show_psx_screenpanel;
begin
  if (Cmenustate = 'em_consoles_psx_paths') then
    em_psx_paths_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_sound') then
    em_psx_sound_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_others') then
    em_psx_others_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'em_consoles_psx_screen';
  em_psx_screen_ShowDynamicComps;
  ShowButtonDown(7,'EM_CONSOLES_SONY_PSX_SCREEN');
  Conf.Pem_psx_sound.Tag := 0;
  Conf.Pem_psx_others.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_psx_screen');
end;

procedure em_psx_screen_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_psx_screen,'media\confeditor\images\psx\psx.png',
              3,590,100,71,i,True);
        2 : Image_Comp(Conf.Pem_psx_screen,'media\confeditor\images\psx\psx_image.png',
              587,381,150,280,i,True);
        3 : Image_Comp(Conf.Pem_psx_screen,'media\confeditor\images\psx\screen.png',
              608,2,120,71,i,True);
      end;
    end;
end;

procedure em_psx_screen_FreeDynamicComps;
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
 