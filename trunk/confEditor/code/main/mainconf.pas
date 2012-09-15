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
  wg_weather,
  OmniXML,OmniXMLUtils,mame_xmlext,ce_xmlext;


  procedure StartProgConfEditor;
  procedure StartConfEditor;
  procedure ReadConfiguration;
  procedure FirstTimeStart;

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
//Application Vars
  ExtraFePath: string;
//Cursors
  Arrow,TArrow,Link,Busy,Horizontal,Vertical,Precision : Byte;
//ConfEditor Vars
  CeXmlDoc: IXMLDocument;
  CeXML: TCE_Configuration;
  Row_Theme: TRowCe_Themes;
  Row_Config: TRowCe_Config;
  nodeCe: IXMLNode;
  Ce_List : IXMLNodeList;
  CE_SHelpInCaption,CE_SHelpInMain: Boolean;
  WinEffectsType,Ce_XMLPath: string;
  WinEffectsTime,Inode_Ce,ThemeNumber: Integer;
//ExtraFe Vars
//Mame Vars
  MameConfigFile,MameDatabaseFile,Mame_Exe,FullPathMame_Exe: String;
  SelectedMame: Shortint;
  Started,FromDatabase: Boolean;
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
              if (k <> 34) and (k <> 35)  then
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
              if (k <> 34) and (k <> 35)  then
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
              if (k <> 34) and (k <> 35) then
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
  resolutions.Free;
end;

procedure FirstTimeStart;
begin
  CeXmlDoc := CreateXMLDoc;
  CeXML := TCE_Configuration.Create;
  CeXML.Ver :=  GetVersion(ExtraFePath+'confeditor.exe');
  STBarInfo[0] := 'Version : '+ GetVersion(ExtraFePath+'confeditor.exe');
  Row_Theme := CeXML.Rows.AddRow;
  Row_Theme.ThemeNumber := 0;
  Row_Config := CeXML.Rows_Conf.AddRow;
  Row_Config.HelpInCaption := True;
  Row_Config.HelpInMainMenu := True;
  Row_Config.WindowsEffects := 'None';
  Row_Config.EffectsTime := 400;
  ThemeNumber := 0;
  CE_SHelpInCaption := True;
  CE_SHelpInMain := True;
  WinEffectsType := 'None';
  WinEffectsTime := 400;
  conf.sCheckBox1.Checked := CE_SHelpInMain;
  Conf.sCheckBox2.Checked := CE_SHelpInCaption;
  Conf.sComboBox74.ItemIndex  := Conf.sComboBox74.IndexOf(WinEffectsType);
  Conf.sComboBox74.Text := WinEffectsType;
  Started := True;
  WindowsEffectsType;
  Conf.se1.Value := WinEffectsTime;
  CeXML.SaveToFile(Ce_XMLPath,ofIndent);
end;

procedure ReadConfiguration;
begin
  CeXmlDoc := CreateXMLDoc;
  CeXmlDoc.Load(Ce_XMLPath);
  CeXML := TCE_Configuration.Create;
  nodeCe := CeXmlDoc.SelectSingleNode('/confEditor');
  if GetNodeAttrStr(nodeCe,'Ver','') <> GetVersion(ExtraFePath+'confeditor.exe') then
    begin
      CeXML.Ver := GetVersion(ExtraFePath+'confeditor.exe');
      STBarInfo[0] := 'Version : '+GetVersion(ExtraFePath+'confeditor.exe');
    end
  else
    begin
      CeXML.Ver := GetNodeAttrStr(nodeCe,'Ver');
      STBarInfo[0] := 'Version : '+GetNodeAttrStr(nodeCe,'Ver');
    end;
  Ce_List := CeXmlDoc.SelectNodes('/confEditor/rowtheme');
  for Inode_Ce := 0 to Ce_List.Length - 1 do
    begin
      nodeCe := Ce_List.Item[Inode_Ce];
      Row_Theme := CeXML.Rows.AddRow;
      Row_Theme.ThemeNumber := GetNodeAttrInt(nodeCe,'ThemeNumber');
    end;
  ThemeNumber := GetNodeAttrInt(nodeCe,'ThemeNumber');
  Ce_List := CeXmlDoc.SelectNodes('/confEditor/rowconfig');
  for Inode_Ce := 0 to Ce_List.Length - 1 do
    begin
      nodeCe := Ce_List.Item[Inode_Ce];
      Row_Config := CeXML.Rows_Conf.AddRow;
      Row_Config.HelpInCaption := GetNodeAttrBool(nodeCe,'HelpInCaption');
      Row_Config.HelpInMainMenu := GetNodeAttrBool(nodeCe,'HelpInMainMenu');
      Row_Config.WindowsEffects := GetNodeAttrStr(nodeCe,'WindowsEffects');
      Row_Config.EffectsTime := GetNodeAttrInt(nodeCe,'EffectsTime');
    end;
  CE_SHelpInCaption := StrToBool(GetNodeAttrStr(nodeCe,'HelpInCaption'));
  CE_SHelpInMain := StrToBool(GetNodeAttrStr(nodeCe,'HelpInMainMenu'));
  WinEffectsType := GetNodeAttrStr(nodeCe,'WindowsEffects');
  WinEffectsTime := GetNodeAttrInt(nodeCe,'EffectsTime');
  conf.sCheckBox1.Checked := CE_SHelpInMain;
  Conf.sCheckBox2.Checked := CE_SHelpInCaption;
  Conf.sComboBox74.ItemIndex  := Conf.sComboBox74.IndexOf(WinEffectsType);
  Conf.sComboBox74.Text := WinEffectsType;
  Started := True;
  WindowsEffectsType;
  Conf.se1.Value := WinEffectsTime;
