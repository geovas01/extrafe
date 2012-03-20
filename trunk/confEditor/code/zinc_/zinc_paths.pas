unit zinc_paths;

interface
uses
  SysUtils,FileCtrl,Classes,global,Forms,
  zinc_xmlext,zinc_database;

  procedure SetZinc_PathsFromZincIni;

  procedure AddZincExe_Path;
  procedure SetUpTheNewZincExe;
  procedure AddZincRoms_Path;
  procedure SetTheNewZincRomDirectory;
  procedure AddZincSnaps_Path;
  procedure SetTheNewZincSnapsDirectory;

  procedure CreateRender_cfgFile;
  procedure SetUpZincGraphicsFirstTime;
  procedure SetUpZincSoundFirstTime;

implementation

uses
  main,mainconf;

var
  oldpath,newpath: string;

procedure AddZincExe_Path;
begin
  gFindFiles := 'zinc';
  Conf.Find_Files.InitialDir := Program_Path+'emulators';
  Conf.Find_Files.Filter := 'ZiNc.exe|ZiNc.exe';
  Conf.Find_Files.Execute;
end;

procedure SetUpTheNewZincExe;
begin
  ZincDatabaseFile := ExtractFilePath(Application.ExeName) + 'media\emulators\arcade\zinc\database\zinc_efuse';
  Zinc_Exe := ExtractFileName(Conf.Find_Files.FileName);
  FullPathZinc_Exe := ExtractFilePath(Conf.Find_Files.FileName);
  Zinc_ini := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\config.ini';
  Conf.sEdit53.Text := FullPathZinc_Exe+Zinc_Exe;
  if not DirectoryExists(FullPathZinc_Exe +'roms') then
    CreateDir(FullPathZinc_Exe+'roms');
  Conf.sEdit54.Text := FullPathZinc_Exe + 'roms';
  if not DirectoryExists(FullPathZinc_Exe +'snaps') then
    CreateDir(FullPathZinc_Exe+ 'snaps');
  conf.sEdit55.Text := FullPathZinc_Exe + 'snaps';
  CreateRender_cfgFile;
  SetUpZincGraphicsFirstTime;
  SetUpZincSoundFirstTime;
  CreateFirstTimeDatabase;
end;

procedure AddZincRoms_Path;
begin
  oldpath := Conf.sEdit54.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      global_Find_DirsClose;
end;

procedure SetTheNewZincRomDirectory;
begin
  Conf.sEdit54.Text := newpath;
end;

procedure AddZincSnaps_Path;
begin
  oldpath := Conf.sEdit55.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      global_Find_DirsClose;
end;

procedure SetTheNewZincSnapsDirectory;
begin
  Conf.sEdit55.Text := newpath;
end;

procedure CreateRender_cfgFile;
var
  rf,sf: TStringList;
