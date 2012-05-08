unit wg_timedate;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_widget_timedate;
  procedure wg_timedate_ShowDynamicComps;
  procedure wg_timedate_FreeDynamicComps;

implementation

uses
  main,mainconf,onflycomponents,FunctionX,menu,
  wg_weather;

procedure Show_widget_timedate;
begin
  if Cmenustate = 'wg_weather' then
    wg_weather_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,False);
  Cmenustate := 'wg_timedate';
  wg_timedate_ShowDynamicComps;
  ShowButtonDown(10,'WG_TIMEDATE');
  ShowHidePanel(CurrentPanel,'Pwg_timedate');
end;

procedure wg_timedate_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 2 do
    begin
      case i of
        1 : Image_Comp(Conf.Pwg_timedate,'media\confeditor\images\timedate\timedate.png',
              3,571,155,85,i,True);
        2 : Image_Comp(Conf.Pwg_timedate,'media\confeditor\images\timedate\timedate_image.png',
              600,447,126,211,i,True);
      end;
    end;
end;

procedure wg_timedate_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 2 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
end;

end.
