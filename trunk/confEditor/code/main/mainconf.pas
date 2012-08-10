unit mainconf;

interface
uses
  Windows,Variants,Classes,SysUtils,Forms,StdCtrls,ComCtrls,IniFiles,ExtCtrls,
  Graphics,FunctionX,sPanel,sComboBox,sCheckBox,sEdit,sBitBtn,
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
  procedure ShowMameProgress(progress: Integer; Comment: string);

  procedure StartEmuZinc;
  procedure ShowZincProgress(progress: Integer; Comment: string);

  procedure StartEmuHatari;
  procedure ShowHatariProgress(progress: Integer; Comment: string);
  
  procedure StartEmupSX;
  procedure ShowpSXProgress(progress: Integer; Comment: string);

  procedure StartEmuKigb;
  procedure ShowKigbProgress(progress: Integer; Comment: string);

  procedure StartWidget_Weather;
  procedure StartWidget_TimeDate;
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
  run: Integer;
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
              component := FindComponentEx('Conf.grp'+inttostr(k));
              TGroupBox(component).Color := $00e4eaed;
            end;
          Conf.PBuilds_MamePlus.Color := $00e4eaed;
          Conf.PBuilds_MameXT.Color := $00e4eaed;
        end;
    1 : begin
          for k := 1 to 122 do
            begin
              component := FindComponentEx('Conf.grp'+inttostr(k));
              TGroupBox(component).Color := $00bae5e8;
            end;
          Conf.PBuilds_MamePlus.Color := $00bae5e8;
          Conf.PBuilds_MameXT.Color := $00bae5e8;
        end;
    2 : begin
          for k := 1 to 122 do
            begin
              if (k <> 11) and (k <> 12) and (k <> 17) and (k <> 18) and
                (k <> 20) and (k <> 30) and (k <> 31) and (k <> 32) and
                (k <> 33) and (k <> 34) and (k <> 35) then
                begin
                  component := FindComponentEx('Conf.grp'+inttostr(k));
                  TGroupBox(component).Color := $00e7e7e7;
                end;
            end;
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
  l: Byte;
  Comp: TComponent;
