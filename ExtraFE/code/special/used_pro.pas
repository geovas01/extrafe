unit used_pro;

interface
  uses
    main,windows,Classes,SysUtils,ShellAPI,Graphics,loadT,GLScene,
    GLmaterial,GLTexture,GlCompositeImage,Forms,GLObjects;

  procedure SetScreen(bpp:byte; width,height,FR:integer);
  function GetDisplayFrequency: Integer;
  function VersionInfo(filename,savetofile : String): string;
  function GetVersionInfo(sFileName:string): string;
  function SetCapitalTheFirstLetter(Word : String) : string;
  function ShellExecAndWait(const FileName, Parameters, dir: string;
  CmdShow: Integer): Boolean;
  function LengthInPixels(const word: string): Integer;
  function SetTextInGivenPixels(const wLength: Integer; const wWord: string) : string;

  function AddMaterial(aMatLib: TGlMaterialLibrary; aFileName, aMaterialName: string): TGlLibMaterial;
  Procedure AddMaterials(aMatLib: TGlMaterialLibrary; aFolder: String; aFiles: array of String; aNames: array of String);

  function FindComponentEx(const Name: string): TComponent;
  function FindGlSceneComponent(const CompName: string; SceneName: TglScene): TGLSceneObject;

  function CountFilesOrFolders(directory : String; Kind: string): integer;

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

function SetCapitalTheFirstLetter(Word : String) : string;
var
  capital: string;
begin
  if Length(Word) > 0 then
    begin
      if (Word[1] in ['a'..'z']) then
        begin
          capital := UpperCase(Word[1]);
          Result := capital + Trim(Copy(Word,2,Length(Word)));
        end
      else
        Result := Word;
    end;
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

function ShellExecAndWait(const FileName, Parameters, dir: string;
  CmdShow: Integer): Boolean;
var
  Sei: TShellExecuteInfo;
begin
  FillChar(Sei, SizeOf(Sei), #0);
  Sei.cbSize := SizeOf(Sei);
  Sei.fMask := SEE_MASK_DOENVSUBST or SEE_MASK_FLAG_NO_UI or SEE_MASK_NOCLOSEPROCESS;
  Sei.lpFile := PChar(FileName);
  Sei.lpParameters := PChar(Parameters);
  Sei.lpdirectory := PChar(dir);
  Sei.nShow := CmdShow;
  Result := ShellExecuteEx(@Sei);
  if Result then
  begin
    WaitForInputIdle(Sei.hProcess, INFINITE);
    WaitForSingleObject(Sei.hProcess, INFINITE);
    CloseHandle(Sei.hProcess);
  end;
end;

function LengthInPixels(const word: string): Integer;
var
  aB: TBitmap;
  aF: TFont;
begin
  aF := TFont.Create;
  aF.Name := loadT.fexistFont.Font.Name;
  aF.Size := loadT.fexistFont.Font.Size;
  aB := TBitmap.Create;
  aB.Canvas.Font := aF;
  Result := aB.Canvas.TextWidth(word);
  aB.Free;
  aF.Free;
end;

function SetTextInGivenPixels(const wLength: Integer; const wWord: string) : string;
var
  aText: string;
  i: Integer;
begin
  i := 40;
  for i := 40 downto 0 do
    begin
      aText := Trim(Copy(wWord,0,i));
      aText := aText + '...';
      if LengthInPixels(aText) < wLength then
        begin
          Result := aText;
          Break;
        end;
    end;
end;

function FindGlSceneComponent(const CompName: string; SceneName: TglScene): TGLSceneObject;
var
  i,k: integer;
  Found: Boolean;
  fGlSceneObject: TGLSceneObject;
begin
  for i := 0 to SceneName.ComponentCount - 1 do
    begin
      k := SceneName.Objects.Count;
      if Result.Name = CompName then
        exit;
    end;
  Result := nil;
end;

function FindComponentEx(const Name: string): TComponent;
var
  FormName: string;
  CompName: string;
  P: Integer;
  Found: Boolean;
  Form: TForm;
  I: Integer;
begin
  // Split up in a valid form and a valid component name
  P := Pos('.', Name);
  if P = 0 then
  begin
    raise Exception.Create('No valid form name given');
  end;
  FormName := Copy(Name, 1, P - 1);
  CompName := Copy(Name, P + 1, High(Integer));
  Found    := False;
  // find the form
  for I := 0 to Screen.FormCount - 1 do
  begin
    Form := Screen.Forms[I];
    // case insensitive comparing
    if AnsiSameText(Form.Name, FormName) then
    begin
      Found := True;
      Break;
    end;
  end;
  if Found then
  begin
    for I := 0 to  Form.ComponentCount - 1 do
    begin
      Result := Form.Components[I];
      if AnsiSameText(Result.Name, CompName) then Exit;
    end;
  end;
  Result := nil;
end;

function CountFilesOrFolders(directory : String; Kind: string): integer;
var
	Rec : TSearchRec;
	nFileCount : integer;
begin
	nFileCount := 0;
  if Kind = 'files' then
    begin
    	if FindFirst(directory+'\*.*', faAnyFile, Rec) = 0 then
		    repeat
		    	// Exclude directories from the list of files.
    			if ((Rec.Attr and faDirectory) <> faDirectory) then
    				Inc(nFileCount);
    		until FindNext(Rec) <> 0;
      FindClose(Rec);
    end
  else if Kind = 'folders' then
    begin
      if FindFirst(directory+'\*.*', faDirectory, Rec) = 0 then
        repeat
          if ((Rec.Attr and fadirectory) = fadirectory) then
            inc(nFileCount);
        until FindNext(Rec) <> 0;
      FindClose(Rec);
    end;
	Result := nFileCount;
end;

end.
