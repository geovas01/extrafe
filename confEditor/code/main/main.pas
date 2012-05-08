unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi, ComCtrls, Buttons, inifiles, ExtCtrls,ImgList, //Delphi units
  sSkinProvider,sSkinManager, sEdit, sPanel,sBitBtn,sGauge,sCheckListBox, sButton, sListBox, sScrollBar, sCheckBox, sComboBox, sLabel,acPNG,acAlphaImageList, //Alphaskin units
  CDesktopMonitorInfo, CWMIBase, CSoundDeviceInfo, //Info Devices Units
  LMDBaseControl,LMDBaseGraphicControl, LMDGraphicControl, LMDBaseImage, LMDCustomLImage,LMDLImage, //LMD Units
  JvBaseDlg, JvSelectDirectory, JvDialogs,JvAppInst, //Jvcl units
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,NxColumnClasses, NxColumns,
  LMDFontSizeComboBox,LMDThemedComboBox, LMDCustomComboBox,LMDFontComboBox,//NextGrid Units
  OmniXML,OmniXMLUtils, // XML Functions And Units
  form_color, //forms
  FunctionX,global, // functions units
  //my units
  menu,
  ce_themes,ce_config,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_builds,mame_database,
  zinc_paths,zinc_graphics,zinc_sound,
  hatari_system,hatari_roms,hatari_screen,hatari_joy, Spin,
  LMDCustomNImage, LMDNImage,
  GLKeyboard;


const
  AniArrow = 1;AniText = 2;AniLink = 3;AniBusy = 4;AniHorizontal = 5;AniVertical = 6;AniPrecision = 7;
  AniArrow2 = 8;AniText2 = 9;AniLink2 = 10;AniBusy2 = 11;AniHorizontal2 = 12;AniVertical2 = 13;AniPrecision2 = 14;
  AniArrow3 = 15;AniText3 = 16;AniLink3 = 17;AniBusy3 = 18;AniHorizontal3 = 19;AniVertical3 = 20;AniPrecision3 = 21;
  AniArrow4 = 22;AniText4 = 23;AniLink4 = 24;AniBusy4 = 25;AniHorizontal4 = 26;AniVertical4 = 27;AniPrecision4 = 28;

type
  TConf = class(TForm)
//  StringGrid Components
    nxtgrd_mame: TNextGrid;nxtgrd_ips_mameplus: TNextGrid;nxtgrd_ips_mamext: TNextGrid;
    nxtgrd_zinc: TNextGrid;
//  Skin Components
    SkinM: TsSkinManager;SkinP: TsSkinProvider;
//  Dialogs Components
    Find_Files: TOpenDialog;
//  Machine Info Components
    SDI1: TSoundDeviceInfo;
    DMI1: TDesktopMonitorInfo;
//  Timers Components
    tmr1: TTimer;tmr_presskey: TTimer;
//  Spitters Components
    spl1: TSplitter;
//  Status Bar Components
    stat1: TStatusBar;
//  Main and MainMenu Panels
    Main_Panel: TsPanel;
    Menu_Panel: TsPanel;
//  ConfEditor Panels
    Pce_wizard: TsPanel;Pce_config: TsPanel;Pce_themes: TsPanel;
//  ExtraFe Panels
    Pexf_configuration: TsPanel;Pexf_themes: TsPanel;
//  Mame Panels
    Pem_mame_dirs: TsPanel;Pem_mame_graphics: TsPanel;Pem_mame_sound: TsPanel;Pem_mame_others: TsPanel;
    Pem_mame_builds: TsPanel;Pem_mame_database: TsPanel;PTools: TsPanel;
    PBuilds_MameBuilds: TsPanel;PBuilds_MameTools: TsPanel;PBuilds_MameXT: TPanel;PBuilds_MamePlus: TPanel;
    panel_mame_page1: TsPanel;panel_mame_page2: TsPanel;
//  Zinc Panels
    Pem_zinc_paths: TsPanel;Pem_zinc_graphics: TsPanel;Pem_zinc_sound: TsPanel; Pem_zinc_database: TsPanel;
//  Hatari Panels
    Pem_hatari_system: TsPanel;Pem_hatari_roms: TsPanel;Pem_hatari_screen: TsPanel;Pem_hatari_joy: TsPanel;
//  pSX Panels
    Pem_psx_paths: TsPanel;Pem_psx_screen: TsPanel;Pem_psx_sound: TsPanel;Pem_psx_others: TsPanel;
//  Kigb Panels
    Pem_kigb_paths: TsPanel;Pem_kigb_screen: TsPanel;Pem_kigb_sound: TsPanel;Pem_kigb_others: TsPanel;
    Pwg_weather: TsPanel;
    Pwg_timedate: TsPanel;
//  other panels
    sPanel: TsPanel;sPanel2: TsPanel;sPanel3: TsPanel;sPanel4: TsPanel;sPanel5: TsPanel;sPanel6: TsPanel;sPanel7: TsPanel;sPanel8: TsPanel;sPanel9: TsPanel;sPanel10: TsPanel;
    sPanel11: TsPanel;sPanel12: TsPanel;sPanel13: TsPanel;sPanel14: TsPanel;sPanel15: TsPanel;sPanel16: TsPanel;sPanel17: TsPanel;sPanel18: TsPanel;sPanel19: TsPanel;sPanel20: TsPanel;
    sPanel21: TsPanel;sPanel22: TsPanel;sPanel23: TsPanel;sPanel24: TsPanel;sPanel25: TsPanel;sPanel26: TsPanel;sPanel27: TsPanel;sPanel28: TsPanel;sPanel29: TsPanel;sPanel30: TsPanel;
    sPanel31: TsPanel;sPanel32: TsPanel;sPanel33: TsPanel;sPanel34: TsPanel;sPanel35: TsPanel;sPanel36: TsPanel;
