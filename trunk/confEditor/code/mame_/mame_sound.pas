unit mame_sound;

interface

uses
  SysUtils,Classes,ExtCtrls,StdCtrls;

  procedure SetMame_SoundFromMameIni;
  procedure SaveMame_SoundAtExit;

  procedure MameJoyDeadzoneChange;
  procedure MameJoySaturationChange;
  procedure MameChooseJoystickMap;
  procedure MameResetJoystickMap;
  procedure MameValumeAttenuationChange;
  procedure MameAudioLatencyChange;

  procedure ResetToDefaultTopic_MameSound;
  procedure CheckMameSound_TopicSettings;
  procedure CheckButtonTopicsConfig_MameSound;

  procedure MameSound_Clear;

// Menu actions
  procedure Show_mame_soundpanel;
  procedure em_mame_sound_ShowDynamicComps;
  procedure em_mame_sound_FreeDynamicComps;

var
  FromMame_SoundToFindSound: Boolean;

implementation

uses
  main,mainconf,menu,onflycomponents,FunctionX,
  mame_dirs,mame_graphics,mame_others,mame_hlsl,mame_database,
  ce_logsession;

Procedure MameValumeAttenuationChange;
Begin
  Conf.sLabel16.Caption := IntToStr(Conf.sbar_mame_valumeattenuation.Position) +' dB';
end;

Procedure MameAudioLatencyChange;
Begin
  Conf.sLabel15.Caption := IntToStr(Conf.sbar_mame_audiolatency.Position)+'/5';
end;


Procedure MameJoyDeadzoneChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_joysdeadzone.Position;
  Conf.sLabel19.Caption := FormatFloat('0.00',(PosNum / 100));
end;


Procedure MameJoySaturationChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_joysaturation.Position;
  Conf.sLabel17.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameChooseJoystickMap;
begin
  if Mame_Exe <> '' then
    begin
      gFindFiles := 'joystick_map';
      Conf.Find_Files.InitialDir := Program_Path + 'emulators';
      Conf.Find_Files.Filter := 'Maps (*.map, *.txt)|*.map;|*.txt';
      Conf.Find_Files.Execute;
    end;
end;

Procedure MameResetJoystickMap;
Begin
  if Conf.sEdit15.Text <> 'auto' then
    Conf.sEdit15.Text := 'auto';
end;

procedure SetMame_SoundFromMameIni;
var
  MameIniFile: TextFile;
  value,text,t1,t2: string;
  r: integer;
  DiffNum: Single;
