unit psx_sound;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetpSX_SoundfrompSXIni;

  procedure pSX_sameAsEmulatedMachine;
  procedure pSX_latancyChange;
  procedure pSX_XAlatancyChange;

// Menu actions
  procedure Show_psx_soundpanel;
  procedure em_psx_sound_ShowDynamicComps;
  procedure em_psx_sound_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  psx_screen,psx_paths,psx_others,psx_database;


procedure SetpSX_SoundfrompSXIni;
var
  Sound_Str: string;
  Screen_Int: Integer;
  DiffNum: Extended;
begin
  if pSX_Exe <> '' then
    begin
      Sound_Str := pSX_Ini.ReadString('Sound','Device',Sound_Str);
      if Sound_Str = 'ffffffffffffffffffffffffffffffff' then
        Conf.sComboBox63.ItemIndex := 0
      else if Sound_Str = '00000000000000000000000000000000' then
        Conf.sComboBox63.ItemIndex := 1;
      Sound_Str := pSX_Ini.ReadString('Sound','Reverb',Sound_Str);
      if Sound_Str = '0' then
        Conf.sCheckBox25.Checked := False
      else
        Conf.sCheckBox25.Checked := True;
      Sound_Str := pSX_Ini.ReadString('Sound','Sync',Sound_Str);
      if Sound_Str = '0' then
        Conf.sCheckBox46.Checked := False
      else
        Conf.sCheckBox46.Checked := True;
      Sound_Str := pSX_Ini.ReadString('Sound','Interpolate',Sound_Str);
      if Sound_Str = '0' then
        Conf.sCheckBox42.Checked := False
      else
        Conf.sCheckBox42.Checked := True;
      Sound_Str := pSX_Ini.ReadString('Sound','Frequency',Sound_Str);
      if Sound_Str = '-1' then
        Conf.sCheckBox45.Checked := True
      else
        begin
          Conf.sCheckBox45.Checked := False;
          Conf.sComboBox64.Text := Sound_Str + 'Hz';
        end;
      Screen_Int := pSX_Ini.ReadInteger('Sound','Latency',Screen_Int);
      Conf.sbar_psx_latency.Position := Screen_Int;
      pSX_latancyChange;
      Screen_Int := pSX_Ini.ReadInteger('Sound','XALatency',Screen_Int);
      Conf.sbar_psx_xalatency.Position := Screen_Int;
      pSX_XAlatancyChange;
      // Prepei na kano tin diadikasia gia ta joysticks...(poli douleia)...
    end;
end;

procedure pSX_sameAsEmulatedMachine;
begin
  if Conf.sCheckBox45.Checked = True then
    Conf.sComboBox64.Enabled := False
  else
    Conf.sComboBox64.Enabled := True;
end;  

procedure pSX_latancyChange;
begin
  Conf.sLabel93.Caption := IntToStr(Conf.sbar_psx_latency.Position) + ' ms';
end;  

procedure pSX_XAlatancyChange;
begin
  Conf.sLabel90.Caption := IntToStr(Conf.sbar_psx_xalatency.Position) + ' ms';
end;  

//////////////////////////////////////////////////////////////////////////////
procedure Show_psx_soundpanel;
begin
  if (Cmenustate = 'em_consoles_psx_screen') then
    em_psx_screen_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_paths') then
    em_psx_paths_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_others') then
    em_psx_others_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_database') then
    em_psx_database_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,True);
  Cmenustate := 'em_consoles_psx_sound';
  em_psx_sound_ShowDynamicComps;
  ShowButtonDown(8,'EM_CONSOLES_SONY_PSX_SOUND');
  Conf.Pem_psx_sound.Tag := 1;
  Conf.Pem_psx_others.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_psx_sound');
end;

procedure em_psx_sound_ShowDynamicComps;
var
  i: Integer;
  Comp: TComponent;
begin
  for i := 1 to 4 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_psx_sound,'media\confeditor\images\psx\psx.png',
              3,590,100,71,i,True);
        2 : Image_Comp(Conf.Pem_psx_sound,'media\confeditor\images\psx\psx_image.png',
              587,381,150,280,i,True);
        3 : Image_Comp(Conf.Pem_psx_sound,'media\confeditor\images\psx\sound.png',
              451,2,291,71,i,True);
        4 : begin
              Image_Comp(Conf.grp12,'media\confeditor\images\psx\joystick.png',
              85,48,402,272,i,True);
              Comp := FindComponentEx('Conf.Pic4');
              TImage(Comp).Stretch := True;
            end;
      end;
    end;
end;

procedure em_psx_sound_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 4 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
end;

end.
 