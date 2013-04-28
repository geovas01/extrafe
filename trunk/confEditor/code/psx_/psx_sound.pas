unit psx_sound;

interface
uses
  SysUtils,Classes,ExtCtrls,global;

  procedure SetpSX_SoundfrompSXIni;
  procedure SavepSX_SoundAtExit;

  procedure pSX_sameAsEmulatedMachine;
  procedure pSX_latancyChange;
  procedure pSX_XAlatancyChange;
  procedure pSX_JoystickPortChange;

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
  Sound_Int: Integer;
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
      Sound_Int := pSX_Ini.ReadInteger('Sound','Latency',Sound_Int);
      Conf.sbar_psx_latency.Position := Sound_Int;
      pSX_latancyChange;
      Sound_Int := pSX_Ini.ReadInteger('Sound','XALatency',Sound_Int);
      Conf.sbar_psx_xalatency.Position := Sound_Int;
      pSX_XAlatancyChange;
      Sound_Int := pSX_Ini.ReadInteger('Controllers','Controller1Type',Sound_Int);
      if Sound_Int = -1 then
        Conf.sComboBox22.ItemIndex := 0
      else
        Conf.sComboBox22.ItemIndex := Sound_Int;
      Conf.sComboBox21.Items.Clear;
      Conf.sComboBox21.Items.Add('None');
      Sound_Str := pSX_Ini.ReadString('Input','JoystickDevice1',Sound_Str);
      if Sound_Str = 'NULL' then
        begin
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1L1',Sound_Int);
          Conf.sPanel.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1L2',Sound_Int);
          Conf.sPanel2.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Select',Sound_Int);
          Conf.sPanel3.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Start',Sound_Int);
          Conf.sPanel4.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1R1',Sound_Int);
          Conf.sPanel5.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1R2',Sound_Int);
          Conf.sPanel6.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Up',Sound_Int);
          Conf.sPanel7.Caption :=CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Left',Sound_Int);
          Conf.sPanel8.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Right',Sound_Int);
          Conf.sPanel9.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Down',Sound_Int);
          Conf.sPanel10.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Triangle',Sound_Int);
          Conf.sPanel13.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Circle',Sound_Int);
          Conf.sPanel14.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Square',Sound_Int);
          Conf.sPanel15.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Cross',Sound_Int);
          Conf.sPanel16.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1LStickX',Sound_Int);
          Conf.sPanel11.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1LStickY',Sound_Int);
          Conf.sPanel12.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1RStickX',Sound_Int);
          Conf.sPanel19.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1RStickY',Sound_Int);
          Conf.sPanel20.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1L3',Sound_Int);
          Conf.sPanel17.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1R3',Sound_Int);
          Conf.sPanel18.Caption := CNumberToShowString(Sound_Int);
        end
      else
        begin
          
          //gia to joystick.
        end;
    end;
end;

procedure SavepSX_SoundAtExit;
var
  text1: string;
  k,let: Integer;
