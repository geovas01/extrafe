unit used_pro;

interface
  uses
    main,windows;

  procedure SetScreen(bpp:byte; width,height,FR:integer);
  function GetDisplayFrequency: Integer;


implementation


// set the screen mode {bpp: the depth, width: the width, height: the height and FR: the frequency}
procedure SetScreen(bpp:byte; width,height,FR:integer);
var
  D: TDevMode;
  h: HWND;
begin
  h:=0;
  D.dmDeviceName:='DISPLAY';
  D.dmBitsPerPel:=BPP;
  D.dmDisplayFrequency:=FR;
  D.dmPelsWidth:=Width;
  D.dmPelsHeight:=Height;
  D.dmFields:=DM_BITSPERPEL+DM_PELSWIDTH+DM_PELSHEIGHT+
              DM_DISPLAYFREQUENCY;
  D.dmSize:=SizeOf(D);
  if ChangeDisplaySettings(D,CDS_TEST)=
     DISP_CHANGE_SUCCESSFUL then
    ChangeDisplaySettings(D,CDS_UPDATEREGISTRY)
  else
      MessageBox(h,'Error',
      'Something goes wrong with setting the display.', MB_ICONWarning);
end;


//Get the display frequency
function GetDisplayFrequency: Integer;                       
var                                                          
DeviceMode: TDeviceMode;                                     
                                                             
begin                                                        
  EnumDisplaySettings(nil, Cardinal(-1), DeviceMode);        
  Result := DeviceMode.dmDisplayFrequency;                   
end;


end.
 