begin
  if not FileExists(FullPathZinc_Exe+'renderer.cfg') then
    begin
      rf := TStringList.Create;
      //Create the test/default renderer cfg
      rf.Add('; renderer settings');
      rf.Add('Created from ExtraFe/confEditor');
      rf.Add('');
      rf.Add('XSize			= 800	; window/fullscreen X size');
      rf.Add('YSize			= 600	; window/fullscreen Y size');
      rf.Add('FullScreen		= 1   	; Fullscreen mode: 0/1');
      rf.Add('ColorDepth		= 32    ; Fullscreen color depth: 16/32');
      rf.Add('ScanLines		= 0   	; Scannlines: 0=none, 1=black, 2=bright');
      rf.Add('Filtering		= 3   	; Texture filtering: 0-3');
      rf.Add('Blending		= 1 	; Enhanced color blend: ogl: 0/1; D3D: 0-2');
      rf.Add('Dithering		= 0 	; Dithering: 0/1');
      rf.Add('ShowFPS			= 0 	; FPS display on startup: 0/1');
      rf.Add('FrameLimitation	 	= 1 	; Frame limit: 0/1');
      rf.Add('FrameSkipping           = 0     ; Frame skip: 0/1');
      rf.Add('FramerateDetection	= 1 	; Auto framerate detection: 0/1');
      rf.Add('FramerateManual		= 100 	; Manual framerate: 0-1000');
      rf.Add('TextureType		= 3 	; Tetxures: 0=default, 1=4 bit, 2=5bit, 3=8bit');
      rf.Add('TextureCaching		= 2 	; Caching type: 0-2');
      rf.Add('TurnDisplay             = 0     ; Turn the whole display (0-2, 0=default)');
      rf.Add('EnableKeys      = 1;   Enable/Disable renderer Keys');
      rf.Add('FastExcel               = 0     ; Speed hack for SF "excel" modes. Will cause glitches if enabled!');
      rf.SaveToFile(FullPathZinc_Exe + 'renderer_default.cfg');
      rf.Clear;
      //Create the zinc renderer cfg
      rf.Add('; renderer settings');
      rf.Add('Created from ExtraFe/confEditor');
      rf.Add('');
      rf.Add('XSize			= 1024;');
      rf.Add('YSize			= 768;');
      rf.Add('FullScreen		= 1;');
      rf.Add('ColorDepth		= 32;');
      rf.Add('ScanLines		= 0;');
      rf.Add('Filtering		= 3;');
      rf.Add('Blending		= 1;');
      rf.Add('Dithering		= 0;');
      rf.Add('ShowFPS			= 0;');
      rf.Add('FrameLimitation   	= 1;');
      rf.Add('FrameSkipping           = 0;');
      rf.Add('FramerateDetection	= 1;');
      rf.Add('FramerateManual		= 100;');
      rf.Add('TextureType		= 3;');
      rf.Add('TextureCaching		= 2;');
      rf.Add('TurnDisplay       = 0;');
      rf.Add('EnableKeys      = 1;');
      rf.Add('FastExcel         = 0;');
      rf.SaveToFile(FullPathZinc_Exe + 'renderer.cfg');
      rf.Free;
      //Create the zinc sound cfg
      sf := TStringList.Create;
      sf.Add('; sound settings');
      sf.Add('Created from ExtraFe/confEditor');
      sf.Add('');
      sf.Add('--use-sound=yes');
      sf.Add('--sound-filter-enable=no');
      sf.Add('--sound-filter-cutoff=22050');
      sf.Add('--sound-surround-lite-enable=no');
      sf.Add('--sound-surround-lite-multiplier=40');
      sf.Add('--sound-stereo-exciter=no');
      sf.Add('--use-slow-geometry=yes');
      sf.Add('--use-stackinram-hack=no');
      sf.Add('--use-mem-predict=no');
      sf.SaveToFile(FullPathZinc_Exe+'zinc_sound.cfg');
      sf.Free;
    end;
end;

procedure SetUpZincGraphicsFirstTime;
begin
  Conf.rb9.Checked := True;
  Conf.rb3.Checked := True;
  Conf.sComboBox26.Text := '1024X768_32bit Color';
  Conf.sCheckBox48.Checked := False;
  Conf.sComboBox27.Text := '1';
  Conf.sComboBox28.Text := '0';
  Conf.sCheckBox49.Checked := False;
  Conf.sCheckBox50.Checked := True;
  Conf.sCheckBox51.Checked := False;
  Conf.sCheckBox52.Checked := True;
  Conf.sEdit65.Text := '100';
  Conf.sComboBox29.Text := '3';
  Conf.sComboBox30.Text := '3';
  Conf.sComboBox31.Text := '2';
  Conf.sCheckBox53.Checked := True;
end;

procedure SetUpZincSoundFirstTime;
begin
  Conf.sCheckBox79.Checked := True;
  Conf.sCheckBox84.Checked := False;
  Conf.sEdit74.Text := '22050';
  Conf.sCheckBox80.Checked := False;
  Conf.sCheckBox81.Checked := True;
  Conf.sCheckBox82.Checked := False;
  Conf.sCheckBox83.Checked := False;
  Conf.sCheckBox85.Checked := False;
  Conf.sEdit75.Text := '40';
end;

procedure SetZinc_PathsFromZincIni;
begin
  Conf.sEdit53.Text := FullPathZinc_Exe + Zinc_Exe;
  Conf.sEdit54.Text := Zinc_Config.ReadString('Zinc_Paths','Zinc_Roms',Conf.sEdit54.Text);
  Conf.sEdit55.Text := Zinc_Config.ReadString('Zinc_Paths','Zinc_Snaps',Conf.sEdit55.Text);
end;

end.