begin
  SetCursors(cur);
  //Menu Panel
  Conf.Menu_Panel.Cursor := Arrow;
  Conf.sBitBtn6.Cursor := Arrow;
  Conf.sBitBtn7.Cursor := Arrow;
  Conf.sBitBtn8.Cursor := Arrow;
  Conf.sBitBtn9.Cursor := Arrow;
  Conf.sBitBtn10.Cursor := Arrow;
  Conf.sBitBtn11.Cursor := Arrow;
  Conf.sBitBtn12.Cursor := Arrow;
  Conf.sBitBtn13.Cursor := Arrow;
  Conf.sBitBtn14.Cursor := Arrow;
  Conf.sBitBtn15.Cursor := Arrow;
  Conf.sBitBtn16.Cursor := Arrow;
  Conf.Menu_Image.Cursor := Arrow;
  Conf.stat1.Cursor := TArrow;
  //Panel Main
  Conf.Main_Panel.Cursor := Arrow;

  //{ConfEditor}
  //Panel CE_StartWizard
  Conf.Pce_wizard.Cursor := Arrow;
  //Panel CE_Configuration
  Conf.Pce_config.Cursor := Arrow;
  Conf.sCheckBox1.Cursor := Arrow;
  Conf.sCheckBox2.Cursor := Arrow;
  Conf.grp116.Cursor := Arrow;
  Conf.sComboBox74.Cursor := Arrow;
  Conf.se1.Cursor := Arrow;
  //Panel CE_Themes
  Conf.Pce_themes.Cursor := Arrow;
  Conf.sLB_ce_themes.Cursor := Arrow;
  Conf.sBB_apply_ce_themes.Cursor := Arrow;
  Conf.img_ce_theme.Cursor := Arrow;
  Conf.sPanel1.Cursor := Arrow;

  //{ExtraFE}
  //Panel EXF_Configuration
  Conf.Pexf_configuration.Cursor := Arrow;
  //Panel EXF_Themes
  Conf.Pexf_themes.Cursor := Arrow;

  //{Weather}
  Conf.Pwg_weather.Cursor := Arrow;

  //{Time/Date}
  Conf.Pwg_timedate.Cursor := Arrow;

  //{Mame}
  //Panel Mame_Dirs
  Conf.Pem_mame_dirs.Cursor := Arrow;
  Conf.panel_mame_page1.Cursor := Arrow;
  Conf.panel_mame_page2.Cursor := Arrow;
  Conf.grp95.Cursor := Arrow;
  Conf.sComboBox1.Cursor := Arrow;
  Conf.sBitBtn42.Cursor := Arrow;
  Conf.sEdit11.cursor := TArrow;
  Conf.sEdit5.cursor := TArrow;
  Conf.sEdit2.Cursor := TArrow;
  Conf.sEdit3.cursor := TArrow;
  Conf.sEdit4.cursor := TArrow;
  Conf.sEdit8.cursor := TArrow;
  Conf.sEdit6.cursor := TArrow;
  Conf.sEdit9.cursor := TArrow;
  Conf.sEdit10.cursor := TArrow;
  Conf.sEdit7.cursor := TArrow;
  Conf.sBitBtn17.Cursor := Arrow;
  Conf.sBitBtn18.Cursor := Arrow;
  Conf.sBitBtn19.Cursor := Arrow;
  Conf.sBitBtn20.Cursor := Arrow;
  Conf.sBitBtn21.Cursor := Arrow;
  Conf.sBitBtn22.Cursor := Arrow;
  Conf.sBitBtn23.Cursor := Arrow;
  Conf.sBitBtn24.Cursor := Arrow;
  Conf.sEdit11.Cursor := TArrow;
  Conf.sEdit5.Cursor := TArrow;
  Conf.sEdit58.Cursor := TArrow;
  Conf.sEdit59.Cursor := TArrow;
  Conf.sEdit60.Cursor := TArrow;
  Conf.sEdit61.Cursor := TArrow;
  Conf.sEdit62.Cursor := TArrow;
  Conf.sEdit63.Cursor := TArrow;
  Conf.sBitBtn27.Cursor := Arrow;
  Conf.sBitBtn28.Cursor := Arrow;
  Conf.sBitBtn29.Cursor := Arrow;
  Conf.sBitBtn30.Cursor := Arrow;
  Conf.sBitBtn31.Cursor := Arrow;
  Conf.sBitBtn32.Cursor := Arrow;
  Conf.sBitBtn33.Cursor := Arrow;
  Conf.sBitBtn34.Cursor := Arrow;
  Conf.sBitBtn25.Cursor := Arrow;
  Conf.sBitBtn26.Cursor := Arrow;
  Conf.sEdit64.Cursor := TArrow;
  Conf.sBitBtn35.Cursor := Arrow;
  Conf.sBitBtn36.Cursor := Arrow;
  Conf.sBitBtn37.Cursor := Arrow;
  Conf.sCheckBox127.Cursor := Arrow;
  Conf.sButton4.Cursor := Arrow;
  Conf.sButton22.Cursor := Arrow;
  //Panel Mame_Graphics
  Conf.Pem_mame_graphics.Cursor := Arrow;
  Conf.grp96.cursor := Arrow;
  Conf.sComboBox20.cursor := Arrow;
  Conf.sCheckBox40.cursor := Arrow;
  Conf.sCheckBox41.cursor := Arrow;
  Conf.grp97.cursor := Arrow;
  Conf.grp98.cursor := Arrow;
  Conf.sCheckBox7.cursor := Arrow;
  Conf.sComboBox3.cursor := Arrow;
  Conf.grp99.Cursor := Arrow;
  Conf.grp101.cursor := Arrow;
  Conf.sCheckBox4.cursor := Arrow;
  Conf.sCheckBox5.cursor := Arrow;
  Conf.sComboBox6.cursor := Arrow;
  Conf.sComboBox8.cursor := Arrow;
  Conf.sComboBox7.cursor := Arrow;
  Conf.sCheckBox9.cursor := Arrow;
  Conf.grp103.cursor := Arrow;
  Conf.sCheckBox11.cursor := Arrow;
  Conf.sCheckBox12.cursor := Arrow;
  Conf.sCheckBox13.cursor := Arrow;
  Conf.sCheckBox14.cursor := Arrow;
  Conf.grp104.cursor := Arrow;
  Conf.sCheckBox15.cursor := Arrow;
  Conf.sComboBox9.cursor := Arrow;
  Conf.sComboBox2.Cursor := Arrow;
  Conf.sCheckBox3.cursor := Arrow;
  Conf.sCheckBox6.cursor := Arrow;
  Conf.sComboBox4.cursor := Arrow;
  Conf.sComboBox5.cursor := Arrow;
  Conf.grp2.Cursor := Arrow;
  Conf.grp3.Cursor := Arrow;
  Conf.grp4.Cursor := Arrow;
  Conf.grp5.Cursor := Arrow;
  Conf.grp6.Cursor := Arrow;
  Conf.grp7.Cursor := Arrow;
  Conf.grp8.Cursor := Arrow;
  Conf.grp9.Cursor := Arrow;
  Conf.grp100.Cursor := Arrow;
  Conf.sCheckBox8.cursor := Arrow;
  Conf.sEdit1.Cursor := TArrow;
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
  Conf.sBitBtn38.Cursor := Arrow;
  Conf.sBitBtn39.Cursor := Arrow;
  Conf.sButton5.Cursor := Arrow;
  Conf.sButton1.Cursor := Arrow;
  //Panel Mame_Sound
  Conf.Pem_mame_sound.Cursor := Arrow;
  Conf.grp10.Cursor := Arrow;
  Conf.grp105.cursor := Arrow;
  Conf.sbar_mame_valumeattenuation.Cursor := Horizontal;
  Conf.sbar_mame_audiolatency.Cursor := Horizontal;
  Conf.sComboBox18.cursor := Arrow;
  Conf.sCheckBox43.cursor := Arrow;
  Conf.sCheckBox26.Cursor := Arrow;
  Conf.grp106.cursor := Arrow;
  Conf.grp107.cursor := Arrow;
  Conf.grp109.cursor := Arrow;
  Conf.sEdit15.Cursor := TArrow;
  Conf.grp108.cursor := Arrow;
  Conf.sComboBox10.cursor := Arrow;
  Conf.sComboBox11.cursor := Arrow;
  Conf.sComboBox12.cursor := Arrow;
  Conf.sComboBox13.cursor := Arrow;
  Conf.sComboBox14.cursor := Arrow;
  Conf.sComboBox15.cursor := Arrow;
  Conf.sComboBox16.cursor := Arrow;
  Conf.sComboBox17.cursor := Arrow;
  Conf.sbar_mame_joysdeadzone.Cursor := Horizontal;
  Conf.sbar_mame_joysaturation.Cursor := Horizontal;
  Conf.sBitBtn40.Cursor := Arrow;
  Conf.sBitBtn41.Cursor := Arrow;
  Conf.sCheckBox16.cursor := Arrow;
  Conf.sCheckBox17.cursor := Arrow;
  Conf.sCheckBox18.cursor := Arrow;
  Conf.sCheckBox19.cursor := Arrow;
  Conf.sCheckBox20.cursor := Arrow;
  Conf.sCheckBox21.cursor := Arrow;
  Conf.sCheckBox22.cursor := Arrow;
  Conf.sCheckBox23.cursor := Arrow;
  Conf.sButton6.Cursor := Arrow;
  Conf.sButton2.Cursor := Arrow;
  //Panel Mame_Others
  Conf.Pem_mame_others.Cursor := Arrow;
  Conf.grp15.Cursor := Arrow;
  Conf.grp16.Cursor := Arrow;
  Conf.grp110.cursor := Arrow;
  Conf.grp111.cursor := Arrow;
  Conf.grp102.Cursor := Arrow;
  Conf.grp112.cursor := Arrow;
  Conf.sComboBox73.Cursor := Arrow;
  Conf.sComboBox75.Cursor := Arrow;
  Conf.sComboBox19.cursor := Arrow;
  Conf.grp113.cursor := Arrow;
  Conf.sCheckBox35.cursor := Arrow;
  Conf.sCheckBox36.cursor := Arrow;
  Conf.sCheckBox37.cursor := Arrow;
  Conf.sCheckBox38.cursor := Arrow;
  Conf.grp114.cursor := Arrow;
  Conf.sCheckBox39.cursor := Arrow;
  Conf.sCheckBox24.cursor := Arrow;
  Conf.sCheckBox27.cursor := Arrow;
  Conf.sCheckBox28.cursor := Arrow;
  Conf.sCheckBox29.cursor := Arrow;
  Conf.sCheckBox30.cursor := Arrow;
  Conf.sCheckBox31.cursor := Arrow;
  Conf.sbar_mame_threadpriority.Cursor := Horizontal;
  Conf.sbar_mame_beamwidth.Cursor := Horizontal;
  Conf.sbar_mame_flicker.Cursor := Horizontal;
  Conf.sButton7.Cursor := Arrow;
  Conf.sButton3.Cursor := Arrow;
  //Panel Mame_Builds
  Conf.Pem_mame_builds.Cursor := Arrow;
  Conf.sBitBtn43.Cursor := Arrow;
  Conf.sBitBtn44.Cursor := Arrow;
  Conf.PBuilds_MameBuilds.Cursor := Arrow;
  Conf.PBuilds_MamePlus.Cursor := Arrow;
  Conf.sBitBtn45.Cursor := Arrow;
  Conf.sCheckBox32.Cursor := Arrow;
  Conf.sCheckBox10.Cursor := Arrow;
  Conf.sCheckBox33.Cursor := Arrow;
  Conf.sCheckBox34.Cursor := Arrow;
  Conf.sEdit12.Cursor := TArrow;
  Conf.sBitBtn1.Cursor := Arrow;
  Conf.sEdit13.Cursor := TArrow;
  Conf.sBitBtn98.Cursor := Arrow;
  Conf.nxtgrd_ips_mameplus.Cursor := Arrow;
  Conf.grp117.Cursor := Arrow;
  Conf.grp118.Cursor := Arrow;
  Conf.sbar_Mame_UITransparent_MamePlus.Cursor := Horizontal;
  Conf.PBuilds_MameXT.Cursor := Arrow;
  Conf.sBitBtn46.Cursor := Arrow;
  Conf.sCheckBox44.Cursor := Arrow;
  Conf.sCheckBox128.Cursor := Arrow;
  Conf.sCheckBox129.Cursor := Arrow;
  Conf.sCheckBox130.Cursor := Arrow;
  Conf.sEdit16.Cursor := TArrow;
  Conf.sEdit17.Cursor := TArrow;
  Conf.sBitBtn99.Cursor := Arrow;
  Conf.sBitBtn100.Cursor := Arrow;
  Conf.sBitBtn101.Cursor := Arrow;
  Conf.sbar_Mame_UITransparent_MameXT.Cursor := Horizontal;
  Conf.nxtgrd_ips_mamext.Cursor := Arrow;
  Conf.grp119.Cursor := Arrow;
  Conf.grp120.Cursor := Arrow;
  Conf.grp121.Cursor := Arrow;
  Conf.sComboBox76.Cursor := Arrow;
  Conf.PBuilds_MameTools.Cursor := Arrow;
  Conf.grp122.Cursor := Arrow;
  Conf.rb56.Cursor := Arrow;
  Conf.rb57.Cursor := Arrow;
  Conf.LMDFontComboBox1.Cursor := Arrow;
  Conf.sEdit125.Cursor := TArrow;
  Conf.sBitBtn103.Cursor := Arrow;
  Conf.LMDFontSizeComboBox1.Cursor := Arrow;
  Conf.sBitBtn104.Cursor := Arrow;
  Conf.img86.Cursor := Arrow;
  Conf.sButton8.Cursor := Arrow;
  Conf.sButton9.Cursor := Arrow;
  //Panel Mame_Database
  Conf.Pem_mame_database.Cursor := Arrow;
  Conf.grp115.Cursor := Arrow;
  Conf.nxtgrd_mame.Cursor := Arrow;
  Conf.sComboBox72.Cursor := Arrow;
  Conf.sWebLabel3.Cursor := Link;

  //{Zinc}
  //Panel Zinc_Paths
  Conf.Pem_zinc_paths.Cursor := Arrow;
  Conf.sEdit53.Cursor := TArrow;
  Conf.sEdit54.Cursor := TArrow;
  Conf.sEdit55.Cursor := TArrow;
  Conf.sBitBtn47.Cursor := Arrow;
  Conf.sBitBtn48.Cursor := Arrow;
  Conf.sBitBtn49.Cursor := Arrow;
  //Panel Zinc_Graphics
  Conf.Pem_zinc_graphics.Cursor := Arrow;
  Conf.grp1.Cursor := Arrow;
  Conf.grp19.Cursor := Arrow;
  for l := 21 to 29 do
    begin
      Comp := FindComponentEx('Conf.grp' + IntToStr(l));
      TGroupBox(Comp).Cursor := Arrow;
    end;
  for l := 3 to 6 do
    begin
      Comp := FindComponentEx('Conf.rb' + IntToStr(l));
      TRadioButton(Comp).Cursor := Arrow;
    end;
  Conf.rb9.Cursor := Arrow;
  Conf.rb10.Cursor := Arrow;
  for l := 26 to 37 do
    begin
      Comp := FindComponentEx('Conf.sComboBox' + IntToStr(l));
      TsComboBox(Comp).Cursor := Arrow;
    end;
  for l := 48 to 59 do
    begin
      Comp := FindComponentEx('Conf.sCheckBox' + IntToStr(l));
      TsCheckBox(Comp).Cursor := Arrow;
    end;
  Conf.sEdit65.Cursor := TArrow;
  Conf.sEdit66.Cursor := TArrow;

  //Panel Zinc_Sound
  Conf.Pem_zinc_sound.Cursor := Arrow;
  for l := 79 to 85 do
    begin
      Comp := FindComponentEx('Conf.sCheckBox' + IntToStr(l));
      TsCheckBox(Comp).Cursor := Arrow;
    end;
  Conf.sEdit74.Cursor := TArrow;
  Conf.sEdit75.Cursor := TArrow;

  //{Hatari}
  //Panel Hatari_System
  Conf.Pem_hatari_system.Cursor := Arrow;
  for l := 36 to 42 do
    begin
      Comp := FindComponentEx('Conf.grp' + IntToStr(l));
      TGroupBox(Comp).Cursor := Arrow;
    end;
  for l := 45 to 48 do
    begin
      Comp := FindComponentEx('Conf.grp' + IntToStr(l));
      TGroupBox(Comp).Cursor := Arrow;
    end;
  Conf.sCheckBox92.Cursor := Arrow;
  Conf.sCheckBox93.Cursor := Arrow;
  Conf.sCheckBox94.Cursor := Arrow;
  for l := 13 to 27 do
    begin
      Comp := FindComponentEx('Conf.rb' + IntToStr(l));
      TRadioButton(Comp).Cursor := Arrow;
    end;
  for l := 86 to 89 do
    begin
      Comp := FindComponentEx('Conf.sCheckBox' + IntToStr(l));
      TsCheckBox(Comp).Cursor := Arrow;
    end;
  Conf.sCheckBox91.Cursor := Arrow;
  Conf.sComboBox43.Cursor := Arrow;
  Conf.sComboBox45.Cursor := Arrow;

  //Panel Hatari_Roms
  Conf.Pem_hatari_roms.Cursor := Arrow;
  Conf.grp43.Cursor := Arrow;
  Conf.grp44.Cursor := Arrow;
  Conf.grp49.Cursor := Arrow;
  for l := 60 to 70 do
    begin
      Comp := FindComponentEx('Conf.sBitBtn' + IntToStr(l));
      TsBitBtn(Comp).Cursor := Arrow;
    end;
  Conf.sComboBox44.Cursor := Arrow;
  Conf.sComboBox46.Cursor := Arrow;
  Conf.sCheckBox90.Cursor := Arrow;
  Conf.sCheckBox95.Cursor := Arrow;

  //Panel Hatari_Screen
  Conf.Pem_hatari_screen.Cursor := Arrow;
  for l := 50 to 58 do
    begin
      Comp := FindComponentEx('Conf.grp' + IntToStr(l));
      TGroupBox(Comp).Cursor := Arrow;
    end;
  for l := 96 to 100 do
    begin
      Comp := FindComponentEx('Conf.sCheckBox' + IntToStr(l));
      TsCheckBox(Comp).Cursor := Arrow;
    end;
  for l := 47 to 54 do
    begin
      Comp := FindComponentEx('Conf.sComboBox' + IntToStr(l));
      TsComboBox(Comp).Cursor := Arrow;
    end;
  Conf.sBitBtn71.Cursor := Arrow;
  Conf.sBitBtn72.Cursor := Arrow;
  Conf.sBitBtn73.Cursor := Arrow;
  //Panel Hatari_Joy
  Conf.Pem_hatari_joy.Cursor := Arrow;
  Conf.grp59.Cursor := Arrow;
  Conf.grp60.Cursor := Arrow;
  Conf.grp61.Cursor := Arrow;
  Conf.sComboBox55.Cursor := Arrow;
  Conf.sComboBox56.Cursor := Arrow;
  Conf.sComboBox57.Cursor := Arrow;
  Conf.rb28.Cursor := Arrow;
  Conf.rb29.Cursor := Arrow;
  Conf.rb30.Cursor := Arrow;
  for l := 37 to 41 do
    begin
      Comp := FindComponentEx('Conf.sPanel' + IntToStr(l));
      TsPanel(Comp).Cursor := Precision;
    end;
  Conf.sBitBtn75.Cursor := Arrow;
  Conf.sCheckBox101.Cursor := Arrow;
  Conf.sCheckBox102.Cursor := Arrow;

  //{pSX Emulator}
  //Panel pSX_Paths
  Conf.Pem_psx_paths.Cursor := Arrow;
  Conf.grp62.Cursor := Arrow;
  Conf.grp63.Cursor := Arrow;
  for l := 81 to 88 do
    begin
      Comp := FindComponentEx('Conf.sEdit' + IntToStr(l));
      TsEdit(Comp).Cursor := TArrow;
    end;
  for l := 76 to 85 do
    begin
      Comp := FindComponentEx('Conf.sBitBtn' + IntToStr(l));
      TsBitBtn(Comp).Cursor := Arrow;
    end;
  Conf.sWebLabel1.cursor := Link;
  Conf.sWebLabel2.cursor := Link;
  //Panel pSX_Screen
  Conf.Pem_psx_screen.Cursor := Arrow;
  Conf.grp64.Cursor := Arrow;
  Conf.grp65.Cursor := Arrow;
  Conf.grp66.Cursor := Arrow;
  for l := 103 to 109 do
    begin
      Comp := FindComponentEx('Conf.sCheckBox' + IntToStr(l));
      TsCheckBox(Comp).Cursor := Arrow;
    end;
  Conf.sBitBtn86.Cursor := Arrow;
  Conf.sComboBox58.Cursor := Arrow;
  Conf.sComboBox59.Cursor := Arrow;
  Conf.sComboBox60.Cursor := Arrow;
  Conf.sComboBox61.Cursor := Arrow;
  Conf.sbar_psx_gamma.Cursor := Horizontal;
  Conf.sbar_psx_brightness.Cursor := Horizontal;
  Conf.sbar_psx_contrast.Cursor := Horizontal;
  //Panel pSX_Sound
  Conf.Pem_psx_sound.Cursor := Arrow;
  Conf.grp11.Cursor := Arrow;
  Conf.grp12.Cursor := Arrow;
  Conf.grp67.Cursor := Arrow;
  Conf.grp68.Cursor := Arrow;
  Conf.sComboBox63.Cursor := Arrow;
  Conf.sComboBox64.Cursor := Arrow;
  Conf.sComboBox62.Cursor := Arrow;
  Conf.sComboBox21.Cursor := Arrow;
  Conf.sComboBox22.Cursor := Arrow;
  Conf.sCheckBox25.Cursor := Arrow;
  Conf.sCheckBox46.Cursor := Arrow;
  Conf.sCheckBox42.Cursor := Arrow;
  Conf.sCheckBox45.Cursor := Arrow;
  Conf.sCheckBox47.Cursor := Arrow;
  Conf.sPanel.Cursor := Precision;
  for l := 2 to 20 do
    begin
      Comp := FindComponentEx('Conf.sPanel' + IntToStr(l));
      TsPanel(Comp).Cursor := Precision;
    end;
  Conf.sbar_psx_latency.Cursor := Horizontal;
  Conf.sbar_psx_xalatency.Cursor := Horizontal;
  //Panel pSX_Others
  Conf.Pem_psx_others.Cursor := Arrow;
  Conf.grp13.Cursor := Arrow;
  Conf.grp14.Cursor := Arrow;
  Conf.sComboBox23.Cursor := Arrow;
  Conf.sComboBox24.Cursor := Arrow;
  Conf.sComboBox25.Cursor := Arrow;
  Conf.sComboBox65.Cursor := Arrow;
  for l := 21 to 36 do
    begin
      Comp := FindComponentEx('Conf.sPanel' + IntToStr(l));
      TsPanel(Comp).Cursor := Precision;
    end;

  //{Kigb}
  //Panel Kigb_Paths
  Conf.Pem_kigb_paths.Cursor := Arrow;
  for l := 69 to 77 do
    begin
      Comp := FindComponentEx('Conf.grp' + IntToStr(l));
      TGroupBox(Comp).Cursor := Arrow;
    end;
  for l := 89 to 97 do
    begin
      Comp := FindComponentEx('Conf.sEdit' + IntToStr(l));
      TsEdit(Comp).Cursor := TArrow;
    end;
  for l := 87 to 95 do
    begin
      Comp := FindComponentEx('Conf.sBitBtn' + IntToStr(l));
      TsBitBtn(Comp).Cursor := Arrow;
    end;
  for l := 110 to 115 do
    begin
      Comp := FindComponentEx('Conf.sCheckBox' + IntToStr(l));
      TsCheckBox(Comp).Cursor := Arrow;
    end;
  Conf.sComboBox66.Cursor := Arrow;
  Conf.rb1.Cursor := Arrow;
  Conf.rb2.Cursor := Arrow;
  Conf.sCheckBox63.Cursor := Arrow;
  Conf.sCheckBox64.Cursor := Arrow;
  for l := 31 to 33 do
    begin
      Comp := FindComponentEx('Conf.rb' + IntToStr(l));
      TRadioButton(Comp).Cursor := Arrow;
    end;
  //Panel Kigb_Screen
  Conf.Pem_kigb_screen.Cursor := Arrow;
  for l := 78 to 82 do
    begin
      Comp := FindComponentEx('Conf.grp' + IntToStr(l));
      TGroupBox(Comp).Cursor := Arrow;
    end;
  for l := 39 to 53 do
    begin
      Comp := FindComponentEx('Conf.rb' + IntToStr(l));
      TRadioButton(Comp).Cursor := Arrow;
    end;
  for l := 116 to 120 do
    begin
      Comp := FindComponentEx('Conf.sCheckBox' + IntToStr(l));
      TsCheckBox(Comp).Cursor := Arrow;
    end;
  for l := 1 to 4 do
    begin
      Comp := FindComponentEx('Conf.pnl' + IntToStr(l));
      TPanel(Comp).Cursor := Precision;
    end;
  //Panel Kigb_Sound
  Conf.Pem_kigb_sound.Cursor := Arrow;
  for l := 83 to 94 do
    begin
      Comp := FindComponentEx('Conf.grp' + IntToStr(l));
      TGroupBox(Comp).Cursor := Arrow;
    end;
  Conf.rb54.Cursor := Arrow;
  Conf.rb55.Cursor := Arrow;
  for l := 67 to 71 do
    begin
      Comp := FindComponentEx('Conf.sComboBox' + IntToStr(l));
      TsComboBox(Comp).Cursor := Arrow;
    end;
  for l := 121 to 126 do
    begin
      Comp := FindComponentEx('Conf.sCheckBox' + IntToStr(l));
      TsCheckBox(Comp).Cursor := Arrow;
    end;
  for l := 42 to 68 do
    begin
      Comp := FindComponentEx('Conf.sPanel' + IntToStr(l));
      TsPanel(Comp).Cursor := Precision;
    end;
  Conf.sbar_kigb_soundvolume.Cursor := Horizontal;
  Conf.sbar_kigb_soundpan.Cursor := Horizontal;
  //Panel Kigb_Others
  Conf.Pem_kigb_others.Cursor := Arrow;
  Conf.sBitBtn96.Cursor := Arrow;
  Conf.sBitBtn97.Cursor := Arrow;
  for l := 36 to 38 do
    begin
      Comp := FindComponentEx('Conf.rb' + IntToStr(l));
      TRadioButton(Comp).Cursor := Arrow;
    end;
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
  comp : TComponent;
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
  STBarInfo1 := 'Version : '+ GetVersion(ExtraFePath+'confeditor.exe');
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
      STBarInfo1 := 'Version : '+GetVersion(ExtraFePath+'confeditor.exe');
    end
  else
    begin
      CeXML.Ver := GetNodeAttrStr(nodeCe,'Ver');
      STBarInfo1 := 'Version : '+GetNodeAttrStr(nodeCe,'Ver');
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
  global_FindJoyInfo;
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
      ShowMameProgress(20,'Mame Directories Ready');
      SetMame_GraphicsFromMameIni;
      ShowMameProgress(35,'Mame Graphics Ready');
      SetMame_SoundFromMameIni;
      ShowMameProgress(50,'Mame Sound Ready');
      SetMame_OthersFromMameIni;
      ShowMameProgress(65,'Mame Others Ready');
      SetMame_BuildsFromMameIni;
      ShowMameProgress(80,'Mame Builds Ready');
      SetMame_DatabaseFromMameIni;
      ShowMameProgress(100,'Mame Database Ready');
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
      ShowZincProgress(20,'Zinc Files Ready');
      SetZinc_PathsFromZincIni;
      ShowZincProgress(40,'Zinc Paths Ready');
      SetZinc_GraphicsFromZincIni;
      ShowZincProgress(60,'Zinc Graphics Ready');
      SetZinc_SoundFromZincIni;
      ShowZincProgress(80,'Zinc Sound Ready');
      SetZinc_DatabaseFromZincIni;
      ShowZincProgress(100,'Zinc Database Ready');
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
      ShowHatariProgress(10,'Hatari Paths Ready');
      SetHatari_SystemfromHatariIni;
      ShowHatariProgress(25,'Hatari System Ready');
      SetHatari_RomsfromHatariIni;
      ShowHatariProgress(40,'Hatari Roms Ready');
      SetHatari_ScreenfromHatariIni;
      ShowHatariProgress(55,'Hatari Screen/Sound Ready');
      SetHatari_JoyfromHatariIni;
      ShowHatariProgress(70,'Hatari Joystics/Keyboard Ready');
      SetHatari_DatabaseFromHatariIni;
      ShowHatariProgress(100,'Hatari Database Ready');
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
          ShowpSXProgress(20,'pSX Paths Ready');
          SetpSX_ScreenfrompSXIni;
          ShowpSXProgress(40,'pSX Screen Ready');
          SetpSX_SoundfrompSXIni;
          ShowpSXProgress(60,'pSX Sound and Controllers Ready');
          SetpSX_OthersfrompSXIni;
          ShowpSXProgress(80,'pSX Others Ready');
