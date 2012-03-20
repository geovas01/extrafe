unit functionX;

interface
uses
  Windows, SysUtils, Classes, Controls, Forms, ComObj, Winsock, Math,
  ShellAPI,sGauge;

type
  TGauseStream = class(TMemoryStream)
  private
    FGause: TsGauge;
    FOldUpdateAt: int64;
  procedure SetGause(const Value: TsGauge);
  public
    property Gause: TsGauge read FGause write SetGause;
    function Read(var Buffer; Count: Longint): Longint; override;
end;  


function RunCaptured(const _dirName, _exeName, _cmdLine,filename: string): Boolean;
function IsWindows64: Boolean;
function StringsToString(Source:TStrings; Delimiter:char):string;
function findDisplays(MyFormat:string) : Integer;
function CountFilesOrFolders(directory : String; Kind: string): integer;
function VersionInfo(filename,savetofile : String): string;
function FuncAvail(dllName, funcName: string; var p: pointer): boolean;
function Compact(DB: string): Boolean;
function PortTCP_IsOpen(dwPort : Word; ipAddressStr:AnsiString) : boolean;
function SaveResourceAsTempFile(const ResName: string; ResType: pchar): string;
function GetResourceAsAniCursor(const ResName: string): HCursor;
function FindComponentEx(const Name: string): TComponent;
function GetVersion(sFileName:string): string;
function ShellExecAndWait(const FileName, Parameters, dir: string;
  CmdShow: Integer): Boolean;
//function PortUDP_IsOpen(dwPort : Word; ipAddressStr: AnsiString) : boolean;

const
  InfoNum = 10;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');

var
  FOldpos: Integer;

implementation
uses
  Main;

function SaveResourceAsTempFile(const ResName: string; ResType: pchar): string;
var
  TempFileName: array [0..MAX_PATH-1] of char;
  TempDir: array [0..MAX_PATH-1] of char;
begin
  GetTempPath(MAX_PATH, TempDir);
  if GetTempFileName(TempDir, '~', 0, TempFileName) = 0 then
    raise Exception.Create(SysErrorMessage(GetLastError));
  Result := TempFileName;
  with TResourceStream.Create(hInstance, ResName, ResType) do
   try        SaveToFile(result);
   finally
     Free;
   end;
end;

function GetResourceAsAniCursor(const ResName: string): HCursor;
var CursorFile: string;
begin
  CursorFile := SaveResourceAsTempFile(ResName, 'ANICURSOR');
  Result := LoadImage(0, PChar(CursorFile), IMAGE_CURSOR, 0, 0,
                           LR_DEFAULTSIZE or LR_LOADFROMFILE);
  DeleteFile(CursorFile);
  if Result = 0 then  raise Exception.Create(SysErrorMessage(GetLastError));
end;
  

{function PortUDP_IsOpen(dwPort : Word; ipAddressStr: AnsiString) : boolean;
var
  Sock:TUDPBlockSocket;
  size:integer;
  buf:string;
begin
  Sock:=TUDPBlockSocket.Create;
  try
    sock.bind('0.0.0.0','port');
    if sock.LastError0 then exit;
    while True do
      begin
        if terminated then break;
	buf := sock.RecvPacket(1000);
	if sock.lasterror=0 then
	  begin
  //        do something with data and prepare response data
            sock.SendString(Buf);
          end;
        sleep(1);
      end;
    sock.CloseSocket;
  finally
    sock.free;
  end;
end;}

//Finds if a TCP port is open...
function PortTCP_IsOpen(dwPort : Word; ipAddressStr:AnsiString) : boolean;
var
  client : sockaddr_in;
  sock   : Integer;
  ret    : Integer;
  wsdata : WSAData;
begin
  Result:=False;
  ret := WSAStartup($0002, wsdata); //initiates use of the Winsock DLL
  if ret<>0 then exit;
  try
    client.sin_family      := AF_INET;  //Set the protocol to use , in this case (IPv4)
    client.sin_port        := htons(dwPort); //convert to TCP/IP network byte order (big-endian)
    client.sin_addr.s_addr := inet_addr(PAnsiChar(ipAddressStr));  //convert to IN_ADDR  structure
    sock  :=socket(AF_INET, SOCK_STREAM, 0);    //creates a socket
    Result:=connect(sock,client,SizeOf(client))=0;  //establishes a connection to a specified socket
  finally
    WSACleanup;
  end;
end;  

//Returns the Internal Version Info of a file
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

//Count files
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

//Finds the resolutions of the display driver
function findDisplays(MyFormat:string) : Integer;
var
  i       : Integer;
  DevMode : TDeviceMode;
begin
  resolutions := TStringList.Create;
  i:=0;
  {$IFOPT R+}
   {$DEFINE CKRANGE}
   {$R-} //range-checking of
  {$ENDIF}
  resolutions.Sorted := True;
  resolutions.Duplicates := dupIgnore;
  while EnumDisplaySettings(nil,i,DevMode) do begin
    with Devmode do
      If (dmPelsWidth > 639) and (dmPelsHeight >479) then
        if dmBitsperPel > 4 then
        Resolutions.Add(Format(MyFormat,[dmPelsWidth,dmPelsHeight,{1 shr dmBitsperPel,}dmDisplayFrequency]));
        // %d bit depth of color in bit
    Inc(i);
  end;
  {$IFDEF CKRANGE}
   {$UNDEF CKRANGE}
   {$R+}  //range-checking on
  {$ENDIF}
