unit wg_weather;

interface
uses
  SysUtils,Classes,ExtCtrls;

// Menu actions
  procedure Show_widget_weather;
  procedure wg_weather_ShowDynamicComps;
  procedure wg_weather_FreeDynamicComps;

implementation

uses
  main,mainconf,onflycomponents,FunctionX,menu,
  wg_timedate;

procedure Show_widget_weather;
begin
  if Cmenustate = 'wg_timedate' then
    wg_timedate_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn6.Caption,False,False);
  Cmenustate := 'wg_weather';
  wg_weather_ShowDynamicComps;
  ShowButtonDown(10,'WG_WEATHER');
  ShowHidePanel(CurrentPanel,'Pwg_weather');
end;

procedure wg_weather_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 2 do
    begin
      case i of
        1 : Image_Comp(Conf.Pwg_weather,'media\confeditor\images\weather\weather.png',
              3,596,155,57,i,True);
        2 : Image_Comp(Conf.Pwg_weather,'media\confeditor\images\weather\weather_image.png',
              573,381,153,280,i,True);
      end;
    end;
end;

procedure wg_weather_FreeDynamicComps;
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
