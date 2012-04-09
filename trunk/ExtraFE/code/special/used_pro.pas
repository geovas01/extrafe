unit used_pro;

interface
  uses
    main,windows,Classes,SysUtils,
    GLmaterial,GLTexture,GlCompositeImage;

  procedure SetScreen(bpp:byte; width,height,FR:integer);
  function GetDisplayFrequency: Integer;
  function VersionInfo(filename,savetofile : String): string;
  function GetVersionInfo(sFileName:string): string;

  function AddMaterial(aMatLib: TGlMaterialLibrary; aFileName, aMaterialName: string): TGlLibMaterial;
  Procedure AddMaterials(aMatLib: TGlMaterialLibrary; aFolder: String; aFiles: array of String; aNames: array of String);

  const
    InfoNum = 10;
    InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');

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


//Returns the Internal Version Info of a file and save into a file
function VersionInfo(filename,savetofile : String): string;
var
  n, Len, i: DWORD;
  Buf: PChar;
  Value: PChar;
  InfoExe: TStringList;
begin
  InfoExe:= TStringList.Create;
  n := GetFileVersionInfoSize(PChar(Filename), n);
  if n > 0 then
  begin
    Buf := AllocMem(n);
    InfoExe.Add('VersionInfoSize = ' + IntToStr(n));
    GetFileVersionInfo(PChar(Filename), 0, n, Buf);
    for i := 1 to InfoNum do
      if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Value), Len) then
        InfoExe.Add(InfoStr[i] + ' = ' + Value);
    FreeMem(Buf, n);
  end
  else
    InfoExe.Add('No version information found');
  InfoExe.SaveToFile(savetofile);
  InfoExe.Free;
end;



// Just gets the version info
function GetVersionInfo(sFileName:string): string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

function AddMaterial(aMatLib: TGlMaterialLibrary; aFileName, aMaterialName: string): TGlLibMaterial;

begin
  result := aMatLib.Materials.Add;
  with result do
  begin
    with Material do
    begin
      MaterialOptions := [moIgnoreFog, moNoLighting];
      Texture.Disabled := false;
      BlendingMode := bmTransparency;
      Texture.TextureMode := tmModulate;
      with FrontProperties do
      begin
        Ambient.SetColor(1, 1, 1, 1);
        Diffuse.SetColor(1, 1, 1, 1);
        Emission.SetColor(1, 1, 1, 1);
        Specular.SetColor(1, 1, 1, 1);
      end;
      Texture.ImageClassName := 'TGLCompositeImage';
      if ExtractFileExt(aFileName) = '' then
        TGLCompositeImage(Texture.Image).LoadFromFile(aFileName + '.png')
      else
        TGLCompositeImage(Texture.Image).LoadFromFile(aFileName);
//      TGLCompositeImage(Texture.Image).LoadFromFile(aFileName);
    end;
    Name := aMaterialName;
  end;
end;

Procedure AddMaterials(aMatLib: TGlMaterialLibrary; aFolder: String; aFiles: array of String; aNames: array of String);
var
  i: integer;
begin
  for i := low(aFiles) to high(aFiles) do
    if (i >= low(aNames)) and (i <= high(aNames)) then
      AddMaterial(aMatLib, aFolder + aFiles[i], aNames[i]);
end;

end.
 