begin
  if pSX_Exe <> '' then
    begin
      if Conf.sComboBox63.ItemIndex = 0 then
        pSX_Ini.WriteString('Sound','Device','ffffffffffffffffffffffffffffffff')
      else if Conf.sComboBox63.ItemIndex = 1 then
        pSX_Ini.WriteString('Sound','Device','00000000000000000000000000000000');
      if Conf.sCheckBox25.Checked = False then
        pSX_Ini.WriteInteger('Sound','Reverb',0)
      else
        pSX_Ini.WriteInteger('Sound','Reverb',1);
      if Conf.sCheckBox46.Checked = False then
        pSX_Ini.WriteInteger('Sound','Sync',0)
      else
        pSX_Ini.WriteInteger('Sound','Sync',1);
      if Conf.sCheckBox42.Checked = False then
        pSX_Ini.WriteInteger('Sound','Interpolate',0)
      else
        pSX_Ini.WriteInteger('Sound','Interpolate',1);
      pSX_Ini.WriteInteger('Sound','Latency',Conf.sbar_psx_latency.Position);
      pSX_Ini.WriteInteger('Sound','XALatency',Conf.sbar_psx_xalatency.Position);
      if Conf.sCheckBox45.Checked = True then
        pSX_Ini.WriteInteger('Sound','Frequency',-1)
      else
        begin
          text1 := Conf.sComboBox64.Text;
          k := Pos('Hz',text1);
          text1 := Trim(Copy(text1,0,Length(text1) - k));
          pSX_Ini.WriteInteger('Sound','Frequency',StrToInt(text1));
        end;
      if Conf.sComboBox22.ItemIndex = 0 then
        pSX_Ini.WriteInteger('Controllers','Controller1Type',-1)
      else
        pSX_Ini.WriteInteger('Controllers','Controller1Type',Conf.sComboBox22.ItemIndex);
      if Conf.sComboBox62.ItemIndex = 0 then
        begin
          if Conf.sComboBox21.ItemIndex = 0 then
            begin
              let := CStringToWriteNumber(Conf.sPanel.Caption);
              pSX_Ini.WriteInteger('Input','Key1L1',let);
              let := CStringToWriteNumber(Conf.sPanel2.Caption);
              pSX_Ini.WriteInteger('Input','Key1L2',let);
              let := CStringToWriteNumber(Conf.sPanel3.Caption);
              pSX_Ini.WriteInteger('Input','Key1Select',let);
              let := CStringToWriteNumber(Conf.sPanel4.Caption);
              pSX_Ini.WriteInteger('Input','Key1Start',let);
              let := CStringToWriteNumber(Conf.sPanel5.Caption);
              pSX_Ini.WriteInteger('Input','Key1R1',let);
              let := CStringToWriteNumber(Conf.sPanel6.Caption);
              pSX_Ini.WriteInteger('Input','Key1R2',let);
              let := CStringToWriteNumber(Conf.sPanel7.Caption);
              pSX_Ini.WriteInteger('Input','Key1Up',let);
              let := CStringToWriteNumber(Conf.sPanel8.Caption);
              pSX_Ini.WriteInteger('Input','Key1Left',let);
              let := CStringToWriteNumber(Conf.sPanel9.Caption);
              pSX_Ini.WriteInteger('Input','Key1Right',let);
              let := CStringToWriteNumber(Conf.sPanel10.Caption);
              pSX_Ini.WriteInteger('Input','Key1Down',let);
              let := CStringToWriteNumber(Conf.sPanel13.Caption);
              pSX_Ini.WriteInteger('Input','Key1Triangle',let);
              let := CStringToWriteNumber(Conf.sPanel14.Caption);
              pSX_Ini.WriteInteger('Input','Key1Circle',let);
              let := CStringToWriteNumber(Conf.sPanel15.Caption);
              pSX_Ini.WriteInteger('Input','Key1Square',let);
              let := CStringToWriteNumber(Conf.sPanel16.Caption);
              pSX_Ini.WriteInteger('Input','Key1Cross',let);
              let := CStringToWriteNumber(Conf.sPanel11.Caption);
              pSX_Ini.WriteInteger('Input','Key1LStickX',let);
              let := CStringToWriteNumber(Conf.sPanel12.Caption);
              pSX_Ini.WriteInteger('Input','Key1LStickY',let);
              let := CStringToWriteNumber(Conf.sPanel19.Caption);
              pSX_Ini.WriteInteger('Input','Key1RStickX',let);
              let := CStringToWriteNumber(Conf.sPanel20.Caption);
              pSX_Ini.WriteInteger('Input','Key1RStickY',let);
              let := CStringToWriteNumber(Conf.sPanel17.Caption);
              pSX_Ini.WriteInteger('Input','Key1L3',let);
              let := CStringToWriteNumber(Conf.sPanel18.Caption);
              pSX_Ini.WriteInteger('Input','Key1R3',let);
            end
          else
            begin
              //
            end;
        end
      else
        begin
          if Conf.sComboBox21.ItemIndex = 0 then
            begin
              let := CStringToWriteNumber(Conf.sPanel.Caption);
              pSX_Ini.WriteInteger('Input','Key2L1',let);
              let := CStringToWriteNumber(Conf.sPanel2.Caption);
              pSX_Ini.WriteInteger('Input','Key2L2',let);
              let := CStringToWriteNumber(Conf.sPanel3.Caption);
              pSX_Ini.WriteInteger('Input','Key2Select',let);
              let := CStringToWriteNumber(Conf.sPanel4.Caption);
              pSX_Ini.WriteInteger('Input','Key2Start',let);
              let := CStringToWriteNumber(Conf.sPanel5.Caption);
              pSX_Ini.WriteInteger('Input','Key2R1',let);
              let := CStringToWriteNumber(Conf.sPanel6.Caption);
              pSX_Ini.WriteInteger('Input','Key2R2',let);
              let := CStringToWriteNumber(Conf.sPanel7.Caption);
              pSX_Ini.WriteInteger('Input','Key2Up',let);
              let := CStringToWriteNumber(Conf.sPanel8.Caption);
              pSX_Ini.WriteInteger('Input','Key2Left',let);
              let := CStringToWriteNumber(Conf.sPanel9.Caption);
              pSX_Ini.WriteInteger('Input','Key2Right',let);
              let := CStringToWriteNumber(Conf.sPanel10.Caption);
              pSX_Ini.WriteInteger('Input','Key2Down',let);
              let := CStringToWriteNumber(Conf.sPanel13.Caption);
              pSX_Ini.WriteInteger('Input','Key2Triangle',let);
              let := CStringToWriteNumber(Conf.sPanel14.Caption);
              pSX_Ini.WriteInteger('Input','Key2Circle',let);
              let := CStringToWriteNumber(Conf.sPanel15.Caption);
              pSX_Ini.WriteInteger('Input','Key2Square',let);
              let := CStringToWriteNumber(Conf.sPanel16.Caption);
              pSX_Ini.WriteInteger('Input','Key2Cross',let);
              let := CStringToWriteNumber(Conf.sPanel11.Caption);
              pSX_Ini.WriteInteger('Input','Key2LStickX',let);
              let := CStringToWriteNumber(Conf.sPanel12.Caption);
              pSX_Ini.WriteInteger('Input','Key2LStickY',let);
              let := CStringToWriteNumber(Conf.sPanel19.Caption);
              pSX_Ini.WriteInteger('Input','Key2RStickX',let);
              let := CStringToWriteNumber(Conf.sPanel20.Caption);
              pSX_Ini.WriteInteger('Input','Key2RStickY',let);
              let := CStringToWriteNumber(Conf.sPanel17.Caption);
              pSX_Ini.WriteInteger('Input','Key2L3',let);
              let := CStringToWriteNumber(Conf.sPanel18.Caption);
              pSX_Ini.WriteInteger('Input','Key2R3',let);
            end
          else
            begin
              //
            end;        
        end;
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
  Conf.sLabel92.Caption := IntToStr(Conf.sbar_psx_latency.Position) + ' ms';
