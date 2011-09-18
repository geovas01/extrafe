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
  LMDCustomNImage, LMDNImage;


const
  AniArrow = 1;AniText = 2;AniLink = 3;AniBusy = 4;AniHorizontal = 5;AniVertical = 6;AniPrecision = 7;
  AniArrow2 = 8;AniText2 = 9;AniLink2 = 10;AniBusy2 = 11;AniHorizontal2 = 12;AniVertical2 = 13;AniPrecision2 = 14;
  AniArrow3 = 15;AniText3 = 16;AniLink3 = 17;AniBusy3 = 18;AniHorizontal3 = 19;AniVertical3 = 20;AniPrecision3 = 21;
  AniArrow4 = 22;AniText4 = 23;AniLink4 = 24;AniBusy4 = 25;AniHorizontal4 = 26;AniVertical4 = 27;AniPrecision4 = 28;

type
  TConf = class(TForm)
//  StringGrid Components
    nxtgrd_mame: TNextGrid;nxtgrd_ips_mameplus: TNextGrid;nxtgrd_ips_mamext: TNextGrid;
//  Skin Components
    SkinM: TsSkinManager;SkinP: TsSkinProvider;
//  Dialogs Components
    Find_Files: TOpenDialog;
    Find_Dirs: TJvSelectDirectory;
//  Machine Info Components
    SDI1: TSoundDeviceInfo;
    DMI1: TDesktopMonitorInfo;
//  Timers Components
    tmr1: TTimer;
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
    Pem_zinc_paths: TsPanel;Pem_zinc_graphics: TsPanel;Pem_zinc_sound: TsPanel;
//  Hatari Panels
    Pem_hatari_system: TsPanel;Pem_hatari_roms: TsPanel;Pem_hatari_screen: TsPanel;Pem_hatari_joy: TsPanel;
//  pSX Panels
    Pem_psx_paths: TsPanel;Pem_psx_screen: TsPanel;Pem_psx_sound: TsPanel;Pem_psx_others: TsPanel;
//  Kigb Panels
    Pem_kigb_paths: TsPanel;Pem_kigb_screen: TsPanel;Pem_kigb_sound: TsPanel;Pem_kigb_others: TsPanel;
//  Weather Panels
    Pweather: TsPanel;
//  Time Date Panels
    Ptimedate: TsPanel;
//  grp Components
    grp105: TGroupBox;grp106: TGroupBox;grp107: TGroupBox;grp108: TGroupBox;grp109: TGroupBox;grp110: TGroupBox;grp111: TGroupBox;grp112: TGroupBox;
    grp113: TGroupBox;grp114: TGroupBox;grp97: TGroupBox;grp98: TGroupBox;grp99: TGroupBox;grp100: TGroupBox;grp101: TGroupBox;grp103: TGroupBox;
    grp104: TGroupBox;grp96: TGroupBox;grp95: TGroupBox;grp2: TGroupBox;grp3: TGroupBox;grp4: TGroupBox;grp5: TGroupBox;grp6: TGroupBox;grp7: TGroupBox;
    grp8: TGroupBox;grp9: TGroupBox;grp10: TGroupBox;grp11: TGroupBox;grp12: TGroupBox;grp13: TGroupBox;grp14: TGroupBox;grp15: TGroupBox;grp16: TGroupBox;
    grp18: TGroupBox;grp19: TGroupBox;grp20: TGroupBox;grp21: TGroupBox;grp22: TGroupBox;grp23: TGroupBox;grp24: TGroupBox;grp25: TGroupBox;grp26: TGroupBox;
    grp27: TGroupBox;grp28: TGroupBox;grp29: TGroupBox;grp17: TGroupBox;grp30: TGroupBox;grp31: TGroupBox;grp32: TGroupBox;grp33: TGroupBox;grp34: TGroupBox;
    grp35: TGroupBox;grp1: TGroupBox;grp36: TGroupBox;grp37: TGroupBox;grp38: TGroupBox;grp39: TGroupBox;grp40: TGroupBox;grp41: TGroupBox;grp42: TGroupBox;
    grp43: TGroupBox;grp44: TGroupBox;grp49: TGroupBox;grp45: TGroupBox;grp46: TGroupBox;grp47: TGroupBox;grp48: TGroupBox;grp50: TGroupBox;grp51: TGroupBox;
    grp52: TGroupBox;grp53: TGroupBox;grp54: TGroupBox;grp55: TGroupBox;grp56: TGroupBox;grp57: TGroupBox;grp58: TGroupBox;grp59: TGroupBox;grp60: TGroupBox;
    grp61: TGroupBox;grp62: TGroupBox;grp63: TGroupBox;grp64: TGroupBox;grp65: TGroupBox;grp66: TGroupBox;grp67: TGroupBox;grp68: TGroupBox;grp69: TGroupBox;
    grp70: TGroupBox;grp71: TGroupBox;grp72: TGroupBox;grp73: TGroupBox;grp74: TGroupBox;grp75: TGroupBox;grp78: TGroupBox;grp79: TGroupBox;grp80: TGroupBox;
    grp81: TGroupBox;grp82: TGroupBox;grp83: TGroupBox;grp84: TGroupBox;grp85: TGroupBox;grp86: TGroupBox;grp87: TGroupBox;grp88: TGroupBox;grp89: TGroupBox;
    grp90: TGroupBox;grp91: TGroupBox;grp92: TGroupBox;grp93: TGroupBox;grp94: TGroupBox;grp76: TGroupBox;grp77: TGroupBox;grp115: TGroupBox;grp102: TGroupBox;
    grp116: TGroupBox;grp117: TGroupBox;grp118: TGroupBox;grp119: TGroupBox;grp120: TGroupBox;grp121: TGroupBox;grp122: TGroupBox;
