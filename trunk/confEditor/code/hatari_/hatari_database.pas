unit hatari_database;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetHatari_DatabasefromHatariIni;

// Menu actions
  procedure Show_hatari_databasepanel;
  procedure em_hatari_database_ShowDynamicComps;
  procedure em_hatari_database_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_roms,hatari_screen,hatari_joy,hatari_paths,hatari_system;

procedure SetHatari_DatabasefromHatariIni;
begin
//
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_hatari_databasepanel;
begin
  if (Cmenustate = 'em_computers_hatari_paths') then
    em_hatari_paths_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_system') then
    em_hatari_system_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_roms') then
    em_hatari_roms_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_screen') then
    em_hatari_screen_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_joy') then
    em_hatari_joy_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn11.Caption,False,True);
  Cmenustate := 'em_computers_hatari_database';
  em_hatari_database_ShowDynamicComps;
  ShowButtonDown(11,'EM_COMPUTERS_ATARI_HATARI_DATABASE');
  ShowHidePanel(CurrentPanel,'Pem_hatari_database');
end;

procedure em_hatari_database_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_hatari_database,'media\confeditor\images\hatari\hatari.png',
              3,586,106,70,i,True);
        2 : Image_Comp(Conf.Pem_hatari_database,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,True);
        3 : Image_Comp(Conf.Pem_hatari_database,'media\confeditor\images\hatari\database.png',
              577,2,151,71,i,True);
      end;
    end;
end;

procedure em_hatari_database_FreeDynamicComps;
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