end;

procedure StartProgConfEditor;
begin
  ExtraFePath := ExtractFilePath(Application.ExeName);
  Ce_XMLPath := ExtraFePath+'media\confeditor\config\config.xml';
  if FileExists(Ce_XMLPath) then
    ReadConfiguration
  else
    FirstTimeStart;
  StartSkinEngine;
  Splash_Screen.Show;
  CDirPath := Conf.Caption;
  CreateSTBarInfo;
  Splash_Screen.Progress_Label(5,'Info Created');
  HideAllPanels;
  Splash_Screen.Progress_Label(15,'ConfEditor initilisize');
  runMenuJustOpen;
  LoadStaticImages;
  LoadCostumCursors;
  Splash_Screen.Progress_Label(20,'Cursors OK');
end;

procedure StartProgExtraFE;
begin

end;

procedure StartEmuMame;
var
  kst: Integer;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'media/emulators/arcade/mame/config/config.xml') then
    begin
      MameConfigFile := ExtractFilePath(Application.ExeName)+'media/emulators/arcade/mame/config/config.xml';
      if not Assigned(MameXmlConfigDoc) then
        MameXmlConfigDoc := CreateXMLDoc;
      if FromDatabase = False then
        MameXMLConfig := TMameXMLPath.Create;
      MameXmlConfigDoc.Load(MameConfigFile);
      nodegame := MameXmlConfigDoc.SelectSingleNode('MamePath');
      if GetNodeAttrStr(nodegame,'SelectedMame','') <> '' then
        Mame_Exe := GetNodeAttrStr(nodegame,'SelectedMame');
      if GetNodeAttrStr(nodegame,'Selected','') <> '' then
        SelectedMame := GetNodeAttrInt(nodegame,'Selected');
      if GetNodeAttrStr(nodegame,'FullPathOfSelectedMame','') <> '' then
        FullPathMame_Exe := GetNodeAttrStr(nodegame,'FullPathOfSelectedMame');
    end
  else
    SelectedMame := -1;
  PathXmlMamePath := Program_Path+'media\emulators\arcade\mame\config\';
  if Mame_Exe <> '' then
    begin
      PathXmlMame := Program_Path+'media\emulators\arcade\mame\database\'+Mame_Exe;
      Delete(PathXmlMame,Length(PathXmlMame)-3,4);
      MameDatabaseFile := PathXmlMame+'_efuse.xml';
      if FromDatabase = False then
        begin
          try
            FGa := TGauseStream.Create;
            MameXmlUseDoc := CreateXMLDoc;
            MameXMLUse := TMameXML.Create;
          finally
            if FromArrows_Mamedirs = False then
              Splash_Screen.sLabel1.Caption := 'Loading Mame Database...'
            else
              Conf.sLabel112.Caption := 'Loading Mame Database...';
            Application.ProcessMessages;
            MameXmlUseDoc.PreserveWhiteSpace := True;
            FGa.LoadFromFile(MameDatabaseFile);
            if FromArrows_Mamedirs = False then
              FGa.Gause := Splash_Screen.sGauge_Splash
            else
              FGa.Gause := Conf.sGauge_MameChange;
            MameXmlUseDoc.LoadFromStream(FGa);
          end;
          FGa.Free;
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
  else
    begin
      Started := True;
      if not Assigned(MameXmlConfigDoc) then
        begin
          MameXmlConfigDoc := CreateXMLDoc;
          SelectedMame := -2;
        end
      else
        begin
          gameList := MameXmlConfigDoc.SelectNodes('/MamePath/rowdir');
          for kst := 0 to gameList.Length - 1 do
            begin
              nodegame := gameList.Item[kst];
             SetupedMame[kst] := GetNodeAttrStr(nodegame,'MameName');
            end;
        end;
      Checkwin64ForListBox(SelectedMame);
      Started := False;
    end;
end;

procedure StartEmuZinc;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\config.ini') then
    begin
      Started := True;
      Zinc_ini := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\config.ini';
      Zinc_Config := TIniFile.Create(Zinc_ini);
      Zinc_Exe := Zinc_Config.ReadString('Zinc_Paths','Zinc_Exe',Zinc_Exe);
      FullPathZinc_Exe := Zinc_Config.ReadString('Zinc_Paths','Zinc_Path',FullPathZinc_Exe);
      ZincDatabaseFile := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\database\zinc_efuse.xml';
      try
        FGa := TGauseStream.Create;
        ZincData_XmlDoc := CreateXMLDoc;
      finally
        Splash_Screen.sLabel1.Caption := 'Loading Zinc Database...';
        Application.ProcessMessages;
        ZincData_XmlDoc.PreserveWhiteSpace := True;
        FGa.LoadFromFile(ZincDatabaseFile);
        FGa.Gause := Splash_Screen.sGauge_Splash;
        ZincData_XmlDoc.LoadFromStream(FGa);
      end;
      FGa.Free;
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
//          SetpSX_DatabasefrompSXIni;
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
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'media\widgets\weather\weather.ini') then
    begin
      Started := True;
      if StBarInfo[2] = 'Internet Connected' then
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
begin
//
end;

procedure CreateSTBarInfo;
begin
  conf.stat1.Panels[0].Text := STBarInfo[0];
  if IsWindows64 = true then
    STBarInfo[1] := 'Windows 64 Bit'
  else
    STBarInfo[1] := 'Windows 32 Bit';
  if IsConnectedToInternet = True then
    StBarInfo[2] := 'Internet Connected'
  else
    StBarInfo[2] := 'Internet Not Found';
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