begin
  if Started = true then
    begin
      if Mame_Exe <> '' then
        begin
          FromMame_SoundToFindSound := True;
          value := FullPathMame_Exe + 'mame.ini';
          AssignFile(MameIniFile,value);
          Reset(MameIniFile);
          while not Eof(MameIniFile) do
            begin
              Readln(MameIniFile,text);
              r := Pos(' ',text);
              t1 := Trim(Copy(text,0,r));
              t2 := Trim(Copy(text,r,100));
              if t1 = 'joystick' then
                Conf.sCheckBox23.Checked := StrToBool(t2)
              else if t1 = 'mouse' then
                Conf.sCheckBox16.Checked := StrToBool(t2)
              else if t1 = 'multimouse' then
                Conf.sCheckBox22.Checked := StrToBool(t2)
              else if t1 = 'multikeyboard' then
                Conf.sCheckBox21.Checked := StrToBool(t2)
              else if t1 = 'steadykey' then
                Conf.sCheckBox17.Checked := StrToBool(t2)
              else if t1 = 'lightgun' then
                Conf.sCheckBox18.Checked := StrToBool(t2)
              else if t1 = 'offscreen_reload' then
                Conf.sCheckBox19.Checked := StrToBool(t2)
              else if t1 = 'dual_lightgun' then
                Conf.sCheckBox20.Checked := StrToBool(t2)
              else if t1 = 'joystick_deadzone' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) *100;
                  Conf.sbar_mame_joysdeadzone.Position := Round(DiffNum);
                  MameJoyDeadzoneChange;
                end
              else if t1 = 'joystick_saturation' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) *100;
                  Conf.sbar_mame_joysaturation.Position := Round(DiffNum);
                  MameJoySaturationChange;
                end
              else if t1 = 'joystick_map' then
                Conf.sEdit15.Text := t2
              else if t1 = 'sound' then
                Conf.sCheckBox26.Checked := StrToBool(t2)
              else if t1 = 'samples' then
                Conf.sCheckBox43.Checked := StrToBool(t2)
              else if t1 = 'samplerate' then
                Conf.sComboBox18.Text := t2
              else if t1 = 'volume' then
                begin
                  Conf.sbar_mame_valumeattenuation.Position := StrToInt(t2);
                  MameValumeAttenuationChange;
                end
              else if t1 = 'audio_latency' then
                begin
                  Conf.sbar_mame_audiolatency.Position := StrToInt(t2);
                  MameAudioLatencyChange;
                end
              else if t1 = 'paddle_device' then
                Conf.sComboBox10.Text := t2
              else if t1 = 'pedal_device' then
                Conf.sComboBox11.Text := t2
              else if t1 = 'dial_device' then
                Conf.sComboBox12.Text := t2
              else if t1 = 'lightgun_device' then
                Conf.sComboBox13.Text := t2
              else if t1 = 'adstick_device' then
                Conf.sComboBox14.Text := t2
              else if t1 = 'mouse_device' then
                Conf.sComboBox15.Text := t2
              else if t1 = 'trackball_device' then
                Conf.sComboBox16.Text := t2
              else if t1 = 'positional_device' then
                Conf.sComboBox17.Text := t2;
            end;
          CloseFile(MameIniFile);
        end;
      CheckMameSound_TopicSettings;
      CheckTopicsConfig;
      Log_NewTextEnter(#9 + 'Found all Settings OK');
    end;
  Started := False;
end;

procedure SaveMame_SoundAtExit;
var
  k,x: Integer;
  value,t1,t2: string;
  Comp: TComponent;
begin
  if Mame_Exe <> '' then
    begin
      Comp := FindComponentEx('Conf.MemoEmu_Mame');
      for k := 0 to TMemo(Comp).Lines.Count - 1 do
        begin
          value := TMemo(Comp).Lines.Strings[k];
          x := Pos(' ',value);
          t1 := Trim(Copy(value,0,x));
          t2 := Trim(Copy(value,x,100));
          if t1 = 'joystick' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox23.Checked = True then
                TMemo(Comp).Lines.Insert(k,'joystick          1')
              else
                TMemo(Comp).Lines.Insert(k,'joystick          0');
            end
          else if t1 = 'mouse' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox16.Checked = True then
                TMemo(Comp).Lines.Insert(k,'mouse          1')
              else
                TMemo(Comp).Lines.Insert(k,'mouse          0');
            end
          else if t1 = 'multimouse' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox22.Checked = True then
                TMemo(Comp).Lines.Insert(k,'multimouse          1')
              else
                TMemo(Comp).Lines.Insert(k,'multimouse          0');
            end
          else if t1 = 'multikeyboard' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox21.Checked = True then
                TMemo(Comp).Lines.Insert(k,'multikeyboard          1')
              else
                TMemo(Comp).Lines.Insert(k,'multikeyboard          0');
            end
          else if t1 = 'steadykey' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox17.Checked = True then
                TMemo(Comp).Lines.Insert(k,'steadykey          1')
              else
                TMemo(Comp).Lines.Insert(k,'steadykey          0');
            end
          else if t1 = 'lightgun' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox18.Checked = True then
                TMemo(Comp).Lines.Insert(k,'lightgun          1')
              else
                TMemo(Comp).Lines.Insert(k,'lightgun          0');
            end
          else if t1 = 'offscreen_reload' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox19.Checked = True then
                TMemo(Comp).Lines.Insert(k,'offscreen_reload          1')
              else
                TMemo(Comp).Lines.Insert(k,'offscreen_reload          0');
            end
          else if t1 = 'dual_lightgun' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox20.Checked = True then
                TMemo(Comp).Lines.Insert(k,'dual_lightgun          1')
              else
                TMemo(Comp).Lines.Insert(k,'dual_lightgun          0');
            end
          else if t1 = 'joystick_deadzone' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'joystick_deadzone          '+Conf.sLabel19.Caption);
            end
          else if t1 = 'joystick_saturation' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'joystick_saturation          '+Conf.sLabel17.Caption);
            end
          else if t1 = 'joystick_map' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'joystick_map          '+Conf.sEdit15.Text);
            end
          else if t1 = 'sound' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox26.Checked = True then
                TMemo(Comp).Lines.Insert(k,'sound          1')
              else
                TMemo(Comp).Lines.Insert(k,'sound          0');
            end
          else if t1 = 'samples' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox43.Checked = True then
                TMemo(Comp).Lines.Insert(k,'samples          1')
              else
                TMemo(Comp).Lines.Insert(k,'samples          0');
            end
          else if t1 = 'samplerate' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'samplerate          '+Conf.sComboBox18.Text);
            end
          else if t1 = 'volume' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'volume          '+IntToStr(Conf.sbar_mame_valumeattenuation.Position));
            end
          else if t1 = 'audio_latency' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'audio_latency          '+IntToStr(Conf.sbar_mame_audiolatency.Position));
            end
          else if t1 = 'paddle_device' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'paddle_device          '+Conf.sComboBox10.Text);
            end
          else if t1 = 'pedal_device' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'pedal_device          '+Conf.sComboBox11.Text);
            end
          else if t1 = 'dial_device' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'dial_device          '+Conf.sComboBox12.Text);
            end
          else if t1 = 'lightgun_device' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'lightgun_device          '+Conf.sComboBox13.Text);
            end
          else if t1 = 'adstick_device' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'adstick_device          '+Conf.sComboBox14.Text);
            end
          else if t1 = 'mouse_device' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'mouse_device          '+Conf.sComboBox15.Text);
            end
          else if t1 = 'trackball_device' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'trackball_device          '+Conf.sComboBox16.Text);
            end
          else if t1 = 'positional_device' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'positional_device          '+Conf.sComboBox17.Text);
            end;
        end;
      TMemo(Comp).Lines.SaveToFile(FullPathMame_Exe+'mame.ini');
      FromMame_SoundToFindSound := False;
    end;
