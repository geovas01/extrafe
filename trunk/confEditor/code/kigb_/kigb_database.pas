unit kigb_database;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_kigb_databasespanel;
  procedure em_kigb_database_ShowDynamicComps;
  procedure em_kigb_database_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  kigb_screen,kigb_sound,kigb_paths,kigb_others;


//////////////////////////////////////////////////////////////////////////////
procedure Show_kigb_databasespanel;
begin
  if (Cmenustate = 'em_kigb_paths') then
    em_kigb_paths_FreeDynamicComps
  else if (Cmenustate = 'em_kigb_screen') then
    em_kigb_screen_FreeDynamicComps
  else if (Cmenustate = 'em_kigb_sound') then
    em_kigb_sound_FreeDynamicComps
  else if (Cmenustate = 'em_kigb_others') then
    em_kigb_others_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn10.Caption,False,True);
  Cmenustate := 'em_kigb_database';
  em_kigb_database_ShowDynamicComps;
  ShowButtonDown(6,'EM_HANDHELDS_NINTENDO_KIGB_DATABASE');
  ShowHidePanel(CurrentPanel,'Pem_kigb_database');
end;

procedure em_kigb_database_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_kigb_database,'media\confeditor\images\kigb\kigb.png',
              3,590,90,71,i,True);
        2 : Image_Comp(Conf.Pem_kigb_database,'media\confeditor\images\kigb\kigb_image.png',
              582,538,147,120,i,True);
        3 : Image_Comp(Conf.Pem_kigb_database,'media\confeditor\images\kigb\database.png',
              577,2,151,71,i,True);
      end;
    end;
end;

procedure em_kigb_database_FreeDynamicComps;
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
