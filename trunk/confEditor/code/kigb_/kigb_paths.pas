unit kigb_paths;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_kigb_pathspanel;
  procedure em_kigb_paths_ShowDynamicComps;
  procedure em_kigb_paths_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  kigb_screen,kigb_sound,kigb_others,kigb_database;

procedure Show_kigb_pathspanel;
begin
  if (Cmenustate = 'em_kigb_screen') then
    em_kigb_screen_FreeDynamicComps
  else if (Cmenustate = 'em_kigb_sound') then
    em_kigb_sound_FreeDynamicComps
  else if (Cmenustate = 'em_kigb_others') then
    em_kigb_others_FreeDynamicComps
  else if (Cmenustate = 'em_kigb_database') then
    em_kigb_database_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn6.Caption,False,True);
  Cmenustate := 'em_kigb_paths';
  em_kigb_paths_ShowDynamicComps;
  ShowButtonDown(6,'EM_HANDHELDS_NINTENDO_KIGB_DIRS');
  ShowHidePanel(CurrentPanel,'Pem_kigb_paths');
end;

procedure em_kigb_paths_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_kigb_paths,'media\confeditor\images\kigb\kigb.png',
              3,590,90,71,i,True);
        2 : Image_Comp(Conf.Pem_kigb_paths,'media\confeditor\images\kigb\kigb_image.png',
              582,538,147,120,i,True);
        3 : Image_Comp(Conf.Pem_kigb_paths,'media\confeditor\images\kigb\paths.png',
              517,2,270,71,i,True);
      end;
    end;
end;

procedure em_kigb_paths_FreeDynamicComps;
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
 