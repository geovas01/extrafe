unit mainconf;

interface
uses
  Windows,Variants,Classes,SysUtils,Forms,StdCtrls, ComCtrls,IniFiles,ExtCtrls,Controls,
  Graphics,FunctionX,
  main,
  form_splash,
  menu,
  ce_themes,ce_config,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_builds,mame_database;

  procedure StartConfEditor;
  procedure StartProgConfEditor;
  procedure StartProgExtraFE;
  procedure StartEmuMame;
  procedure StartEmuZinc;
  procedure StartEmuHatari;
  procedure StartEmupSX;
  procedure StartEmuKigb;
  procedure StartProgWeather;
  procedure StartProTimeDate;
  procedure CreateSTBarInfo;
  procedure HideAllPanels;
  procedure ReadInisAndCreateDefaultFolders;
  procedure StartSkinEngine;
  procedure confEditorIniSettings;
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
//Inis
  ConfIni,
  ExtraFEIni,
  MameIni,ZincIni,HatariIni,pSXIni,KigbIni,
  WeatherIni,
  TimeDateIni : TIniFile;
//ConfEditor Vars
  CE_SHelpInCaption,CE_SHelpInMain: Boolean;
  WinEffectsType: string;
  WinEffectsTime: Integer;
//ExtraFe Vars
//Mame Vars
  SelectedMame: Shortint;
  Started,FromDatabase: Boolean;
//Zinc Vars
//Hatari Vars
//pSX Vars
//Kigb Vars
//Weather Vars
//TimeDate Vars

implementation

Procedure StartSkinEngine;
var
  i: Integer;
  skinnames: TStringList;
