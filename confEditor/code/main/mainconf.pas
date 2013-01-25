unit mainconf;

interface
uses
  Windows,Variants,Classes,SysUtils,Forms,StdCtrls,ComCtrls,IniFiles,ExtCtrls,
  Graphics,FunctionX,sPanel,sComboBox,sCheckBox,sEdit,sBitBtn,sButton,
  form_splash,
  menu,global,
  ce_themes,ce_config,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_builds,mame_database,
  zinc_paths,zinc_graphics,zinc_sound,zinc_database,
  hatari_paths,hatari_system,hatari_roms,hatari_screen,hatari_joy,hatari_database,
  psx_paths,psx_screen,psx_sound,psx_others,psx_database,
  kigb_paths,kigb_screen,kigb_sound,kigb_others,kigb_database,
  wg_weather,wg_timedate,
  NativeXml;


  procedure StartProgConfEditor;
  procedure StartConfEditor;

  procedure StartProgExtraFE;

  procedure StartEmuMame;
  procedure StartEmuZinc;
  procedure StartEmuHatari;
  procedure StartEmupSX;
  procedure StartEmuKigb;
  procedure StartWidget_Weather;
  procedure StartWidget_TimeDate;

  procedure ShowProgressBar(progress: Integer; Comment,Emu: string);
  procedure CreateSTBarInfo;
  procedure HideAllPanels;
  procedure StartSkinEngine;
  procedure GroupBoxColors(i : Integer);
  procedure LoadStaticImages;
  procedure SetAllCursor(Theme: Byte);
  procedure SetCursors(Cur: Byte);
  procedure AllCursor(cur: Byte);
//  procedure SetCursorToBusy(cur: Byte);
  procedure LoadCostumCursors;

var
//Cursors
  Arrow,TArrow,Link,Busy,Horizontal,Vertical,Precision : Byte;
//MainConf
  Started: Boolean;
//Zinc Vars
  Zinc_Exe,FullPathZinc_Exe,Zinc_RomsPath,ZincDatabaseFile,Zinc_ini: String;
  Zinc_Config: TIniFile;
//Hatari Vars
  Hatari_Exe,FullPathHatari_Exe,Hatari_confeditor_ini,Hatari_Tos,Hatari_FullPathTos: string;
  Hatari_Config,Hatari_ini: TIniFile;
//pSX Vars
  pSX_Exe,FullPathpSX_Exe,pSX_confEditor_ini: string;
  pSX_Config,pSX_Ini: TIniFile;
//Kigb Vars
  Kigb_Exe,FullPathKigb_Exe,Kigb_confEditor_ini,KigbCfg_File: string;
  Kigb_Config: TIniFile;
//Weather Vars
  WeatherIni: TIniFile;
//TimeDate Vars
  DateTimeIni: TIniFile;

implementation

uses
  main;
Procedure StartSkinEngine;
var
  skinnames: TStringList;
  rec : TSearchRec;
  themeName: string;
