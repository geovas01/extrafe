unit hatari_roms;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_hatari_romspanel;
  procedure em_hatari_roms_ShowDynamicComps;
  procedure em_hatari_roms_FreeDynamicComps;


implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_system,hatari_screen,hatari_joy;


procedure Show_hatari_romspanel;
begin
  if (Cmenustate = 'em_computers_hatari_system') then
    em_hatari_system_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_screen') then
    em_hatari_screen_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_joy') then
    em_hatari_joy_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'em_computers_hatari_roms';
  em_hatari_roms_ShowDynamicComps;
  ShowButtonDown(7,'EM_COMPUTERS_ATARI_HATARI_DISKS');
  ShowHidePanel(CurrentPanel,'Pem_hatari_roms');
end;

procedure em_hatari_roms_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_hatari_roms,'media\confeditor\images\hatari\hatari.png',
              3,586,106,70,i,True);
        2 : Image_Comp(Conf.Pem_hatari_roms,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,True);
        3 : Image_Comp(Conf.Pem_hatari_roms,'media\confeditor\images\hatari\roms.png',
              538,2,185,71,i,True);
      end;
    end;
end;

procedure em_hatari_roms_FreeDynamicComps;
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
