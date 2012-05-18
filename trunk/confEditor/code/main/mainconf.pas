unit mainconf;

interface
uses
  Windows,Variants,Classes,SysUtils,Forms,StdCtrls,ComCtrls,IniFiles,ExtCtrls,
  Graphics,FunctionX,
  main,
  form_splash,
  menu,
  ce_themes,ce_config,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_builds,mame_database,
  zinc_paths,zinc_graphics,zinc_sound,zinc_database,
  hatari_paths,hatari_system,hatari_roms,hatari_screen,hatari_joy,hatari_database,
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
  procedure StartEmuKigb;
  procedure StartProgWeather;
  procedure StartProTimeDate;
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
//Kigb Vars
//Weather Vars
//TimeDate Vars

implementation

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
          Conf.mmo2.Color := $00e4eaed;
          Conf.PBuilds_MamePlus.Color := $00e4eaed;
          Conf.PBuilds_MameXT.Color := $00e4eaed;
        end;
    1 : begin
          for k := 1 to 122 do
            begin
              component := FindComponentEx('Conf.grp'+inttostr(k));
              TGroupBox(component).Color := $00bae5e8;
            end;
          Conf.mmo2.Color := $00bae5e8;
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
          Conf.mmo2.Color := $00e7e7e7;
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
  Conf.sLabelFX10.Cursor := Arrow;
  Conf.mmo2.Cursor := TArrow;

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
  Conf.grp25.Cursor := Arrow;
  Conf.grp21.Cursor := Arrow;
  Conf.grp22.Cursor := Arrow;
  Conf.grp23.Cursor := Arrow;
  Conf.grp24.Cursor := Arrow;
  Conf.grp26.Cursor := Arrow;
  Conf.grp27.Cursor := Arrow;
  Conf.grp28.Cursor := Arrow;
  Conf.grp29.Cursor := Arrow;
  Conf.rb3.Cursor := Arrow;
  Conf.rb4.Cursor := Arrow;
  Conf.rb5.Cursor := Arrow;
  Conf.rb6.Cursor := Arrow;
  Conf.rb9.Cursor := Arrow;
  Conf.rb10.Cursor := Arrow;
  Conf.sComboBox26.Cursor := Arrow;
  Conf.sComboBox27.Cursor := Arrow;
  Conf.sComboBox28.Cursor := Arrow;
  Conf.sComboBox29.Cursor := Arrow;
  Conf.sComboBox30.Cursor := Arrow;
  Conf.sComboBox31.Cursor := Arrow;
  Conf.sComboBox32.Cursor := Arrow;
  Conf.sComboBox33.Cursor := Arrow;
  Conf.sComboBox34.Cursor := Arrow;
  Conf.sComboBox35.Cursor := Arrow;
  Conf.sComboBox36.Cursor := Arrow;
  Conf.sComboBox37.Cursor := Arrow;
  Conf.sCheckBox48.Cursor := Arrow;
  Conf.sCheckBox49.Cursor := Arrow;
  Conf.sCheckBox50.Cursor := Arrow;
  Conf.sCheckBox51.Cursor := Arrow;
  Conf.sCheckBox52.Cursor := Arrow;
  Conf.sCheckBox53.Cursor := Arrow;
  Conf.sCheckBox54.Cursor := Arrow;
  Conf.sCheckBox55.Cursor := Arrow;
  Conf.sCheckBox56.Cursor := Arrow;
  Conf.sCheckBox57.Cursor := Arrow;
  Conf.sCheckBox58.Cursor := Arrow;
  Conf.sCheckBox59.Cursor := Arrow;
  Conf.sEdit65.Cursor := TArrow;
  Conf.sEdit66.Cursor := TArrow;

  //Panel Zinc_Sound
  Conf.Pem_zinc_sound.Cursor := Arrow;
  Conf.sCheckBox79.Cursor := Arrow;
  Conf.sCheckBox80.Cursor := Arrow;
  Conf.sCheckBox81.Cursor := Arrow;
  Conf.sCheckBox82.Cursor := Arrow;
  Conf.sCheckBox83.Cursor := Arrow;
  Conf.sCheckBox84.Cursor := Arrow;
  Conf.sCheckBox85.Cursor := Arrow;
  Conf.sEdit74.Cursor := TArrow;
  Conf.sEdit75.Cursor := TArrow;

  //{Hatari}
  //Panel Hatari_System
  Conf.Pem_hatari_system.Cursor := Arrow;
  Conf.grp36.Cursor := Arrow;
  Conf.grp37.Cursor := Arrow;
  Conf.grp38.Cursor := Arrow;
  Conf.grp39.Cursor := Arrow;
  Conf.grp40.Cursor := Arrow;
  Conf.grp41.Cursor := Arrow;
  Conf.grp42.Cursor := Arrow;
  Conf.grp45.Cursor := Arrow;
  Conf.grp46.Cursor := Arrow;
  Conf.grp47.Cursor := Arrow;
  Conf.grp48.Cursor := Arrow;
  Conf.sCheckBox92.Cursor := Arrow;
  Conf.sCheckBox93.Cursor := Arrow;
  Conf.sCheckBox94.Cursor := Arrow;
  Conf.rb13.Cursor := Arrow;
  Conf.rb14.Cursor := Arrow;
  Conf.rb15.Cursor := Arrow;
  Conf.rb16.Cursor := Arrow;
  Conf.rb17.Cursor := Arrow;
  Conf.rb18.Cursor := Arrow;
  Conf.rb19.Cursor := Arrow;
  Conf.rb20.Cursor := Arrow;
  Conf.rb21.Cursor := Arrow;
  Conf.rb22.Cursor := Arrow;
  Conf.rb23.Cursor := Arrow;
  Conf.rb24.Cursor := Arrow;
  Conf.rb25.Cursor := Arrow;
  Conf.rb26.Cursor := Arrow;
  Conf.rb27.Cursor := Arrow;
  Conf.sCheckBox86.Cursor := Arrow;
  Conf.sCheckBox87.Cursor := Arrow;
  Conf.sCheckBox88.Cursor := Arrow;
  Conf.sCheckBox89.Cursor := Arrow;
  Conf.sCheckBox91.Cursor := Arrow;
  Conf.sComboBox43.Cursor := Arrow;
  Conf.sComboBox45.Cursor := Arrow;

  //Panel Hatari_Roms
  Conf.Pem_hatari_roms.Cursor := Arrow;
  Conf.grp43.Cursor := Arrow;
  Conf.grp44.Cursor := Arrow;
  Conf.grp49.Cursor := Arrow;
  Conf.sBitBtn60.Cursor := Arrow;
  Conf.sBitBtn61.Cursor := Arrow;
  Conf.sBitBtn62.Cursor := Arrow;
  Conf.sBitBtn63.Cursor := Arrow;
  Conf.sBitBtn64.Cursor := Arrow;
  Conf.sBitBtn65.Cursor := Arrow;
  Conf.sBitBtn66.Cursor := Arrow;
  Conf.sBitBtn67.Cursor := Arrow;
  Conf.sBitBtn68.Cursor := Arrow;
  Conf.sBitBtn69.Cursor := Arrow;
  Conf.sBitBtn70.Cursor := Arrow;
  Conf.sComboBox44.Cursor := Arrow;
  Conf.sComboBox46.Cursor := Arrow;
  Conf.sCheckBox90.Cursor := Arrow;
  Conf.sCheckBox95.Cursor := Arrow;

  //Panel Hatari_Screen
  Conf.Pem_hatari_screen.Cursor := Arrow;
  Conf.grp50.Cursor := Arrow;
  Conf.grp51.Cursor := Arrow;
  Conf.grp52.Cursor := Arrow;
  Conf.grp53.Cursor := Arrow;
  Conf.grp54.Cursor := Arrow;
  Conf.grp55.Cursor := Arrow;
  Conf.grp56.Cursor := Arrow;
  Conf.grp57.Cursor := Arrow;
  Conf.grp58.Cursor := Arrow;
  Conf.sCheckBox96.Cursor := Arrow;
  Conf.sCheckBox97.Cursor := Arrow;
  Conf.sCheckBox98.Cursor := Arrow;
  Conf.sCheckBox99.Cursor := Arrow;
  Conf.sCheckBox100.Cursor := Arrow;
  Conf.sComboBox47.Cursor := Arrow;
  Conf.sComboBox48.Cursor := Arrow;
  Conf.sComboBox49.Cursor := Arrow;
  Conf.sComboBox50.Cursor := Arrow;
  Conf.sComboBox51.Cursor := Arrow;
  Conf.sComboBox52.Cursor := Arrow;
  Conf.sComboBox53.Cursor := Arrow;
  Conf.sComboBox54.Cursor := Arrow;
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
  Conf.sBitBtn75.Cursor := Arrow;
  Conf.sCheckBox101.Cursor := Arrow;
  Conf.sCheckBox102.Cursor := Arrow;

  //{pSX Emulator}
  //Panel pSX_Paths
  Conf.Pem_psx_paths.Cursor := Arrow;
  Conf.grp62.Cursor := Arrow;
  Conf.grp63.Cursor := Arrow;
  Conf.sEdit81.Cursor := TArrow;
  Conf.sEdit82.Cursor := TArrow;
  Conf.sEdit83.Cursor := TArrow;
  Conf.sEdit84.Cursor := TArrow;
  Conf.sEdit85.Cursor := TArrow;
  Conf.sEdit86.Cursor := TArrow;
  Conf.sEdit87.Cursor := TArrow;
  Conf.sEdit88.Cursor := TArrow;
  Conf.sBitBtn76.Cursor := Arrow;
  Conf.sBitBtn77.Cursor := Arrow;
  Conf.sBitBtn78.Cursor := Arrow;
  Conf.sBitBtn79.Cursor := Arrow;
  Conf.sBitBtn80.Cursor := Arrow;
  Conf.sBitBtn81.Cursor := Arrow;
  Conf.sBitBtn82.Cursor := Arrow;
  Conf.sBitBtn83.Cursor := Arrow;
  Conf.sBitBtn84.Cursor := Arrow;
  Conf.sBitBtn85.Cursor := Arrow;
  Conf.sWebLabel1.cursor := Link;
  Conf.sWebLabel2.cursor := Link;
  //Panel pSX_Screen
  Conf.Pem_psx_screen.Cursor := Arrow;
  Conf.grp64.Cursor := Arrow;
  Conf.grp65.Cursor := Arrow;
  Conf.grp66.Cursor := Arrow;
  Conf.sCheckBox103.Cursor := Arrow;
  Conf.sCheckBox104.Cursor := Arrow;
  Conf.sCheckBox105.Cursor := Arrow;
  Conf.sCheckBox106.Cursor := Arrow;
  Conf.sCheckBox107.Cursor := Arrow;
  Conf.sCheckBox108.Cursor := Arrow;
  Conf.sCheckBox109.Cursor := Arrow;
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
  Conf.sPanel2.Cursor := Precision;
  Conf.sPanel3.Cursor := Precision;
  Conf.sPanel4.Cursor := Precision;
  Conf.sPanel5.Cursor := Precision;
  Conf.sPanel6.Cursor := Precision;
  Conf.sPanel7.Cursor := Precision;
  Conf.sPanel8.Cursor := Precision;
  Conf.sPanel9.Cursor := Precision;
  Conf.sPanel10.Cursor := Precision;
  Conf.sPanel11.Cursor := Precision;
  Conf.sPanel12.Cursor := Precision;
  Conf.sPanel13.Cursor := Precision;
  Conf.sPanel14.Cursor := Precision;
  Conf.sPanel15.Cursor := Precision;
  Conf.sPanel16.Cursor := Precision;
  Conf.sPanel17.Cursor := Precision;
  Conf.sPanel18.Cursor := Precision;
  Conf.sPanel19.Cursor := Precision;
  Conf.sPanel20.Cursor := Precision;
  Conf.img85.Cursor := Arrow;
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
  Conf.sPanel21.Cursor := Precision;
  Conf.sPanel22.Cursor := Precision;
  Conf.sPanel23.Cursor := Precision;
  Conf.sPanel24.Cursor := Precision;
  Conf.sPanel25.Cursor := Precision;
  Conf.sPanel26.Cursor := Precision;
  Conf.sPanel27.Cursor := Precision;
  Conf.sPanel28.Cursor := Precision;
  Conf.sPanel29.Cursor := Precision;
  Conf.sPanel30.Cursor := Precision;
  Conf.sPanel31.Cursor := Precision;
  Conf.sPanel32.Cursor := Precision;
  Conf.sPanel33.Cursor := Precision;
  Conf.sPanel34.Cursor := Precision;
  Conf.sPanel35.Cursor := Precision;
  Conf.sPanel36.Cursor := Precision;

  //{Kigb}
  //Panel Kigb_Paths
  Conf.Pem_kigb_paths.Cursor := Arrow;
  Conf.grp69.Cursor := Arrow;
  Conf.grp70.Cursor := Arrow;
  Conf.grp71.Cursor := Arrow;
  Conf.grp72.Cursor := Arrow;
  Conf.grp73.Cursor := Arrow;
  Conf.grp74.Cursor := Arrow;
  Conf.grp75.Cursor := Arrow;
  Conf.grp76.Cursor := Arrow;
  Conf.grp77.Cursor := Arrow;
  Conf.sEdit89.Cursor := TArrow;
  Conf.sEdit90.Cursor := TArrow;
  Conf.sEdit91.Cursor := TArrow;
  Conf.sEdit92.Cursor := TArrow;
  Conf.sEdit93.Cursor := TArrow;
  Conf.sEdit94.Cursor := TArrow;
  Conf.sEdit95.Cursor := TArrow;
  Conf.sEdit96.Cursor := TArrow;
  Conf.sEdit97.Cursor := TArrow;
  Conf.sBitBtn87.Cursor := Arrow;
  Conf.sBitBtn88.Cursor := Arrow;
  Conf.sBitBtn89.Cursor := Arrow;
  Conf.sBitBtn90.Cursor := Arrow;
  Conf.sBitBtn91.Cursor := Arrow;
  Conf.sBitBtn92.Cursor := Arrow;
  Conf.sBitBtn93.Cursor := Arrow;
  Conf.sBitBtn94.Cursor := Arrow;
  Conf.sBitBtn95.Cursor := Arrow;
  Conf.sCheckBox110.Cursor := Arrow;
  Conf.sCheckBox111.Cursor := Arrow;
  Conf.sCheckBox112.Cursor := Arrow;
  Conf.sCheckBox113.Cursor := Arrow;
  Conf.sCheckBox114.Cursor := Arrow;
  Conf.sCheckBox115.Cursor := Arrow;
  Conf.sComboBox66.Cursor := Arrow;
  Conf.rb1.Cursor := Arrow;
  Conf.rb2.Cursor := Arrow;
  Conf.rb31.Cursor := Arrow;
  Conf.rb32.Cursor := Arrow;
  Conf.rb33.Cursor := Arrow;
  Conf.rb34.Cursor := Arrow;
  Conf.rb35.Cursor := Arrow;
  Conf.rb36.Cursor := Arrow;
  Conf.rb37.Cursor := Arrow;
  Conf.rb38.Cursor := Arrow;
  //Panel Kigb_Screen
  Conf.Pem_kigb_screen.Cursor := Arrow;
  Conf.grp78.Cursor := Arrow;
  Conf.grp79.Cursor := Arrow;
  Conf.grp80.Cursor := Arrow;
  Conf.grp81.Cursor := Arrow;
  Conf.grp82.Cursor := Arrow;
  Conf.rb39.Cursor := Arrow;
  Conf.rb40.Cursor := Arrow;
  Conf.rb41.Cursor := Arrow;
  Conf.rb42.Cursor := Arrow;
  Conf.rb43.Cursor := Arrow;
  Conf.rb44.Cursor := Arrow;
  Conf.rb45.Cursor := Arrow;
  Conf.rb46.Cursor := Arrow;
  Conf.rb47.Cursor := Arrow;
  Conf.rb48.Cursor := Arrow;
  Conf.rb49.Cursor := Arrow;
  Conf.rb50.Cursor := Arrow;
  Conf.rb51.Cursor := Arrow;
  Conf.rb52.Cursor := Arrow;
  Conf.rb53.Cursor := Arrow;
  Conf.sCheckBox116.Cursor := Arrow;
  Conf.sCheckBox117.Cursor := Arrow;
  Conf.sCheckBox118.Cursor := Arrow;
  Conf.sCheckBox119.Cursor := Arrow;
  Conf.sCheckBox120.Cursor := Arrow;
  Conf.pnl1.Cursor := Precision;
  Conf.pnl2.Cursor := Precision;
  Conf.pnl3.Cursor := Precision;
  Conf.pnl4.Cursor := Precision;
  //Panel Kigb_Sound
  Conf.Pem_kigb_sound.Cursor := Arrow;
  Conf.grp83.Cursor := Arrow;
  Conf.grp84.Cursor := Arrow;
  Conf.grp85.Cursor := Arrow;
  Conf.grp86.Cursor := Arrow;
  Conf.grp87.Cursor := Arrow;
  Conf.grp88.Cursor := Arrow;
  Conf.grp89.Cursor := Arrow;
  Conf.grp90.Cursor := Arrow;
  Conf.grp91.Cursor := Arrow;
  Conf.grp92.Cursor := Arrow;
  Conf.grp93.Cursor := Arrow;
  Conf.grp94.Cursor := Arrow;
  Conf.rb54.Cursor := Arrow;
  Conf.rb55.Cursor := Arrow;
  Conf.sComboBox67.Cursor := Arrow;
  Conf.sComboBox68.Cursor := Arrow;
  Conf.sComboBox69.Cursor := Arrow;
  Conf.sComboBox70.Cursor := Arrow;
  Conf.sComboBox71.Cursor := Arrow;
  Conf.sCheckBox121.Cursor := Arrow;
  Conf.sCheckBox122.Cursor := Arrow;
  Conf.sCheckBox123.Cursor := Arrow;
  Conf.sCheckBox124.Cursor := Arrow;
  Conf.sCheckBox125.Cursor := Arrow;
  Conf.sCheckBox126.Cursor := Arrow;
  Conf.sbar_kigb_soundvolume.Cursor := Horizontal;
  Conf.sbar_kigb_soundpan.Cursor := Horizontal;
  Conf.sEdit98.Cursor := Precision;
  Conf.sEdit99.Cursor := Precision;
  Conf.sEdit100.Cursor := Precision;
  Conf.sEdit101.Cursor := Precision;
  Conf.sEdit102.Cursor := Precision;
  Conf.sEdit103.Cursor := Precision;
  Conf.sEdit104.Cursor := Precision;
  Conf.sEdit105.Cursor := Precision;
  Conf.sEdit106.Cursor := Precision;
  Conf.sEdit107.Cursor := Precision;
  Conf.sEdit108.Cursor := Precision;
  Conf.sEdit109.Cursor := Precision;
  Conf.sEdit110.Cursor := Precision;
  Conf.sEdit111.Cursor := Precision;
  Conf.sEdit112.Cursor := Precision;
  Conf.sEdit113.Cursor := Precision;
  Conf.sEdit114.Cursor := Precision;
  Conf.sEdit115.Cursor := Precision;
  Conf.sEdit116.Cursor := Precision;
  Conf.sEdit117.Cursor := Precision;
  Conf.sEdit118.Cursor := Precision;
  Conf.sEdit119.Cursor := Precision;
  Conf.sEdit120.Cursor := Precision;
  Conf.sEdit121.Cursor := Precision;
  Conf.sEdit122.Cursor := Precision;
  Conf.sEdit123.Cursor := Precision;
  Conf.sEdit124.Cursor := Precision;
  Conf.sBitBtn96.Cursor := Arrow;
  Conf.sBitBtn97.Cursor := Arrow;
  //Panel Kigb_Others
  Conf.Pem_kigb_others.Cursor := Arrow;
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
begin
  Conf.Pce_themes.Left := 727;
  Conf.Pce_config.Left := 727;
  Conf.Pce_wizard.Left := 727;
  Conf.Pem_mame_dirs.Left := 727;
  Conf.Pem_mame_graphics.Left := 727;
  Conf.Pem_mame_sound.Left := 727;
  Conf.Pem_mame_others.Left := 727;
  Conf.Pem_mame_builds.Left := 727;
  Conf.Pem_mame_database.Left := 727;
  Conf.Pwg_weather.Left := 727;
  Conf.Pwg_timedate.Left := 727;
  Conf.Pexf_configuration.Left := 727;
  Conf.Pexf_themes.Left := 727;
  Conf.Pem_zinc_paths.Left := 727;
  Conf.Pem_zinc_graphics.Left := 727;
  Conf.Pem_zinc_sound.Left := 727;
  Conf.Pem_zinc_database.Left := 727;
  Conf.Pem_hatari_paths.Left := 727;
  Conf.Pem_hatari_system.Left := 727;
  Conf.Pem_hatari_roms.Left := 727;
  Conf.Pem_hatari_screen.Left := 727;
  Conf.Pem_hatari_joy.Left := 727;
  Conf.Pem_hatari_database.Left := 727;
  Conf.Pem_psx_paths.Left := 727;
  Conf.Pem_psx_screen.Left := 727;
  Conf.Pem_psx_sound.Left := 727;
  Conf.Pem_psx_others.Left := 727;
  Conf.Pem_kigb_paths.Left := 727;
  Conf.Pem_kigb_screen.Left := 727;
  Conf.Pem_kigb_sound.Left := 727;
  Conf.Pem_kigb_others.Left := 727;
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
      if not Assigned(Mame_Global_MemoIni) then
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
//      ShowHatari_DatabaseFromHatariIni;
      ShowHatariProgress(100,'Hatari Database Ready');
      Started := False;
    end;
end;

procedure StartEmupSX;
begin

end;

procedure StartEmuKigb;
begin

end;

procedure StartProgWeather;
begin

end;

procedure StartProTimeDate;
begin

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

end.