end;  

procedure pSX_XAlatancyChange;
begin
  Conf.sLabel90.Caption := IntToStr(Conf.sbar_psx_xalatency.Position) + ' ms';
end;  

procedure pSX_JoystickPortChange;
var
  Sound_Int: Integer;
  Sound_Str: string;
begin
  if Conf.sComboBox62.ItemIndex = 0 then
    begin
      Conf.grp12.Caption := 'Controller Setup = Joystick 1';
      Sound_Int := pSX_Ini.ReadInteger('Controllers','Controller1Type',Sound_Int);
      if Sound_Int = -1 then
        Conf.sComboBox22.ItemIndex := 0
      else
        Conf.sComboBox22.ItemIndex := Sound_Int;
      Conf.sComboBox21.Items.Clear;
      Conf.sComboBox21.Items.Add('None');
      Sound_Str := pSX_Ini.ReadString('Input','JoystickDevice1',Sound_Str);
      if Sound_Str = 'NULL' then
        begin
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1L1',Sound_Int);
          Conf.sPanel.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1L2',Sound_Int);
          Conf.sPanel2.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Select',Sound_Int);
          Conf.sPanel3.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Start',Sound_Int);
          Conf.sPanel4.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1R1',Sound_Int);
          Conf.sPanel5.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1R2',Sound_Int);
          Conf.sPanel6.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Up',Sound_Int);
          Conf.sPanel7.Caption :=CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Left',Sound_Int);
          Conf.sPanel8.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Right',Sound_Int);
          Conf.sPanel9.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Down',Sound_Int);
          Conf.sPanel10.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Triangle',Sound_Int);
          Conf.sPanel13.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Circle',Sound_Int);
          Conf.sPanel14.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Square',Sound_Int);
          Conf.sPanel15.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1Cross',Sound_Int);
          Conf.sPanel16.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1LStickX',Sound_Int);
          Conf.sPanel11.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1LStickY',Sound_Int);
          Conf.sPanel12.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1RStickX',Sound_Int);
          Conf.sPanel19.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1RStickY',Sound_Int);
          Conf.sPanel20.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1L3',Sound_Int);
          Conf.sPanel17.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key1R3',Sound_Int);
          Conf.sPanel18.Caption := CNumberToShowString(Sound_Int);
        end;
    end
  else
    begin
      Conf.grp12.Caption := 'Controller Setup = Joystick 2';
      Sound_Int := pSX_Ini.ReadInteger('Controllers','Controller2Type',Sound_Int);
      if Sound_Int = -1 then
        Conf.sComboBox22.ItemIndex := 0
      else
        Conf.sComboBox22.ItemIndex := Sound_Int;
      Conf.sComboBox21.Items.Clear;
      Conf.sComboBox21.Items.Add('None');
      Sound_Str := pSX_Ini.ReadString('Input','JoystickDevice2',Sound_Str);
      if Sound_Str = 'NULL' then
        begin
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2L1',Sound_Int);
          Conf.sPanel.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2L2',Sound_Int);
          Conf.sPanel2.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Select',Sound_Int);
          Conf.sPanel3.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Start',Sound_Int);
          Conf.sPanel4.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2R1',Sound_Int);
          Conf.sPanel5.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2R2',Sound_Int);
          Conf.sPanel6.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Up',Sound_Int);
          Conf.sPanel7.Caption :=CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Left',Sound_Int);
          Conf.sPanel8.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Right',Sound_Int);
          Conf.sPanel9.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Down',Sound_Int);
          Conf.sPanel10.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Triangle',Sound_Int);
          Conf.sPanel13.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Circle',Sound_Int);
          Conf.sPanel14.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Square',Sound_Int);
          Conf.sPanel15.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2Cross',Sound_Int);
          Conf.sPanel16.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2LStickX',Sound_Int);
          Conf.sPanel11.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2LStickY',Sound_Int);
          Conf.sPanel12.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2RStickX',Sound_Int);
          Conf.sPanel19.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2RStickY',Sound_Int);
          Conf.sPanel20.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2L3',Sound_Int);
          Conf.sPanel17.Caption := CNumberToShowString(Sound_Int);
          Sound_Int := pSX_Ini.ReadInteger('Input','Key2R3',Sound_Int);
          Conf.sPanel18.Caption := CNumberToShowString(Sound_Int);
        end
    end;
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
  CurrentStateSave;
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
  comp: TComponent;
begin
  for i := 1 to 4 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_psx_sound,'media\confeditor\images\psx\psx.png',
              3,590,100,71,i,'',True,False);
        2 : Image_Comp(Conf.Pem_psx_sound,'media\confeditor\images\psx\psx_image.png',
              587,381,150,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_psx_sound,'media\confeditor\images\psx\sound.png',
              451,2,291,71,i,'',True,False);
        4 : Image_Comp(Conf.grp12,'media\confeditor\images\psx\joystick.png',
              85,48,402,272,i,'',True,True);
      end;
    end;  
  comp := FindComponentEx('Conf.Pic4');
  TImage(comp).SendToBack;
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