//          SetpSX_DatabasefrompSXIni;
          ShowpSXProgress(100,'pSX Database Ready');
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
      ShowKigbProgress(20,'Kigb Paths Ready');
      SetKigb_ScreenfromKigbIni;
      ShowKigbProgress(40,'Kigb Screen Ready');
      SetKigb_SoundfromKigbIni;
      ShowKigbProgress(60,'Kigb Sound and Controllers Ready');
      SetKigb_OthersfromKigbIni;
      ShowKigbProgress(80,'Kigb Others Ready');
      SetKigb_DatabasefromKigbIni;
      ShowKigbProgress(100,'Kigb Database Ready');
      Started := False;
    end;
end;

procedure StartWidget_Weather;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'media\widgets\weather\weather.ini') then
    begin
      Started := True;
      WeatherIni := TIniFile.Create(Extractfilepath(Application.ExeName) + 'media\widgets\weather\weather.ini');
      SetWeather_FromWeatherIni;
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
  conf.stat1.Panels[0].Text := STBarInfo1;
  if IsWindows64 = true then
    STBarInfo2 := 'Windows 64 Bit'
  else
    STBarInfo2 := 'Windows 32 Bit';
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

procedure ShowMameProgress(progress: Integer; Comment: string);
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
end;

procedure ShowZincProgress(progress: Integer; Comment: string);
begin
  Splash_Screen.Progress_Label(progress,Comment);
  Application.ProcessMessages;
  Sleep(50);
end;

procedure ShowHatariProgress(progress: Integer; Comment: string);
begin
  Splash_Screen.Progress_Label(progress,Comment);
  Application.ProcessMessages;
  Sleep(50);
end;

procedure ShowpSXProgress(progress: Integer; Comment: string);
begin
  Splash_Screen.Progress_Label(progress,Comment);
  Application.ProcessMessages;
  Sleep(50);
end;

procedure ShowKigbProgress(progress: Integer; Comment: string);
begin
  Splash_Screen.Progress_Label(progress,Comment);
  Application.ProcessMessages;
  Sleep(50);
end;

end.