//  grp Components
    grp105: TGroupBox;grp106: TGroupBox;grp107: TGroupBox;grp108: TGroupBox;grp109: TGroupBox;grp110: TGroupBox;grp111: TGroupBox;grp112: TGroupBox;
    grp113: TGroupBox;grp114: TGroupBox;grp97: TGroupBox;grp98: TGroupBox;grp99: TGroupBox;grp100: TGroupBox;grp101: TGroupBox;grp103: TGroupBox;
    grp104: TGroupBox;grp96: TGroupBox;grp95: TGroupBox;grp2: TGroupBox;grp3: TGroupBox;grp4: TGroupBox;grp5: TGroupBox;grp6: TGroupBox;grp7: TGroupBox;
    grp8: TGroupBox;grp9: TGroupBox;grp10: TGroupBox;grp11: TGroupBox;grp12: TGroupBox;grp13: TGroupBox;grp14: TGroupBox;grp15: TGroupBox;grp16: TGroupBox;grp19: TGroupBox;grp21: TGroupBox;grp22: TGroupBox;grp23: TGroupBox;grp24: TGroupBox;grp25: TGroupBox;grp26: TGroupBox;
    grp27: TGroupBox;grp28: TGroupBox;grp29: TGroupBox;grp1: TGroupBox;grp36: TGroupBox;grp37: TGroupBox;grp38: TGroupBox;grp39: TGroupBox;grp40: TGroupBox;grp41: TGroupBox;grp42: TGroupBox;
    grp43: TGroupBox;grp44: TGroupBox;grp49: TGroupBox;grp45: TGroupBox;grp46: TGroupBox;grp47: TGroupBox;grp48: TGroupBox;grp50: TGroupBox;grp51: TGroupBox;
    grp52: TGroupBox;grp53: TGroupBox;grp54: TGroupBox;grp55: TGroupBox;grp56: TGroupBox;grp57: TGroupBox;grp58: TGroupBox;grp59: TGroupBox;grp60: TGroupBox;
    grp61: TGroupBox;grp62: TGroupBox;grp63: TGroupBox;grp64: TGroupBox;grp65: TGroupBox;grp66: TGroupBox;grp67: TGroupBox;grp68: TGroupBox;grp69: TGroupBox;
    grp70: TGroupBox;grp71: TGroupBox;grp72: TGroupBox;grp73: TGroupBox;grp74: TGroupBox;grp75: TGroupBox;grp78: TGroupBox;grp79: TGroupBox;grp80: TGroupBox;
    grp81: TGroupBox;grp82: TGroupBox;grp83: TGroupBox;grp84: TGroupBox;grp85: TGroupBox;grp86: TGroupBox;grp87: TGroupBox;grp88: TGroupBox;grp89: TGroupBox;
    grp90: TGroupBox;grp91: TGroupBox;grp92: TGroupBox;grp93: TGroupBox;grp94: TGroupBox;grp76: TGroupBox;grp77: TGroupBox;grp115: TGroupBox;grp102: TGroupBox;
    grp116: TGroupBox;grp117: TGroupBox;grp118: TGroupBox;grp119: TGroupBox;grp120: TGroupBox;grp121: TGroupBox;grp122: TGroupBox;
//  sLabel Components
    sLabel13: TsLabel;sLabel14: TsLabel;sLabel15: TsLabel;sLabel16: TsLabel;sLabel19: TsLabel;sLabel28: TsLabel;sLabel6: TsLabel;sLabel7: TsLabel;
    sLabel8: TsLabel;sLabel9: TsLabel;sLabel10: TsLabel;
    sLabel46: TsLabel;sLabel47: TsLabel;sLabel3: TsLabel;sLabel4: TsLabel;sLabel5: TsLabel;sLabel2: TsLabel;sLabel48: TsLabel;sLabel49: TsLabel;
    sLabel50: TsLabel;sLabel11: TsLabel;sLabel12: TsLabel;sLabel1: TsLabel;sLabel51: TsLabel;sLabel52: TsLabel;sLabel17: TsLabel;sLabel18: TsLabel;
    sLabel20: TsLabel;sLabel21: TsLabel;sLabel22: TsLabel;sLabel58: TsLabel;sLabel59: TsLabel;sLabel60: TsLabel;sLabel61: TsLabel;sLabel62: TsLabel;
    sLabel63: TsLabel;sLabel64: TsLabel;sLabel65: TsLabel;sLabel66: TsLabel;sLabel67: TsLabel;sLabel68: TsLabel;sLabel69: TsLabel;sLabel23: TsLabel;
    sLabel24: TsLabel;sLabel25: TsLabel;sLabel26: TsLabel;sLabel27: TsLabel;sLabel53: TsLabel;sLabel54: TsLabel;sLabel55: TsLabel;sLabel56: TsLabel;
    sLabel57: TsLabel;sLabel70: TsLabel;sLabel71: TsLabel;sLabel72: TsLabel;sLabel73: TsLabel;sLabel74: TsLabel;sLabel75: TsLabel;sLabel76: TsLabel;
    sLabel77: TsLabel;sLabel78: TsLabel;sLabel79: TsLabel;sLabel80: TsLabel;sLabel81: TsLabel;sLabel82: TsLabel;sLabel83: TsLabel;sLabel84: TsLabel;
    sLabel85: TsLabel;sLabel86: TsLabel;sLabel87: TsLabel;sLabel88: TsLabel;sLabel89: TsLabel;sLabel90: TsLabel;sLabel91: TsLabel;sLabel93: TsLabel;
    sLabel92: TsLabel;sLabel94: TsLabel;sLabel95: TsLabel;sLabel96: TsLabel;sLabel97: TsLabel;sLabel98: TsLabel;sLabel99: TsLabel;sLabel100: TsLabel;
    sLabel101: TsLabel;sLabel32: TsLabel;sLabel33: TsLabel;sLabel34: TsLabel;sLabel35: TsLabel;sLabel36: TsLabel;sLabel37: TsLabel;sLabel38: TsLabel;
    sLabel39: TsLabel;sLabel40: TsLabel;sLabel41: TsLabel;sLabel42: TsLabel;sLabel43: TsLabel;sLabel102: TsLabel;sLabel103: TsLabel;sLabel104: TsLabel;
    sLabel105: TsLabel;sLabel106: TsLabel;sLabel107: TsLabel;sLabel109: TsLabel;sLabel110: TsLabel;sLabel111: TsLabel;sLabel112: TsLabel;sLabel108: TsLabel;
    sLabel113: TsLabel;sLabel114: TsLabel;sLabel115: TsLabel;sLabel116: TsLabel;sLabel117: TsLabel;sLabel118: TsLabel;sLabel119: TsLabel;sLabel120: TsLabel;
    sLabel121: TsLabel;sLabel122: TsLabel;sLabel123: TsLabel;sLabel124: TsLabel;sLabel125: TsLabel;sLabel126: TsLabel;sLabel127: TsLabel;sLabel128: TsLabel;
    sLabel129: TsLabel;