//  sLabel Components
    sLabel13: TsLabel;sLabel14: TsLabel;sLabel15: TsLabel;sLabel16: TsLabel;sLabel19: TsLabel;sLabel28: TsLabel;sLabel6: TsLabel;sLabel7: TsLabel;
    sLabel8: TsLabel;sLabel9: TsLabel;sLabel10: TsLabel;sLabel29: TsLabel;sLabel30: TsLabel;sLabel31: TsLabel;sLabel44: TsLabel;sLabel45: TsLabel;
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
    sLabel105: TsLabel;sLabel106: TsLabel;sLabel107: TsLabel;sLabel108: TsLabel;sLabel109: TsLabel;sLabel110: TsLabel;sLabel111: TsLabel;sLabel112: TsLabel;
//  sCheckBox Components
    sCheckBox26: TsCheckBox;sCheckBox16: TsCheckBox;sCheckBox17: TsCheckBox;sCheckBox35: TsCheckBox;sCheckBox36: TsCheckBox;sCheckBox37: TsCheckBox;
    sCheckBox38: TsCheckBox;sCheckBox39: TsCheckBox;sCheckBox3: TsCheckBox;sCheckBox4: TsCheckBox;sCheckBox5: TsCheckBox;sCheckBox6: TsCheckBox;sCheckBox7: TsCheckBox;
    sCheckBox8: TsCheckBox;sCheckBox11: TsCheckBox;sCheckBox12: TsCheckBox;sCheckBox13: TsCheckBox;sCheckBox14: TsCheckBox;sCheckBox15: TsCheckBox;
    sCheckBox40: TsCheckBox;sCheckBox41: TsCheckBox;sCheckBox43: TsCheckBox;sCheckBox1: TsCheckBox;sCheckBox2: TsCheckBox;sCheckBox18: TsCheckBox;
    sCheckBox19: TsCheckBox;sCheckBox20: TsCheckBox;sCheckBox21: TsCheckBox;sCheckBox22: TsCheckBox;sCheckBox23: TsCheckBox;sCheckBox47: TsCheckBox;
    sCheckBox24: TsCheckBox;sCheckBox27: TsCheckBox;sCheckBox28: TsCheckBox;sCheckBox30: TsCheckBox;sCheckBox31: TsCheckBox;sCheckBox48: TsCheckBox;sCheckBox49: TsCheckBox;sCheckBox50: TsCheckBox;sCheckBox51: TsCheckBox;sCheckBox52: TsCheckBox;
    sCheckBox53: TsCheckBox;sCheckBox54: TsCheckBox;sCheckBox55: TsCheckBox;sCheckBox56: TsCheckBox;sCheckBox57: TsCheckBox;sCheckBox58: TsCheckBox;
    sCheckBox59: TsCheckBox;sCheckBox60: TsCheckBox;sCheckBox61: TsCheckBox;sCheckBox62: TsCheckBox;sCheckBox63: TsCheckBox;sCheckBox64: TsCheckBox;
    sCheckBox65: TsCheckBox;sCheckBox66: TsCheckBox;sCheckBox67: TsCheckBox;sCheckBox68: TsCheckBox;sCheckBox69: TsCheckBox;sCheckBox70: TsCheckBox;
    sCheckBox71: TsCheckBox;sCheckBox72: TsCheckBox;sCheckBox73: TsCheckBox;sCheckBox74: TsCheckBox;sCheckBox75: TsCheckBox;sCheckBox76: TsCheckBox;
    sCheckBox77: TsCheckBox;sCheckBox78: TsCheckBox;sCheckBox79: TsCheckBox;sCheckBox80: TsCheckBox;sCheckBox81: TsCheckBox;sCheckBox82: TsCheckBox;
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
    sComboBox34: TsComboBox;sComboBox35: TsComboBox;sComboBox36: TsComboBox;sComboBox37: TsComboBox;sComboBox38: TsComboBox;sComboBox39: TsComboBox;
    sComboBox40: TsComboBox;sComboBox42: TsComboBox;sComboBox41: TsComboBox;sComboBox43: TsComboBox;sComboBox44: TsComboBox;sComboBox45: TsComboBox;
    sComboBox46: TsComboBox;sComboBox47: TsComboBox;sComboBox49: TsComboBox;sComboBox48: TsComboBox;sComboBox50: TsComboBox;sComboBox51: TsComboBox;
    sComboBox52: TsComboBox;sComboBox53: TsComboBox;sComboBox54: TsComboBox;sComboBox55: TsComboBox;sComboBox56: TsComboBox;sComboBox57: TsComboBox;
    sComboBox58: TsComboBox;sComboBox59: TsComboBox;sComboBox60: TsComboBox;sComboBox61: TsComboBox;sComboBox62: TsComboBox;sComboBox63: TsComboBox;
    sComboBox64: TsComboBox;sComboBox65: TsComboBox;sComboBox66: TsComboBox;sComboBox67: TsComboBox;sComboBox68: TsComboBox;sComboBox69: TsComboBox;
    sComboBox70: TsComboBox;sComboBox71: TsComboBox;sComboBox72: TsComboBox;sComboBox6: TsComboBox;sComboBox7: TsComboBox;sComboBox8: TsComboBox;
    sComboBox73: TsComboBox;sComboBox74: TsComboBox;sComboBox75: TsComboBox;sComboBox76: TsComboBox;