Begin
  Conf.skinM.SkinDirectory := Program_Path+'media\confeditor\skins';
  SkinNames := TStringList.Create;
  Conf.SkinM.SkinName := Conf.SkinM.GetSkinNames(SkinNames);
  Conf.sLB_ce_themes.Items.Clear;
  for i := 0 to skinnames.Count -1 do
    Conf.sLB_ce_themes.Items.Add(SkinNames[i]);
  FreeAndNil(SkinNames);
  i := ConfIni.ReadInteger('Themes','Theme',i);
  Conf.sLB_ce_themes.Selected[i] := true;
  Conf.sLabelFX3.Caption := Conf.sLB_ce_themes.Items.Strings[i];
  Conf.img_ce_theme.Picture.LoadFromFile('media\confeditor\skins\preview\'+conf.sLB_ce_themes.items.strings[i]+'.png');
  ThemeCreator(i+1);
  SetAllCursor(i+1);
  GroupBoxColors(i);
  conf.skinM.SkinName := Conf.sLB_ce_themes.Items.Strings[i];
  Conf.skinM.Active := True;
  Application.ProcessMessages;
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
              component := FindComponentEx('Conf.grp'+inttostr(k));
              TGroupBox(component).Color := $00e7e7e7;
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
  Conf.img9.Cursor := Arrow;
  Conf.img10.Cursor := Arrow;
  Conf.img11.Cursor := Arrow;
  //Panel CE_Configuration
  Conf.Pce_config.Cursor := Arrow;
  Conf.img6.Cursor := Arrow;
  Conf.img7.Cursor := Arrow;
  Conf.img8.Cursor := Arrow;
  Conf.sCheckBox1.Cursor := Arrow;
  Conf.sCheckBox2.Cursor := Arrow;
  Conf.grp116.Cursor := Arrow;
  Conf.sComboBox74.Cursor := Arrow;
  Conf.se1.Cursor := Arrow;
  //Panel CE_Themes
  Conf.Pce_themes.Cursor := Arrow;
  Conf.img4.Cursor := Arrow;
  Conf.img5.Cursor := Arrow;
  Conf.img6.Cursor := Arrow;
  Conf.sLB_ce_themes.Cursor := Arrow;
  Conf.sBB_apply_ce_themes.Cursor := Arrow;
  Conf.img_ce_theme.Cursor := Arrow;
  Conf.sPanel1.Cursor := Arrow;

  //{ExtraFE}
  //Panel EXF_Configuration
  Conf.Pexf_configuration.Cursor := Arrow;
  Conf.img37.Cursor := Arrow;
  Conf.img38.Cursor := Arrow;
  Conf.img39.Cursor := Arrow;
  //Panel EXF_Themes
  Conf.Pexf_themes.Cursor := Arrow;
  Conf.img34.Cursor := Arrow;
  Conf.img35.Cursor := Arrow;
  Conf.img36.Cursor := Arrow;

  //{Weather}
  Conf.Pweather.Cursor := Arrow;
  Conf.img30.Cursor := Arrow;
  Conf.img31.Cursor := Arrow;

  //{Time/Date}
  Conf.Ptimedate.Cursor := Arrow;
  Conf.img32.Cursor := Arrow;
  Conf.img33.Cursor := Arrow;

  //{Mame}
  //Panel Mame_Dirs
  Conf.Pem_mame_dirs.Cursor := Arrow;
  Conf.panel_mame_page1.Cursor := Arrow;
  Conf.panel_mame_page2.Cursor := Arrow;
  Conf.img12.Cursor := Arrow;
  Conf.img13.Cursor := Arrow;
  Conf.img14.Cursor := Arrow;
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
  Conf.img15.Cursor := Arrow;
  Conf.img16.Cursor := Arrow;
  Conf.img17.Cursor := Arrow;
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
  Conf.img18.Cursor := Arrow;
  Conf.img19.Cursor := Arrow;
  Conf.img20.Cursor := Arrow;
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
  Conf.img21.Cursor := Arrow;
  Conf.img22.Cursor := Arrow;
  Conf.img23.Cursor := Arrow;
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
  Conf.img24.Cursor := Arrow;
  Conf.img25.Cursor := Arrow;
  Conf.img26.Cursor := Arrow;
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
  Conf.img27.Cursor := Arrow;
  Conf.img28.Cursor := Arrow;
  Conf.img29.Cursor := Arrow;
  Conf.grp115.Cursor := Arrow;
  Conf.nxtgrd_mame.Cursor := Arrow;
  Conf.sComboBox72.Cursor := Arrow;
  Conf.sWebLabel3.Cursor := Link;

  //{Zinc}
  //Panel Zinc_Paths
  Conf.Pem_zinc_paths.Cursor := Arrow;
  Conf.img46.Cursor := Arrow;
  Conf.img47.Cursor := Arrow;
  Conf.img48.Cursor := Arrow;
  Conf.sEdit53.Cursor := TArrow;
  Conf.sEdit54.Cursor := TArrow;
  Conf.sEdit55.Cursor := TArrow;
  Conf.sBitBtn47.Cursor := Arrow;
  Conf.sBitBtn48.Cursor := Arrow;
  Conf.sBitBtn49.Cursor := Arrow;
  //Panel Zinc_Graphics
  Conf.Pem_zinc_graphics.Cursor := Arrow;
  Conf.img43.Cursor := Arrow;
  Conf.img43.Cursor := Arrow;
  Conf.img45.Cursor := Arrow;
  Conf.grp1.Cursor := Arrow;
  Conf.grp18.Cursor := Arrow;
  Conf.grp19.Cursor := Arrow;
  Conf.grp20.Cursor := Arrow;
  Conf.grp25.Cursor := Arrow;
  Conf.grp21.Cursor := Arrow;
  Conf.grp22.Cursor := Arrow;
  Conf.grp23.Cursor := Arrow;
  Conf.grp24.Cursor := Arrow;
  Conf.grp26.Cursor := Arrow;
  Conf.grp27.Cursor := Arrow;
  Conf.grp28.Cursor := Arrow;
  Conf.grp29.Cursor := Arrow;
  Conf.grp30.Cursor := Arrow;
  Conf.grp17.Cursor := Arrow;
  Conf.grp31.Cursor := Arrow;
  Conf.grp32.Cursor := Arrow;
  Conf.grp33.Cursor := Arrow;
  Conf.grp34.Cursor := Arrow;
  Conf.grp35.Cursor := Arrow;
  Conf.rb3.Cursor := Arrow;
  Conf.rb4.Cursor := Arrow;
  Conf.rb5.Cursor := Arrow;
  Conf.rb6.Cursor := Arrow;
  Conf.rb7.Cursor := Arrow;
  Conf.rb8.Cursor := Arrow;
  Conf.rb9.Cursor := Arrow;
  Conf.rb10.Cursor := Arrow;
  Conf.rb11.Cursor := Arrow;
  Conf.rb12.Cursor := Arrow;
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
  Conf.sComboBox38.Cursor := Arrow;
  Conf.sComboBox39.Cursor := Arrow;
  Conf.sComboBox40.Cursor := Arrow;
  Conf.sComboBox41.Cursor := Arrow;
  Conf.sComboBox42.Cursor := Arrow;
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
  Conf.sCheckBox60.Cursor := Arrow;
  Conf.sCheckBox61.Cursor := Arrow;
  Conf.sCheckBox62.Cursor := Arrow;
  Conf.sCheckBox63.Cursor := Arrow;
  Conf.sCheckBox64.Cursor := Arrow;
  Conf.sCheckBox65.Cursor := Arrow;
  Conf.sCheckBox66.Cursor := Arrow;
  Conf.sCheckBox67.Cursor := Arrow;
  Conf.sCheckBox68.Cursor := Arrow;
  Conf.sCheckBox69.Cursor := Arrow;
  Conf.sCheckBox70.Cursor := Arrow;
  Conf.sCheckBox71.Cursor := Arrow;
  Conf.sCheckBox72.Cursor := Arrow;
  Conf.sCheckBox73.Cursor := Arrow;
  Conf.sCheckBox74.Cursor := Arrow;
  Conf.sCheckBox75.Cursor := Arrow;
  Conf.sCheckBox76.Cursor := Arrow;
  Conf.sCheckBox77.Cursor := Arrow;
  Conf.sCheckBox78.Cursor := Arrow;
  Conf.sEdit65.Cursor := TArrow;
  Conf.sEdit66.Cursor := TArrow;
  Conf.sEdit67.Cursor := TArrow;
  Conf.sEdit68.Cursor := Precision;
  Conf.sEdit69.Cursor := Precision;
  Conf.sEdit70.Cursor := Precision;
  Conf.sEdit71.Cursor := Precision;
  Conf.sEdit72.Cursor := Precision;
  Conf.sEdit73.Cursor := TArrow;

  //Panel Zinc_Sound
  Conf.Pem_zinc_sound.Cursor := Arrow;
  Conf.img40.Cursor := Arrow;
  Conf.img41.Cursor := Arrow;
  Conf.img42.Cursor := Arrow;
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
  Conf.img58.Cursor := Arrow;
  Conf.img59.Cursor := Arrow;
  Conf.img60.Cursor := Arrow;
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
  Conf.sBitBtn50.Cursor := Arrow;
  Conf.sBitBtn51.Cursor := Arrow;
  Conf.sBitBtn52.Cursor := Arrow;
  Conf.sBitBtn53.Cursor := Arrow;
  Conf.sBitBtn54.Cursor := Arrow;
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
  Conf.img55.Cursor := Arrow;
  Conf.img56.Cursor := Arrow;
  Conf.img57.Cursor := Arrow;
  Conf.grp43.Cursor := Arrow;
  Conf.grp44.Cursor := Arrow;
  Conf.grp49.Cursor := Arrow;
  Conf.sBitBtn55.Cursor := Arrow;
  Conf.sBitBtn56.Cursor := Arrow;
  Conf.sBitBtn57.Cursor := Arrow;
  Conf.sBitBtn58.Cursor := Arrow;
  Conf.sBitBtn59.Cursor := Arrow;
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
  Conf.img52.Cursor := Arrow;
  Conf.img53.Cursor := Arrow;
  Conf.img54.Cursor := Arrow;
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
  Conf.img49.Cursor := Arrow;
  Conf.img50.Cursor := Arrow;
  Conf.img51.Cursor := Arrow;
  Conf.grp59.Cursor := Arrow;
  Conf.grp60.Cursor := Arrow;
  Conf.grp61.Cursor := Arrow;
  Conf.sComboBox55.Cursor := Arrow;
  Conf.sComboBox56.Cursor := Arrow;
  Conf.sComboBox57.Cursor := Arrow;
  Conf.rb28.Cursor := Arrow;
  Conf.rb29.Cursor := Arrow;
  Conf.rb30.Cursor := Arrow;
  Conf.sBitBtn74.Cursor := Arrow;
  Conf.sBitBtn75.Cursor := Arrow;
  Conf.sCheckBox101.Cursor := Arrow;
  Conf.sCheckBox102.Cursor := Arrow;
  Conf.sEdit76.Cursor := Precision;
  Conf.sEdit77.Cursor := Precision;
  Conf.sEdit78.Cursor := Precision;
  Conf.sEdit79.Cursor := Precision;
  Conf.sEdit80.Cursor := Precision;

  //{pSX Emulator}
  //Panel pSX_Paths
  Conf.Pem_psx_paths.Cursor := Arrow;
  Conf.img61.Cursor := Arrow;
  Conf.img62.Cursor := Arrow;
  Conf.img63.Cursor := Arrow;
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
  Conf.img64.Cursor := Arrow;
  Conf.img65.Cursor := Arrow;
  Conf.img66.Cursor := Arrow;
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
  Conf.img67.Cursor := Arrow;
  Conf.img68.Cursor := Arrow;
  Conf.img69.Cursor := Arrow;
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
  Conf.sEdit45.Cursor := Precision;
  Conf.sEdit44.Cursor := Precision;
  Conf.sEdit43.Cursor := Precision;
  Conf.sEdit14.Cursor := Precision;
  Conf.sEdit46.Cursor := Precision;
  Conf.sEdit47.Cursor := Precision;
  Conf.sEdit52.Cursor := Precision;
  Conf.sEdit18.Cursor := Precision;
  Conf.sEdit36.Cursor := Precision;
  Conf.sEdit37.Cursor := Precision;
  Conf.sEdit41.Cursor := Precision;
  Conf.sEdit35.Cursor := Precision;
  Conf.sEdit40.Cursor := Precision;
  Conf.sEdit39.Cursor := Precision;
  Conf.sEdit48.Cursor := Precision;
  Conf.sEdit49.Cursor := Precision;
  Conf.sEdit50.Cursor := Precision;
  Conf.sEdit51.Cursor := Precision;
  Conf.sEdit42.Cursor := Precision;
  Conf.sEdit38.Cursor := Precision;
  Conf.img85.Cursor := Arrow;
  Conf.sbar_psx_latency.Cursor := Horizontal;
  Conf.sbar_psx_xalatency.Cursor := Horizontal;
  //Panel pSX_Others
  Conf.Pem_psx_others.Cursor := Arrow;
  Conf.img70.Cursor := Arrow;
  Conf.img71.Cursor := Arrow;
  Conf.img72.Cursor := Arrow;
  Conf.grp13.Cursor := Arrow;
  Conf.grp14.Cursor := Arrow;
  Conf.sComboBox23.Cursor := Arrow;
  Conf.sComboBox24.Cursor := Arrow;
  Conf.sComboBox25.Cursor := Arrow;
  Conf.sComboBox65.Cursor := Arrow;
  Conf.sEdit19.Cursor := Precision;
  Conf.sEdit20.Cursor := Precision;
  Conf.sEdit21.Cursor := Precision;
  Conf.sEdit22.Cursor := Precision;
  Conf.sEdit23.Cursor := Precision;
  Conf.sEdit24.Cursor := Precision;
  Conf.sEdit25.Cursor := Precision;
  Conf.sEdit26.Cursor := Precision;
  Conf.sEdit27.Cursor := Precision;
  Conf.sEdit28.Cursor := Precision;
  Conf.sEdit29.Cursor := Precision;
  Conf.sEdit30.Cursor := Precision;
  Conf.sEdit31.Cursor := Precision;
  Conf.sEdit32.Cursor := Precision;
  Conf.sEdit33.Cursor := Precision;
  Conf.sEdit34.Cursor := Precision;

  //{Kigb}
  //Panel Kigb_Paths
  Conf.Pem_kigb_paths.Cursor := Arrow;
  Conf.img73.Cursor := Arrow;
  Conf.img74.Cursor := Arrow;
  Conf.img75.Cursor := Arrow;
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
  Conf.img76.Cursor := Arrow;
  Conf.img77.Cursor := Arrow;
  Conf.img78.Cursor := Arrow;
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
  Conf.img79.Cursor := Arrow;
  Conf.img80.Cursor := Arrow;
  Conf.img81.Cursor := Arrow;
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
  Conf.img82.Cursor := Arrow;
  Conf.img83.Cursor := Arrow;
  Conf.img84.Cursor := Arrow;
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
  Conf.Pweather.Left := 727;
  Conf.Ptimedate.Left := 727;
  Conf.Pexf_configuration.Left := 727;
  Conf.Pexf_themes.Left := 727;
  Conf.Pem_zinc_paths.Left := 727;
  Conf.Pem_zinc_graphics.Left := 727;
  Conf.Pem_zinc_sound.Left := 727;
  Conf.Pem_hatari_system.Left := 727;
  Conf.Pem_hatari_roms.Left := 727;
  Conf.Pem_hatari_screen.Left := 727;
  Conf.Pem_hatari_joy.Left := 727;
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
  resolutions := TStringList.Create; //Cration of the resolution list
  StartProgConfEditor;
  StartEmuMame;
  StartEmuZinc;
  StartEmuHatari;
  StartEmupSX;
  StartEmuKigb;
end;

procedure ReadInisAndCreateDefaultFolders;
begin
  //ConfEditor Start Inis
  Confini := TiniFile.Create(Program_Path +'config\confeditor.ini');
  if not ConfIni.SectionExists('Themes') then
    ConfIni.WriteInteger('Themes','Theme',0);
  if not ConfIni.SectionExists('Config') then
    begin
      ConfIni.WriteBool('Config','HelpInCaption',True);
      ConfIni.WriteBool('Config','HelpInMainPanel',True);
      ConfIni.WriteString('Config','WindowEffects','None');
      ConfIni.WriteInteger('Config','EffectsTime',400);
    end;
  confEditorIniSettings;
  //Mame Start Inis
  MameIni := TiniFile.Create(Program_Path +'config\mame.ini');
  if not MameIni.SectionExists('MamePaths') then
    begin
//      MameIni.WriteString('MamePaths','Mame1','');
//      MameIni.WriteString('MamePaths','Type1','');
      MameIni.WriteInteger('SelMame','Selected',-1);
      MameIni.WriteBool('SelMame','ShowOnly',False);
      MameIni.WriteString('MameDirs','Cabinets_Dir_-1','Default');
      MameIni.WriteString('MameDirs','Flyers_Dir_-1','Default');
      MameIni.WriteString('MameDirs','Marquees_Dir_-1','Default');
      MameIni.WriteString('MameDirs','Control_Panels_Dir_-1','Default');
      MameIni.WriteString('MameDirs','Pcbs_Dir_-1','Default');
      MameIni.WriteString('MameDirs','Artwork_Preview_Dir_-1','Default');
      MameIni.WriteString('MameDirs','Titles_Dir_-1','Default');
      MameIni.WriteString('MameDirs','Select_Dir_-1','Default');
      MameIni.WriteString('MameDirs','Scores_Dir_-1','Default');
      MameIni.WriteString('MameDirs','Bosses_Dir_-1','Default');
    end;
  //pSX Start Inis
  PsxIni := TiniFile.Create(Program_Path +'config\psx.ini');
  if not FileExists(Program_Path+'Config') then
    CreateDir(Program_Path+'Config');
end;

procedure confEditorIniSettings;
begin
  CE_SHelpInMain := ConfIni.ReadBool('Config','HelpInMainPanel',CE_SHelpInMain);
  conf.sCheckBox1.Checked := CE_SHelpInMain;
  CE_SHelpInCaption := ConfIni.ReadBool('Config','HelpInCaption',CE_SHelpInCaption);
  Conf.sCheckBox2.Checked := CE_SHelpInCaption;
  WinEffectsType := ConfIni.ReadString('Config','WindowEffects',WinEffectsType);
  Conf.sComboBox74.ItemIndex  := Conf.sComboBox74.IndexOf(WinEffectsType);
  Conf.sComboBox74.Text := WinEffectsType;
  WindowsEffectsType;
  WinEffectsTime := ConfIni.ReadInteger('Config','EffectsTime',WinEffectsTime);
  Conf.se1.Value := WinEffectsTime;
end;

procedure StartProgConfEditor;
begin
  ReadInisAndCreateDefaultFolders;
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
  MameIniFile: TextFile;
  text,value: string;
begin
  SelectedMame := MameIni.ReadInteger('SelMame','Selected',SelectedMame);
  Mame_Exe := MameIni.ReadString('MamePaths','Mame'+IntToStr(SelectedMame),Mame_Exe);
  if Mame_Exe <> '' then
    begin
      Conf.sEdit64.Text := Mame_Exe;
      Mame_Global_MemoIni.Free;
      Mame_Global_MemoIni := TMemo.Create(Conf);
      Mame_Global_MemoIni.Parent := Conf;
      Mame_Global_MemoIni.Visible := False;
      Mame_Global_MemoIni.Align := alClient;
      Mame_Global_MemoIni.WordWrap := False;
      value := ExtractFilePath(Mame_Exe) + 'mame.ini';
      AssignFile(MameIniFile,value);
      Reset(MameIniFile);
      while not Eof(MameIniFile) do
        begin
          Readln(MameIniFile,text);
          Mame_Global_MemoIni.Lines.Add(text);
        end;
      CloseFile(MameIniFile);
      SetMame_DirsFromMameIni;
      if FromArrows_Mamedirs = False then
        begin
          if FromDatabase = False then
            Splash_Screen.Progress_Label(40,'Mame Directories Ready')
          else
            begin
              Conf.sLabel109.Caption := 'SetSettings To Mame (ConfEditor)';
              Conf.sGauge_MameData.Progress := 10;
            end
        end
      else
        begin
          Conf.sLabel112.Caption := 'Mame Directories Ready';
          Conf.sGauge_MameChange.Progress := 20;
        end;
      Application.ProcessMessages;
      Sleep(50);
      Started := True;
      SetMame_GraphicsFromMameIni;
      if FromArrows_Mamedirs = False then
        begin
          if FromDatabase = False then
            Splash_Screen.Progress_Label(50,'Mame Graphics Ready')
          else
            begin
              Conf.sLabel109.Caption := 'SetSettings To Mame (ConfEditor)';
              Conf.sGauge_MameData.Progress := 30;
            end;
        end
      else
        begin
          Conf.sLabel112.Caption := 'Mame Graphics Ready';
          Conf.sGauge_MameChange.Progress := 40;
        end;
      Application.ProcessMessages;
      Sleep(50);
      Started := True;
      SetMame_SoundFromMameIni;
      if FromArrows_Mamedirs = False then
        begin
          if FromDatabase = False then
            Splash_Screen.Progress_Label(60,'Mame Sound Ready')
          else
            begin
              Conf.sLabel109.Caption := 'SetSettings To Mame (ConfEditor)';
              Conf.sGauge_MameData.Progress := 50;
            end;
        end
      else
        begin
          Conf.sLabel112.Caption := 'Mame Sound Ready';
          Conf.sGauge_MameChange.Progress := 60;
        end;
      Application.ProcessMessages;
      Sleep(50);
      Started := True;
      SetMame_OthersFromMameIni;
      if FromArrows_Mamedirs = False then
        begin
          if FromDatabase = False then
            Splash_Screen.Progress_Label(70,'Mame Others Ready')
          else
            begin
              Conf.sLabel109.Caption := 'SetSettings To Mame (ConfEditor)';
              Conf.sGauge_MameData.Progress := 70;
            end;
        end
      else
        begin
          Conf.sLabel112.Caption := 'Mame Others Ready';
          Conf.sGauge_MameChange.Progress := 70;
        end;
      Application.ProcessMessages;
      Sleep(50);
      Started := True;
      SetMame_BuildsFromMameIni;
      if FromArrows_Mamedirs = False then
        begin
          if FromDatabase = False then
            Splash_Screen.Progress_Label(90,'Mame Builds Ready')
          else
            begin
              Conf.sLabel109.Caption := 'SetSettings To Mame (ConfEditor)';
              Conf.sGauge_MameData.Progress := 90;
            end;
        end
      else
        begin
          Conf.sLabel112.Caption := 'Mame Builds Ready';
          Conf.sGauge_MameChange.Progress := 85;
        end;
      Application.ProcessMessages;
      Sleep(50);
      Started := true;
      SetMame_DatabaseFromMameIni;
      if FromArrows_Mamedirs = False then
        begin
          if FromDatabase = False then
            Splash_Screen.Progress_Label(90,'Mame Database Ready')
          else
            begin
              Conf.sLabel109.Caption := 'SetSettings To Mame (ConfEditor)';
              Conf.sGauge_MameData.Progress := 100;
              Application.ProcessMessages;
            end;
        end
      else
        begin
          Conf.sLabel112.Caption := 'Mame Database Ready';
          Conf.sGauge_MameChange.Progress := 100;
        end;
      Application.ProcessMessages;
      Sleep(50);
      FromDatabase := False;
    end
  else
    Checkwin64ForListBox(SelectedMame,true);
end;

procedure StartEmuZinc;
begin

end;

procedure StartEmuHatari;
begin

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
  STBarInfo1 := 'Version : '+GetVersion(ExtractFilePath(Application.ExeName)+'confeditor.exe');
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

end.


