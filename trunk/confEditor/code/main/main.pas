unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi, ComCtrls, Buttons, inifiles, ExtCtrls,ImgList, //Delphi units
  sSkinProvider,sSkinManager, sEdit, sPanel,sBitBtn,sGauge,sCheckListBox, sButton, sListBox, sScrollBar, sCheckBox, sComboBox, sLabel,acPNG,acAlphaImageList, //Alphaskin units
  CDesktopMonitorInfo, CWMIBase, CSoundDeviceInfo, //Info Devices Units
  LMDBaseControl,LMDBaseGraphicControl, LMDGraphicControl, LMDBaseImage, LMDCustomLImage,LMDLImage,LMDFontSizeComboBox,LMDThemedComboBox, LMDCustomComboBox,LMDFontComboBox,
  LMDCustomNImage, LMDNImage,LMDControl,LMDCustomControl, LMDRadioButton,LMDCustomPanel,LMDButtonControl, // LMND Units
  JvBaseDlg, JvSelectDirectory, JvDialogs,JvAppInst,JvLED, JvExControls,
  JvExStdCtrls, JvRichEdit, JvExForms, JvScrollBox,
  JvExExtCtrls, JvExtComponent, JvPanel, JvOfficeColorPanel,//Jvcl units
  NxScrollControl, NxCustomGridControl, NxCustomGrid, NxGrid,NxColumnClasses, NxColumns,//NextGrid Units
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdUDPBase, IdUDPClient, IdSNTP, //Indy units
  FunctionX,global, // functions units  
  NLDJoystick, // Joystick units
  GLKeyboard, // Glsnene Units
  Spin,
  //forms
  form_search,
  //my units    
  menu,
  ce_themes,ce_config,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_hlsl,mame_database,
  zinc_paths,zinc_graphics,zinc_sound,zinc_database,
  hatari_system,hatari_roms,hatari_screen,hatari_joy,hatari_paths,hatari_database,
  psx_paths,psx_screen,psx_sound,psx_others,psx_database,
  kigb_paths,kigb_screen,kigb_sound,kigb_others,kigb_database,
  wg_weather,wg_timedate, Menus;


const
  AniArrow = 1;AniText = 2;AniLink = 3;AniBusy = 4;AniHorizontal = 5;AniVertical = 6;AniPrecision = 7;
  AniArrow2 = 8;AniText2 = 9;AniLink2 = 10;AniBusy2 = 11;AniHorizontal2 = 12;AniVertical2 = 13;AniPrecision2 = 14;
  AniArrow3 = 15;AniText3 = 16;AniLink3 = 17;AniBusy3 = 18;AniHorizontal3 = 19;AniVertical3 = 20;AniPrecision3 = 21;
  AniArrow4 = 22;AniText4 = 23;AniLink4 = 24;AniBusy4 = 25;AniHorizontal4 = 26;AniVertical4 = 27;AniPrecision4 = 28;
  AniArrow5 = 29;AniText5 = 30;AniLink5 = 31;AniBusy5 = 32;AniHorizontal5 = 33;AniVertical5 = 34;AniPrecision5 = 35;
  AniArrow6 = 36;AniText6 = 37;AniLink6 = 38;AniBusy6 = 39;AniHorizontal6 = 40;AniVertical6 = 41;AniPrecision6 = 42;
  AniArrow7 = 43;AniText7 = 44;AniLink7 = 45;AniBusy7 = 46;AniHorizontal7 = 47;AniVertical7 = 48;AniPrecision7 = 49;
  AniArrow8 = 50;AniText8 = 51;AniLink8 = 52;AniBusy8 = 53;AniHorizontal8 = 54;AniVertical8 = 55;AniPrecision8 = 56;
  UM_DESTROYPANEL = WM_APP + 601;
  UM_ONClICKEDPANELSACTIONS = WM_APP + 660;

type
  TConf = class(TForm)
//  StringGrid Components
    nxtgrd_mame: TNextGrid;
    nxtgrd_ips_mameplus: TNextGrid;
    nxtgrd_zinc: TNextGrid;
    nxtgrd_hatari: TNextGrid;
    nxtgrd_pSX: TNextGrid;
    nxtgrd_kigb: TNextGrid;
//  Skin Components
    SkinM: TsSkinManager;SkinP: TsSkinProvider;
//  Dialogs Components
    Find_Files: TOpenDialog;Save_Files: TSaveDialog;
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
    Pce_wizard: TsPanel;Pce_config: TsPanel;Pce_themes: TsPanel;Pce_logsession: TsPanel;
//  ExtraFe Panels
    Pexf_configuration: TsPanel;Pexf_themes: TsPanel;
//  Mame Panels
    Pem_mame_dirs: TsPanel;Pem_mame_graphics: TsPanel;Pem_mame_sound: TsPanel;Pem_mame_others: TsPanel;
    Pem_mame_hlsl: TsPanel;Pem_mame_database: TsPanel;PTools: TsPanel;panel_mame_page1: TsPanel;panel_mame_page2: TsPanel;    
//  Zinc Panels
    Pem_zinc_paths: TsPanel;Pem_zinc_graphics: TsPanel;Pem_zinc_sound: TsPanel; Pem_zinc_database: TsPanel;
//  Hatari Panels
    Pem_hatari_system: TsPanel;Pem_hatari_roms: TsPanel;Pem_hatari_screen: TsPanel;Pem_hatari_joy: TsPanel;
    Pem_hatari_paths: TsPanel;Pem_hatari_database: TsPanel;
//  pSX Panels
    Pem_psx_paths: TsPanel;Pem_psx_screen: TsPanel;Pem_psx_sound: TsPanel;Pem_psx_others: TsPanel;Pem_psx_database: TsPanel;
//  Kigb Panels
    Pem_kigb_paths: TsPanel;Pem_kigb_screen: TsPanel;Pem_kigb_sound: TsPanel;Pem_kigb_others: TsPanel;Pem_kigb_database: TsPanel;
//  Widgets
    Pwg_weather: TsPanel;
    Pwg_timedate: TsPanel;Ptimedate_worldclock: TsPanel;Ptimedate_internettime: TsPanel;
//  other panels
    sPanel: TsPanel;sPanel2: TsPanel;sPanel3: TsPanel;sPanel4: TsPanel;sPanel5: TsPanel;sPanel6: TsPanel;sPanel7: TsPanel;sPanel8: TsPanel;sPanel9: TsPanel;sPanel10: TsPanel;
    sPanel11: TsPanel;sPanel12: TsPanel;sPanel13: TsPanel;sPanel14: TsPanel;sPanel15: TsPanel;sPanel16: TsPanel;sPanel17: TsPanel;sPanel18: TsPanel;sPanel19: TsPanel;sPanel20: TsPanel;
    sPanel21: TsPanel;sPanel22: TsPanel;sPanel23: TsPanel;sPanel24: TsPanel;sPanel25: TsPanel;sPanel26: TsPanel;sPanel27: TsPanel;sPanel28: TsPanel;sPanel29: TsPanel;sPanel30: TsPanel;
    sPanel31: TsPanel;sPanel32: TsPanel;sPanel33: TsPanel;sPanel34: TsPanel;sPanel35: TsPanel;sPanel36: TsPanel;sLabel45: TsLabel;sLabel44: TsLabel;sLabel31: TsLabel;sLabel30: TsLabel;
    sLabel29: TsLabel;sLabel63: TsLabel;sPanel37: TsPanel;sPanel38: TsPanel;sPanel39: TsPanel;sPanel40: TsPanel;sPanel41: TsPanel;sPanel44: TsPanel;sPanel45: TsPanel;sPanel46: TsPanel;
    sPanel47: TsPanel;sPanel48: TsPanel;sPanel49: TsPanel;sPanel50: TsPanel;sPanel51: TsPanel;sPanel52: TsPanel;sPanel53: TsPanel;sPanel54: TsPanel;sPanel55: TsPanel;sPanel56: TsPanel;
    sPanel57: TsPanel;sPanel58: TsPanel;sPanel59: TsPanel;sPanel60: TsPanel;sPanel61: TsPanel;sPanel62: TsPanel;sPanel63: TsPanel;sPanel64: TsPanel;sPanel65: TsPanel;sPanel66: TsPanel;    
    sPanel67: TsPanel;sPanel68: TsPanel;sPanel42: TsPanel;sPanel43: TsPanel;sPanel69: TsPanel;sPanel70: TsPanel;sPanel71: TsPanel;sPanel72: TsPanel;sPanel73: TsPanel;sPanel74: TsPanel;    
    sPanel75: TsPanel;sPanel76: TsPanel;sPanel77: TsPanel;sPanel78: TsPanel;sPanel79: TsPanel;sPanel80: TsPanel;sPanel81: TsPanel;sPanel82: TsPanel;sPanel89: TsPanel;sPanel83: TsPanel;
    sPanel84: TsPanel;sPanel85: TsPanel;sPanel86: TsPanel;sPanel87: TsPanel;sPanel90: TsPanel;