Begin
  Conf.skinM.SkinDirectory := Program_Path+'media\confeditor\skins';
  SkinNames := TStringList.Create;
  Conf.SkinM.SkinName := Conf.SkinM.GetSkinNames(SkinNames);
  Conf.sLB_ce_themes.Items.Clear;
  if SysUtils.FindFirst(Conf.SkinM.SkinDirectory+'\*.*' , faAnyFile, Rec) = 0 then
    begin
      repeat
        if ((Rec.Attr and faDirectory) <> faDirectory) then
          begin
            themeName := Trim(Copy(rec.Name,0,Length(rec.Name)-4));
            Conf.sLB_ce_themes.Items.Add(themeName);
          end;
      until FindNext(Rec) <> 0;
    end;
  Conf.sLB_ce_themes.Selected[ThemeNumber] := true;
  Conf.sLabelFX3.Caption := Conf.sLB_ce_themes.Items.Strings[ThemeNumber];
  Conf.img_ce_theme.Picture.LoadFromFile('media\confeditor\skins\preview\'+conf.sLB_ce_themes.items.strings[ThemeNumber]+'.png');
  ThemeCreator(ThemeNumber+1);
  SetAllCursor(ThemeNumber+1);
  GroupBoxColors(ThemeNumber);
  conf.skinM.SkinName := Conf.sLB_ce_themes.Items.Strings[ThemeNumber];
  Conf.skinM.Active := True;
  Application.ProcessMessages;
  skinnames.Free;
end;

Procedure GroupBoxColors(i : Integer);
var
  component: TComponent;
  k: Integer;
Begin
  if i = 3 then
    i := 2;
  Case i of
    0 : begin
          for k := 1 to 122 do
            begin
              if (k <> 35)  then
                begin
                  component := FindComponentEx('Conf.grp'+inttostr(k));
                  TGroupBox(component).Color := $00e4eaed;
                end;
            end;
          Conf.ScrollBox1.Color := $00e4eaed;
          Conf.ScrollBox2.Color := $00e4eaed;
          Conf.PBuilds_MamePlus.Color := $00e4eaed;
          Conf.PBuilds_MameXT.Color := $00e4eaed;
        end;
    1 : begin
          for k := 1 to 122 do
            begin
              if (k <> 35)  then
                begin
                  component := FindComponentEx('Conf.grp'+inttostr(k));
                  TGroupBox(component).Color := $00bae5e8;
                end;
            end;
          Conf.ScrollBox1.Color := $00bae5e8;
          Conf.ScrollBox2.Color := $00bae5e8;
          Conf.PBuilds_MamePlus.Color := $00bae5e8;
          Conf.PBuilds_MameXT.Color := $00bae5e8;
        end;
    2 : begin
          for k := 1 to 122 do
            begin
              if (k <> 35) then
                begin
                  component := FindComponentEx('Conf.grp'+inttostr(k));
                  TGroupBox(component).Color := $00e7e7e7;
                end;
            end;
          Conf.ScrollBox1.Color := $00e7e7e7;
          Conf.ScrollBox2.Color := $00e7e7e7;
          Conf.PBuilds_MamePlus.Color := $00e7e7e7;
          Conf.PBuilds_MameXT.Color := $00e7e7e7;
        end;
  end;
end;

procedure SetAllCursor(Theme : Byte);
begin
  case Theme of
    1 : AllCursor(2);
    2 : AllCursor(3);
    3 : AllCursor(4);
    4 : AllCursor(1);
  end;
end;

procedure SetCursors(Cur: Byte);
begin
  case cur of
    1 : begin
          Arrow := AniArrow;
          TArrow := AniText;
          Link := AniLink;
          Busy := AniBusy;
          Horizontal := AniHorizontal;
          Vertical := AniVertical;
          Precision := AniPrecision;
        end;
    2 : begin
          Arrow := AniArrow2;
          TArrow := AniText2;
          Link := AniLink2;
          Busy := AniBusy2;
          Horizontal := AniHorizontal2;
          Vertical := AniVertical2;
          Precision := AniPrecision2;
        end;
    3 : begin
          Arrow := AniArrow3;
          TArrow := AniText3;
          Link := AniLink3;
          Busy := AniBusy3;
          Horizontal := AniHorizontal3;
          Vertical := AniVertical3;
          Precision := AniPrecision3;
        end;
    4 : begin
          Arrow := AniArrow4;
          TArrow := AniText4;
          Link := AniLink4;
          Busy := AniBusy4;
          Horizontal := AniHorizontal4;
          Vertical := AniVertical4;
          Precision := AniPrecision4;
        end;
  end;
end;

procedure AllCursor(cur: Byte);
var
  i: Integer;
  Comp: TComponent;
begin
  SetCursors(cur);
  //Menu Panel
  Conf.Menu_Panel.Cursor := Arrow;
  for i := 6 to 16 do
    begin
      Comp := FindComponentEx('Conf.sBitBtn' + IntToStr(i));
      TsBitBtn(Comp).Cursor := Arrow;
    end;
  Conf.Menu_Image.Cursor := Arrow;
  Conf.stat1.Cursor := TArrow;
  //Mains Panel in Main Panel
  Conf.Main_Panel.Cursor := Arrow;
  Conf.Pce_wizard.Cursor := Arrow;
  Conf.Pce_config.Cursor := Arrow;
  Conf.Pce_themes.Cursor := Arrow;
  Conf.Pexf_configuration.Cursor := Arrow;
  Conf.Pexf_themes.Cursor := Arrow;
  Conf.Pem_mame_dirs.Cursor := Arrow;
  Conf.Pem_mame_graphics.Cursor := Arrow;
  Conf.Pem_mame_sound.Cursor := Arrow;
  Conf.Pem_mame_others.Cursor := Arrow;
  Conf.Pem_mame_builds.Cursor := Arrow;
  Conf.Pem_mame_database.Cursor := Arrow;
  Conf.Pem_zinc_paths.Cursor := Arrow;
  Conf.Pem_zinc_graphics.Cursor := Arrow;
  Conf.Pem_zinc_sound.Cursor := Arrow;
  Conf.Pem_zinc_database.Cursor := Arrow;
  Conf.Pem_hatari_paths.Cursor := Arrow;
  Conf.Pem_hatari_system.Cursor := Arrow;
  Conf.Pem_hatari_roms.Cursor := Arrow;
  Conf.Pem_hatari_screen.Cursor := Arrow;
  Conf.Pem_hatari_joy.Cursor := Arrow;
  Conf.Pem_hatari_database.Cursor := Arrow;
  Conf.Pem_psx_paths.Cursor := Arrow;
  Conf.Pem_psx_screen.Cursor := Arrow;
  Conf.Pem_psx_sound.Cursor := Arrow;
  Conf.Pem_psx_others.Cursor := Arrow;
  Conf.Pem_psx_database.Cursor := Arrow;
  Conf.Pem_kigb_paths.Cursor := Arrow;
  Conf.Pem_kigb_screen.Cursor := Arrow;
  Conf.Pem_kigb_sound.Cursor := Arrow;
  Conf.Pem_kigb_others.Cursor := Arrow;
  Conf.Pem_kigb_database.Cursor := Arrow;
  Conf.Pwg_weather.Cursor := Arrow;
  Conf.Pwg_timedate.Cursor := Arrow;
  Conf.Ptimedate_internettime.Cursor := Arrow;
  Conf.Ptimedate_worldclock.Cursor := Arrow;

  //groupBoxes(grp)
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.grp' + IntToStr(i)) <> nil then
        begin
          Comp := FindComponentEx('Conf.grp' + IntToStr(i));
          TGroupBox(Comp).Cursor := Arrow;
        end;
    end;
  //sPanels
  Conf.sPanel.Cursor := Precision;
  for i := 2 to 68 do
    begin
      Comp := FindComponentEx('Conf.sPanel' + IntToStr(i));
      TsPanel(Comp).Cursor := Precision;
    end;
  for i := 69 to 200 do
    begin
      if FindComponentEx('Conf.sPanel' + IntToStr(i)) <> nil then
        begin
          Comp := FindComponentEx('Conf.sPanel' + IntToStr(i));
          TsPanel(Comp).Cursor := Arrow;
        end;
    end;
  //sCheckBoxes
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sCheckBox' + IntToStr(i)) <> nil then
        begin
          Comp := FindComponentEx('Conf.sCheckBox' + IntToStr(i));
          TsCheckBox(Comp).Cursor := Arrow;
        end;
    end;
  //sComboBoxes
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sComboBox' + IntToStr(i)) <> nil then
        begin
          Comp := FindComponentEx('Conf.sComboBox' + IntToStr(i));
          TsComboBox(Comp).Cursor := Arrow;
        end;
    end;
  //sEdits
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sEdit' + IntToStr(i)) <> nil then
        begin
          Comp := FindComponentEx('Conf.sEdit' + IntToStr(i));
          TsEdit(Comp).Cursor := TArrow;
        end;
    end;
  //sBitBtns
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sBitBtn' + IntToStr(i)) <> nil then
        begin
          Comp := FindComponentEx('Conf.sBitBtn' + IntToStr(i));
          TsBitBtn(Comp).Cursor := Arrow;
        end;
    end;
  //radioButtons(rb)
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.rb' + IntToStr(i)) <> nil then
        begin
          Comp := FindComponentEx('Conf.rb' + IntToStr(i));
          TRadioButton(Comp).Cursor := Arrow;
        end;
    end;
  //sButtons
  for i := 0 to 200 do
    begin
      if FindComponentEx('Conf.sButton' + IntToStr(i)) <> nil then
        begin
          Comp := FindComponentEx('Conf.sButton' + IntToStr(i));
          TsButton(Comp).Cursor := Arrow;
        end;
    end;

  //(confEditor)
  //Panel CE_Config
  Conf.se1.Cursor := Arrow;
  //Panel CE_Themes
  Conf.sLB_ce_themes.Cursor := Arrow;
  Conf.sBB_apply_ce_themes.Cursor := Arrow;
  Conf.img_ce_theme.Cursor := Arrow;

  //{ExtraFE}
  //Panel EXF_Configuration
  //Panel EXF_Themes

  //{Mame}
  //Panel Mame_Dirs
  Conf.panel_mame_page1.Cursor := Arrow;
  Conf.panel_mame_page2.Cursor := Arrow;
  //Panel Mame_Graphics
  Conf.sbar_mame_emulatrionspeed.Cursor := Horizontal;
  Conf.sbar_mame_pausebrightness.Cursor := Horizontal;
  Conf.sbar_mame_gammacorrection.Cursor := Horizontal;
  Conf.sbar_mame_brightnesscorrection.Cursor := Horizontal;
  Conf.sbar_mame_contrastcorrection.Cursor := Horizontal;
  Conf.sbar_mame_secondstorun.Cursor := Horizontal;
  Conf.sbar_mame_scalescreen.Cursor := Horizontal;
  Conf.sbar_mame_Fgamma.Cursor := Horizontal;
  Conf.sbar_mame_Fbrightness.Cursor := Horizontal;
  Conf.sbar_mame_Fcontrast.Cursor := Horizontal;
  //Panel Mame_Sound
  Conf.sbar_mame_valumeattenuation.Cursor := Horizontal;
  Conf.sbar_mame_audiolatency.Cursor := Horizontal;
  Conf.sbar_mame_joysdeadzone.Cursor := Horizontal;
  Conf.sbar_mame_joysaturation.Cursor := Horizontal;
  //Panel Mame_Others
  Conf.sbar_mame_threadpriority.Cursor := Horizontal;
  Conf.sbar_mame_beamwidth.Cursor := Horizontal;
  Conf.sbar_mame_flicker.Cursor := Horizontal;
  //Panel Mame_Builds
  Conf.PBuilds_MameBuilds.Cursor := Arrow;
  Conf.PBuilds_MamePlus.Cursor := Arrow;
  Conf.nxtgrd_ips_mameplus.Cursor := Arrow;
  Conf.sbar_Mame_UITransparent_MamePlus.Cursor := Horizontal;
  Conf.PBuilds_MameXT.Cursor := Arrow;
  Conf.sbar_Mame_UITransparent_MameXT.Cursor := Horizontal;
  Conf.nxtgrd_ips_mamext.Cursor := Arrow;
  Conf.PBuilds_MameTools.Cursor := Arrow;
  Conf.LMDFontComboBox1.Cursor := Arrow;
  Conf.LMDFontSizeComboBox1.Cursor := Arrow;
  Conf.img86.Cursor := Arrow;
  //Panel Mame_Database
  Conf.nxtgrd_mame.Cursor := Arrow;
  Conf.sWebLabel3.Cursor := Link;

  //{Zinc}
  //Panel Zinc_Paths
  //Panel Zinc_Graphics
  //Panel Zinc_Sound
  //Panel Zinc_Database
  Conf.nxtgrd_zinc.Cursor := Arrow;

  //{Hatari}
  //Panel Hatari_Paths
  //Panel Hatari_System
  //Panel Hatari_Roms
  //Panel Hatari_Screen
  //Panel Hatari_Joy
  //Panel Hatari_Database
  Conf.sGauge_HatariData.Cursor := Arrow;
  Conf.nxtgrd_hatari.Cursor := Arrow;

  //{pSX Emulator}
  //Panel pSX_Paths
  Conf.sWebLabel1.cursor := Link;
  Conf.sWebLabel2.cursor := Link;
  //Panel pSX_Screen
  Conf.sbar_psx_gamma.Cursor := Horizontal;
  Conf.sbar_psx_brightness.Cursor := Horizontal;
  Conf.sbar_psx_contrast.Cursor := Horizontal;
  //Panel pSX_Sound
  Conf.sbar_psx_latency.Cursor := Horizontal;
  Conf.sbar_psx_xalatency.Cursor := Horizontal;
  //Panel pSX_Others
  //Panel pSX_Database

  Conf.nxtgrd_pSX.Cursor := Arrow;

  //{Kigb}
  //Panel Kigb_Paths
  //Panel Kigb_Screen
  for i := 1 to 4 do
    begin
      Comp := FindComponentEx('Conf.pnl' + IntToStr(i));
      TPanel(Comp).Cursor := Precision;
    end;
  //Panel Kigb_Sound
  Conf.sbar_kigb_soundvolume.Cursor := Horizontal;
  Conf.sbar_kigb_soundpan.Cursor := Horizontal;
  //Panel Kigb_Others
  //Panel Kigb_Database
  Conf.nxtgrd_kigb.Cursor := Arrow;

  //WidGets
  //Weather
  Conf.ScrollBox1.Cursor := Arrow;
  Conf.sListBox1.Cursor := Arrow;
  //DateTime
  Conf.ScrollBox2.Cursor := Arrow;
end;

{procedure SetCursorToBusy(cur: Byte);
begin
//  SetCursors(cur);
  Conf.Pem_mame_database.Cursor := Busy;
  Conf.img24.Cursor := Busy;
  Conf.img25.Cursor := Busy;
  Conf.img26.Cursor := Busy;
  Conf.nxtgrd_mame.Cursor := Busy;
  Conf.sComboBox72.Cursor := Busy;
  Conf.sGauge_MameData.Cursor := Busy;
end;}


procedure LoadCostumCursors;
begin
  Screen.Cursors[AniArrow] := GetResourceAsAniCursor('ARROW');
  Screen.Cursors[AniText] := GetResourceAsAniCursor('TEXT');
  Screen.Cursors[AniLink] := GetResourceAsAniCursor('LINK');
  Screen.Cursors[AniBusy] := GetResourceAsAniCursor('BUSY');
  Screen.Cursors[AniHorizontal] := GetResourceAsAniCursor('HORIZONTAL');
  Screen.Cursors[AniVertical] := GetResourceAsAniCursor('VERTICAL');
  Screen.Cursors[AniPrecision] := GetResourceAsAniCursor('PRECISION');
  Screen.Cursors[AniArrow2] := GetResourceAsAniCursor('ARROW2');
  Screen.Cursors[AniText2] := GetResourceAsAniCursor('TEXT2');
  Screen.Cursors[AniLink2] := GetResourceAsAniCursor('LINK2');
  Screen.Cursors[AniBusy2] := GetResourceAsAniCursor('BUSY2');
  Screen.Cursors[AniHorizontal2] := GetResourceAsAniCursor('HORIZONTAL2');
  Screen.Cursors[AniVertical2] := GetResourceAsAniCursor('VERTICAL2');
  Screen.Cursors[AniPrecision2] := GetResourceAsAniCursor('PRECISION2');
  Screen.Cursors[AniArrow3] := GetResourceAsAniCursor('ARROW3');
  Screen.Cursors[AniText3] := GetResourceAsAniCursor('TEXT3');
  Screen.Cursors[AniLink3] := GetResourceAsAniCursor('LINK3');
  Screen.Cursors[AniBusy3] := GetResourceAsAniCursor('BUSY3');
  Screen.Cursors[AniHorizontal3] := GetResourceAsAniCursor('HORIZONTAL3');
  Screen.Cursors[AniVertical3] := GetResourceAsAniCursor('VERTICAL3');
  Screen.Cursors[AniPrecision3] := GetResourceAsAniCursor('PRECISION3');
  Screen.Cursors[AniArrow4] := GetResourceAsAniCursor('ARROW4');
  Screen.Cursors[AniText4] := GetResourceAsAniCursor('TEXT4');
  Screen.Cursors[AniLink4] := GetResourceAsAniCursor('LINK4');
  Screen.Cursors[AniBusy4] := GetResourceAsAniCursor('BUSY4');
  Screen.Cursors[AniHorizontal4] := GetResourceAsAniCursor('HORIZONTAL4');
  Screen.Cursors[AniVertical4] := GetResourceAsAniCursor('VERTICAL4');
  Screen.Cursors[AniPrecision4] := GetResourceAsAniCursor('PRECISION4');
end;

procedure HideAllPanels;
const
  ConfEditorPanels: array [0..2] of string = ('themes','config','wizard');
  ExtraFePanels: array [0..1] of string = ('configuration','themes');
  MamePanels: array [0..5] of string = ('dirs','graphics','sound','others','builds','database');
  ZincPanels: array [0..3] of string = ('paths','graphics','sound','database');
  HatariPanels: array [0..5] of string = ('paths','system','roms','screen','joy','database');
  pSXPanels: array [0..4] of string = ('paths','screen','sound','others','database');
  KiGBPanels: array [0..4] of string = ('paths','screen','sound','others','database');
  WidgetsPanels: array [0..1] of string = ('weather','timedate');
var
  run: Integer;
  comp: TComponent;
begin
  for run := 0 to 2 do
    begin
      Comp := FindComponentEx('Conf.Pce_' + ConfEditorPanels[run]);
      TsPanel(comp).Left := 727;
    end;
  for run := 0 to 1 do
    begin
      Comp := FindComponentEx('Conf.Pexf_' + ExtraFePanels[run]);
      TsPanel(comp).Left := 727;
    end;
  for run := 0 to 5 do
    begin
      Comp := FindComponentEx('Conf.Pem_mame_' + MamePanels[run]);
      TsPanel(comp).Left := 727;
    end;
  for run := 0 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pem_zinc_' + ZincPanels[run]);
      TsPanel(comp).Left := 727;
    end;
  for run := 0 to 5 do
    begin
      Comp := FindComponentEx('Conf.Pem_hatari_' + HatariPanels[run]);
      TsPanel(comp).Left := 727;
    end;
  for run := 0 to 4 do
    begin
      Comp := FindComponentEx('Conf.Pem_psx_' + pSXPanels[run]);
      TsPanel(comp).Left := 727;
    end;
  for run := 0 to 4 do
    begin
      Comp := FindComponentEx('Conf.Pem_kigb_' + KiGBPanels[run]);
      TsPanel(comp).Left := 727;
    end;
  for run := 0 to 1 do
    begin
      Comp := FindComponentEx('Conf.Pwg_' + WidgetsPanels[run]);
      TsPanel(comp).Left := 727;
    end;
end;

procedure StartConfEditor;
begin
  Program_Path := ExtractFilePath(Application.ExeName); //The Path of my program
  ConfEditor_ImagePath:= Program_Path+'media\confeditor\images\'; // The Path of programs images
  StartProgConfEditor;
  StartEmuMame;
  StartEmuZinc;
  StartEmuHatari;
  StartEmupSX;
  StartEmuKigb;
  StartWidget_Weather;
  StartWidget_TimeDate;
  resolutions.Free;
end;

procedure StartProgConfEditor;
begin
  Ce_XMLPath := Program_Path+'media\confeditor\config\config.xml';
  if FileExists(Ce_XMLPath) then
    ReadConfiguration
  else
    FirstTimeStart;
  SetCE_ConfigFromConfigIni;
end;

procedure StartProgExtraFE;
begin

end;

procedure StartEmuMame;
var
  F: TFileStream;
begin
  PathXmlMamePath := Program_Path+'media\emulators\arcade\mame\config\';
  MameConfigFile := Program_Path+'media\emulators\arcade\mame\config\config.xml';
  if FileExists(Program_Path +'media\emulators\arcade\mame\config\config.xml') then
    begin
      MameConfigFile := Program_Path+'media\emulators\arcade\mame\config\config.xml';
      Assigned_MameConfiguration;
      FXml_MameConfing.LoadFromFile(MameConfigFile);
      Mame_Exe := FXml_MameConfing.Root.ReadAttributeString('SelectedMame');
      SelectedMame := FXml_MameConfing.Root.ReadAttributeInteger('Selected');
      FullPathMame_Exe := FXml_MameConfing.Root.ReadAttributeString('FullPathOfSelectedMame');
    end
  else
    SelectedMame := -1;
  if Mame_Exe <> '' then
    begin
      PathXmlMame := Program_Path+'media\emulators\arcade\mame\database\'+Mame_Exe;
      Delete(PathXmlMame,Length(PathXmlMame)-3,4);
      MameDatabaseFile := PathXmlMame+'_efuse.xml';
      FFileName := MameDatabaseFile;
      if FromArrows_Mamedirs then
        progressComesFrom := 'Mame_dirs'
      else if FromDatabase = False then
        progressComesFrom := 'Mame_start'
      else
        progressComesFrom := 'Mame_database';
      Assigned_MameDatabase;
      FXml_MameDatabase.OnProgress := Conf.XMLProgress;
      F := TFileStream.Create(FFileName, fmOpenRead or fmShareDenyWrite);
        try
          FFileSize := F.Size;
          if IsBinary(F) then
            FXml_MameDatabase.LoadFromBinaryStream(F)
          else
            FXml_MameDatabase.LoadFromStream(F);
        finally
          F.Free;
        end;
      Conf.sEdit64.Text := FullPathMame_Exe+Mame_Exe;
      InitGlobal_MameMemo_ForMameIni;
      SetMame_DirsFromMameIni;
      ShowProgressBar(20,'Mame Directories Ready','Mame');
      SetMame_GraphicsFromMameIni;
      ShowProgressBar(35,'Mame Graphics Ready','Mame');
      SetMame_SoundFromMameIni;
      ShowProgressBar(50,'Mame Sound Ready','Mame');
      SetMame_OthersFromMameIni;
      ShowProgressBar(65,'Mame Others Ready','Mame');
      SetMame_BuildsFromMameIni;
      ShowProgressBar(80,'Mame Builds Ready','Mame');
      SetMame_DatabaseFromMameIni;
      ShowProgressBar(100,'Mame Database Ready','Mame');
      Started := False;
      FromDatabase := False;
    end
end;

procedure StartEmuZinc;
var
  F : TFileStream;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\config.ini') then
    begin
      Started := True;
      Zinc_ini := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\config.ini';
      Zinc_Config := TIniFile.Create(Zinc_ini);
      Zinc_Exe := Zinc_Config.ReadString('Zinc_Paths','Zinc_Exe',Zinc_Exe);
      FullPathZinc_Exe := Zinc_Config.ReadString('Zinc_Paths','Zinc_Path',FullPathZinc_Exe);
      ZincDatabaseFile := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\database\zinc_efuse.xml';
      FFileName := ZincDatabaseFile;
      progressComesFrom := 'Zinc_start';
      FXml_Zinc := TNativeXml.Create(nil);
      FXml_Zinc.XmlFormat := xfReadable; 
      FXml_Zinc.OnProgress := Conf.XMLProgress;
      F := TFileStream.Create(FFileName, fmOpenRead or fmShareDenyWrite);
        try
          FFileSize := F.Size;
          if IsBinary(F) then
            FXml_Zinc.LoadFromBinaryStream(F)
          else
            FXml_Zinc.LoadFromStream(F);
        finally
          F.Free;
        end;
      ShowProgressBar(20,'Zinc Files Ready','Zinc');
      SetZinc_PathsFromZincIni;
      ShowProgressBar(40,'Zinc Paths Ready','Zinc');
      SetZinc_GraphicsFromZincIni;
      ShowProgressBar(60,'Zinc Graphics Ready','Zinc');
      SetZinc_SoundFromZincIni;
      ShowProgressBar(80,'Zinc Sound Ready','Zinc');
      SetZinc_DatabaseFromZincIni;
      ShowProgressBar(100,'Zinc Database Ready','Zinc');
      Started := False;
    end;  
end;

procedure StartEmuHatari;
begin
  Hatari_confeditor_ini := ExtractFilePath(Application.ExeName)+'media\emulators\computers\atari\hatari\config\config.ini';
  if FileExists(Hatari_confeditor_ini) then
    begin
      Hatari_Config := TIniFile.Create(Hatari_confeditor_ini);
      Started := True;
      SetHatari_PathsfromHatariIni;
      ShowProgressBar(10,'Hatari Paths Ready','Hatari');
      SetHatari_SystemfromHatariIni;
      ShowProgressBar(25,'Hatari System Ready','Hatari');
      SetHatari_RomsfromHatariIni;
      ShowProgressBar(40,'Hatari Roms Ready','Hatari');
      SetHatari_ScreenfromHatariIni;
      ShowProgressBar(55,'Hatari Screen/Sound Ready','Hatari');
      SetHatari_JoyfromHatariIni;
      ShowProgressBar(70,'Hatari Joystics/Keyboard Ready','Hatari');
      SetHatari_DatabaseFromHatariIni;
      ShowProgressBar(100,'Hatari Database Ready','Hatari');
      Started := False;
    end;
end;

procedure StartEmupSX;
begin
  pSX_confEditor_ini := ExtractFilePath(Application.ExeName) + 'media\emulators\consoles\playstation\psxemulator\config\config.ini';
  if FileExists(pSX_confEditor_ini) then
    begin
      pSX_Config := TIniFile.Create(pSX_confEditor_ini);
      pSX_Exe := pSX_Config.ReadString('Paths','ExeName',pSX_Exe);
      if pSX_Config.ValueExists('Paths','FoundBIOS') then
        begin
          FullPathpSX_Exe := pSX_Config.ReadString('Paths','FullPathExe',FullPathpSX_Exe);
          pSX_Ini := TIniFile.Create(FullPathpSX_Exe + 'psx.ini');
          Started := True;
          SetpSX_PathsfrompSXIni;
          ShowProgressBar(20,'pSX Paths Ready','pSX');
          SetpSX_ScreenfrompSXIni;
          ShowProgressBar(40,'pSX Screen Ready','pSX');
          SetpSX_SoundfrompSXIni;
          ShowProgressBar(60,'pSX Sound and Controllers Ready','pSX');
          SetpSX_OthersfrompSXIni;
          ShowProgressBar(80,'pSX Others Ready','pSX');
          SetpSX_DatabasefrompSXIni;
          ShowProgressBar(100,'pSX Database Ready','pSX');
          Started := False;
        end;
    end;
end;

procedure StartEmuKigb;
begin
  Kigb_confEditor_ini := ExtractFilePath(Application.ExeName) + 'media\emulators\handheld\nintendo\kigb\config\config.ini';
  if FileExists(Kigb_confEditor_ini) then
    begin
      Kigb_Config := TIniFile.Create(Kigb_confEditor_ini);
      Kigb_Exe := Kigb_Config.ReadString('Paths','KigbExe',Kigb_Exe);
      FullPathKigb_Exe := Kigb_Config.ReadString('Paths','FullPathKigbExe',FullPathKigb_Exe);
      Started := True;
      KigbCfg_File := FullPathKigb_Exe + 'kigb.cfg';
      SetKigb_PathsfromKigbIni;
      ShowProgressBar(20,'Kigb Paths Ready','Kigb');
      SetKigb_ScreenfromKigbIni;
      ShowProgressBar(40,'Kigb Screen Ready','Kigb');
      SetKigb_SoundfromKigbIni;
      ShowProgressBar(60,'Kigb Sound and Controllers Ready','Kigb');
      SetKigb_OthersfromKigbIni;
      ShowProgressBar(80,'Kigb Others Ready','Kigb');
      SetKigb_DatabasefromKigbIni;
      ShowProgressBar(100,'Kigb Database Ready','Kigb');
      Started := False;
    end;
end;

procedure StartWidget_Weather;
const
  WeatherIniPath = 'media\widgets\weather\weather.ini';
begin
  if FileExists(Program_Path + WeatherIniPath) then
    begin
      Started := True;
      if StBarInfo[3] = 'Internet Connected' then
        begin
          WeatherIni := TIniFile.Create(Extractfilepath(Application.ExeName) + 'media\widgets\weather\weather.ini');
          SetWeather_FromWeatherIni;
        end
      else
        Conf.sLabel62.Visible := True;
      Started := False;
    end
  else
    CreateWeatherIniFirstTime;
end;

procedure StartWidget_TimeDate;
const
  DateTimeIniPath = 'media\widgets\datetime\datetime.ini';
begin
  if FileExists(Program_Path + DateTimeIniPath) then
    begin
      Started := True;
      DateTimeIni := TIniFile.Create(Program_Path + DateTimeIniPath);
      SetDateTime_FromDateTimeIni;
      Started := False;
    end
  else
    CreateDateTimeIniFirstTime;
end;

procedure CreateSTBarInfo;
begin
  Conf.stat1.Panels[0].Text := 'confEditor Ver: ' + STBarInfo[0];
  if IsWindows64 = true then
    STBarInfo[2] := 'Windows 64 Bit'
  else
    STBarInfo[2] := 'Windows 32 Bit';
  if IsConnectedToInternet = True then
    StBarInfo[3] := 'Internet Connected'
  else
    StBarInfo[3] := 'Internet Not Found';
  STBarMessages := 0;
  Conf.tmr1.Enabled := True;
end;

procedure LoadStaticImages;
var
  BMPImage: TBitmap;
begin
  BMPImage := TBitmap.Create;
  BMPImage.LoadFromResourceName(HInstance,'GLYF_BACKBUTTON');
  Conf.sBitBtn16.Glyph := BMPImage;
  BMPImage.Free;
  BMPImage := TBitmap.Create;
  BMPImage.LoadFromResourceName(HInstance,'CONFEDITOR');
  Conf.Menu_Image.Bitmap := BMPImage;
  BMPImage.Free;
end;

procedure ShowProgressBar(progress: Integer; Comment,Emu: string);
begin
  if Emu = 'Mame' then
    begin
      if FromArrows_Mamedirs = False then
        begin
          if FromDatabase = False then
            Splash_Screen.Progress_Label(progress,Comment)
          else
            begin
              Conf.sLabel109.Caption := 'SetSettings To Mame (ConfEditor)';
              Conf.sGauge_MameData.Progress := progress;
            end
        end
      else
        begin
          Conf.sLabel112.Caption := Comment;
          Conf.sGauge_MameChange.Progress := progress;
        end;
      Application.ProcessMessages;
      Sleep(50);
      Started := True;
    end
  else
    begin
      Splash_Screen.Progress_Label(progress,Comment);
      Application.ProcessMessages;
      Sleep(50);    
    end;
end;

end.