//  sEdit Components
    sEdit15: TsEdit;sEdit56: TsEdit;sEdit57: TsEdit;sEdit2: TsEdit;sEdit4: TsEdit;sEdit3: TsEdit;sEdit8: TsEdit;sEdit10: TsEdit;sEdit6: TsEdit;sEdit9: TsEdit;
    sEdit7: TsEdit;sEdit11: TsEdit;sEdit5: TsEdit;sEdit58: TsEdit;sEdit59: TsEdit;sEdit60: TsEdit;sEdit61: TsEdit;sEdit62: TsEdit;sEdit63: TsEdit;sEdit64: TsEdit;
    sEdit1: TsEdit;sEdit14: TsEdit;sEdit18: TsEdit;sEdit35: TsEdit;sEdit36: TsEdit;sEdit37: TsEdit;sEdit38: TsEdit;sEdit39: TsEdit;sEdit40: TsEdit;sEdit41: TsEdit;
    sEdit42: TsEdit;sEdit43: TsEdit;sEdit44: TsEdit;sEdit45: TsEdit;sEdit46: TsEdit;sEdit47: TsEdit;sEdit48: TsEdit;sEdit49: TsEdit;sEdit50: TsEdit;sEdit51: TsEdit;
    sEdit52: TsEdit;sEdit19: TsEdit;sEdit20: TsEdit;sEdit21: TsEdit;sEdit22: TsEdit;sEdit23: TsEdit;sEdit24: TsEdit;sEdit25: TsEdit;sEdit26: TsEdit;sEdit27: TsEdit;
    sEdit28: TsEdit;sEdit29: TsEdit;sEdit30: TsEdit;sEdit31: TsEdit;sEdit32: TsEdit;sEdit33: TsEdit;sEdit34: TsEdit;sEdit53: TsEdit;sEdit65: TsEdit;sEdit66: TsEdit;
    sEdit67: TsEdit;sEdit68: TsEdit;sEdit69: TsEdit;sEdit70: TsEdit;sEdit71: TsEdit;sEdit72: TsEdit;sEdit73: TsEdit;sEdit54: TsEdit;sEdit55: TsEdit;sEdit74: TsEdit;
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
    img1: TImage;img2: TImage;img3: TImage;img4: TImage;img5: TImage;img_ce_theme: TImage;img6: TImage;img7: TImage;img8: TImage;img9: TImage;img10: TImage;img11: TImage;
    img12: TImage;img13: TImage;img14: TImage;img15: TImage;img16: TImage;img17: TImage;img18: TImage;img19: TImage;img20: TImage;img21: TImage;img22: TImage;
    img23: TImage;img24: TImage;img25: TImage;img26: TImage;img27: TImage;img28: TImage;img29: TImage;img30: TImage;img31: TImage;img32: TImage;img33: TImage;
    img34: TImage;img35: TImage;img36: TImage;img37: TImage;img38: TImage;img39: TImage;img40: TImage;img41: TImage;img42: TImage;img43: TImage;img44: TImage;
    img45: TImage;img46: TImage;img47: TImage;img48: TImage;img49: TImage;img50: TImage;img51: TImage;img52: TImage;img53: TImage;img54: TImage;img55: TImage;
    img56: TImage;img57: TImage;img58: TImage;img59: TImage;img60: TImage;img61: TImage;img62: TImage;img63: TImage;img64: TImage;img65: TImage;img66: TImage;
    img67: TImage;img68: TImage;img69: TImage;img70: TImage;img71: TImage;img72: TImage;img73: TImage;img74: TImage;img75: TImage;img76: TImage;img77: TImage;
    img78: TImage;img79: TImage;img80: TImage;img81: TImage;img82: TImage;img83: TImage;img84: TImage;img85: TImage;img86: TImage;img87: TImage;img88: TImage;
    Menu_Image: TLMDNImage;