//  grp Components
    grp105: TGroupBox;grp106: TGroupBox;grp107: TGroupBox;grp108: TGroupBox;grp109: TGroupBox;grp17: TGroupBox;grp18: TGroupBox;grp30: TGroupBox;grp61: TGroupBox;grp20: TGroupBox;grp10: TGroupBox;grp11: TGroupBox;grp12: TGroupBox;grp13: TGroupBox;grp14: TGroupBox;
    grp19: TGroupBox;grp21: TGroupBox;grp22: TGroupBox;grp23: TGroupBox;grp24: TGroupBox;grp25: TGroupBox;grp26: TGroupBox;grp35: TGroupBox;grp2: TGroupBox;GroupBox1: TGroupBox;grp3: TGroupBox;grp4: TGroupBox;grp5: TGroupBox;grp6: TGroupBox;grp32: TGroupBox;grp33: TGroupBox;    
    grp99: TGroupBox;grp100: TGroupBox;grp34: TGroupBox;grp95: TGroupBox;grp7: TGroupBox;grp8: TGroupBox;grp9: TGroupBox;grp96: TGroupBox;grp97: TGroupBox;grp98: TGroupBox;grp101: TGroupBox;grp103: TGroupBox;grp104: TGroupBox;grp119: TGroupBox;grp111: TGroupBox;    
    grp27: TGroupBox;grp28: TGroupBox;grp29: TGroupBox;grp1: TGroupBox;grp36: TGroupBox;grp37: TGroupBox;grp38: TGroupBox;grp39: TGroupBox;grp40: TGroupBox;grp41: TGroupBox;grp42: TGroupBox;grp112: TGroupBox;grp102: TGroupBox;grp110: TGroupBox;grp113: TGroupBox;grp114: TGroupBox;
    grp43: TGroupBox;grp44: TGroupBox;grp49: TGroupBox;grp45: TGroupBox;grp46: TGroupBox;grp47: TGroupBox;grp48: TGroupBox;grp50: TGroupBox;grp51: TGroupBox;grp15: TGroupBox;grp16: TGroupBox;grp120: TGroupBox;grp117: TGroupBox;grp118: TGroupBox;grp122: TGroupBox;grp31: TGroupBox;
    grp52: TGroupBox;grp53: TGroupBox;grp54: TGroupBox;grp55: TGroupBox;grp56: TGroupBox;grp57: TGroupBox;grp58: TGroupBox;grp59: TGroupBox;grp60: TGroupBox;grp62: TGroupBox;grp63: TGroupBox;grp64: TGroupBox;grp65: TGroupBox;grp66: TGroupBox;grp67: TGroupBox;grp68: TGroupBox;grp69: TGroupBox;
    grp70: TGroupBox;grp71: TGroupBox;grp72: TGroupBox;grp73: TGroupBox;grp74: TGroupBox;grp75: TGroupBox;grp78: TGroupBox;grp79: TGroupBox;grp80: TGroupBox;
    grp81: TGroupBox;grp82: TGroupBox;grp83: TGroupBox;grp84: TGroupBox;grp85: TGroupBox;grp86: TGroupBox;grp87: TGroupBox;grp88: TGroupBox;grp89: TGroupBox;
    grp90: TGroupBox;grp91: TGroupBox;grp92: TGroupBox;grp93: TGroupBox;grp94: TGroupBox;grp76: TGroupBox;grp77: TGroupBox;grp115: TGroupBox;
//  sLabel Components
    sLabel13: TsLabel;sLabel14: TsLabel;sLabel15: TsLabel;sLabel16: TsLabel;sLabel19: TsLabel;sLabel9: TsLabel;sLabel10: TsLabel;sLabel60: TsLabel;sLabel47: TsLabel;sLabel17: TsLabel;sLabel21: TsLabel;sLabel22: TsLabel;sLabel58: TsLabel;sLabel59: TsLabel;sLabel64: TsLabel;sLabel65: TsLabel;sLabel66: TsLabel;sLabel67: TsLabel;sLabel68: TsLabel;sLabel69: TsLabel;sLabel23: TsLabel;
    sLabel24: TsLabel;sLabel25: TsLabel;sLabel26: TsLabel;sLabel27: TsLabel;sLabel53: TsLabel;sLabel54: TsLabel;sLabel55: TsLabel;sLabel56: TsLabel;sLabel3: TsLabel;sLabel4: TsLabel;sLabel5: TsLabel;sLabel2: TsLabel;sLabel11: TsLabel;sLabel51: TsLabel; sLabel52: TsLabel; sLabel48: TsLabel;sLabel8: TsLabel;sLabel7: TsLabel;
    sLabel57: TsLabel;sLabel70: TsLabel;sLabel71: TsLabel;sLabel72: TsLabel;sLabel73: TsLabel;sLabel74: TsLabel;sLabel75: TsLabel;sLabel76: TsLabel;sLabel49: TsLabel;sLabel6: TsLabel;sLabel50: TsLabel;sLabel12: TsLabel;sLabel1: TsLabel;sLabel32: TsLabel;lbl33: TsLabel;sLabel36: TsLabel;sLabel37: TsLabel;sLabel38: TsLabel;
    sLabel77: TsLabel;sLabel78: TsLabel;sLabel80: TsLabel;sLabel81: TsLabel;sLabel82: TsLabel;sLabel83: TsLabel;sLabel84: TsLabel;sLabel39: TsLabel;sLabel40: TsLabel;sLabel103: TsLabel;sLabel111: TsLabel;sLabel134: TsLabel;sLabel135: TsLabel;sLabel136: TsLabel;sLabel137: TsLabel;    
    sLabel85: TsLabel;sLabel86: TsLabel;sLabel87: TsLabel;sLabel88: TsLabel;sLabel89: TsLabel;sLabel90: TsLabel;sLabel91: TsLabel;sLabel93: TsLabel;sLabel46: TsLabel;     
    sLabel92: TsLabel;sLabel94: TsLabel;sLabel95: TsLabel;sLabel96: TsLabel;sLabel97: TsLabel;sLabel98: TsLabel;sLabel99: TsLabel;sLabel100: TsLabel;    
    sLabel105: TsLabel;sLabel106: TsLabel;sLabel107: TsLabel;sLabel109: TsLabel;sLabel112: TsLabel;sLabel108: TsLabel;sLabel101: TsLabel;sLabel104: TsLabel;
    sLabel113: TsLabel;sLabel114: TsLabel;sLabel115: TsLabel;sLabel116: TsLabel;sLabel117: TsLabel;sLabel118: TsLabel;sLabel119: TsLabel;sLabel120: TsLabel;
    sLabel121: TsLabel;sLabel122: TsLabel;sLabel123: TsLabel;sLabel124: TsLabel;sLabel125: TsLabel;sLabel126: TsLabel;sLabel127: TsLabel;sLabel128: TsLabel;
    sLabel129: TsLabel;sLabel61: TsLabel;sLabel62: TsLabel;sLabel79: TsLabel;sLabel133: TsLabel;sLabel132: TsLabel;sLabel131: TsLabel;sLabel130: TsLabel;    
    sLabel102: TsLabel;sLabel35: TsLabel;sLabel110: TsLabel;sLabel41: TsLabel;sLabel42: TsLabel;sLabel43: TsLabel;sLabel28: TsLabel;sLabel18: TsLabel;sLabel20: TsLabel;sLabel33: TsLabel;sLabel34: TsLabel;sLabel138: TsLabel;        