//  sCheckBox Components
    sCheckBox26: TsCheckBox;sCheckBox16: TsCheckBox;sCheckBox17: TsCheckBox;sCheckBox35: TsCheckBox;sCheckBox36: TsCheckBox;sCheckBox37: TsCheckBox;
    sCheckBox38: TsCheckBox;sCheckBox39: TsCheckBox;sCheckBox3: TsCheckBox;sCheckBox4: TsCheckBox;sCheckBox5: TsCheckBox;sCheckBox6: TsCheckBox;sCheckBox7: TsCheckBox;
    sCheckBox8: TsCheckBox;sCheckBox11: TsCheckBox;sCheckBox12: TsCheckBox;sCheckBox13: TsCheckBox;sCheckBox14: TsCheckBox;sCheckBox15: TsCheckBox;
    sCheckBox40: TsCheckBox;sCheckBox41: TsCheckBox;sCheckBox43: TsCheckBox;sCheckBox1: TsCheckBox;sCheckBox2: TsCheckBox;sCheckBox18: TsCheckBox;
    sCheckBox19: TsCheckBox;sCheckBox20: TsCheckBox;sCheckBox21: TsCheckBox;sCheckBox22: TsCheckBox;sCheckBox23: TsCheckBox;sCheckBox47: TsCheckBox;
    sCheckBox24: TsCheckBox;sCheckBox27: TsCheckBox;sCheckBox28: TsCheckBox;sCheckBox30: TsCheckBox;sCheckBox31: TsCheckBox;sCheckBox48: TsCheckBox;sCheckBox49: TsCheckBox;sCheckBox50: TsCheckBox;sCheckBox51: TsCheckBox;sCheckBox52: TsCheckBox;
    sCheckBox53: TsCheckBox;sCheckBox54: TsCheckBox;sCheckBox55: TsCheckBox;sCheckBox56: TsCheckBox;sCheckBox57: TsCheckBox;sCheckBox58: TsCheckBox;
    sCheckBox59: TsCheckBox;sCheckBox79: TsCheckBox;sCheckBox80: TsCheckBox;sCheckBox81: TsCheckBox;sCheckBox82: TsCheckBox;
    sCheckBox83: TsCheckBox;sCheckBox84: TsCheckBox;sCheckBox85: TsCheckBox;sCheckBox86: TsCheckBox;sCheckBox87: TsCheckBox;sCheckBox88: TsCheckBox;
    sCheckBox89: TsCheckBox;sCheckBox91: TsCheckBox;sCheckBox95: TsCheckBox;sCheckBox92: TsCheckBox;sCheckBox93: TsCheckBox;sCheckBox94: TsCheckBox;
    sCheckBox90: TsCheckBox;sCheckBox96: TsCheckBox;sCheckBox97: TsCheckBox;sCheckBox98: TsCheckBox;sCheckBox99: TsCheckBox;sCheckBox101: TsCheckBox;
    sCheckBox100: TsCheckBox;sCheckBox102: TsCheckBox;sCheckBox103: TsCheckBox;sCheckBox104: TsCheckBox;sCheckBox105: TsCheckBox;sCheckBox106: TsCheckBox;
    sCheckBox107: TsCheckBox;sCheckBox108: TsCheckBox;sCheckBox109: TsCheckBox;sCheckBox25: TsCheckBox;sCheckBox42: TsCheckBox;sCheckBox45: TsCheckBox;
    sCheckBox46: TsCheckBox;sCheckBox110: TsCheckBox;sCheckBox111: TsCheckBox;sCheckBox112: TsCheckBox;sCheckBox113: TsCheckBox;sCheckBox115: TsCheckBox;
    sCheckBox116: TsCheckBox;sCheckBox117: TsCheckBox;sCheckBox118: TsCheckBox;sCheckBox119: TsCheckBox;sCheckBox120: TsCheckBox;sCheckBox121: TsCheckBox;
    sCheckBox122: TsCheckBox;sCheckBox123: TsCheckBox;sCheckBox124: TsCheckBox;sCheckBox125: TsCheckBox;sCheckBox126: TsCheckBox;sCheckBox114: TsCheckBox;
    sCheckBox127: TsCheckBox;sCheckBox9: TsCheckBox;sCheckBox10: TsCheckBox;sCheckBox29: TsCheckBox;sCheckBox32: TsCheckBox;sCheckBox33: TsCheckBox;
    sCheckBox34: TsCheckBox;sCheckBox44: TsCheckBox;sCheckBox128: TsCheckBox;sCheckBox129: TsCheckBox;sCheckBox130: TsCheckBox;
//  sComboBox Components
    sComboBox18: TsComboBox;sComboBox10: TsComboBox;sComboBox11: TsComboBox;sComboBox12: TsComboBox;sComboBox13: TsComboBox;sComboBox14: TsComboBox;
    sComboBox15: TsComboBox;sComboBox16: TsComboBox;sComboBox17: TsComboBox;sComboBox19: TsComboBox;sComboBox2: TsComboBox;sComboBox3: TsComboBox;
    sComboBox4: TsComboBox;sComboBox5: TsComboBox;sComboBox9: TsComboBox;sComboBox20: TsComboBox;sComboBox1: TsComboBox;sComboBox21: TsComboBox;
    sComboBox22: TsComboBox;sComboBox23: TsComboBox;sComboBox24: TsComboBox;sComboBox25: TsComboBox;sComboBox26: TsComboBox;sComboBox27: TsComboBox;
    sComboBox28: TsComboBox;sComboBox29: TsComboBox;sComboBox30: TsComboBox;sComboBox31: TsComboBox;sComboBox32: TsComboBox;sComboBox33: TsComboBox;
    sComboBox34: TsComboBox;sComboBox35: TsComboBox;sComboBox36: TsComboBox;sComboBox37: TsComboBox;sComboBox43: TsComboBox;sComboBox44: TsComboBox;sComboBox45: TsComboBox;
    sComboBox46: TsComboBox;sComboBox47: TsComboBox;sComboBox49: TsComboBox;sComboBox48: TsComboBox;sComboBox50: TsComboBox;sComboBox51: TsComboBox;
    sComboBox52: TsComboBox;sComboBox53: TsComboBox;sComboBox54: TsComboBox;sComboBox55: TsComboBox;sComboBox56: TsComboBox;sComboBox57: TsComboBox;
    sComboBox58: TsComboBox;sComboBox59: TsComboBox;sComboBox60: TsComboBox;sComboBox61: TsComboBox;sComboBox62: TsComboBox;sComboBox63: TsComboBox;
    sComboBox64: TsComboBox;sComboBox65: TsComboBox;sComboBox66: TsComboBox;sComboBox67: TsComboBox;sComboBox68: TsComboBox;sComboBox69: TsComboBox;
    sComboBox70: TsComboBox;sComboBox71: TsComboBox;sComboBox72: TsComboBox;sComboBox6: TsComboBox;sComboBox7: TsComboBox;sComboBox8: TsComboBox;
    sComboBox73: TsComboBox;sComboBox74: TsComboBox;sComboBox75: TsComboBox;sComboBox76: TsComboBox;
