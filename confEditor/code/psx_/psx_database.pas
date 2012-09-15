unit psx_database;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_psx_databasepanel;
  procedure em_psx_database_ShowDynamicComps;
  procedure em_psx_database_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  psx_screen,psx_sound,psx_others,psx_paths;

//////////////////////////////////////////////////////////////////////////////

procedure Show_psx_databasepanel;
begin
  if (Cmenustate = 'em_consoles_psx_paths') then
    em_psx_paths_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_screen') then
    em_psx_screen_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_sound') then
    em_psx_sound_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_others') then
    em_psx_others_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn10.Caption,False,True);
  Cmenustate := 'em_consoles_psx_database';
  em_psx_database_ShowDynamicComps;
  ShowButtonDown(6,'EM_CONSOLES_SONY_PSX_DATABASE');
  Conf.Pem_psx_sound.Tag := 0;
  Conf.Pem_psx_others.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_psx_database');
end;

procedure em_psx_database_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_psx_database,'media\confeditor\images\psx\psx.png',
              3,590,100,71,i,'',True,False);
        2 : Image_Comp(Conf.Pem_psx_database,'media\confeditor\images\psx\psx_image.png',
              587,381,150,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_psx_database,'media\confeditor\images\psx\database.png',
              577,2,151,71,i,'',True,False);
      end;
    end;
end;

procedure em_psx_database_FreeDynamicComps;
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