//  sCheckBox Components
    sCheckBox26: TsCheckBox;sCheckBox16: TsCheckBox;sCheckBox17: TsCheckBox;sCheckBox3: TsCheckBox;sCheckBox4: TsCheckBox;sCheckBox5: TsCheckBox;sCheckBox6: TsCheckBox;sCheckBox43: TsCheckBox;sCheckBox1: TsCheckBox;sCheckBox2: TsCheckBox;sCheckBox18: TsCheckBox;
    sCheckBox19: TsCheckBox;sCheckBox20: TsCheckBox;sCheckBox21: TsCheckBox;sCheckBox22: TsCheckBox;sCheckBox23: TsCheckBox;sCheckBox47: TsCheckBox;sCheckBox48: TsCheckBox;sCheckBox49: TsCheckBox;sCheckBox50: TsCheckBox;sCheckBox51: TsCheckBox;sCheckBox52: TsCheckBox;
    sCheckBox53: TsCheckBox;sCheckBox54: TsCheckBox;sCheckBox55: TsCheckBox;sCheckBox56: TsCheckBox;sCheckBox57: TsCheckBox;sCheckBox58: TsCheckBox;sCheckBox44: TsCheckBox;sCheckBox41: TsCheckBox;sCheckBox40: TsCheckBox;sCheckBox9: TsCheckBox;sCheckBox11: TsCheckBox;sCheckBox13: TsCheckBox;    
    sCheckBox59: TsCheckBox;sCheckBox79: TsCheckBox;sCheckBox80: TsCheckBox;sCheckBox81: TsCheckBox;sCheckBox82: TsCheckBox;sCheckBox101: TsCheckBox;sCheckBox12: TsCheckBox;sCheckBox14: TsCheckBox;sCheckBox63: TsCheckBox;sCheckBox64: TsCheckBox;sCheckBox24: TsCheckBox;
    sCheckBox83: TsCheckBox;sCheckBox84: TsCheckBox;sCheckBox85: TsCheckBox;sCheckBox86: TsCheckBox;sCheckBox87: TsCheckBox;sCheckBox88: TsCheckBox;sCheckBox27: TsCheckBox;sCheckBox28: TsCheckBox;sCheckBox29: TsCheckBox;sCheckBox30: TsCheckBox;sCheckBox31: TsCheckBox;sCheckBox35: TsCheckBox;        
    sCheckBox89: TsCheckBox;sCheckBox91: TsCheckBox;sCheckBox95: TsCheckBox;sCheckBox92: TsCheckBox;sCheckBox93: TsCheckBox;sCheckBox94: TsCheckBox;sCheckBox36: TsCheckBox;sCheckBox37: TsCheckBox;sCheckBox38: TsCheckBox;sCheckBox39: TsCheckBox;sCheckBox32: TsCheckBox;    
    sCheckBox90: TsCheckBox;sCheckBox96: TsCheckBox;sCheckBox98: TsCheckBox;sCheckBox99: TsCheckBox;sCheckBox62: TsCheckBox;sCheckBox15: TsCheckBox;sCheckBox7: TsCheckBox;sCheckBox8: TsCheckBox;sCheckBox10: TsCheckBox;sCheckBox33: TsCheckBox;sCheckBox34: TsCheckBox;    
    sCheckBox100: TsCheckBox;sCheckBox102: TsCheckBox;sCheckBox103: TsCheckBox;sCheckBox104: TsCheckBox;sCheckBox105: TsCheckBox;sCheckBox106: TsCheckBox;sCheckBox66: TsCheckBox;sCheckBox67: TsCheckBox;sCheckBox68: TsCheckBox;
    sCheckBox107: TsCheckBox;sCheckBox108: TsCheckBox;sCheckBox109: TsCheckBox;sCheckBox25: TsCheckBox;sCheckBox42: TsCheckBox;sCheckBox45: TsCheckBox;
    sCheckBox46: TsCheckBox;sCheckBox110: TsCheckBox;sCheckBox111: TsCheckBox;sCheckBox112: TsCheckBox;sCheckBox113: TsCheckBox;sCheckBox115: TsCheckBox;
    sCheckBox116: TsCheckBox;sCheckBox117: TsCheckBox;sCheckBox118: TsCheckBox;sCheckBox119: TsCheckBox;sCheckBox120: TsCheckBox;sCheckBox121: TsCheckBox;
    sCheckBox122: TsCheckBox;sCheckBox123: TsCheckBox;sCheckBox124: TsCheckBox;sCheckBox125: TsCheckBox;sCheckBox126: TsCheckBox;sCheckBox114: TsCheckBox;
    sCheckBox127: TsCheckBox;sCheckBox60: TsCheckBox;sCheckBox61: TsCheckBox;sCheckBox97: TsCheckBox;
//  sComboBox Components
    sComboBox18: TsComboBox;sComboBox10: TsComboBox;sComboBox11: TsComboBox;sComboBox12: TsComboBox;sComboBox13: TsComboBox;sComboBox14: TsComboBox;
    sComboBox15: TsComboBox;sComboBox16: TsComboBox;sComboBox17: TsComboBox;sComboBox21: TsComboBox;sComboBox20: TsComboBox;sComboBox9: TsComboBox;sComboBox2: TsComboBox;
    sComboBox22: TsComboBox;sComboBox23: TsComboBox;sComboBox24: TsComboBox;sComboBox25: TsComboBox;sComboBox26: TsComboBox;sComboBox27: TsComboBox;
    sComboBox28: TsComboBox;sComboBox29: TsComboBox;sComboBox30: TsComboBox;sComboBox31: TsComboBox;sComboBox32: TsComboBox;sComboBox33: TsComboBox;
    sComboBox34: TsComboBox;sComboBox35: TsComboBox;sComboBox36: TsComboBox;sComboBox37: TsComboBox;sComboBox43: TsComboBox;sComboBox44: TsComboBox;sComboBox45: TsComboBox;
    sComboBox46: TsComboBox;sComboBox47: TsComboBox;sComboBox49: TsComboBox;sComboBox48: TsComboBox;sComboBox50: TsComboBox;sComboBox51: TsComboBox;
    sComboBox52: TsComboBox;sComboBox53: TsComboBox;sComboBox54: TsComboBox;sComboBox55: TsComboBox;sComboBox57: TsComboBox;sComboBox56: TsComboBox;
    sComboBox58: TsComboBox;sComboBox59: TsComboBox;sComboBox60: TsComboBox;sComboBox61: TsComboBox;sComboBox62: TsComboBox;sComboBox63: TsComboBox;
    sComboBox64: TsComboBox;sComboBox65: TsComboBox;sComboBox66: TsComboBox;sComboBox67: TsComboBox;sComboBox68: TsComboBox;sComboBox69: TsComboBox;
    sComboBox70: TsComboBox;sComboBox71: TsComboBox;sComboBox72: TsComboBox;sComboBox38: TsComboBox;sComboBox39: TsComboBox;sComboBox40: TsComboBox;sComboBox41: TsComboBox;
    sComboBox77: TsComboBox;sComboBox42: TsComboBox;sComboBox3: TsComboBox;sComboBox4: TsComboBox;sComboBox5: TsComboBox;sComboBox6: TsComboBox;sComboBox7: TsComboBox;sComboBox8: TsComboBox;
    sComboBox74: TsComboBox;sComboBox75: TsComboBox;sComboBox19: TsComboBox;sComboBox73: TsComboBox;sComboBox76: TsComboBox;sComboBox1: TsComboBox;
//  sEdit Components
    sEdit15: TsEdit;sEdit56: TsEdit;sEdit57: TsEdit;sEdit64: TsEdit;sEdit53: TsEdit;sEdit65: TsEdit;sEdit66: TsEdit;sEdit54: TsEdit;sEdit55: TsEdit;sEdit74: TsEdit;sEdit75: TsEdit;sEdit81: TsEdit;sEdit82: TsEdit;sEdit33: TsEdit;sEdit34: TsEdit;
    sEdit36: TsEdit;sEdit37: TsEdit;sEdit38: TsEdit;sEdit39: TsEdit;sEdit40: TsEdit;sEdit41: TsEdit;sEdit42: TsEdit;sEdit43: TsEdit;sEdit44: TsEdit;sEdit45: TsEdit;sEdit46: TsEdit;sEdit47: TsEdit;sEdit48: TsEdit;sEdit49: TsEdit;sEdit50: TsEdit;
    sEdit51: TsEdit;sEdit52: TsEdit;sEdit63: TsEdit;sEdit67: TsEdit;sEdit68: TsEdit;sEdit69: TsEdit;sEdit70: TsEdit;sEdit71: TsEdit;sEdit72: TsEdit;sEdit73: TsEdit;sEdit76: TsEdit;sEdit77: TsEdit;sEdit78: TsEdit;sEdit79: TsEdit;sEdit80: TsEdit;
    sEdit98: TsEdit;sEdit99: TsEdit;sEdit100: TsEdit;sEdit101: TsEdit;sEdit113: TsEdit;sEdit114: TsEdit;sEdit115: TsEdit;sEdit112: TsEdit;sEdit111: TsEdit;sEdit110: TsEdit;sEdit109: TsEdit;sEdit108: TsEdit;sEdit107: TsEdit;sEdit106: TsEdit;sEdit105: TsEdit;
    sEdit104: TsEdit;sEdit103: TsEdit;sEdit102: TsEdit;sEdit2: TsEdit;sEdit4: TsEdit;sEdit3: TsEdit;sEdit8: TsEdit;sEdit10: TsEdit;sEdit6: TsEdit;sEdit9: TsEdit;sEdit7: TsEdit;sEdit11: TsEdit;sEdit5: TsEdit;sEdit58: TsEdit;sEdit59: TsEdit;sEdit60: TsEdit;sEdit61: TsEdit;    
    sEdit83: TsEdit;sEdit84: TsEdit;sEdit85: TsEdit;sEdit86: TsEdit;sEdit87: TsEdit;sEdit88: TsEdit;sEdit89: TsEdit;sEdit90: TsEdit;sEdit91: TsEdit;sEdit92: TsEdit;sEdit93: TsEdit;sEdit94: TsEdit;sEdit95: TsEdit;sEdit96: TsEdit;sEdit97: TsEdit;sEdit14: TsEdit;sEdit18: TsEdit;    sEdit19: TsEdit;sEdit20: TsEdit;sEdit21: TsEdit;sEdit22: TsEdit;sEdit23: TsEdit;sEdit24: TsEdit;sEdit25: TsEdit;sEdit26: TsEdit;sEdit27: TsEdit;sEdit28: TsEdit;sEdit29: TsEdit;sEdit30: TsEdit;sEdit1: TsEdit;sEdit31: TsEdit;sEdit62: TsEdit;
    sEdit12: TsEdit;sEdit13: TsEdit;sEdit125: TsEdit;sEdit16: TsEdit;sEdit17: TsEdit;sEdit32: TsEdit;sEdit35: TsEdit;