//  sEdit Components
    sEdit15: TsEdit;sEdit56: TsEdit;sEdit57: TsEdit;sEdit2: TsEdit;sEdit4: TsEdit;sEdit3: TsEdit;sEdit8: TsEdit;sEdit10: TsEdit;sEdit6: TsEdit;sEdit9: TsEdit;
    sEdit7: TsEdit;sEdit11: TsEdit;sEdit5: TsEdit;sEdit58: TsEdit;sEdit59: TsEdit;sEdit60: TsEdit;sEdit61: TsEdit;sEdit62: TsEdit;sEdit63: TsEdit;sEdit64: TsEdit;
    sEdit1: TsEdit;sEdit53: TsEdit;sEdit65: TsEdit;sEdit66: TsEdit;sEdit54: TsEdit;sEdit55: TsEdit;sEdit74: TsEdit;
    sEdit75: TsEdit;sEdit76: TsEdit;sEdit77: TsEdit;sEdit78: TsEdit;sEdit79: TsEdit;sEdit80: TsEdit;sEdit81: TsEdit;sEdit82: TsEdit;sEdit83: TsEdit;sEdit84: TsEdit;
    sEdit85: TsEdit;sEdit86: TsEdit;sEdit87: TsEdit;sEdit88: TsEdit;sEdit89: TsEdit;sEdit90: TsEdit;sEdit91: TsEdit;sEdit92: TsEdit;sEdit93: TsEdit;sEdit94: TsEdit;
    sEdit95: TsEdit;sEdit98: TsEdit;sEdit99: TsEdit;sEdit100: TsEdit;sEdit101: TsEdit;sEdit102: TsEdit;sEdit103: TsEdit;sEdit104: TsEdit;sEdit105: TsEdit;
    sEdit106: TsEdit;sEdit107: TsEdit;sEdit108: TsEdit;sEdit109: TsEdit;sEdit110: TsEdit;sEdit111: TsEdit;sEdit112: TsEdit;sEdit113: TsEdit;sEdit114: TsEdit;
    sEdit115: TsEdit;sEdit116: TsEdit;sEdit117: TsEdit;sEdit118: TsEdit;sEdit119: TsEdit;sEdit120: TsEdit;sEdit121: TsEdit;sEdit122: TsEdit;sEdit123: TsEdit;
    sEdit124: TsEdit;sEdit96: TsEdit;sEdit97: TsEdit;sEdit12: TsEdit;sEdit13: TsEdit;sEdit16: TsEdit;sEdit17: TsEdit;sEdit125: TsEdit;
//  sBitBtn Components
    sBitBtn3: TsBitBtn;sBitBtn4: TsBitBtn;sBitBtn5: TsBitBtn;sBitBtn2: TsBitBtn;sBitBtn6: TsBitBtn;sBitBtn7: TsBitBtn;sBitBtn8: TsBitBtn;sBitBtn9: TsBitBtn;
    sBitBtn10: TsBitBtn;sBitBtn11: TsBitBtn;sBitBtn12: TsBitBtn;sBitBtn13: TsBitBtn;sBitBtn14: TsBitBtn;sBitBtn15: TsBitBtn;sBitBtn16: TsBitBtn;sBB_apply_ce_themes: TsBitBtn;
    sBitBtn17: TsBitBtn;sBitBtn18: TsBitBtn;sBitBtn19: TsBitBtn;sBitBtn20: TsBitBtn;sBitBtn21: TsBitBtn;sBitBtn22: TsBitBtn;sBitBtn23: TsBitBtn;sBitBtn24: TsBitBtn;
    sBitBtn25: TsBitBtn;sBitBtn26: TsBitBtn;sBitBtn34: TsBitBtn;sBitBtn33: TsBitBtn;sBitBtn32: TsBitBtn;sBitBtn31: TsBitBtn;sBitBtn30: TsBitBtn;sBitBtn29: TsBitBtn;
    sBitBtn28: TsBitBtn;sBitBtn27: TsBitBtn;sBitBtn35: TsBitBtn;sBitBtn36: TsBitBtn;sBitBtn37: TsBitBtn;sBitBtn38: TsBitBtn;sBitBtn39: TsBitBtn;sBitBtn40: TsBitBtn;
    sBitBtn41: TsBitBtn;sBitBtn42: TsBitBtn;sBitBtn43: TsBitBtn;sBitBtn44: TsBitBtn;sBitBtn45: TsBitBtn;sBitBtn46: TsBitBtn;sBitBtn47: TsBitBtn;sBitBtn48: TsBitBtn;
    sBitBtn49: TsBitBtn;sBitBtn55: TsBitBtn;sBitBtn56: TsBitBtn;sBitBtn57: TsBitBtn;sBitBtn58: TsBitBtn;sBitBtn59: TsBitBtn;sBitBtn60: TsBitBtn;sBitBtn61: TsBitBtn;
    sBitBtn62: TsBitBtn;sBitBtn63: TsBitBtn;sBitBtn64: TsBitBtn;sBitBtn50: TsBitBtn;sBitBtn51: TsBitBtn;sBitBtn52: TsBitBtn;sBitBtn53: TsBitBtn;sBitBtn54: TsBitBtn;
    sBitBtn65: TsBitBtn;sBitBtn66: TsBitBtn;sBitBtn67: TsBitBtn;sBitBtn68: TsBitBtn;sBitBtn69: TsBitBtn;sBitBtn70: TsBitBtn;sBitBtn71: TsBitBtn;sBitBtn72: TsBitBtn;
    sBitBtn73: TsBitBtn;sBitBtn74: TsBitBtn;sBitBtn75: TsBitBtn;sBitBtn76: TsBitBtn;sBitBtn77: TsBitBtn;sBitBtn78: TsBitBtn;sBitBtn79: TsBitBtn;sBitBtn80: TsBitBtn;
    sBitBtn81: TsBitBtn;sBitBtn82: TsBitBtn;sBitBtn83: TsBitBtn;sBitBtn84: TsBitBtn;sBitBtn85: TsBitBtn;sBitBtn86: TsBitBtn;sBitBtn87: TsBitBtn;sBitBtn88: TsBitBtn;
    sBitBtn89: TsBitBtn;sBitBtn90: TsBitBtn;sBitBtn91: TsBitBtn;sBitBtn92: TsBitBtn;sBitBtn93: TsBitBtn;sBitBtn96: TsBitBtn;sBitBtn97: TsBitBtn;sBitBtn94: TsBitBtn;
    sBitBtn95: TsBitBtn;sBitBtn1: TsBitBtn;sBitBtn98: TsBitBtn;sBitBtn99: TsBitBtn;sBitBtn100: TsBitBtn;sBitBtn101: TsBitBtn;sBitBtn103: TsBitBtn;
    sBitBtn104: TsBitBtn;
//  image Components
    img1: TImage;img2: TImage;img_ce_theme: TImage;img85: TImage;img86: TImage;img87: TImage;img88: TImage;
    Menu_Image: TLMDNImage;