end;

//Convert strings to string
function StringsToString(Source:TStrings; Delimiter:char):string;
var i: integer;
 begin
   Result:='';
   for i:=0 to Source.Count-1 do
     Result:=Result + Delimiter + Source[ i ];
   if Result<>'' then Delete(Result, 1, 1)
 end;

//Captures the result of a command line programm
function RunCaptured(const _dirName, _exeName, _cmdLine, filename: string): Boolean;
var
  start: TStartupInfo;
  procInfo: TProcessInformation;
  tmpName: string;
  tmp: Windows.THandle;
  tmpSec: TSecurityAttributes;
  res: TStringList;
  return: Cardinal;
begin
  Result := False;
  try
    tmpName := 'Test.tmp';
    FillChar(tmpSec, SizeOf(tmpSec), #0);
    tmpSec.nLength := SizeOf(tmpSec);
    tmpSec.bInheritHandle := True;
    tmp := Windows.CreateFile(PChar(tmpName),
    Generic_Write, File_Share_Write,
    @tmpSec, Create_Always, File_Attribute_Normal, 0);
    try
      FillChar(start, SizeOf(start), #0);
      start.cb := SizeOf(start);
      start.hStdOutput := tmp;
      start.dwFlags := StartF_UseStdHandles or StartF_UseShowWindow;
      start.wShowWindow := SW_HIDE;
  // Start The Program
      if CreateProcess(nil, PChar(_exeName + ' ' + _cmdLine), nil, nil, True,
        0, nil, PChar(_dirName), start, procInfo) then
        begin
          Application.ProcessMessages;
          Screen.Cursor := AniBusy;
          SetPriorityClass(procInfo.hProcess, Idle_Priority_Class);
          WaitForSingleObject(procInfo.hProcess, Infinite);
          GetExitCodeProcess(procInfo.hProcess, return);
          Result := (return = 0);
          CloseHandle(procInfo.hThread);
          CloseHandle(procInfo.hProcess);
          Windows.CloseHandle(tmp);
          // Add the output
          res := TStringList.Create;
          try
            res.LoadFromFile(tmpName);
          finally
            res.Free;
          end;
          Windows.CopyFile(Pchar(tmpName),pchar(filename),FALSE);
          Windows.DeleteFile(PChar(tmpName));
        end
      else
        begin
          Application.MessageBox(PChar(SysErrorMessage(GetLastError())),
            'RunCaptured Error', MB_OK);
        end;
    except
      Windows.CloseHandle(tmp);
      Windows.DeleteFile(PChar(tmpName));
      raise;
    end;
  finally

  end;
end;

//You can block the keyboard and the mouse
function FuncAvail(dllName, funcName: string; var p: pointer): boolean;
var
  lib: THandle;
begin
  result := false;
  p := nil;
  if LoadLibrary(PChar(dllName)) = 0 then exit;
  lib := GetModuleHandle(PChar(dllName)) ;
  if lib <> 0 then
    begin
      p := GetProcAddress(lib, PChar(funcName)) ;
      if p <> nil then Result := true;
    end;
end;

//Compat any ADO database to earn space and make smaller database
function Compact(DB: string): Boolean;
var
  dao: OLEVariant;
begin
  dao := CreateOleObject('DAO.DBEngine.36');
  dao.CompactDatabase(DB,DB+'x');
  DeleteFile(DB);
  RenameFile(DB+'x',DB);
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
    for I := 0 to Form.ComponentCount - 1 do
    begin
      Result := Form.Components[I];
      if AnsiSameText(Result.Name, CompName) then Exit;
    end;
  end;
  Result := nil;
end;

function GetVersion(sFileName:string): string;
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

function IsWindows64: Boolean;
type
  TIsWow64Process = function(AHandle:THandle; var AIsWow64: BOOL): BOOL; stdcall;
var
  vKernel32Handle: DWORD;
  vIsWow64Process: TIsWow64Process;
  vIsWow64       : BOOL;
begin
  // 1) assume that we are not running under Windows 64 bit
  Result := False;

  // 2) Load kernel32.dll library
  vKernel32Handle := LoadLibrary('kernel32.dll');
  if (vKernel32Handle = 0) then Exit; // Loading kernel32.dll was failed, just return

  try

    // 3) Load windows api IsWow64Process
    @vIsWow64Process := GetProcAddress(vKernel32Handle, 'IsWow64Process');
    if not Assigned(vIsWow64Process) then Exit; // Loading IsWow64Process was failed, just return

    // 4) Execute IsWow64Process against our own process
    vIsWow64 := False;
    if (vIsWow64Process(GetCurrentProcess, vIsWow64)) then
      Result := vIsWow64;   // use the returned value

  finally
    FreeLibrary(vKernel32Handle);  // unload the library
  end;
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

//Stream Functions tha can handle a sGauge progress when using an xml file from OmniXML.
function TGauseStream.Read(var Buffer; Count: Integer): Longint;
var
  percPos: integer;
begin
  Result := inherited Read(Buffer, Count);
  percPos := Round(Self.Position / Self.Size * 100);
  if Assigned(FGause) and (FOldPos <> percPos) then
    begin
      FGause.Progress := percPos;
      FOldPos := percPos;
      Application.ProcessMessages;
    end;
end;

procedure TGauseStream.SetGause(const Value: TsGauge);
begin
  FGause := Value;
  FGause.MaxValue := 100;
  FGause.Progress := Self.Position;
end;

end.