//  sBitBtn Components
    sBitBtn3: TsBitBtn;sBitBtn4: TsBitBtn;sBitBtn5: TsBitBtn;sBitBtn2: TsBitBtn;sBitBtn6: TsBitBtn;sBitBtn7: TsBitBtn;sBitBtn8: TsBitBtn;sBitBtn9: TsBitBtn;
    sBitBtn10: TsBitBtn;sBitBtn11: TsBitBtn;sBitBtn12: TsBitBtn;sBitBtn13: TsBitBtn;sBitBtn14: TsBitBtn;sBitBtn15: TsBitBtn;sBitBtn16: TsBitBtn;sBB_apply_ce_themes: TsBitBtn;sBitBtn35: TsBitBtn;sBitBtn36: TsBitBtn;sBitBtn37: TsBitBtn;sBitBtn40: TsBitBtn;
    sBitBtn41: TsBitBtn;sBitBtn47: TsBitBtn;sBitBtn48: TsBitBtn;sBitBtn44: TsBitBtn;sBitBtn45: TsBitBtn;sBitBtn46: TsBitBtn;sBitBtn33: TsBitBtn;sBitBtn0: TsBitBtn;sBitBtn42: TsBitBtn;    
    sBitBtn49: TsBitBtn;sBitBtn60: TsBitBtn;sBitBtn61: TsBitBtn;sBitBtn62: TsBitBtn;sBitBtn63: TsBitBtn;sBitBtn64: TsBitBtn;sBitBtn65: TsBitBtn;sBitBtn66: TsBitBtn;
    sBitBtn67: TsBitBtn;sBitBtn68: TsBitBtn;sBitBtn69: TsBitBtn;sBitBtn70: TsBitBtn;sBitBtn71: TsBitBtn;sBitBtn72: TsBitBtn;sBitBtn73: TsBitBtn;sBitBtn75: TsBitBtn;
    sBitBtn76: TsBitBtn;sBitBtn77: TsBitBtn;sBitBtn78: TsBitBtn;sBitBtn79: TsBitBtn;sBitBtn80: TsBitBtn;sBitBtn81: TsBitBtn;sBitBtn82: TsBitBtn;sBitBtn83: TsBitBtn;
    sBitBtn84: TsBitBtn;sBitBtn85: TsBitBtn;sBitBtn86: TsBitBtn;sBitBtn87: TsBitBtn;sBitBtn88: TsBitBtn;sBitBtn89: TsBitBtn;sBitBtn90: TsBitBtn;sBitBtn91: TsBitBtn;
    sBitBtn92: TsBitBtn;sBitBtn93: TsBitBtn;sBitBtn96: TsBitBtn;sBitBtn97: TsBitBtn;sBitBtn94: TsBitBtn;sBitBtn95: TsBitBtn;sBitBtn102: TsBitBtn;sBitBtn105: TsBitBtn;sBitBtn106: TsBitBtn;
    sBitBtn50: TsBitBtn;sBitBtn51: TsBitBtn;sBitBtn52: TsBitBtn;sBitBtn53: TsBitBtn;sBitBtn54: TsBitBtn;sBitBtn55: TsBitBtn;sBitBtn56: TsBitBtn;sBitBtn57: TsBitBtn;sBitBtn58: TsBitBtn;
    sBitBtn59: TsBitBtn;sBitBtn74: TsBitBtn;sBitBtn107: TsBitBtn;sBitBtn108: TsBitBtn;sBitBtn109: TsBitBtn;sBitBtn110: TsBitBtn;sBitBtn111: TsBitBtn;sBitBtn114: TsBitBtn;sBitBtn115: TsBitBtn;sBitBtn116: TsBitBtn;
    sBitBtn19: TsBitBtn;sBitBtn20: TsBitBtn;sBitBtn21: TsBitBtn;sBitBtn22: TsBitBtn;sBitBtn23: TsBitBtn;sBitBtn24: TsBitBtn;sBitBtn25: TsBitBtn;sBitBtn26: TsBitBtn;sBitBtn34: TsBitBtn;sBitBtn32: TsBitBtn;
    sBitBtn31: TsBitBtn;sBitBtn30: TsBitBtn;sBitBtn29: TsBitBtn;sBitBtn28: TsBitBtn;sBitBtn27: TsBitBtn;sBitBtn18: TsBitBtn;sBitBtn17: TsBitBtn;sBitBtn38: TsBitBtn;sBitBtn39: TsBitBtn;sBitBtn113: TsBitBtn;sBitBtn112: TsBitBtn;
    sBitBtn43: TsBitBtn;sBitBtn99: TsBitBtn;sBitBtn100: TsBitBtn;sBitBtn1: TsBitBtn;sBitBtn98: TsBitBtn;sBitBtn103: TsBitBtn;sBitBtn104: TsBitBtn;
//  image Components
    img1: TImage;img2: TImage;img_ce_theme: TImage;img86: TImage;img87: TImage;img88: TImage;       
    Menu_Image: TLMDNImage;
//  TsScrollBar Components
    sbar_mame_valumeattenuation: TsScrollBar;sbar_mame_audiolatency: TsScrollBar;sbar_mame_joysdeadzone: TsScrollBar;sbar_mame_joysaturation: TsScrollBar;sbar_psx_gamma: TsScrollBar;sbar_psx_brightness: TsScrollBar;sbar_psx_contrast: TsScrollBar;
    sbar_psx_latency: TsScrollBar;sbar_psx_xalatency: TsScrollBar;sbar_kigb_soundvolume: TsScrollBar;sbar_kigb_soundpan: TsScrollBar;sScrollBar1: TsScrollBar;sScrollBar2: TsScrollBar;sScrollBar3: TsScrollBar;sScrollBar4: TsScrollBar;sScrollBar5: TsScrollBar;
    sScrollBar6: TsScrollBar;sScrollBar7: TsScrollBar;sScrollBar8: TsScrollBar;sScrollBar9: TsScrollBar;sScrollBar10: TsScrollBar;sScrollBar11: TsScrollBar;sbar_mame_threadpriority: TsScrollBar;sbar_mame_beamwidth: TsScrollBar;sbar_mame_flicker: TsScrollBar;sbar_Mame_UITransparent_MamePlus: TsScrollBar;        
    sbar_mame_pausebrightness: TsScrollBar;sbar_mame_gammacorrection: TsScrollBar;sbar_mame_brightnesscorrection: TsScrollBar;sbar_mame_contrastcorrection: TsScrollBar;sbar_mame_emulatrionspeed: TsScrollBar;sbar_mame_Fgamma: TsScrollBar;sbar_mame_Fbrightness: TsScrollBar;
    sbar_mame_Fcontrast: TsScrollBar;sbar_mame_secondstorun: TsScrollBar;sbar_mame_scalescreen: TsScrollBar;
//  TsButton Components
    sButton22: TsButton;sButton1: TsButton;sButton2: TsButton;sButton3: TsButton;sButton4: TsButton;sButton5: TsButton;sButton6: TsButton;sButton7: TsButton;
    sButton8: TsButton;sButton9: TsButton;sButton10: TsButton;sButton11: TsButton;sButton12: TsButton;sButton13: TsButton;sButton14: TsButton;sButton15: TsButton;
    sButton16: TsButton;sButton17: TsButton;sButton18: TsButton;sButton19: TsButton;sButton25: TsButton;sButton23: TsButton;sButton21: TsButton;sButton20: TsButton;
    sButton24: TsButton;sButton26: TsButton;
//  TsAlphaImageList Components
    InBitBtn_Imagelist: TsAlphaImageList;
//  TsLabelFX Components
    sLabelFX3: TsLabelFX;sLabelFX11: TsLabelFX;sLabelFX12: TsLabelFX;
//  TsGauge Components
    sGauge1: TsGauge;sGauge2: TsGauge;sGauge_MameData: TsGauge;
    sGauge_MameChange: TsGauge;sGauge_HatariData: TsGauge;sGauge_kigb: TsGauge;sGauge_IPSMamePlus: TsGauge;
//  sWebLabel Components
    sWebLabel2: TsWebLabel;sWebLabel1: TsWebLabel;sWebLabel3: TsWebLabel;
//  sCheckListBox Components
    sCheckListBox1: TsCheckListBox;
//  ListBox Components
    sLB_ce_themes: TsListBox;sListBox1: TsListBox;
//  Pick Color Components
    JvOfficeColorPanel1: TJvOfficeColorPanel;
//  UnKnow Panels
    pnl1: TPanel;pnl2: TPanel;pnl3: TPanel;pnl4: TPanel;    
//  Internet Components
    IdHTTP1: TIdHTTP;
//  Scrolllbox Components
    ScrollBox1: TJvScrollBox;ScrollBox2: TJvScrollBox;
//  Joystick Components
    CEJoy1: TNLDJoystick;CEJoy2: TNLDJoystick;        
//  Button Components
    Button1: TButton;