//  Radio Button Components
    rb3: TRadioButton;rb4: TRadioButton;rb5: TRadioButton;rb6: TRadioButton;rb9: TRadioButton;rb10: TRadioButton;rb13: TRadioButton;rb14: TRadioButton;rb15: TRadioButton;rb16: TRadioButton;rb17: TRadioButton;rb18: TRadioButton;
    rb19: TRadioButton;rb20: TRadioButton;rb21: TRadioButton;rb22: TRadioButton;rb23: TRadioButton;rb24: TRadioButton;rb25: TRadioButton;rb26: TRadioButton;
    rb27: TRadioButton;rb28: TRadioButton;rb29: TRadioButton;rb30: TRadioButton;rb1: TRadioButton;rb2: TRadioButton;rb31: TRadioButton;rb32: TRadioButton;
    rb33: TRadioButton;rb34: TRadioButton;rb35: TRadioButton;rb39: TRadioButton;rb40: TRadioButton;rb41: TRadioButton;rb42: TRadioButton;rb43: TRadioButton;
    rb44: TRadioButton;rb45: TRadioButton;rb46: TRadioButton;rb47: TRadioButton;rb48: TRadioButton;rb49: TRadioButton;rb50: TRadioButton;rb51: TRadioButton;
    rb52: TRadioButton;rb53: TRadioButton;rb54: TRadioButton;rb55: TRadioButton;rb36: TRadioButton;rb37: TRadioButton;rb38: TRadioButton;rb56: TRadioButton;
    rb57: TRadioButton;
//  TsScrollBar Components
    sbar_mame_valumeattenuation: TsScrollBar;sbar_mame_audiolatency: TsScrollBar;sbar_mame_joysdeadzone: TsScrollBar;sbar_mame_threadpriority: TsScrollBar;
    sbar_mame_Fgamma: TsScrollBar;sbar_mame_Fbrightness: TsScrollBar;sbar_mame_Fcontrast: TsScrollBar;sbar_mame_pausebrightness: TsScrollBar;
    sbar_mame_gammacorrection: TsScrollBar;sbar_mame_brightnesscorrection: TsScrollBar;sbar_mame_contrastcorrection: TsScrollBar;
    sbar_mame_emulatrionspeed: TsScrollBar;sbar_mame_secondstorun: TsScrollBar;sbar_mame_scalescreen: TsScrollBar;sbar_mame_joysaturation: TsScrollBar;
    sbar_mame_beamwidth: TsScrollBar;sbar_mame_flicker: TsScrollBar;sbar_psx_gamma: TsScrollBar;sbar_psx_brightness: TsScrollBar;sbar_psx_contrast: TsScrollBar;
    sbar_psx_latency: TsScrollBar;sbar_psx_xalatency: TsScrollBar;sbar_kigb_soundvolume: TsScrollBar;sbar_kigb_soundpan: TsScrollBar;
    sbar_Mame_UITransparent_MamePlus: TsScrollBar;sbar_Mame_UITransparent_MameXT: TsScrollBar;
//  TsButton Components
    sButton22: TsButton;sButton1: TsButton;sButton2: TsButton;sButton3: TsButton;sButton4: TsButton;sButton5: TsButton;sButton6: TsButton;sButton7: TsButton;
    sButton8: TsButton;sButton9: TsButton;
//  TsAlphaImageList Components
    InBitBtn_Imagelist: TsAlphaImageList;
//  TsLabelFX Components
    sLabelFX3: TsLabelFX;sLabelFX10: TsLabelFX;sLabelFX11: TsLabelFX;sLabelFX12: TsLabelFX;
//  TsGauge Components
    sGauge1: TsGauge;sGauge2: TsGauge;sGauge_MameData: TsGauge;sGauge_IPSMamePlus: TsGauge;sGauge_IPSMameXT: TsGauge;
    sGauge_MameChange: TsGauge;
//  Memo Components
    mmo2: TMemo;
//  sWebLabel Components
    sWebLabel2: TsWebLabel;sWebLabel1: TsWebLabel;sWebLabel3: TsWebLabel;
//  sCheckListBox Components
    sCheckListBox1: TsCheckListBox;
//  ListBox Components
    sLB_ce_themes: TsListBox;
//  spin Components
    se1: TSpinEdit;
//  Font Components
    LMDFontComboBox1: TLMDFontComboBox;LMDFontSizeComboBox1: TLMDFontSizeComboBox;