end;

procedure MameSound_Clear;
begin
  Conf.sCheckBox16.Checked := False;
  Conf.sCheckBox17.Checked := False;
  Conf.sCheckBox18.Checked := False;
  Conf.sCheckBox19.Checked := False;
  Conf.sCheckBox20.Checked := False;
  Conf.sCheckBox21.Checked := False;
  Conf.sCheckBox22.Checked := False;
  Conf.sCheckBox23.Checked := False;
  Conf.sCheckBox26.Checked := False;
  Conf.sCheckBox43.Checked := False;
  Conf.sbar_mame_joysdeadzone.Position := 10;
  Conf.sbar_mame_joysaturation.Position := 10;
  Conf.sbar_mame_valumeattenuation.Position := -32;
  Conf.sbar_mame_audiolatency.Position := 1;
  Conf.sEdit15.Text := '';
  Conf.sComboBox10.ItemIndex := 0;
  Conf.sComboBox11.ItemIndex := 0;
  Conf.sComboBox12.ItemIndex := 0;
  Conf.sComboBox13.ItemIndex := 0;
  Conf.sComboBox14.ItemIndex := 0;
  Conf.sComboBox15.ItemIndex := 0;
  Conf.sComboBox16.ItemIndex := 0;
  Conf.sComboBox17.ItemIndex := 0;
  Conf.sButton6.Enabled := False;
  Conf.sButton2.Enabled := False;
end;

procedure ResetToDefaultTopic_MameSound;
begin
  Conf.sCheckBox23.Checked := True;
  Conf.sCheckBox16.Checked := False;
  Conf.sCheckBox17.Checked := False;
  Conf.sCheckBox18.Checked := False;
  Conf.sCheckBox19.Checked := False;
  Conf.sCheckBox20.Checked := False;
  Conf.sCheckBox21.Checked := False;
  Conf.sCheckBox22.Checked := False;
  Conf.sbar_mame_joysdeadzone.Position := 30;
  MameJoyDeadzoneChange;
  Conf.sbar_mame_joysaturation.Position := 85;
  MameJoySaturationChange;
  Conf.sEdit15.Text := 'auto';
  Conf.sComboBox10.Text := 'keyboard';
  Conf.sComboBox11.Text := 'keyboard';
  Conf.sComboBox12.Text := 'keyboard';
  Conf.sComboBox13.Text := 'keyboard';
  Conf.sComboBox14.Text := 'keyboard';
  Conf.sComboBox15.Text := 'mouse';
  Conf.sComboBox16.Text := 'keyboard';
  Conf.sComboBox17.Text := 'keyboard';
  Conf.sCheckBox26.Checked := True;
  Conf.sCheckBox43.Checked := True;
  Conf.sComboBox18.Text := '48000';
  Conf.sbar_mame_valumeattenuation.Position := 0;
  MameValumeAttenuationChange;
  Conf.sbar_mame_audiolatency.Position := 2;
  MameAudioLatencyChange;
  Conf.sButton6.Enabled := False;
  CheckTopicsConfig;