//  Led Components
    JvLED2: TJvLED;JvLED5: TJvLED;JvLED1: TJvLED;JvLED4: TJvLED;JvLED3: TJvLED;JvLED6: TJvLED;JvLED7: TJvLED;JvLED8: TJvLED;JvLED9: TJvLED;JvLED10: TJvLED;JvLED11: TJvLED;JvLED12: TJvLED;JvLED13: TJvLED;JvLED14: TJvLED;
    JvLED15: TJvLED;JvLED16: TJvLED;JvLED17: TJvLED;JvLED18: TJvLED;JvLED19: TJvLED;JvLED20: TJvLED;JvLED21: TJvLED;JvLED22: TJvLED;JvLED23: TJvLED;JvLED24: TJvLED;JvLED25: TJvLED;JvLED26: TJvLED;JvLED27: TJvLED;JvLED28: TJvLED;
    JvLED29: TJvLED;JvLED30: TJvLED;JvLED31: TJvLED;JvLED32: TJvLED;JvLED33: TJvLED;JvLED34: TJvLED;JvLED35: TJvLED;JvLED36: TJvLED;JvLED37: TJvLED;
//  Label Components
    lbl1: TLabel;lbl31: TLabel;lbl2: TLabel;lbl3: TLabel;lbl4: TLabel;lbl5: TLabel;lbl6: TLabel;lbl7: TLabel;lbl8: TLabel;lbl9: TLabel;lbl10: TLabel;lbl11: TLabel;lbl12: TLabel;lbl13: TLabel;lbl14: TLabel;lbl15: TLabel;lbl16: TLabel;
    lbl17: TLabel;lbl18: TLabel;lbl19: TLabel;lbl32: TLabel;lbl20: TLabel;lbl21: TLabel;lbl22: TLabel;lbl23: TLabel;lbl24: TLabel;lbl25: TLabel;lbl26: TLabel;lbl27: TLabel;lbl28: TLabel;lbl29: TLabel;lbl30: TLabel;L_FoundJoy1: TLabel;
    L_Joy1Id: TLabel;L_Joy1Buttons: TLabel;L_Joy1Axis: TLabel;L_Joy1POV: TLabel;L_FoundJoy2: TLabel;L_Joy2Id: TLabel;L_Joy2Buttons: TLabel;L_Joy2Axis: TLabel;L_Joy2POV: TLabel;lbl34: TLabel;lbl35: TLabel;lbl37: TLabel;lbl36: TLabel;
    lbl38: TLabel;lbl39: TLabel;lbl41: TLabel;lbl40: TLabel;lbl43: TLabel;lbl42: TLabel;lbl45: TLabel;lbl44: TLabel;lbl47: TLabel;lbl46: TLabel;lbl48: TLabel;lbl49: TLabel;lbl50: TLabel;lbl51: TLabel;lbl52: TLabel;lbl53: TLabel;lbl55: TLabel;lbl54: TLabel;
//  TLMDRadioButton Components
    rb36: TLMDRadioButton;rb37: TLMDRadioButton;rb38: TLMDRadioButton;rb1: TLMDRadioButton;rb2: TLMDRadioButton;rb31: TLMDRadioButton;rb32: TLMDRadioButton;rb33: TLMDRadioButton;rb43: TLMDRadioButton;rb44: TLMDRadioButton;rb45: TLMDRadioButton;rb46: TLMDRadioButton;
    rb47: TLMDRadioButton;rb48: TLMDRadioButton;rb49: TLMDRadioButton;rb50: TLMDRadioButton;rb51: TLMDRadioButton;rb52: TLMDRadioButton;rb53: TLMDRadioButton;rb39: TLMDRadioButton;rb40: TLMDRadioButton;rb41: TLMDRadioButton;rb42: TLMDRadioButton;rb54: TLMDRadioButton;
    rb55: TLMDRadioButton;rb9: TLMDRadioButton;rb10: TLMDRadioButton;rb3: TLMDRadioButton;rb4: TLMDRadioButton;rb5: TLMDRadioButton;rb6: TLMDRadioButton;rb13: TLMDRadioButton;rb14: TLMDRadioButton;rb15: TLMDRadioButton;rb16: TLMDRadioButton;rb17: TLMDRadioButton;
    rb18: TLMDRadioButton;rb19: TLMDRadioButton;rb20: TLMDRadioButton;rb21: TLMDRadioButton;rb22: TLMDRadioButton;rb23: TLMDRadioButton;rb24: TLMDRadioButton;rb25: TLMDRadioButton;rb26: TLMDRadioButton;rb27: TLMDRadioButton;rb28: TLMDRadioButton;rb29: TLMDRadioButton;
    rb30: TLMDRadioButton;rb7: TLMDRadioButton;rb8: TLMDRadioButton;
//  TJvRichEdit Components
    RE_Log: TJvRichEdit;    
//  TSpinEdit Components
    se1: TSpinEdit;    
//  TLmdFont Components
    LMDFontComboBox1: TLMDFontComboBox;
    LMDFontSizeComboBox1: TLMDFontSizeComboBox;
//  TRadioButton        
    rb56: TRadioButton;rb57: TRadioButton;
    sCheckBox65: TsCheckBox;
    Mame_GameInfoPanel: TsPanel;
    sLabel139: TsLabel;
    sBitBtn101: TsBitBtn;
    Image7: TImage;
    Image8: TImage;
    sLabel146: TsLabel;
    sLabel147: TsLabel;
    Zinc_GameInfoPanel: TsPanel;
    sLabel148: TsLabel;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    sLabel149: TsLabel;
    sLabel150: TsLabel;
    sLabel151: TsLabel;
    sLabel152: TsLabel;
    Image13: TImage;
    Image14: TImage;
    sLabel153: TsLabel;
    sLabel154: TsLabel;
    Image15: TImage;
    Image16: TImage;
    sLabel155: TsLabel;
    sLabel156: TsLabel;
    sBitBtn117: TsBitBtn;
    pm1: TPopupMenu;
    Search1: TMenuItem;
    sBitBtn118: TsBitBtn;
    sBitBtn119: TsBitBtn;
    sBitBtn120: TsBitBtn;
    mTabGameInfo: TsPanel;
    Image1: TImage;
    sLabel140: TsLabel;
    Image2: TImage;
    sLabel141: TsLabel;
    Image3: TImage;
    sLabel142: TsLabel;
    Image5: TImage;
    sLabel144: TsLabel;
    Image6: TImage;
    sLabel145: TsLabel;
    Image4: TImage;
    sLabel143: TsLabel;
    sLabel157: TsLabel;
    Image17: TImage;
    mTabMedia: TsPanel;
    mTabRom: TsPanel;
    Image18: TImage;
    sLabel158: TsLabel;
        
//  Main form actions
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
//  Global Settings
    // KeyMap
    procedure CheckUpKey(Sender: TObject);
    // Find files or Find Dirs
    procedure Find_DirsClose(Sender: TObject);
    procedure Find_FilesClose(Sender: TObject);
    procedure Find_FilesCanClose(Sender: TObject; var CanClose: Boolean);
    // Timers
    procedure tmr1Timer(Sender: TObject);
    //xmlProgress
    procedure XMLProgress(Sender: TObject; position: Int64);
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
    procedure Mame_ManageHlsl(Sender: TObject);
    procedure Mame_ManageSound(Sender: TObject);
    procedure Mame_ManageOthers(Sender: TObject);    
    procedure nxtgrd_ips_mameplusCellClick(Sender: TObject; ACol,ARow: Integer);
    procedure nxtgrd_ips_mameplusExpand(Sender: TObject; ARow: Integer);
    procedure Mame_ManageDatabase(Sender: TObject);
    procedure Mame_GlobalOrTopicSave(Sender: TObject);
//  Zinc
    procedure Zinc_ConfigPaths(Sender: TObject);
    procedure Zinc_ClickGraphicsState(Sender: TObject);
    procedure Zinc_SoundChecking(Sender: TObject);
    procedure Zinc_Database(Sender: TObject);
//  Hatari
    procedure Hatari_ConfigPaths(Sender: TObject);
    procedure Hatari_ConfigSystem(Sender: TObject);
    procedure Hatari_ConfigRoms(Sender: TObject);
    procedure Hatari_ConfigScreenSound(Sender: TObject);
    procedure Hatari_ConfigJoy(Sender: TObject);
    procedure Hatari_ConfigJoy2(Sender: TObject);
    procedure Hatari_ConfigDatabase(Sender: TObject);
//  pSX
    procedure pSX_ConfigPaths(Sender: TObject);
    procedure pSX_ConfigScreen(Sender: TObject);
    procedure pSX_ConfigSound(Sender: TObject);
//  KiGB
    procedure Kigb_ConfigPaths(Sender: TObject);
    procedure Kigb_ConfigScreen(Sender: TObject);
    procedure Kigb_ConfigSound(Sender: TObject);
    procedure Kigb_ConfigOthers(Sender: TObject);
    procedure Kigb_ConfigDatabase(Sender: TObject);
//
//WidGets
//
//  Weather
    procedure sEdit31KeyPress(Sender: TObject; var Key: Char);
    procedure Weather_Config(Sender: TObject);