//  UnKnow Panels
    sPanel1: TsPanel;pnl1: TPanel;pnl2: TPanel;pnl3: TPanel;pnl4: TPanel;
    sBitBtn102: TsBitBtn;


    procedure sButton17Click(Sender: TObject);
    procedure sComboBox22Change(Sender: TObject);
    procedure sComboBox23Change(Sender: TObject);
    procedure sComboBox24Change(Sender: TObject);
    procedure sComboBox25Change(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
    procedure pnl1Click(Sender: TObject);
    procedure sCheckBox127Click(Sender: TObject);
    procedure sBitBtn44Click(Sender: TObject);
    procedure sBitBtn43Click(Sender: TObject);
    procedure sBitBtn45Click(Sender: TObject);
    procedure sBitBtn46Click(Sender: TObject);
    procedure rb56Click(Sender: TObject);
    procedure rb57Click(Sender: TObject);
//  Main form actions
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
//  Global Settings
    // KeyMap
    procedure CheckUpKey(Sender: TObject);
    procedure tmr_presskeyTimer(Sender: TObject);
    // Find files or Find Dirs
    procedure Find_DirsClose(Sender: TObject);
    procedure Find_FilesClose(Sender: TObject);
    procedure Find_FilesCanClose(Sender: TObject; var CanClose: Boolean);
    // Timers
    procedure tmr1Timer(Sender: TObject);
//  Menu
    procedure HitButtonMenu(Sender:TObject);
    procedure MouseInButtonMenu(Sender: TObject);
    procedure MouseOutButtonMenu(Sender: TObject);
//  confEditor
    procedure confEditor_Config_Set(Sender: TObject);
    procedure confEditor_Themes_Set(Sender: TObject);
//  ExtraFE
    //(None Yet)
//  Mame
    procedure Mame_ManageDirectories(Sender: TObject);
    procedure sCheckListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Mame_ManageGraphics(Sender: TObject);
    procedure Mame_ManageSound(Sender: TObject);
    procedure Mame_ManageOthers(Sender: TObject);
    procedure Mame_ManageBuilds(Sender: TObject);
    procedure nxtgrd_ips_mameplusCellClick(Sender: TObject; ACol,ARow: Integer);
    procedure nxtgrd_ips_mameplusExpand(Sender: TObject; ARow: Integer);
    procedure nxtgrd_ips_mamextCellClick(Sender: TObject; ACol,ARow: Integer);
    procedure nxtgrd_ips_mamextExpand(Sender: TObject; ARow: Integer);
    procedure Mame_ManageDatabase(Sender: TObject);
    procedure Mame_GlobalOrTopicSave(Sender: TObject);
//  Zinc
    procedure Zinc_ConfigPaths(Sender: TObject);
    procedure Zinc_ClickGraphicsState(Sender: TObject);
    procedure Zinc_SoundChecking(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
//New Version 0.3.0
  Conf: TConf;
  Cmenustate,CurrentPanel,Program_Path,ConfEditor_ImagePath,CDirPath: string;
  gFindFiles,gFindDirs: string;
  resolutions: TStringList; //List with all avialable graphic card resolutions
  FGa: TGauseStream;
//Mame Global Vars
  Mame_Global_MemoIni: TMemo;

implementation

Uses
  Mame,psx,psx2,mainconf;


{$R *.dfm}
{$R resfiles/mycursors.res}

procedure TConf.FormCreate(Sender: TObject);
begin
  StartConfEditor;
end;

procedure TConf.Find_DirsClose(Sender: TObject);
begin
  global_Find_DirsClose;
end;

procedure TConf.Find_FilesClose(Sender: TObject);
begin
  global_Find_FilesClose;
end;

procedure TConf.Find_FilesCanClose(Sender: TObject; var CanClose: Boolean);
begin
  global_Find_FilesCanClose;
end;

procedure TConf.sButton17Click(Sender: TObject);
begin
  pSXStats;
end;

procedure TConf.FormDestroy(Sender: TObject);
begin
  RealpSXIni.Free;
  Mame_Global_MemoIni.Free;
  GamePlayTime_Memo.Free;
end;

procedure TConf.sComboBox22Change(Sender: TObject);
begin
    pSXsoundDeviceCheck;
end;

procedure TConf.sComboBox23Change(Sender: TObject);
begin
    pSXcdromDriverCheck;
end;

procedure TConf.sComboBox24Change(Sender: TObject);
begin
    pSXsubcodeCheck;
end;

procedure TConf.sComboBox25Change(Sender: TObject);
begin
    pSXscreenshotFormatCheck;
end;

procedure TConf.sBitBtn4Click(Sender: TObject);
begin
    HistoryButtonFindClick;
end;

procedure TConf.sBitBtn5Click(Sender: TObject);
begin
    MameInfoButtonFindClick;
end;

procedure TConf.tmr1Timer(Sender: TObject);
begin
  ChangeStatusInfo;
  {img1.Visible := False;
  img2.Visible := False;
  tmr1.Enabled := False;}
end;

procedure TConf.pnl1Click(Sender: TObject);
begin
  frm_color.ShowModal;
end;

procedure TConf.sCheckBox127Click(Sender: TObject);
begin
  ShowOnlySetupedMameBuilds;
end;

procedure TConf.sBitBtn44Click(Sender: TObject);
begin
  BuildsClick;
end;

procedure TConf.sBitBtn43Click(Sender: TObject);
begin
  ToolsClick;
end;

procedure TConf.sBitBtn45Click(Sender: TObject);
begin
  Builds_MamePlus;
end;

procedure TConf.sBitBtn46Click(Sender: TObject);
begin
  Builds_MameXT;
end;

procedure TConf.rb56Click(Sender: TObject);
begin
  Tools_SystemFont_RadioButtonClick;
end;

procedure TConf.rb57Click(Sender: TObject);
begin
  Tools_DirectoryFont_RadioButtonClick;
end;

procedure TConf.nxtgrd_ips_mameplusCellClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  IpsMamePlus_CellClick(Acol,Arow);
end;

procedure TConf.nxtgrd_ips_mameplusExpand(Sender: TObject; ARow: Integer);
begin
  IpsMamePlus_Expand(ARow);
end;

procedure TConf.nxtgrd_ips_mamextCellClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  IpsMameXT_CellClick(Acol,Arow);
end;

procedure TConf.nxtgrd_ips_mamextExpand(Sender: TObject; ARow: Integer);
begin
  IpsMameXT_Expand(ARow);
end;

procedure TConf.CheckUpKey(Sender: TObject);
var
  keyCode : Integer;
  PrevKey : String; 
begin
  tmr_presskey.Enabled := True;
  RestoreTheOriginalColor;
  PrevKey := TsPanel(Sender).Caption;
  TsPanel(Sender).Color := clSkyBlue;
  TsPanel(Sender).Caption := 'Waiting...';
  Application.ProcessMessages;
  if Pem_psx_sound.Tag = 1 then
    sLabel108.Caption := 'Hit KEY for '+ TsPanel(Sender).Hint;
  repeat
    Application.ProcessMessages;  // let other messages happen
    Sleep(30);                     // relinquish time for other processes
    keyCode:=KeyPressed;
  until keyCode>=0;
  CheckedTimes := 0;
  CheckForHittingKey;
  if CheckedTimes > 0 then
    begin
      TsPanel(Sender).Color := clBtnFace;
      TsPanel(Sender).Caption := PrevKey;
      if Pem_psx_sound.Tag = 1 then
        sLabel108.Caption := 'This key already used.'
      else if Pem_psx_others.Tag = 1 then
        sLabel129.Caption := 'This key already used.';
      Application.ProcessMessages;
    end
  else
    begin
      TsPanel(Sender).Caption := VirtualKeyCodeToKeyName(keyCode);
      TsPanel(Sender).Color := clBtnFace;
      if Pem_psx_sound.Tag = 1 then
        sLabel108.Caption := ''
      else if Pem_psx_others.Tag = 1 then
        sLabel129.Caption := '';
      Application.ProcessMessages;
    end;
  tmr_presskey.Enabled := False;
end;

procedure TConf.tmr_presskeyTimer(Sender: TObject);
begin
  if (Pem_psx_sound.Tag = 1) or  (Pem_psx_others.Tag = 1) then
    CheckForHittingKey;
end;

procedure TConf.HitButtonMenu(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Button_1' then
    MenuButton1
  else if TsBitBtn(Sender).Hint = 'Button_2' then
    MenuButton2
  else if TsBitBtn(Sender).Hint = 'Button_3' then
    MenuButton3
  else if TsBitBtn(Sender).Hint = 'Button_4' then
    MenuButton4
  else if TsBitBtn(Sender).Hint = 'Button_5' then
    MenuButton5
  else if TsBitBtn(Sender).Hint = 'Button_6' then
    MenuButton6
  else if TsBitBtn(Sender).Hint = 'Button_7' then
    MenuButton7
  else if TsBitBtn(Sender).Hint = 'Button_8' then
    MenuButton8
  else if TsBitBtn(Sender).Hint = 'Button_9' then
    MenuButton9
  else if TsBitBtn(Sender).Hint = 'Button_10' then
    MenuButton10
  else if TsBitBtn(Sender).Hint = 'Button_back' then
    MenuBackButton;
end;

procedure TConf.MouseInButtonMenu(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Button_1' then
    ShowMouseEnterButton(6)
  else if TsBitBtn(Sender).Hint = 'Button_2' then
    ShowMouseEnterButton(7)
  else if TsBitBtn(Sender).Hint = 'Button_3' then
    ShowMouseEnterButton(8)
  else if TsBitBtn(Sender).Hint = 'Button_4' then
    ShowMouseEnterButton(9)
  else if TsBitBtn(Sender).Hint = 'Button_5' then
    ShowMouseEnterButton(10)
  else if TsBitBtn(Sender).Hint = 'Button_6' then
    ShowMouseEnterButton(11);
  {else if TsBitBtn(Sender).Hint = 'Button_7' then
    ShowMouseEnterButton(12)
  else if TsBitBtn(Sender).Hint = 'Button_8' then
    ShowMouseEnterButton(13)
  else if TsBitBtn(Sender).Hint = 'Button_9' then
    ShowMouseEnterButton(14)
  else if TsBitBtn(Sender).Hint = 'Button_10' then
    ShowMouseEnterButton(15)}
end;

procedure TConf.MouseOutButtonMenu(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Button_1' then
    ShowMouseLeaveButton(6)
  else if TsBitBtn(Sender).Hint = 'Button_2' then
    ShowMouseLeaveButton(7)
  else if TsBitBtn(Sender).Hint = 'Button_3' then
    ShowMouseLeaveButton(8)
  else if TsBitBtn(Sender).Hint = 'Button_4' then
    ShowMouseLeaveButton(9)
  else if TsBitBtn(Sender).Hint = 'Button_5' then
    ShowMouseLeaveButton(10)
  else if TsBitBtn(Sender).Hint = 'Button_6' then
    ShowMouseLeaveButton(11);
  {else if TsBitBtn(Sender).Hint = 'Button_7' then
    ShowMouseLeaveButton(12)
  else if TsBitBtn(Sender).Hint = 'Button_8' then
    ShowMouseLeaveButton(13)
  else if TsBitBtn(Sender).Hint = 'Button_9' then
    ShowMouseLeaveButton(14)
  else if TsBitBtn(Sender).Hint = 'Button_10' then
    ShowMouseLeaveButton(15)}
end;

procedure TConf.Zinc_ClickGraphicsState(Sender: TObject);
begin
  if TRadioButton(Sender).Hint = 'OpenGL' then
    UseZinc_OpenGL_Settings
  else if TRadioButton(Sender).Hint = 'D3D' then
    UseZinc_D3D_Settings;
end;

procedure TConf.Zinc_ConfigPaths(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Zinc_exe' then
    AddZincExe_Path
  else if TsBitBtn(Sender).Hint = 'Zinc_roms' then
    AddZincRoms_Path
  else if TsBitBtn(Sender).Hint = 'Zinc_snaps' then
    AddZincSnaps_Path;
end;

procedure TConf.Zinc_SoundChecking(Sender: TObject);
begin
  if TsCheckBox(Sender).Hint = 'Filter' then
    Zinc_FilterEnabled
  else if TsCheckBox(Sender).Hint = 'Surround' then
    Zinc_SurroundLiteEnabled;
end;

procedure TConf.confEditor_Config_Set(Sender: TObject);
begin
  if TsCheckBox(Sender).Hint = 'Help_in_main_panel' then
    CheckShowHelpInMainPanel
  else if TsCheckBox(Sender).Hint = 'Show_path_in_main_form' then
    CheckShowHelpInFormCaption
  else if TsComboBox(Sender).Hint = 'Window_effect_type' then
    WindowsEffectsType
  else if TSpinEdit(Sender).Hint = 'Window_effect_time' then
    WindowsEffectsTimeChange;
end;

procedure TConf.confEditor_Themes_Set(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Apply_themes' then
    click_apply_ce_themes
  else if TsListBox(Sender).Hint = 'Select_Themes' then
    Click_ce_Themes;
end;

procedure TConf.Mame_ManageDirectories(sender: TObject);
begin
  if TsBitBtn(sender).Hint = 'Find_Mame' then
    GetMame
  else if TsBitBtn(sender).Hint = 'Select_mame_button_up' then
    SelectMameUp
  else if TsBitBtn(sender).Hint = 'Select_mame_button_down' then
    SelectMameDown
  else if TsBitBtn(sender).Hint = 'Show_results_from_rom_paths' then
    ShowRomPathResults
  else if TsComboBox(sender).Hint = 'Add_or_Choose_rom_directories' then
    MameChooseRomsDirsOrAdd
  else if TsBitBtn(sender).Hint = 'Left_page_of_mame_dirs' then
    LeftPageDirs
  else if TsBitBtn(sender).Hint = 'Right_page_of_mame_dirs' then
    RightPageDirs
  else if TsBitBtn(sender).Hint = 'Mame_snapshots' then
    GetMamePath('mamesnapshots')
  else if TsBitBtn(sender).Hint = 'Mame_samples' then
    GetMamePath('mamesamples')
  else if TsBitBtn(sender).Hint = 'Mame_cabinets' then
    GetMamePath('mamecabinets')
  else if TsBitBtn(sender).Hint = 'Mame_flyers' then
    GetMamePath('mameflyers')
  else if TsBitBtn(sender).Hint = 'Mame_marquees' then
    GetMamePath('mamemarquees')
  else if TsBitBtn(sender).Hint = 'Mame_control_panels' then
    GetMamePath('mamecontrolpanels')
  else if TsBitBtn(sender).Hint = 'Mame_pcbs' then
    GetMamePath('mamepcbs')
  else if TsBitBtn(sender).Hint = 'Mame_artwork_preview' then
    GetMamePath('mameartworkpreview')
  else if TsBitBtn(sender).Hint = 'Mame_titles' then
    GetMamePath('mametitles')
  else if TsBitBtn(sender).Hint = 'Mame_select' then
    GetMamePath('mameselect')
  else if TsBitBtn(sender).Hint = 'Mame_scores' then
    GetMamePath('mamescores')
  else if TsBitBtn(sender).Hint = 'Mame_bosses' then
    GetMamePath('mamebosses')
  else if TsBitBtn(sender).Hint = 'Mame_crosshair' then
    GetMamePath('mamecrosshair')
  else if TsBitBtn(sender).Hint = 'Mame_artwork' then
    GetMamePath('mameartwork')
  else if TsBitBtn(sender).Hint = 'Mame_state' then
    GetMamePath('mamestate')
  else if TsBitBtn(sender).Hint = 'Mame_input' then
    GetMamePath('mameinputfiles');
end;

procedure TConf.sCheckListBox1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
//    else if TsCheckListBox(sender).Hint = 'Show_mame_builds' then
    ListBoxOfSetupedMames(Index,Rect)
end;

procedure TConf.Mame_ManageGraphics(Sender: TObject);
begin
  if TsScrollBar(Sender).Hint = 'Change_emulation_speed' then
    MameEmulationSpeedChange
  else if TsComboBox(Sender).Hint = 'Change_rotation' then
    MameRotationChange
  else if TsScrollBar(Sender).Hint = 'Change_pause_brightness' then
    MamePauseChange
  else if TsScrollBar(Sender).Hint = 'Change_gamma' then
    MameGammaChange
  else if TsScrollBar(Sender).Hint = 'Change_brightness' then
    MameBrightnessChange
  else if TsScrollBar(Sender).Hint = 'Change_contrast' then
    MameContrastChange
  else if TsComboBox(Sender).Hint = 'Change_video_mode' then
    MameVideoModeChange('')
  else if TsScrollBar(Sender).Hint = 'Change_fullscreen_gamma' then
    MameFullscreenGammaChange
  else if TsScrollBar(Sender).Hint = 'Change_fullscreen_brightness' then
    MameFullscreenBrightnessChange
  else if TsScrollBar(Sender).Hint = 'Change_fullscreen_contrast' then
    MameFullscreenContrastChange
  else if TsScrollBar(Sender).Hint = 'Change_seconds_to_run' then
    MameSecondsToRunChange
  else if TsScrollBar(Sender).Hint = 'Change_scale_screen' then
    MameScaleScreenChange
  else if TsBitBtn(Sender).Hint = 'Choose_effect' then
    MameChooseEffect
  else if TsBitBtn(Sender).Hint = 'Reset_effect' then
    MameResetEffects
  else if TsComboBox(Sender).Hint = 'Change_per_window_video_mode' then
    MamePerWindowVideoChange(Conf.sComboBox4.Text,'',False)
  else if TsComboBox(Sender).Hint = 'Change_per_window_physical_monitor' then
    MamePerWindowVideoChange(sComboBox4.Text,'',True)
  else if TsComboBox(Sender).Hint = 'Change_per_window_aspect' then
    MamePerWindowVideoChange(sComboBox4.Text,'aspect',True)
  else if TsComboBox(Sender).Hint = 'Change_per_window_resolution' then
    MamePerWindowVideoChange(sComboBox4.Text,'resolution',True)
  else if TsComboBox(Sender).Hint = 'Change_per_window_view' then
    MamePerWindowVideoChange(sComboBox4.Text,'view',True);
end;

procedure TConf.Mame_ManageSound(Sender: TObject);
begin
  if TsScrollBar(Sender).Hint = 'Change_joystick_deadzone' then
    MameJoyDeadzoneChange
  else if TsScrollBar(Sender).Hint = 'Change_joystick_saturation' then
    MameJoySaturationChange
  else if TsBitBtn(Sender).Hint = 'Choose_joystick_map' then
    MameChooseJoystickMap
  else if TsBitBtn(Sender).Hint = 'Reset_joystick_map' then
    MameResetJoystickMap
  else if TsScrollBar(Sender).Hint = 'Change_volume_attenuation' then
    MameValumeAttenuationChange
  else if TsScrollBar(Sender).Hint = 'Change_audio_latency' then
    MameAudioLatencyChange;
end;

procedure TConf.Mame_ManageOthers(Sender: TObject);
begin
  if TsScrollBar(Sender).Hint = 'Change_thread_priority' then
    MameThreadPriorityChange
  else if TsScrollBar(Sender).Hint = 'Change_beam_width' then
    MameBeamWidthChange
  else if TsScrollBar(Sender).Hint = 'Change_flicker' then
    MameFlickerChange
end;

procedure TConf.Mame_ManageBuilds(Sender: TObject);
begin
  if TsCheckBox(Sender).Hint = 'Mplus_check_hiscore' then
    HiScorePath_MamePlus
  else if TsBitBtn(Sender).Hint = 'Mplus_find_hiscore' then
    FindHiScoreDat_MamePlus
  else if TsScrollBar(Sender).Hint = 'Mplus_change_ui_transparent' then
    MameUITrasparentChange_MamePlus
  else if TsCheckBox(Sender).Hint = 'Mplus_enable_ips' then
    IPSEnableClick_MamePlus
  else if TsBitBtn(Sender).Hint = 'Mplus_find_ips' then
    FindIPSDir_MamePlus
  else if TsCheckBox(Sender).Hint = 'Mxt_check_hiscore' then
    HiScorePath_MameXT
  else if TsBitBtn(Sender).Hint = 'Mxt_find_hiscore' then
    FindHiScoreDat_MameXT
  else if TsScrollBar(Sender).Hint = 'Mxt_change_ui_transparent' then
    MameUITrasparentChange_MameXT
  else if TsCheckBox(Sender).Hint = 'Mxt_enable_ips' then
    IPSEnableClick_MameXT
  else if TsBitBtn(Sender).Hint = 'Mxt_find_ips' then
    FindIPSDir_MameXT
  else if TsComboBox(Sender).Hint = 'Mxt_get_games_count_times' then
    GetMameXT_Game_CountTime
  else if TsBitBtn(Sender).Hint = 'Mxt_zero_games_count_times' then
    ZeroPlayTime_Count(sComboBox76.Text)
  else if TLMDFontComboBox(Sender).Hint = 'Tools_change_font' then
    Tools_FontComboBoxChange
  else if TsBitBtn(Sender).Hint = 'Tools_find_font' then
    Tools_FindFontFromDirClick
  else if TLMDFontSizeComboBox(Sender).Hint = 'Tools_change_font_size' then
    Tools_FontSizeComboBoxChange
  else if TsBitBtn(Sender).Hint = 'Tools_create_font' then
    Tools_CreateFont;
end;

procedure TConf.Mame_ManageDatabase(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Erase_dir_data' then
    EraseMameDir(sComboBox72.Text)
  else if TsComboBox(Sender).Hint = 'Show_statistics' then
    ShowDatabaseStatsFor(sComboBox72.Text)
end;

procedure TConf.Mame_GlobalOrTopicSave(Sender: TObject);
begin
  if TsButton(Sender).Hint = 'Mame_save_global_button' then
    ResetMameConfig_Global
  else if TsButton(Sender).Hint = 'Mame_save_topic_dirs_button' then
    ResetToDefaultTopic_MameDirs
  else if TsButton(Sender).Hint = 'Mame_save_topic_builds_button' then
    ResetToDefaultTopic_MameBuilds
  else if TsButton(Sender).Hint = 'Mame_save_topic_graphics_button' then
    ResetToDefaultTopic_MameGraphics
  else if TsButton(Sender).Hint = 'Mame_save_topic_others_button' then
    ResetToDefaultTopic_MameOthers
  else if TsButton(Sender).Hint = 'Mame_save_topic_sound_button' then
    ResetToDefaultTopic_MameSound;
end;

end.
