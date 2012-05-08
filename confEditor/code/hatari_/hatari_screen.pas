unit hatari_screen;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_hatari_screenpanel;
  procedure em_hatari_screen_ShowDynamicComps;
  procedure em_hatari_screen_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_roms,hatari_system,hatari_joy;

procedure Show_hatari_screenpanel;
begin
  if (Cmenustate = 'em_computers_hatari_roms') then
    em_hatari_roms_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_system') then
    em_hatari_system_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_joy') then
    em_hatari_joy_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,True);
  Cmenustate := 'em_computers_hatari_screen';
  em_hatari_screen_ShowDynamicComps;
  ShowButtonDown(8,'EM_COMPUTERS_ATARI_HATARI_SCREEN');
  ShowHidePanel(CurrentPanel,'Pem_hatari_screen');
end;

procedure em_hatari_screen_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_hatari_screen,'media\confeditor\images\hatari\hatari.png',
              3,586,106,70,i,True);
        2 : Image_Comp(Conf.Pem_hatari_screen,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,True);
        3 : Image_Comp(Conf.Pem_hatari_screen,'media\confeditor\images\hatari\sound.png',
              507,2,227,71,i,True);
      end;
    end;
end;

procedure em_hatari_screen_FreeDynamicComps;
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