end;

procedure CheckMameSound_TopicSettings;
begin
  Conf.sButton6.Enabled := False;
  if Mame_Exe <> '' then
    begin
      if Conf.sCheckBox23.Checked <> True then
        Conf.sButton6.Enabled := True;
      if Conf.sCheckBox16.Checked <> False then
        Conf.sButton6.Enabled := True;
      if Conf.sCheckBox17.Checked <> False then
        Conf.sButton6.Enabled := True;
      if Conf.sCheckBox18.Checked <> False then
        Conf.sButton6.Enabled := True;
      if Conf.sCheckBox19.Checked <> False then
        Conf.sButton6.Enabled := True;
      if Conf.sCheckBox20.Checked <> False then
        Conf.sButton6.Enabled := True;
      if Conf.sCheckBox21.Checked <> False then
        Conf.sButton6.Enabled := True;
      if Conf.sCheckBox22.Checked <> False then
        Conf.sButton6.Enabled := True;
      if Conf.sbar_mame_joysdeadzone.Position <> 30 then
        Conf.sButton6.Enabled := True;
      if Conf.sbar_mame_joysaturation.Position <> 85 then
        Conf.sButton6.Enabled := True;
      if Conf.sEdit15.Text <> 'auto' then
        Conf.sButton6.Enabled := True;
      if Conf.sComboBox10.Text <> 'keyboard' then
        Conf.sButton6.Enabled := True;
      if Conf.sComboBox11.Text <> 'keyboard' then
        Conf.sButton6.Enabled := True;
      if Conf.sComboBox12.Text <> 'keyboard' then
        Conf.sButton6.Enabled := True;
      if Conf.sComboBox13.Text <> 'keyboard' then
        Conf.sButton6.Enabled := True;
      if Conf.sComboBox14.Text <> 'keyboard' then
        Conf.sButton6.Enabled := True;
      if Conf.sComboBox15.Text <> 'mouse' then
        Conf.sButton6.Enabled := True;
      if Conf.sComboBox16.Text <> 'keyboard' then
        Conf.sButton6.Enabled := True;
      if Conf.sComboBox17.Text <> 'keyboard' then
        Conf.sButton6.Enabled := True;
      if Conf.sCheckBox26.Checked <> True then
        Conf.sButton6.Enabled := True;
      if Conf.sCheckBox43.Checked <> True then
        Conf.sButton6.Enabled := True;
      if Conf.sComboBox18.Text <> '48000' then
        Conf.sButton6.Enabled := True;
      if Conf.sbar_mame_valumeattenuation.Position <> 0 then
        Conf.sButton6.Enabled := True;
      if Conf.sbar_mame_audiolatency.Position <> 2 then
        Conf.sButton6.Enabled := True;
    end;
end;

procedure CheckButtonTopicsConfig_MameSound;
begin
  FromMame_SoundToFindSound := True;
  CheckMameSound_TopicSettings;
  CheckTopicsConfig;
end;

procedure Show_mame_soundpanel;
begin
  if (Cmenustate = 'em_arcade_mame_graphics') then
    em_mame_graphics_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_paths') then
    em_mame_dirs_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_others') then
    em_mame_others_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_hlsl') then
    em_mame_hlsl_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_database') then
    em_mame_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn9.Caption,False,True);
  Cmenustate := 'em_arcade_mame_sound';
  em_mame_sound_ShowDynamicComps;
  ShowButtonDown(9,'EM_ARCADE_MAME_SOUND');
  CheckButtonTopicsConfig_MameSound;
  ShowHidePanel(CurrentPanel,'Pem_mame_sound');
end;

procedure em_mame_sound_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_mame_sound,'media\confeditor\images\mame\mame.png',
              -10,587,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pem_mame_sound,'media\confeditor\images\mame\mame_image.png',
              558,381,169,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_mame_sound,'media\confeditor\images\mame\sound.png',
              452,2,275,71,i,'',True,False);
      end;
    end;
end;

procedure em_mame_sound_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
end;

end.
