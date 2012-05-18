unit kigb_sound;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_kigb_soundpanel;
  procedure em_kigb_sound_ShowDynamicComps;
  procedure em_kigb_sound_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  kigb_screen,kigb_paths,kigb_others;

procedure Show_kigb_soundpanel;
begin
  if (Cmenustate = 'em_kigb_screen') then
    em_kigb_screen_FreeDynamicComps
  else if (Cmenustate = 'em_kigb_paths') then
    em_kigb_paths_FreeDynamicComps
  else if (Cmenustate = 'em_kigb_others') then
    em_kigb_others_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,True);
  Cmenustate := 'em_kigb_sound';
  em_kigb_sound_ShowDynamicComps;
  ShowButtonDown(8,'EM_HANDHELDS_NINTENDO_KIGB_SOUND');
  ShowHidePanel(CurrentPanel,'Pem_kigb_sound');
end;

procedure em_kigb_sound_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_kigb_sound,'media\confeditor\images\kigb\kigb.png',
              3,590,90,71,i,True);
        2 : Image_Comp(Conf.Pem_kigb_sound,'media\confeditor\images\kigb\kigb_image.png',
              582,538,147,120,i,True);
        3 : Image_Comp(Conf.Pem_kigb_sound,'media\confeditor\images\kigb\sound.png',
              450,2,278,71,i,True);
      end;
    end;
end;

procedure em_kigb_sound_FreeDynamicComps;
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
 