//  DateTime
    procedure DateTime_Config(Sender: TObject);
    procedure CEJoy1ButtonDown(Sender: TNLDJoystick;
      const Buttons: TJoyButtons);
    procedure FormShow(Sender: TObject);
    procedure CEJoy1ButtonUp(Sender: TNLDJoystick;
      const Buttons: TJoyButtons);
    procedure CEJoy1Move(Sender: TNLDJoystick; const JoyPos: TJoyRelPos;
      const Buttons: TJoyButtons);
    procedure CEJoy1Idle(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure OnMouseOverToolTip(Sender: TObject;Shift: TShiftState; X,Y: Integer);
    procedure nxtgrd_mameCellDblClick(Sender: TObject; ACol,
      ARow: Integer);
    procedure nxtgrd_zincCellDblClick(Sender: TObject; ACol,
      ARow: Integer);
    procedure Search1Click(Sender: TObject);
      
  private
    { Private declarations }
    procedure UMDestroyPanel(var Message: TMessage); message UM_DESTROYPANEL;
    procedure OnClickedPanelActions(var message: TMessage); message UM_ONClICKEDPANELSACTIONS; 
  public
    { Public declarations }
    procedure ClosePanel(Sender: TObject);
    procedure ClickOnWidgetPanels(Sender: TObject);
  end;

var
//New Version 0.3.0
  Conf: TConf;
  Program_Path: string;
  Cmenustate,CurrentPanel,ConfEditor_ImagePath,CDirPath: string;
  gFindFiles,gFindDirs,gSaveFiles: string;
  progressComesFrom: string;
//Joystick Vars
  Joy1Active,Joy2Active: Boolean;
  Joy1Buttons: array [0..31] of string;
  Joy2Buttons: array [0..31] of string;  
//List with all avialable graphic card resolutions  
  resolutions: TStringList; 
// Native progress XML Needed vars
  FGa: TGauseStream;
  FFileName: UTF8String;  
  FFileSize: int64;      
  
implementation

uses
  mainconf,form_splash;

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

procedure TConf.FormDestroy(Sender: TObject);
var
  Comp: TComponent;
  i: Byte;
begin
  for i := 1 to 2 do
    begin
      Comp := FindComponentEx('Conf.MemoEmu' + IntToStr(i));
      TMemo(Comp).Free
    end;
  SaveWeather_AtExit;
end;

////////////////////////////////////////

procedure TConf.tmr1Timer(Sender: TObject);
begin
  ChangeStatusInfo;
end;

procedure TConf.CheckUpKey(Sender: TObject);
var
  keyCode : Integer;
  PrevKey : String; 
begin
  RestoreTheOriginalColor;
  PrevKey := TsPanel(Sender).Caption;
  TsPanel(Sender).Caption := 'Waiting...';
  if Pem_psx_sound.Tag = 1 then
    sLabel108.Caption := 'Hit KEY for '+ TsPanel(Sender).Hint;
  TsPanel(Sender).SetFocus;
  repeat
    Application.ProcessMessages;  // let other messages happen
    Sleep(50);                     // relinquish time for other processes
    keyCode:=KeyPressed;
  until keyCode>=0;
  CheckedTimes := 0;
  CheckForHittingKey;
  if CheckedTimes > 0 then
    begin
      TsPanel(Sender).Caption := PrevKey;
      if Pem_psx_sound.Tag = 1 then
        sLabel108.Caption := 'This key already used.'
      else if Pem_psx_others.Tag = 1 then
        sLabel129.Caption := 'This key already used.'
      else if Pem_hatari_joy.Tag = 1 then
        sLabel63.Visible := True
      else if Pem_kigb_sound.Tag = 1 then
        sLabel60.Visible := True;
      Application.ProcessMessages;
    end
  else
    begin
      TsPanel(Sender).Caption := VirtualKeyCodeToKeyName(keyCode);
      if Pem_psx_sound.Tag = 1 then
        sLabel108.Caption := ''
      else if Pem_psx_others.Tag = 1 then
        sLabel129.Caption := ''
      else if Pem_hatari_joy.Tag = 1 then
        sLabel63.Visible := False
      else if Pem_kigb_sound.Tag = 1 then
        sLabel60.Visible := False;
      Application.ProcessMessages;
    end;
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
  if TLMDRadioButton(Sender).Hint = 'OpenGL' then
    UseZinc_OpenGL_Settings
  else if TLMDRadioButton(Sender).Hint = 'D3D' then
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

procedure TConf.Zinc_Database(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Back_ZincDatabaseSheet' then
    BackToZinc_DatabaseSheet;
end;

procedure TConf.confEditor_Config_Set(Sender: TObject);
begin
  if TsCheckBox(Sender).Hint = 'Show_path_in_main_form' then
    CheckShowHelpInFormCaption
  else if TsComboBox(Sender).Hint = 'Window_effect_type' then
    WindowsEffectsType
  else if TButton(Sender).Hint = 'Make_Log' then
    CreateLog_For_All
  else if TsButton(Sender).Hint = 'Refresh_Joystics' then
    FoundAndSetJoystics
  else if TsBitBtn(Sender).Hint = 'TestJoy1' then
    ShowOrHideTestJoy1Area
  else if TsBitBtn(Sender).Hint = 'TestJoy2' then
    ShowOrHideTestJoy2Area;
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
  else if TsCheckBox(Sender).Hint = 'Show Setuped Mame' then
    ShowOnlySetupedMameBuilds
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
    Graphics_MovingScrollbar('sbar_mame_emulatrionspeed','sLabel11','0.00',100)
//  else if TsComboBox(Sender).Hint = 'Change_rotation' then
//    MameRotationChange
  else if TsScrollBar(Sender).Hint = 'Change_pause_brightness' then
    Graphics_MovingScrollbar('sbar_mame_pausebrightness','sLabel3','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_gamma' then
    Graphics_MovingScrollbar('sbar_mame_gammacorrection','sLabel4','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_brightness' then
    Graphics_MovingScrollbar('sbar_mame_brightnesscorrection','sLabel5','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_contrast' then
    Graphics_MovingScrollbar('sbar_mame_contrastcorrection','sLabel2','0.00',100)
  else if TsComboBox(Sender).Hint = 'Change_video_mode' then
    MameVideoModeChange('')
  else if TsScrollBar(Sender).Hint = 'Change_fullscreen_gamma' then
    Graphics_MovingScrollbar('sbar_mame_Fgamma','sLabel8','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_fullscreen_brightness' then
    Graphics_MovingScrollbar('sbar_mame_Fbrightness','sLabel7','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_fullscreen_contrast' then
    Graphics_MovingScrollbar('sbar_mame_Fcontrast','sLabel6','0.00',100)
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
  if TsBitBtn(Sender).Hint = 'Others_Others' then
    Others_ButtonOthersClick
  else if TsBitBtn(Sender).Hint = 'Others_MamePlus' then
    Others_ButtonMamePlusClick
  else if TsBitBtn(Sender).Hint = 'Others_Tools' then
    Others_ButtonToolsClick
  else if TsScrollBar(Sender).Hint = 'Change_thread_priority' then
    MameThreadPriorityChange
  else if TsScrollBar(Sender).Hint = 'Change_beam_width' then
    MameBeamWidthChange
  else if TsScrollBar(Sender).Hint = 'Change_flicker' then
    MameFlickerChange
  else if TsCheckBox(Sender).Hint = 'Mplus_enable_ips' then
    IPSEnableClick_MamePlus
  else if TsBitBtn(Sender).Hint = 'Mplus_find_ips' then
    FindIPSDir_MamePlus
  else if TsCheckBox(Sender).Hint = 'Mplus_check_hiscore' then
    HiScorePath_MamePlus
  else if TsBitBtn(Sender).Hint = 'Mplus_find_hiscore' then
    FindHiScoreDat_MamePlus
  else if TsScrollBar(Sender).Hint = 'Mplus_change_ui_transparent' then
    MameUITrasparentChange_MamePlus
  else if TRadioButton(Sender).Hint = 'System font' then
    Tools_SystemFont_RadioButtonClick
  else if TRadioButton(Sender).Hint = 'Directory font' then
    Tools_DirectoryFont_RadioButtonClick
  else if TLMDFontComboBox(Sender).Hint = 'Tools_change_font' then
    Tools_FontComboBoxChange
  else if TsBitBtn(Sender).Hint = 'Tools_find_font' then
    Tools_FindFontFromDirClick
  else if TLMDFontSizeComboBox(Sender).Hint = 'Tools_change_font_size' then
    Tools_FontSizeComboBoxChange
  else if TsBitBtn(Sender).Hint = 'Tools_create_font' then
    Tools_CreateFont;
end;

procedure TConf.Mame_ManageHlsl(Sender: TObject);
begin    
  If TsCheckBox(Sender).Hint = 'HLSL_Enable' then
    Enable_HLSL(TsCheckBox(Sender).Checked)
  else if TsCheckBox(Sender).Hint = 'HLSL_EnableYIQ' then
    Enable_HLSL_YIQ(TsCheckBox(Sender).Checked)
  else if TsBitBtn(Sender).Hint = 'HLSL_Switches' then
    HLSL_ButtonSwithcesClick
  else if TsBitBtn(Sender).Hint = 'HLSL_Surface/Color' then
    HLSL_ButtonSurface_ColorClick
  else if TsBitBtn(Sender).Hint = 'HLSL_NTSC' then
    HLSL_ButtonNTSCClick
  else if TsScrollBar(Sender).Hint = 'Change_ShadowMaskAlpha' then
    HLSL_MovingScrollbar('sScrollbar1','lbl35','0.00',100)      
  else if TsScrollBar(Sender).Hint = 'Change_ShadowMaskUSize' then
    HLSL_MovingScrollbar('sScrollbar2','lbl37','0.000000',1000000)
  else if TsScrollBar(Sender).Hint = 'Change_ShadowMaskVSize' then
    HLSL_MovingScrollbar('sScrollbar3','lbl39','0.000000',1000000)
  else if TsScrollBar(Sender).Hint = 'Change_Curvature' then
    HLSL_MovingScrollbar('sScrollbar4','lbl41','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_Pincushion' then
    HLSL_MovingScrollbar('sScrollbar5','lbl43','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_ScanlineAlpha' then
    HLSL_MovingScrollbar('sScrollbar6','lbl45','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_ScanlineSize' then
    HLSL_MovingScrollbar('sScrollbar7','lbl47','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_ScanlineBrightScale' then
    HLSL_MovingScrollbar('sScrollbar8','lbl49','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_ScanlineBrightOffset' then
    HLSL_MovingScrollbar('sScrollbar9','lbl51','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_ScanlineJitter' then
    HLSL_MovingScrollbar('sScrollbar10','lbl53','0.00',100)
  else if TsScrollBar(Sender).Hint = 'Change_Saturation' then
    HLSL_MovingScrollbar('sScrollbar11','lbl55','0.00',100);
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

procedure TConf.Mame_ManageDatabase(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Erase_dir_data' then
    EraseMameDir(sComboBox72.Text)
  else if TsComboBox(Sender).Hint = 'Show_statistics' then
    ShowDatabaseStatsFor(sComboBox72.Text)
  else if TsBitBtn(Sender).Hint = 'Back_DatabaseSheet' then
    BackToDatabaseSheet
  else if TsBitBtn(Sender).Hint = 'Tab_GameInfo' then
    ShowMame_TabGameInfoClick
  else if TsBitBtn(Sender).Hint = 'Tab_Media' then
    ShowMame_TabMediaClick
  else if TsBitBtn(Sender).Hint = 'Tab_Rom' then  
    ShowMame_TabRomClick;
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

procedure TConf.Hatari_ConfigPaths(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Hatari_Exe' then
    Add_hatari_exe_File
  else if TsBitBtn(Sender).Hint = 'Hatari_Tos' then
    Add_hatari_tos_File_and_setup_Hatari
  else if TsBitBtn(Sender).Hint = 'Hatari_screenshots' then
    SetHatari_ScreenshotsPath
  else if TsBitBtn(Sender).Hint = 'Hatari_music' then
    SetHatari_MusicPath
  else if TsBitBtn(Sender).Hint = 'Hatari_boxscans' then
    SetHatari_BoxscansPath
  else if TsBitBtn(Sender).Hint = 'Hatari_diskscans' then
    SetHatari_DiskscansPath
  else if TsBitBtn(Sender).Hint = 'Hatari_adverts' then
    SetHatari_AdvertsPath
  else if TsBitBtn(Sender).Hint = 'Hatari_cheats' then
    SetHatari_CheatsPath
  else if TsBitBtn(Sender).Hint = 'Hatari_hints' then
    SetHatari_HintsPath
  else if TsBitBtn(Sender).Hint = 'Hatari_instructions' then
    SetHatari_InstructionsPath
  else if TsBitBtn(Sender).Hint = 'Hatari_maps' then
    SetHatari_MapsPath
  else if TsBitBtn(Sender).Hint = 'Hatari_solutions' then
    SetHatari_SolutionsPath
  else if TsBitBtn(Sender).Hint = 'Hatari_reviews' then
    SetHatari_ReviewsPath
  else if TsBitBtn(Sender).Hint = 'Hatari_other' then
    SetHatari_OtherPath;
end;

procedure TConf.Hatari_ConfigSystem(Sender: TObject);
begin
  if TsCheckBox(Sender).Hint = 'Auto_memory_state' then
    CheckUnCheck_AutoSaveMemeoryState;
end;

procedure TConf.Hatari_ConfigRoms(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Set_cartridge' then
    SetHatari_CartridgeImage
  else if TsBitBtn(Sender).Hint = 'Set_diskimagesdir' then
    SetHatari_DiskImagesDir
  else if TsBitBtn(Sender).Hint = 'Set_hdimage' then
    SetHatari_HardDiskImage
  else if TsBitBtn(Sender).Hint = 'Set_masteride' then
    SetHatari_MasterIDEImage
  else if TsBitBtn(Sender).Hint = 'Set_slaveide' then
    SetHatari_SlaveIDEImage
  else if TsBitBtn(Sender).Hint = 'Set_gemdos' then
    SetHatari_GemDosDrive
  else if TsBitBtn(Sender).Hint = 'Eject_cartridge' then
    EjectHatari_CartridgeImage
  else if TsBitBtn(Sender).Hint = 'Eject_hdimage' then
    EjectHatari_HardDiskImage
  else if TsBitBtn(Sender).Hint = 'Eject_masteride' then
    EjectHatari_MasterIDEImage
  else if TsBitBtn(Sender).Hint = 'Eject_slaveide' then
    EjectHatari_SlaveIDEImage
  else if TsBitBtn(Sender).Hint = 'Eject_gemdos' then
    EjectHatari_GemDosDrive;
end;

procedure TConf.Hatari_ConfigScreenSound(Sender: TObject);
begin
//
end;

procedure TConf.Hatari_ConfigJoy(Sender: TObject);
begin
  if TsComboBox(Sender).Hint = 'Change_joystick_port' then
    SaveCurrentState_Joy(TsComboBox(Sender).ItemIndex)
  else if TsBitBtn(Sender).Hint = 'Set_mapping' then
    SetHatari_Mapping
  else if TsBitBtn(Sender).Hint = 'Eject_mapping' then
    EjectHatari_Mapping
  else if TLMDRadioButton(Sender).Hint = 'Joystick_disable' then
    PressJoy_Disable
  else if TLMDRadioButton(Sender).Hint = 'Joystick_keyboard' then
    PressJoy_Keyboard
  else if TLMDRadioButton(Sender).Hint = 'Joystick_real' then
    PressJoy_RealJoystick;
end;

procedure TConf.Hatari_ConfigJoy2(Sender: TObject);
begin
  if TsComboBox(Sender).Hint = 'Change_joystick_port' then
    Change_JoystickType(TsComboBox(Sender).ItemIndex);
end;

procedure TConf.Hatari_ConfigDatabase(Sender: TObject);
begin
  if TsButton(Sender).Hint = 'SingleGames' then
    SingleGames_Click
  else if TsButton(Sender).Hint = 'BigCollections' then
    BigCollections_Click
  else if TsComboBox(Sender).Hint = 'BigC' then
    begin
      if TsComboBox(Sender).ItemIndex <> 0 then
        LoadBigCollection(TsComboBox(Sender).Text)
    end
  else if TsButton(Sender).Hint = 'SmallCollections' then
    SmallCollections_Click
  else if TsComboBox(Sender).Hint = 'SmallC' then
    begin
      if TsComboBox(Sender).ItemIndex <> 0 then
        LoadSmallCollection(TsComboBox(Sender).Text)
    end
  else if TsButton(Sender).Hint = 'Demos' then
    Demos_Click
  else if TsButton(Sender).Hint = 'Applications' then
    Applications_Click;
end;

procedure TConf.pSX_ConfigPaths(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'pSX_exe' then
    Add_pSX_exe_file
  else if TsBitBtn(Sender).Hint = 'pSX_bios' then
    Add_pSX_bios_file
  else if TsBitBtn(Sender).Hint = 'pSX_screenshotsdir' then
    SetpSX_ScreenShotsDir
  else if TsBitBtn(Sender).Hint = 'pSX_cdimagesdir' then
    SetpSX_CDImagesDir
  else if TsBitBtn(Sender).Hint = 'pSX_savestatesdir' then
    SetpSX_SaveStatesDir
  else if TsBitBtn(Sender).Hint = 'pSX_memorycardsdir' then
    SetpSX_MemoryCardsDir
  else if TsBitBtn(Sender).Hint = 'pSX_mcard1' then
    SetpSX_Card1
  else if TsBitBtn(Sender).Hint = 'pSX_mcard2' then
    SetpSX_Card2
  else if TsBitBtn(Sender).Hint = 'pSX_ejectmcard1' then
    EjectpSX_Card1
  else if TsBitBtn(Sender).Hint = 'pSX_ejectmcard2' then
    EjectpSX_Card2;
end;

procedure TConf.pSX_ConfigScreen(Sender: TObject);
begin
  if TsScrollBar(Sender).Hint = 'pSX_gamma' then
    pSX_gammaChange
  else if TsScrollBar(Sender).Hint = 'pSX_brightness' then
    pSX_brightnessChange
  else if TsScrollBar(Sender).Hint = 'pSX_contrast' then
    pSX_contrastChange
  else if TsBitBtn(Sender).Hint = 'pSX_resetgraphics_to_default' then
    pSX_ResetGraphs;
end;

procedure TConf.pSX_ConfigSound(Sender: TObject);
begin
  if TsCheckBox(Sender).Hint = 'pSX_same' then
    pSX_sameAsEmulatedMachine
  else if TsScrollBar(Sender).Hint = 'pSX_latancy' then
    pSX_latancyChange
  else if TsScrollBar(Sender).Hint = 'pSX_xalatancy' then
    pSX_XAlatancyChange
  else if TsComboBox(Sender).Hint = 'pSX_joystick' then
    pSX_JoystickPortChange;
end;

procedure TConf.Kigb_ConfigPaths(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'Kigb_getkigb' then
    Add_Kigb_Exe
  else if TsBitBtn(Sender).Hint = 'Kigb_rompath' then
    SetKigb_RomPath
  else if TsBitBtn(Sender).Hint = 'Kigb_snappath' then
    SetKigb_SnapshotPath
  else if TsBitBtn(Sender).Hint = 'Kigb_savepath' then
    SetKigb_SavePath
  else if TsBitBtn(Sender).Hint = 'Kigb_savestatepath' then
    SetKigb_SaveStatePath
  else if TsBitBtn(Sender).Hint = 'Kigb_inputpath' then
    SetKigb_InputPath
  else if TsBitBtn(Sender).Hint = 'Kigb_configurepath' then
    SetKigb_ConfigurePath;
end;

procedure TConf.Kigb_ConfigScreen(Sender: TObject);
begin
  if TPanel(Sender).Hint = 'Kigb_color' then
    OnPallete_ColorPanelClick(TPanel(Sender).Tag)
  else if TJvOfficeColorPanel(Sender).Hint = 'Kigb_setcolor' then
    OnPallete_ChangeCustomColor
  else if TLMDRadioButton(Sender).Hint = 'Kigb_otherthancustom' then
    OnPallete_AllOtherExeptCustomClick
  else if TLMDRadioButton(Sender).Hint = 'Kigb_custom' then
    OnPallete_CustomClick;
end;

procedure TConf.Kigb_ConfigSound(Sender: TObject);
begin
//
end;

procedure TConf.Kigb_ConfigOthers(Sender: TObject);
begin
  if TRadioButton(Sender).Hint = 'Kigb_GBD_None' then
    CheckNone_GB_Device
  else if TRadioButton(Sender).Hint = 'Kigb_GBD_BGPrinter' then
    CheckBGPrinter_GB_Device
  else if TRadioButton(Sender).Hint = 'Kigb_GBD_BarcodeBoy' then
    CheckBarcodeBoy_GB_Device;
end;

procedure TConf.Kigb_ConfigDatabase(Sender: TObject);
begin
  if TsButton(Sender).Hint = 'Kigb_GameBoy' then
    LoadGameBoyDatabase
  else if TsButton(Sender).Hint = 'Kigb_GameBoyColor' then
    LoadGameBoyColorDatabase;
end;

procedure TConf.Weather_Config(Sender: TObject);
begin
  if TsButton(Sender).Hint = 'Weather_AddSelection' then
    PressPlus_Add
  else if TsButton(Sender).Hint = 'Weather_CancelAdd' then
    PressCancel_Add
  else if TsListBox(Sender).Hint = 'Weather_ClickedTownInfo' then
    onClickIn_Town(TsListBox(Sender).ItemIndex)
  else if TsButton(Sender).Hint = 'Weather_ClickToAddTownInfo' then
    OnClickCheckIn_Town
  else if TsButton(Sender).Hint = 'Weather_Refresh' then
    RefreshTheWeatherPanels
  else if TsButton(Sender).Hint = 'Weather_Celcius' then
    RefreshTheTempPanels('C')
  else if TsButton(Sender).Hint = 'Weather_Fahrenheit' then
    RefreshTheTempPanels('F');
end;

procedure TConf.sEdit31KeyPress(Sender: TObject; var Key: Char);
begin
  KeyPressedInEdit(Key);
end;

procedure TConf.ClickOnWidgetPanels(Sender: TObject);
begin
  PostMessage(Handle,UM_ONClICKEDPANELSACTIONS,TsPanel(Sender).Tag,0);
end;

procedure TConf.OnClickedPanelActions(var message: TMessage);
begin
  if message.WParam < 11 then
    WeatherPanelClicked(message.WParam);
end;

procedure TConf.ClosePanel(Sender: TObject);
begin
  PostMessage(Handle, UM_DESTROYPANEL, TsBitBtn(Sender).Tag, 0);
end;

procedure TConf.UMDestroyPanel(var Message: TMessage);
var
  panelComp: TComponent;
begin
  if Message.WParam < 11 then
    begin
      panelComp := FindComponentEx('Conf.MyPanel_weather' + IntToStr(Message.WParam));
      panelComp.Destroy;
      SortOtherWeatherPanels(Message.WParam);
    end
  else if Message.WParam >= 11 then
    begin
      panelComp := FindComponentEx('Conf.MyPanel_datetime' + IntToStr(Message.WParam));
      panelComp.Destroy;
      SortOtherDateTimePanels(Message.WParam);
    end;
end;

procedure TConf.DateTime_Config(Sender: TObject);
begin
  if TsBitBtn(Sender).Hint = 'DateTime_WorldClock' then
    ShowWorldClock
  else if TsBitBtn(Sender).Hint = 'DateTime_InternetTime' then
    ShowInternetTime
  else if TsButton(Sender).Hint = 'DateTime_AddSelection' then
    Press_AddTime
  else if TsButton(Sender).Hint = 'DateTime_Cancel' then
    Cancel_Add
  else if TsBitBtn(Sender).Hint = 'DateTime_GetInternetTime' then
    Get_InternetTime
  else if TsButton(Sender).Hint = 'DateTime_SetComputersTime' then
    Set_ComputersTime
  else if TsComboBox(Sender).Hint = 'DateTime_CountryChoosed' then
    Get_DataOfCountry
  else if TsButton(Sender).Hint = 'DateTime_CreateSelection' then
    AddSelection;
end;

procedure TConf.XMLProgress(Sender: TObject; position: Int64);
begin
  ProgressTgauge(position);
end;

procedure TConf.CEJoy1ButtonDown(Sender: TNLDJoystick;
  const Buttons: TJoyButtons);
begin
  if Cmenustate = 'ce_configuration' then
    TestPressButtonDownInAreaJoystics(Buttons,Sender.ID);
end;

procedure TConf.CEJoy1ButtonUp(Sender: TNLDJoystick;
  const Buttons: TJoyButtons);
begin
  if Cmenustate = 'ce_configuration' then
    TestPressButtonUpInAreaJoystics(Buttons,Sender.ID);
end;

procedure TConf.CEJoy1Move(Sender: TNLDJoystick; const JoyPos: TJoyRelPos;
  const Buttons: TJoyButtons);
begin
  if Cmenustate = 'ce_configuration' then
    TestJoyHandleInAreaJoystics(JoyPos);
end;


procedure TConf.FormShow(Sender: TObject);
begin
  FoundAndSetJoystics;
  SkinM.UpdateSkin(True);
end;

procedure TConf.CEJoy1Idle(Sender: TObject);
var
  comp: TComponent;
  i: Integer;
begin
  if Cmenustate = 'ce_configuration' then
    begin
      comp := FindComponentEx('Conf.JvLED1');
      TJvLED(comp).Status := true;
      for i := 2 to 5 do
        begin
          comp := FindComponentEx('Conf.JvLED' + IntToStr(i));
          TJvLED(comp).Status := False;
        end;
    end;  
end;

procedure TConf.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if Cmenustate = 'wg_weather' then
    WeatherWheelAction(WheelDelta,Handled)
  else if Cmenustate = 'wg_datetime' then
    DateTimeWheelAction(WheelDelta,Handled);    
end;

procedure TConf.OnMouseOverToolTip(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if TsEdit(Sender).Tag > 1000 then
    ShowToolTip(TsEdit(Sender).Name,'Edit')
  else if TsLabel(Sender).Tag > 1000 then
    ShowToolTip(TsLabel(Sender).Name,'Label');
end;

procedure TConf.nxtgrd_mameCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  ShowMameGameInfoPanel(nxtgrd_mame.Cell[1,ARow].AsString,nxtgrd_mame.Cell[2,ARow].AsString);
end;

procedure TConf.nxtgrd_zincCellDblClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  ShowZincGameInfoPanel(nxtgrd_zinc.Cell[1,Arow].AsString,nxtgrd_zinc.Cell[2,Arow].AsString);
end;

procedure TConf.Search1Click(Sender: TObject);
begin
  fSearch.Show;
end;

end.