//  Radio Button Components
    rb3: TRadioButton;rb4: TRadioButton;rb5: TRadioButton;rb6: TRadioButton;rb7: TRadioButton;rb8: TRadioButton;rb9: TRadioButton;rb10: TRadioButton;
    rb11: TRadioButton;rb12: TRadioButton;rb13: TRadioButton;rb14: TRadioButton;rb15: TRadioButton;rb16: TRadioButton;rb17: TRadioButton;rb18: TRadioButton;
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

    procedure FormCreate(Sender: TObject);
    procedure Find_DirsClose(Sender: TObject);
    procedure Find_FilesClose(Sender: TObject);
    procedure Find_FilesCanClose(Sender: TObject; var CanClose: Boolean);
    procedure sComboBox1Select(Sender: TObject);
    procedure sButton17Click(Sender: TObject);
    procedure sbar_mame_scalescreenChange(Sender: TObject);
    procedure sbar_mame_gammacorrectionChange(Sender: TObject);
    procedure sbar_mame_brightnesscorrectionChange(Sender: TObject);
    procedure sbar_mame_contrastcorrectionChange(Sender: TObject);
    procedure sbar_mame_pausebrightnessChange(Sender: TObject);
    procedure sbar_mame_FgammaChange(Sender: TObject);
    procedure sbar_mame_FcontrastChange(Sender: TObject);
    procedure sbar_mame_FbrightnessChange(Sender: TObject);
    procedure sbar_mame_secondstorunChange(Sender: TObject);
    procedure sbar_mame_emulatrionspeedChange(Sender: TObject);
    procedure sbar_mame_valumeattenuationChange(Sender: TObject);
    procedure sbar_mame_audiolatencyChange(Sender: TObject);
    procedure sbar_mame_joysdeadzoneChange(Sender: TObject);
    procedure sbar_mame_joysaturationChange(Sender: TObject);
    procedure sbar_mame_threadpriorityChange(Sender: TObject);
    procedure sbar_mame_beamwidthChange(Sender: TObject);
    procedure sbar_mame_flickerChange(Sender: TObject);
    procedure sComboBox2Change(Sender: TObject);
    procedure sComboBox4Change(Sender: TObject);
    procedure sComboBox20Change(Sender: TObject);
    procedure sBB_apply_ce_themesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sEdit14MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit18MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit35KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit35MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit36MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit36KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit37KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit37MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit38MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit38KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit39KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit39MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit40MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit40KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit41KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit41MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit42MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit42KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit19MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit20MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit21MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit22MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit23MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit24MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit25MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit26MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit27MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit28KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit28MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit29MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit29KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit30KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit30MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit31MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit31KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit32KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit32MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit33MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit33KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit34KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sEdit34MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure sCheckBox10Click(Sender: TObject);
    procedure sComboBox22Change(Sender: TObject);
    procedure sComboBox23Change(Sender: TObject);
    procedure sComboBox24Change(Sender: TObject);
    procedure sComboBox25Change(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure sBitBtn16Click(Sender: TObject);
    procedure sBitBtn6Click(Sender: TObject);
    procedure sBitBtn7Click(Sender: TObject);
    procedure sBitBtn8Click(Sender: TObject);
    procedure sBitBtn7MouseEnter(Sender: TObject);
    procedure sBitBtn7MouseLeave(Sender: TObject);
    procedure sBitBtn6MouseEnter(Sender: TObject);
    procedure sBitBtn6MouseLeave(Sender: TObject);
    procedure sBitBtn8MouseEnter(Sender: TObject);
    procedure sBitBtn8MouseLeave(Sender: TObject);
    procedure sBitBtn9Click(Sender: TObject);
    procedure sBitBtn9MouseEnter(Sender: TObject);
    procedure sBitBtn9MouseLeave(Sender: TObject);
    procedure sBitBtn10MouseEnter(Sender: TObject);
    procedure sBitBtn10MouseLeave(Sender: TObject);
    procedure sBitBtn10Click(Sender: TObject);
    procedure sBitBtn11Click(Sender: TObject);
    procedure sBitBtn12Click(Sender: TObject);
    procedure sBitBtn13Click(Sender: TObject);
    procedure sBitBtn14Click(Sender: TObject);
    procedure sBitBtn15Click(Sender: TObject);
    procedure sLB_ce_themesClick(Sender: TObject);
    procedure sBitBtn11MouseEnter(Sender: TObject);
    procedure sBitBtn11MouseLeave(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sBitBtn18Click(Sender: TObject);
    procedure sBitBtn17Click(Sender: TObject);
    procedure sBitBtn36Click(Sender: TObject);
    procedure sBitBtn37Click(Sender: TObject);
    procedure sBitBtn38Click(Sender: TObject);
    procedure sBitBtn39Click(Sender: TObject);
    procedure sBitBtn40Click(Sender: TObject);
    procedure sBitBtn41Click(Sender: TObject);
    procedure sBitBtn42Click(Sender: TObject);
    procedure pnl1Click(Sender: TObject);
    procedure sBitBtn35Click(Sender: TObject);
    procedure sBitBtn19Click(Sender: TObject);
    procedure sBitBtn20Click(Sender: TObject);
    procedure sBitBtn21Click(Sender: TObject);
    procedure sBitBtn22Click(Sender: TObject);
    procedure sBitBtn23Click(Sender: TObject);
    procedure sBitBtn24Click(Sender: TObject);
    procedure sBitBtn25Click(Sender: TObject);
    procedure sBitBtn26Click(Sender: TObject);
    procedure sBitBtn27Click(Sender: TObject);
    procedure sBitBtn28Click(Sender: TObject);
    procedure sBitBtn29Click(Sender: TObject);
    procedure sBitBtn30Click(Sender: TObject);
    procedure sBitBtn31Click(Sender: TObject);
    procedure sBitBtn32Click(Sender: TObject);
    procedure sBitBtn34Click(Sender: TObject);
    procedure sBitBtn33Click(Sender: TObject);
    procedure sCheckBox127Click(Sender: TObject);
    procedure sComboBox5Change(Sender: TObject);
    procedure sComboBox6Change(Sender: TObject);
    procedure sComboBox7Change(Sender: TObject);
    procedure sComboBox8Change(Sender: TObject);
    procedure sComboBox74Change(Sender: TObject);
    procedure se1Change(Sender: TObject);
    procedure sBitBtn44Click(Sender: TObject);
    procedure sBitBtn43Click(Sender: TObject);
    procedure sBitBtn45Click(Sender: TObject);
    procedure sBitBtn46Click(Sender: TObject);
    procedure rb56Click(Sender: TObject);
    procedure rb57Click(Sender: TObject);
    procedure LMDFontComboBox1Change(Sender: TObject);
    procedure LMDFontSizeComboBox1Change(Sender: TObject);
    procedure sBitBtn103Click(Sender: TObject);
    procedure sBitBtn104Click(Sender: TObject);
    procedure sbar_Mame_UITransparent_MameXTChange(Sender: TObject);
    procedure sbar_Mame_UITransparent_MamePlusChange(Sender: TObject);
    procedure sCheckBox34Click(Sender: TObject);
    procedure nxtgrd_ips_mameplusCellClick(Sender: TObject; ACol,ARow: Integer);
    procedure sCheckBox33Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn98Click(Sender: TObject);
    procedure sBitBtn99Click(Sender: TObject);
    procedure sCheckBox129Click(Sender: TObject);
    procedure sBitBtn100Click(Sender: TObject);
    procedure sComboBox76Change(Sender: TObject);
    procedure nxtgrd_ips_mameplusExpand(Sender: TObject; ARow: Integer);
    procedure sComboBox72Change(Sender: TObject);
    procedure nxtgrd_ips_mamextCellClick(Sender: TObject; ACol,ARow: Integer);
    procedure nxtgrd_ips_mamextExpand(Sender: TObject; ARow: Integer);
    procedure sCheckListBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure sButton4Click(Sender: TObject);
    procedure sButton5Click(Sender: TObject);
    procedure sButton6Click(Sender: TObject);
    procedure sButton7Click(Sender: TObject);
    procedure sButton8Click(Sender: TObject);
    procedure sButton22Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sButton9Click(Sender: TObject);
    procedure sBitBtn101Click(Sender: TObject);
    procedure sCheckBox130Click(Sender: TObject);
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

procedure TConf.sComboBox1Select(Sender: TObject);
begin
  MameChooseRomsDirsOrAdd;
end;

procedure TConf.sButton17Click(Sender: TObject);
begin
  pSXStats;
end;

procedure TConf.sbar_mame_gammacorrectionChange(Sender: TObject);
begin
  MameGammaChange;
end;

procedure TConf.sbar_mame_brightnesscorrectionChange(Sender: TObject);
begin
  MameBrightnessChange;
end;

procedure TConf.sbar_mame_contrastcorrectionChange(Sender: TObject);
begin
  MameContrastChange;
end;

procedure TConf.sbar_mame_pausebrightnessChange(Sender: TObject);
begin
  MamePauseChange;
end;

procedure TConf.sbar_mame_FgammaChange(Sender: TObject);
begin
  MameFullscreenGammaChange;
end;

procedure TConf.sbar_mame_FcontrastChange(Sender: TObject);
begin
  MameFullscreenContrastChange;
end;

procedure TConf.sbar_mame_FbrightnessChange(Sender: TObject);
begin
  MameFullscreenBrightnessChange;
end;

procedure TConf.sbar_mame_secondstorunChange(Sender: TObject);
begin
  MameSecondsToRunChange;
end;

procedure TConf.sbar_mame_scalescreenChange(Sender: TObject);
begin
  MameScaleScreenChange;
end;

procedure TConf.sbar_mame_emulatrionspeedChange(Sender: TObject);
begin
  MameEmulationSpeedChange;
end;

procedure TConf.sbar_mame_valumeattenuationChange(Sender: TObject);
begin
  MameValumeAttenuationChange;
end;

procedure TConf.sbar_mame_audiolatencyChange(Sender: TObject);
begin
  MameAudioLatencyChange;
end;

procedure TConf.sbar_mame_joysdeadzoneChange(Sender: TObject);
begin
  MameJoyDeadzoneChange;
end;

procedure TConf.sbar_mame_joysaturationChange(Sender: TObject);
begin
  MameJoySaturationChange;
end;

procedure TConf.sbar_mame_threadpriorityChange(Sender: TObject);
begin
  MameThreadPriorityChange;
end;

procedure TConf.sbar_mame_beamwidthChange(Sender: TObject);
begin
  MameBeamWidthChange;
end;

procedure TConf.sbar_mame_flickerChange(Sender: TObject);
begin
  MameFlickerChange;
end;

procedure TConf.sComboBox2Change(Sender: TObject);
begin
  MameVideoModeChange('');
end;

procedure TConf.sComboBox4Change(Sender: TObject);
begin
  MamePerWindowVideoChange(Conf.sComboBox4.Text,'',False);
end;

procedure TConf.sComboBox20Change(Sender: TObject);
begin
  MameRotationChange;
end;

procedure TConf.sBB_apply_ce_themesClick(Sender: TObject);
begin
  click_apply_ce_themes;
end;

procedure TConf.FormDestroy(Sender: TObject);
begin
  ConfIni.Free;
  RealpSXIni.Free;
  Mame_Global_MemoIni.Free;
  GamePlayTime_Memo.Free;
end;

procedure TConf.sEdit14MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(35);
end;

procedure TConf.sEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyLeft(Key);
end;

procedure TConf.sEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyRight(Key);
end;

procedure TConf.sEdit18MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(36);
end;

procedure TConf.sEdit35KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyDown(key);
end;

procedure TConf.sEdit35MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(37);
end;

procedure TConf.sEdit36MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(38);
end;

procedure TConf.sEdit36KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyUp(key);
end;

procedure TConf.sEdit37KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyStart(key);
end;

procedure TConf.sEdit37MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(39);
end;

procedure TConf.sEdit38MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(40);
end;

procedure TConf.sEdit38KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeySelect(key);
end;

procedure TConf.sEdit39KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyCircle(key);
end;

procedure TConf.sEdit39MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(41);
end;

procedure TConf.sEdit40MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(42);
end;

procedure TConf.sEdit40KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyTriangle(key);
end;

procedure TConf.sEdit41KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyCross(key);
end;

procedure TConf.sEdit41MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(43);
end;

procedure TConf.sEdit42MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(44);
end;

procedure TConf.sEdit42KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeySquare(key);
end;

procedure TConf.sEdit19MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(19);
end;

procedure TConf.sEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeySoundStatus(key);
end;

procedure TConf.sEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyMuteSound(key);
end;

procedure TConf.sEdit20MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(20);
end;

procedure TConf.sEdit21MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(21);
end;

procedure TConf.sEdit21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyIncVolume(key);
end;

procedure TConf.sEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyDecVolume(key);
end;

procedure TConf.sEdit22MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(22);
end;

procedure TConf.sEdit23MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(23);
end;

procedure TConf.sEdit23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyIncXAVolume(key);
end;

procedure TConf.sEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyDecXAVolume(key);
end;

procedure TConf.sEdit24MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(24);
end;

procedure TConf.sEdit25MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(25);
end;

procedure TConf.sEdit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyFastForward(key);
end;

procedure TConf.sEdit26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyShowVRam(key);
end;

procedure TConf.sEdit26MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(26);
end;

procedure TConf.sEdit27MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(27);
end;

procedure TConf.sEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  pSXKeyStatusDisplay(key);
end;

procedure TConf.sEdit28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyIncGamma(key);
end;

procedure TConf.sEdit28MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(28);
end;

procedure TConf.sEdit29MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(29);
end;

procedure TConf.sEdit29KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyDecGamma(key);
end;

procedure TConf.sEdit30KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyIncBrightness(key);
end;

procedure TConf.sEdit30MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(30);
end;

procedure TConf.sEdit31MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(31);
end;

procedure TConf.sEdit31KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyDecBrightness(key);
end;

procedure TConf.sEdit32KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyIncContrast(key);
end;

procedure TConf.sEdit32MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(32);
end;

procedure TConf.sEdit33MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(33);
end;

procedure TConf.sEdit33KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyDecContrast(key);
end;

procedure TConf.sEdit34KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    pSXKeyScreenshot(key);
end;

procedure TConf.sEdit34MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      RedKey(34);
end;

procedure TConf.rb1Click(Sender: TObject);
begin
    ChooseKeys1Port;
end;

procedure TConf.rb2Click(Sender: TObject);
begin
    ChooseKeys2Port;
end;

procedure TConf.sCheckBox10Click(Sender: TObject);
begin
    pSXinterpolateCheck;
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

procedure TConf.sBitBtn16Click(Sender: TObject);
begin
  MenuBackButton;
end;

procedure TConf.sBitBtn6Click(Sender: TObject);
begin
  MenuButton1;
end;

procedure TConf.sBitBtn7Click(Sender: TObject);
begin
  MenuButton2;
end;

procedure TConf.sBitBtn8Click(Sender: TObject);
begin
  MenuButton3;
end;

procedure TConf.sBitBtn9Click(Sender: TObject);
begin
  MenuButton4;
end;

procedure TConf.sBitBtn10Click(Sender: TObject);
begin
  MenuButton5;
end;

procedure TConf.sBitBtn11Click(Sender: TObject);
begin
  MenuButton6;
end;

procedure TConf.sBitBtn12Click(Sender: TObject);
begin
  MenuButton7;
end;

procedure TConf.sBitBtn13Click(Sender: TObject);
begin
  MenuButton8;
end;

procedure TConf.sBitBtn14Click(Sender: TObject);
begin
  MenuButton9;
end;

procedure TConf.sBitBtn15Click(Sender: TObject);
begin
  MenuButton10;
end;

procedure TConf.sBitBtn6MouseEnter(Sender: TObject);
begin
  ShowMouseEnterButton(6);
end;

procedure TConf.sBitBtn6MouseLeave(Sender: TObject);
begin
  ShowMouseLeaveButton(6);
end;

procedure TConf.sBitBtn7MouseEnter(Sender: TObject);
begin
  ShowMouseEnterButton(7);
end;

procedure TConf.sBitBtn7MouseLeave(Sender: TObject);
begin
  ShowMouseLeaveButton(7);
end;

procedure TConf.sBitBtn8MouseEnter(Sender: TObject);
begin
  ShowMouseEnterButton(8);
end;

procedure TConf.sBitBtn8MouseLeave(Sender: TObject);
begin
  ShowMouseLeaveButton(8);
end;

procedure TConf.sBitBtn9MouseEnter(Sender: TObject);
begin
  ShowMouseEnterButton(9);
end;

procedure TConf.sBitBtn9MouseLeave(Sender: TObject);
begin
  ShowMouseLeaveButton(9);
end;

procedure TConf.sBitBtn10MouseEnter(Sender: TObject);
begin
  ShowMouseEnterButton(10);
end;

procedure TConf.sBitBtn10MouseLeave(Sender: TObject);
begin
  ShowMouseLeaveButton(10);
end;

procedure TConf.sBitBtn11MouseEnter(Sender: TObject);
begin
  ShowMouseEnterButton(11);
end;

procedure TConf.sBitBtn11MouseLeave(Sender: TObject);
begin
  ShowMouseLeaveButton(11);
end;

procedure TConf.sLB_ce_themesClick(Sender: TObject);
begin
  Click_ce_Themes;
end;

procedure TConf.sCheckBox1Click(Sender: TObject);
begin
  CheckShowHelpInMainPanel;
end;

procedure TConf.sCheckBox2Click(Sender: TObject);
begin
  CheckShowHelpInFormCaption;
end;

procedure TConf.sBitBtn18Click(Sender: TObject);
begin
  RightPageDirs;
end;

procedure TConf.sBitBtn17Click(Sender: TObject);
begin
  LeftPageDirs;
end;

procedure TConf.sBitBtn36Click(Sender: TObject);
begin
  SelectMameUp;
end;

procedure TConf.sBitBtn37Click(Sender: TObject);
begin
  SelectMameDown;
end;

procedure TConf.sBitBtn38Click(Sender: TObject);
begin
  MameChooseEffect;
end;

procedure TConf.sBitBtn39Click(Sender: TObject);
begin
  MameResetEffects;
end;

procedure TConf.sBitBtn40Click(Sender: TObject);
begin
  MameChooseJoystickMap;
end;

procedure TConf.sBitBtn41Click(Sender: TObject);
begin
  MameResetJoystickMap;
end;

procedure TConf.sBitBtn42Click(Sender: TObject);
begin
  ShowRomPathResults;
end;

procedure TConf.pnl1Click(Sender: TObject);
begin
  frm_color.ShowModal;
end;

procedure TConf.sBitBtn35Click(Sender: TObject);
begin
  GetMame;
end;

procedure TConf.sBitBtn19Click(Sender: TObject);
begin
  GetMamePath('mamesnapshots');
end;

procedure TConf.sBitBtn20Click(Sender: TObject);
begin
  GetMamePath('mamesamples');
end;

procedure TConf.sBitBtn21Click(Sender: TObject);
begin
  GetMamePath('mamecabinets');
end;

procedure TConf.sBitBtn22Click(Sender: TObject);
begin
  GetMamePath('mameflyers');
end;

procedure TConf.sBitBtn23Click(Sender: TObject);
begin
  GetMamePath('mamemarquees');
end;

procedure TConf.sBitBtn24Click(Sender: TObject);
begin
  GetMamePath('mamecontrolpanels');
end;

procedure TConf.sBitBtn25Click(Sender: TObject);
begin
  GetMamePath('mamepcbs');
end;

procedure TConf.sBitBtn26Click(Sender: TObject);
begin
  GetMamePath('mameartworkpreview');
end;

procedure TConf.sBitBtn27Click(Sender: TObject);
begin
  GetMamePath('mametitles');
end;

procedure TConf.sBitBtn28Click(Sender: TObject);
begin
  GetMamePath('mameselect');
end;

procedure TConf.sBitBtn29Click(Sender: TObject);
begin
  GetMamePath('mamescores');
end;

procedure TConf.sBitBtn30Click(Sender: TObject);
begin
  GetMamePath('mamebosses');
end;

procedure TConf.sBitBtn31Click(Sender: TObject);
begin
  GetMamePath('mamecrosshair');
end;

procedure TConf.sBitBtn32Click(Sender: TObject);
begin
  GetMamePath('mameartwork');
end;

procedure TConf.sBitBtn34Click(Sender: TObject);
begin
  GetMamePath('mameinputfiles');
end;

procedure TConf.sBitBtn33Click(Sender: TObject);
begin
  GetMamePath('mamestate');
end;

procedure TConf.sCheckBox127Click(Sender: TObject);
begin
  ShowOnlySetupedMameBuilds;
end;

procedure TConf.sComboBox5Change(Sender: TObject);
begin
  MamePerWindowVideoChange(sComboBox4.Text,'',True);
end;

procedure TConf.sComboBox6Change(Sender: TObject);
begin
  MamePerWindowVideoChange(sComboBox4.Text,'aspect',True);
end;

procedure TConf.sComboBox7Change(Sender: TObject);
begin
  MamePerWindowVideoChange(sComboBox4.Text,'resolution',True);
end;

procedure TConf.sComboBox8Change(Sender: TObject);
begin
  MamePerWindowVideoChange(sComboBox4.Text,'view',True);
end;

procedure TConf.sComboBox74Change(Sender: TObject);
begin
  WindowsEffectsType;
end;

procedure TConf.se1Change(Sender: TObject);
begin
  WindowsEffectsTimeChange;
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

procedure TConf.LMDFontComboBox1Change(Sender: TObject);
begin
  Tools_FontComboBoxChange;
end;

procedure TConf.LMDFontSizeComboBox1Change(Sender: TObject);
begin
  Tools_FontSizeComboBoxChange;
end;

procedure TConf.sBitBtn103Click(Sender: TObject);
begin
  Tools_FindFontFromDirClick;
end;

procedure TConf.sBitBtn104Click(Sender: TObject);
begin
  Tools_CreateFont;
end;

procedure TConf.sbar_Mame_UITransparent_MameXTChange(Sender: TObject);
begin
  MameUITrasparentChange_MameXT;
end;

procedure TConf.sbar_Mame_UITransparent_MamePlusChange(Sender: TObject);
begin
  MameUITrasparentChange_MamePlus;
end;

procedure TConf.sCheckBox34Click(Sender: TObject);
begin
  IPSEnableClick_MamePlus;
end;

procedure TConf.nxtgrd_ips_mameplusCellClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  IpsMamePlus_CellClick(Acol,Arow);
end;

procedure TConf.sCheckBox33Click(Sender: TObject);
begin
  HiScorePath_MamePlus;
end;

procedure TConf.sBitBtn1Click(Sender: TObject);
begin
  FindHiScoreDat_MamePlus;
end;

procedure TConf.sBitBtn98Click(Sender: TObject);
begin
  FindIPSDir_MamePlus;
end;

procedure TConf.sBitBtn99Click(Sender: TObject);
begin
  FindHiScoreDat_MameXT;
end;

procedure TConf.sCheckBox129Click(Sender: TObject);
begin
  HiScorePath_MameXT;
end;

procedure TConf.sBitBtn100Click(Sender: TObject);
begin
  FindIPSDir_MameXT;
end;

procedure TConf.sComboBox76Change(Sender: TObject);
begin
  GetMameXT_Game_CountTime;
end;

procedure TConf.nxtgrd_ips_mameplusExpand(Sender: TObject; ARow: Integer);
begin
  IpsMamePlus_Expand(ARow);
end;

procedure TConf.sComboBox72Change(Sender: TObject);
begin
  ShowDatabaseStatsFor(sComboBox72.Text);
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
procedure TConf.sCheckListBox1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  ListBoxOfSetupedMames(Index,Rect);
end;

procedure TConf.sButton4Click(Sender: TObject);
begin
  ResetToDefaultTopic_MameDirs;
end;

procedure TConf.sButton5Click(Sender: TObject);
begin
  ResetToDefaultTopic_MameGraphics;
end;

procedure TConf.sButton6Click(Sender: TObject);
begin
  ResetToDefaultTopic_MameSound;
end;

procedure TConf.sButton7Click(Sender: TObject);
begin
  ResetToDefaultTopic_MameOthers;
end;

procedure TConf.sButton8Click(Sender: TObject);
begin
  ResetToDefaultTopic_MameBuilds;
end;

procedure TConf.sButton22Click(Sender: TObject);
begin
  ResetMameConfig_Global;
end;

procedure TConf.sButton1Click(Sender: TObject);
begin
  ResetMameConfig_Global;
end;

procedure TConf.sButton2Click(Sender: TObject);
begin
  ResetMameConfig_Global;
end;

procedure TConf.sButton3Click(Sender: TObject);
begin
  ResetMameConfig_Global;
end;

procedure TConf.sButton9Click(Sender: TObject);
begin
  ResetMameConfig_Global;
end;

procedure TConf.sBitBtn101Click(Sender: TObject);
begin
  ZeroPlayTime_Count(sComboBox76.Text);
end;

procedure TConf.sCheckBox130Click(Sender: TObject);
begin
  IPSEnableClick_MameXT;
end;

end.
