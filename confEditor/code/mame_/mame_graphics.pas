unit mame_graphics;

interface
uses
  SysUtils,StdCtrls,Controls,Classes,ExtCtrls;

  procedure SetMame_GraphicsFromMameIni;
  procedure SaveMame_GraphicsAtExit;

  procedure MamePauseChange;
  procedure MameContrastChange;
  procedure MameBrightnessChange;
  procedure MameGammaChange;
  procedure MameEmulationSpeedChange;
  procedure MameSecondsToRunChange;
  procedure MameScaleScreenChange;
  procedure MameFullscreenContrastChange;
  procedure MameFullscreenBrightnessChange;
  procedure MameFullscreenGammaChange;
  procedure MameChooseEffect;
  procedure MameResetEffects;
  procedure MameVideomodeChange(VideoMode: string);
  procedure MamePerWindowVideoChange(Which_Screen,FromType: string;Save:Boolean);

  procedure ResetToDefaultTopic_MameGraphics;
  procedure CheckMameGraphics_TopicSettings;
  procedure CheckButtonTopicsConfig_MameGraphics;

  procedure MameGraphics_Clear;

// Menu actions
  procedure Show_mame_graphicspanel;
  procedure em_mame_graphics_ShowDynamicComps;
  procedure em_mame_graphics_FreeDynamicComps;
var
  FromMame_GrpaphicsToFindGraphics: Boolean;

implementation
uses
  main,mainconf,menu,FunctionX,onflycomponents,
  mame_dirs,mame_sound,mame_others,mame_database,mame_builds;

Procedure MamePauseChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_pausebrightness.Position;
  Conf.sLabel3.Caption := FormatFloat('0.00',(PosNum / 100));
End;

ProCedure MameContrastChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_contrastcorrection.Position;
  Conf.sLabel2.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameBrightnessChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_brightnesscorrection.Position;
  Conf.sLabel5.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameGammaChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_gammacorrection.Position;
  Conf.sLabel4.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameEmulationSpeedChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_emulatrionspeed.Position;
  Conf.sLabel11.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameSecondsToRunChange;
Begin
  Conf.sLabel12.Caption := IntToStr(Conf.sbar_mame_secondstorun.Position);
end;

Procedure MameScaleScreenChange;
Begin
  Conf.sLabel1.Caption := IntToStr(Conf.sbar_mame_scalescreen.Position);
End;

Procedure MameFullscreenGammaChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_Fgamma.Position;
  Conf.sLabel8.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameFullscreenContrastChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_Fcontrast.Position;
  Conf.sLabel6.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameFullscreenBrightnessChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_Fbrightness.Position;
  Conf.sLabel7.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameResetEffects;
Begin
  Conf.sEdit1.Text := 'none';
end;

procedure MameChooseEffect;
begin
  if Mame_Exe <> '' then
    begin
      gFindFiles := 'visual_effect';
      Conf.Find_Files.InitialDir := Program_Path + 'emulators';
      Conf.Find_Files.Filter := 'All (Png) artwork files|*.png';
      Conf.Find_Files.Execute;
    end;
end;

Procedure MameVideomodeChange(VideoMode: string);
Begin
  if VideoMode = 'none' then
    Conf.sComboBox2.ItemIndex := 0
  else if VideoMode = 'gdi' then
    Conf.sComboBox2.ItemIndex := 1
  else if VideoMode = 'ddraw' then
    Conf.sComboBox2.ItemIndex := 2
  else if VideoMode = 'd3d' then
    Conf.sComboBox2.ItemIndex := 3;
  if (Conf.sComboBox2.ItemIndex = 0) or (Conf.sComboBox2.ItemIndex = 1) then
    begin
      Conf.sCheckBox7.Enabled := False;
      Conf.sLabel51.Enabled := False;
      Conf.sComboBox3.Enabled := False;
      Conf.sCheckBox8.Enabled := False;
      Conf.sLabel52.Enabled := False;
      Conf.sLabel1.Enabled := False;
      Conf.sbar_mame_scalescreen.Enabled := False;
    end
  else if (Conf.sComboBox2.ItemIndex = 2) or (Conf.sComboBox2.ItemIndex = 3) then
    begin
      Conf.sLabel1.Enabled := True;
      Conf.sbar_mame_scalescreen.Enabled := True;
      if Conf.sComboBox2.ItemIndex = 2 then
        begin
          Conf.sCheckBox7.Enabled := False;
          Conf.sLabel51.Enabled := False;
          Conf.sComboBox3.Enabled := False;
          Conf.sCheckBox8.Enabled := True;
          Conf.sLabel52.Enabled := True;
        end
      else
        begin
          Conf.sCheckBox7.Enabled := True;
          Conf.sLabel51.Enabled := True;
          Conf.sComboBox3.Enabled := True;
          Conf.sCheckBox8.Enabled := False;
          Conf.sLabel52.Enabled := False;
        end;
    end
end;

procedure MamePerWindowVideoChange(Which_Screen,FromType: string; Save: Boolean);
var
  Screen_Memo: TMemo;
  MScreenIniFile: TextFile;
  value,text,t1,t2,t3,scr,asp,res,vie,CurrentScreen: string;
  k,x: Integer;
begin
  if Save = False then
    begin
      Conf.sComboBox5.BoundLabel.Caption := 'Physical Monitor(' + Which_Screen+')';
      Conf.sComboBox6.BoundLabel.Caption := 'Aspect Ration(' + Which_Screen+')';
      Conf.sComboBox7.BoundLabel.Caption := 'Resolution(' + Which_Screen+')';
      Conf.sComboBox8.BoundLabel.Caption := 'View('+Which_Screen+')';
    end;
  if Which_Screen = 'All Screens' then
    begin
      if FromType = '' then
        CurrentScreen := 'screen'
      else
        CurrentScreen := FromType;
      scr := 'screen';
      asp := 'aspect';
      res := 'resolution';
      vie := 'view';
    end
  else if Which_Screen = 'Screen 1' then
    begin
      if FromType = '' then
        CurrentScreen := 'screen0'
      else
        CurrentScreen := FromType+'0';
      scr := 'screen0';
      asp := 'aspect0';
      res := 'resolution0';
      vie := 'view0';
    end
  else if Which_Screen = 'Screen 2' then
    begin
      if FromType = '' then
        CurrentScreen := 'screen1'
      else
        CurrentScreen := FromType+'1';
      scr := 'screen1';
      asp := 'aspect1';
      res := 'resolution1';
      vie := 'view1';
    end
  else if Which_Screen = 'Screen 3' then
    begin
      if FromType = '' then
        CurrentScreen := 'screen2'
      else
        CurrentScreen := FromType+'2';
      scr := 'screen2';
      asp := 'aspect2';
      res := 'resolution2';
      vie := 'view2';
    end
  else if Which_Screen = 'Screen 4' then
    begin
      if FromType = '' then
        CurrentScreen := 'screen3'
      else
        CurrentScreen := FromType+'3';
      scr := 'screen3';
      asp := 'aspect3';
      res := 'resolution3';
      vie := 'view3';
    end;
  Screen_Memo := TMemo.Create(Conf);
  Screen_Memo.Parent := Conf;
  Screen_Memo.Visible := False;
  Screen_Memo.Align := alClient;
  Screen_Memo.WordWrap := False;
  value := FullPathMame_Exe + 'mame.ini';
  if Save = True then
    begin
      AssignFile(MScreenIniFile,value);
      Reset(MScreenIniFile);
      while not Eof(MScreenIniFile) do
        begin
          Readln(MScreenIniFile,text);
          Screen_Memo.Lines.Add(text);
        end;
      CloseFile(MScreenIniFile);
      for k := 0 to Screen_Memo.Lines.Count - 1 do
        begin
          text := Screen_Memo.Lines.Strings[k];
          x := Pos(' ',text);
          t1 := Trim(Copy(text,0,x));
          t3 := Trim(Copy(text,0,x - 2));
          if ((t1 = 'screen') or (t3 = 'screen')) and (CurrentScreen = t1) then
            begin
              Screen_Memo.Lines.Delete(k);
              Screen_Memo.Lines.Insert(k,t1+'          '+Conf.sComboBox5.Text);
            end
          else if ((t1 = 'aspect') or (t3 = 'aspect')) and (CurrentScreen = t1) then
            begin
              Screen_Memo.Lines.Delete(k);
              Screen_Memo.Lines.Insert(k,t1+'          '+Conf.sComboBox6.Text);
            end
          else if ((t1 = 'resolution') or (t3 = 'resolution')) and (CurrentScreen = t1) then
            begin
              Screen_Memo.Lines.Delete(k);
              Screen_Memo.Lines.Insert(k,t1+'          '+Conf.sComboBox7.Text);
            end
          else if ((t1 = 'view') or (t3 = 'view')) and (CurrentScreen = t1) then
            begin
              Screen_Memo.Lines.Delete(k);
              if Conf.sComboBox6.Text = 'pixel aspect' then
                t2 := 'pixel'
              else
                t2 := Conf.sComboBox6.Text;
              Screen_Memo.Lines.Insert(k,t1+'          '+Conf.sComboBox8.Text);
            end;
        end;
      Screen_Memo.Lines.SaveToFile(value);
      Screen_Memo.Free;
    end
  else
    begin
      AssignFile(MScreenIniFile,value);
      Reset(MScreenIniFile);
      while not Eof(MScreenIniFile) do
        begin
          Readln(MScreenIniFile,text);
          x := Pos(' ',text);
          t1 := Trim(Copy(text,0,x));
          t2 := Trim(Copy(text,x,100));
          t3 := Trim(Copy(text,0,x - 2));
          if ((t1 = 'screen') or (t3 = 'screen')) and (scr = t1) then
            Conf.sComboBox5.Text := t2
          else if ((t1 = 'aspect') or (t3 = 'aspect')) and (asp = t1) then
            Conf.sComboBox6.Text := t2
          else if ((t1 = 'resolution') or (t3 = 'resolution')) and (res = t1) then
            Conf.sComboBox7.Text := t2
          else if ((t1 = 'view') or (t3 = 'view')) and (vie = t1) then
            begin
              if t2 = 'pixel' then
                t2 := 'pixel aspect';
              Conf.sComboBox8.Text := t2
            end;
        end;
      CloseFile(MScreenIniFile);
    end;
end;


procedure SetMame_GraphicsFromMameIni;
var
  MameIniFile: TextFile;
  value,text,t1,t2: string;
  r,k: integer;
  DiffNum: Extended;
begin
  if Started = True then
    begin
      FromMame_GrpaphicsToFindGraphics := True;
      FindDisplays('%dx%d@%d');
      Conf.sComboBox7.Clear;
      Conf.sComboBox7.Items.Add('auto');
      for k := 0 to resolutions.Count - 1 do
        Conf.sComboBox7.Items.Add(resolutions.Strings[k]);
      Conf.sComboBox7.ItemIndex := 0;
      Conf.DMI1.Active := True;
      Conf.sComboBox5.Clear;
      Conf.sComboBox5.Items.Add('auto');
      case Conf.DMI1.ObjectsCount of
        1 : Conf.sComboBox5.Items.Add('\\.\DISPLAY1');
        2 : begin
              Conf.sComboBox5.Items.Add('\\.\DISPLAY1');
              Conf.sComboBox5.Items.Add('\\.\DISPLAY2');
            end;
        3 : begin
              Conf.sComboBox5.Items.Add('\\.\DISPLAY1');
              Conf.sComboBox5.Items.Add('\\.\DISPLAY2');
              Conf.sComboBox5.Items.Add('\\.\DISPLAY3');
            end;
        4 : begin
              Conf.sComboBox5.Items.Add('\\.\DISPLAY1');
              Conf.sComboBox5.Items.Add('\\.\DISPLAY2');
              Conf.sComboBox5.Items.Add('\\.\DISPLAY3');
              Conf.sComboBox5.Items.Add('\\.\DISPLAY4');
            end;
      end;
      Conf.sComboBox5.ItemIndex := 0;
      Conf.DMI1.Active := False;
      if Mame_Exe <> '' then
        begin
          value := FullPathMame_Exe + 'mame.ini';
          AssignFile(MameIniFile,value);
          Reset(MameIniFile);
          while not Eof(MameIniFile) do
            begin
              Readln(MameIniFile,text);
              r := Pos(' ',text);
              t1 := Trim(Copy(text,0,r));
              t2 := Trim(Copy(text,r,100));
              //yparxei kapio lathos....

              if t1 = 'window' then
                Conf.sCheckBox3.Checked := StrToBool(t2)
              else if t1 = 'maximize' then
                conf.sCheckBox4.Checked := StrToBool(t2)
              else if t1 = 'keepaspect' then
                conf.sCheckBox5.Checked := StrToBool(t2)
              else if t1 = 'throttle' then
                conf.sCheckBox6.Checked := StrToBool(t2)
              else if t1 = 'speed' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) * 100;
                  Conf.sbar_mame_emulatrionspeed.Position := Round(DiffNum);
                  MameEmulationSpeedChange;
                end
              else if t1 = 'rotate' then
                begin
                  if t2 = '1' then
                    Conf.sComboBox20.ItemIndex := 0
                  else
                    Conf.sComboBox20.ItemIndex := 3;
                end
              else if t1 = 'flipx' then
                Conf.sCheckBox40.Checked := StrToBool(t2)
              else if t1 = 'flipy' then
                conf.sCheckBox41.Checked := StrToBool(t2)
              else if t1 = 'pause_brightness' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) * 100;
                  Conf.sbar_mame_pausebrightness.Position := Round(DiffNum);
                  MamePauseChange;
                end
              else if t1 = 'gamma' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) *100;
                  Conf.sbar_mame_gammacorrection.Position := Round(DiffNum);
                  MameGammaChange;
                end
              else if t1 = 'brightness' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) *100;
                  Conf.sbar_mame_brightnesscorrection.Position := Round(DiffNum);
                  MameBrightnessChange;
                end
              else if t1 = 'contrast' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) *100;
                  Conf.sbar_mame_contrastcorrection.Position := Round(DiffNum);
                  MameContrastChange;
                end
              else if t1 = 'autoframeskip' then
                Conf.sCheckBox15.Checked := StrToBool(t2)
              else if t1 = 'frameskip' then
                begin
                  if conf.sCheckBox15.Checked = False then
                    Conf.sComboBox9.ItemIndex := StrToInt(t2)
                  else
                    Conf.sComboBox9.Enabled := False;
                end
              else if t1 = 'video' then
                MameVideomodeChange(t2)
              else if t1 = 'filter' then
                Conf.sCheckBox7.Checked := StrToBool(t2)
              else if t1 = 'd3dversion' then
                begin
                  if t2 = '9' then
                    Conf.sComboBox3.ItemIndex := 0
                  else
                    Conf.sComboBox3.ItemIndex := 1;
                end
              else if t1 = 'hwstretch' then
                Conf.sCheckBox8.Checked := StrToBool(t2)
              else if t1 = 'full_screen_gamma' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) *100;
                  Conf.sbar_mame_Fgamma.Position := Round(DiffNum);
                  MameFullscreenGammaChange;
                end
              else if t1 = 'full_screen_brightness' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) *100;
                  Conf.sbar_mame_Fbrightness.Position := Round(DiffNum);
                  MameFullscreenBrightnessChange;
                end
              else if t1 = 'full_screen_contrast' then
                begin
                  DecimalSeparator := '.';
                  DiffNum := StrToFloat(t2) *100;
                  Conf.sbar_mame_Fcontrast.Position := Round(DiffNum);
                  MameFullscreenContrastChange;
                end
              else if t1 = 'switchres' then
                Conf.sCheckBox9.Checked := StrToBool(t2)
              else if t1 = 'triplebuffer' then
                Conf.sCheckBox11.Checked := StrToBool(t2)
              else if t1 = 'waitvsync' then
                Conf.sCheckBox13.Checked := StrToBool(t2)
              else if t1 = 'syncrefresh' then
                Conf.sCheckBox12.Checked := StrToBool(t2)
              else if t1 ='refreshspeed' then
                Conf.sCheckBox14.Checked := StrToBool(t2)
              else if t1 = 'seconds_to_run' then
                begin
                  Conf.sLabel12.Caption := t2;
                  MameSecondsToRunChange;
                end
              else if t1 = 'prescale' then
                begin
                  Conf.sLabel1.Caption := t2;
                  MameScaleScreenChange;
                end
              else if t1 = 'effect' then
                Conf.sEdit1.Text := t2;
            end;
          CloseFile(MameIniFile);
        end;
      MamePerWindowVideoChange('All Screens','',False);
      CheckMameGraphics_TopicSettings;
      CheckTopicsConfig;
    end;
  Started := False;
end;

procedure SaveMame_GraphicsAtExit;
var
  k,x: Integer;
  value,t1,t2: string;
  scr,asp,res,vie: string;
  Comp: TComponent;
begin
  if Mame_Exe <> '' then
    begin
      if Conf.sComboBox4.Text = 'All Screens' then
        begin
          scr := 'screen';
          asp := 'aspect';
          res := 'resolution';
          vie := 'view';
        end
      else if Conf.sComboBox4.Text = 'Screen 1' then
        begin
          scr := 'screen0';
          asp := 'aspect0';
          res := 'resolution0';
          vie := 'view0';
        end
      else if Conf.sComboBox4.Text = 'Screen 2' then
        begin
          scr := 'screen1';
          asp := 'aspect1';
          res := 'resolution1';
          vie := 'view1';
        end
      else if Conf.sComboBox4.Text = 'Screen 3' then
        begin
          scr := 'screen2';
          asp := 'aspect3';
          res := 'resolution2';
          vie := 'view2';
        end
      else if Conf.sComboBox4.Text = 'Screen 4' then
        begin
          scr := 'screen3';
          asp := 'aspect3';
          res := 'resolution3';
          vie := 'view3';
        end;
      Comp := FindComponentEx('Conf.MemoEmu1');
      for k := 0 to TMemo(Comp).Lines.Count - 1 do
        begin
          value := TMemo(Comp).Lines.Strings[k];
          x := Pos(' ',value);
          t1 := Trim(Copy(value,0,x));
          t2 := Trim(Copy(value,x,100));
          if t1 = 'window' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox3.Checked = True then
                TMemo(Comp).Lines.Insert(k,'window       1')
              else
                TMemo(Comp).Lines.Insert(k,'window       0');
            end
          else if t1 = 'maximize' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox4.Checked = True then
                TMemo(Comp).Lines.Insert(k,'maximize        1')
              else
                TMemo(Comp).Lines.Insert(k,'maximize        0');
            end
          else if t1 = 'keepaspect' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox5.Checked = True then
                TMemo(Comp).Lines.Insert(k,'keepaspect        1')
              else
                TMemo(Comp).Lines.Insert(k,'keepaspect        0');
            end
          else if t1 = 'throttle' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox6.Checked = True then
                TMemo(Comp).Lines.Insert(k,'throttle        1')
              else
                TMemo(Comp).Lines.Insert(k,'throttle        0');
            end
          else if t1 = 'speed' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'speed        '+Conf.sLabel11.Caption);
            end
          else if t1 = 'rotate' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sComboBox20.ItemIndex = 0 then
                TMemo(Comp).Lines.Insert(k,'rotate        1');
              if Conf.sComboBox20.ItemIndex = 3 then
                TMemo(Comp).Lines.Insert(k,'rotate        0');
            end
          else if t1 = 'flipx' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox40.Checked = True then
                TMemo(Comp).Lines.Insert(k,'flipx        1')
              else
                TMemo(Comp).Lines.Insert(k,'flipx        0');
            end
          else if t1 = 'flipy' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox41.Checked = True then
                TMemo(Comp).Lines.Insert(k,'flipy        1')
              else
                TMemo(Comp).Lines.Insert(k,'flipy        0');
            end
          else if t1 = 'pause_brightness' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'pause_brightness        '+Conf.sLabel3.Caption);
            end
          else if t1 = 'gamma' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'gamma          '+Conf.sLabel4.Caption);
            end
          else if t1 = 'brightness' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'brightness          '+Conf.sLabel5.Caption);
            end
          else if t1 = 'contrast' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'contrast          '+Conf.sLabel2.Caption);
            end
          else if t1 = 'autoframeskip' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox15.Checked = True then
                TMemo(Comp).Lines.Insert(k,'autoframeskip          1')
              else
                TMemo(Comp).Lines.Insert(k,'autoframeskip          0');
            end
          else if t1 = 'frameskip' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'frameskip          '+IntToStr(Conf.sComboBox9.ItemIndex));
            end
          else if t1 = 'video' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sComboBox2.Text = 'None' then
                t2 := 'none'
              else if Conf.sComboBox2.Text = 'GDI' then
                t2 := 'gdi'
              else if Conf.sComboBox2.Text = 'Direct Draw' then
                t2 := 'ddraw'
              else if Conf.sComboBox2.Text = 'Direct 3D' then
                t2 := 'd3d';
              TMemo(Comp).Lines.Insert(k,'video          '+t2);
            end
          else if t1 = 'filter' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox7.Checked = True then
                TMemo(Comp).Lines.Insert(k,'filter          1')
              else
                TMemo(Comp).Lines.Insert(k,'filter          0');
            end
          else if t1 = 'd3dversion' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sComboBox3.ItemIndex = 0 then
                TMemo(Comp).Lines.Insert(k,'d3dversion          9')
              else
                TMemo(Comp).Lines.Insert(k,'d3dversion          8');
            end
          else if t1 = 'hwstretch' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox8.Checked = True then
                Tmemo(Comp).Lines.Insert(k,'hwstretch          1')
              else
                Tmemo(Comp).Lines.Insert(k,'hwstretch          0');
            end
          else if t1 = 'full_screen_gamma' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,'full_screen_gamma          '+Conf.sLabel8.Caption);
            end
          else if t1 = 'full_screen_brightness' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,'full_screen_brightness          '+Conf.sLabel7.Caption);
            end
          else if t1 = 'full_screen_contrast' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,'full_screen_contrast          '+Conf.sLabel6.Caption);
            end
          else if t1 = 'triplebuffer' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox11.Checked = True then
                Tmemo(Comp).Lines.Insert(k,'triplebuffer          1')
              else
                Tmemo(Comp).Lines.Insert(k,'triplebuffer          0');
            end
          else if t1 = 'waitvsync' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox13.Checked = True then
                Tmemo(Comp).Lines.Insert(k,'waitvsync          1')
              else
                Tmemo(Comp).Lines.Insert(k,'waitvsync          0');
            end
          else if t1 ='syncrefresh' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox12.Checked = True then
                Tmemo(Comp).Lines.Insert(k,'syncrefresh          1')
              else
                Tmemo(Comp).Lines.Insert(k,'syncrefresh          0');
            end
          else if t1 ='refreshspeed' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox14.Checked = True then
                Tmemo(Comp).Lines.Insert(k,'refreshspeed          1')
              else
                Tmemo(Comp).Lines.Insert(k,'refreshspeed          0');
            end
          else if t1 = 'seconds_to_run' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,'seconds_to_run          '+Conf.sLabel12.Caption);
            end
          else if t1 = 'prescale' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,'prescale          '+Conf.sLabel1.Caption);
            end
          else if t1 = 'effect' then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,'effect          '+Conf.sEdit1.Text);
            end
          else if t1 = scr then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,scr+'          '+Conf.sComboBox5.Text);
            end
          else if t1 = asp then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,asp+'          '+Conf.sComboBox6.Text);
            end
          else if t1 = res then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,res+'          '+Conf.sComboBox7.Text);
            end
          else if t1 = vie then
            begin
              Tmemo(Comp).Lines.Delete(k);
              Tmemo(Comp).Lines.Insert(k,vie+'          '+Conf.sComboBox8.Text);
            end;
        end;
      Tmemo(Comp).Lines.SaveToFile(FullPathMame_Exe+'mame.ini');
      FromMame_GrpaphicsToFindGraphics := False;
    end;
end;

procedure MameGraphics_Clear;
begin
  Conf.sCheckBox3.Checked := False;
  Conf.sCheckBox4.Checked := False;
  Conf.sCheckBox5.Checked := False;
  Conf.sCheckBox6.Checked := False;
  Conf.sCheckBox15.Checked := False;
  Conf.sCheckBox8.Checked := False;
  Conf.sCheckBox11.Checked := False;
  Conf.sCheckBox12.Checked := False;
  Conf.sCheckBox13.Checked := False;
  Conf.sCheckBox14.Checked := False;
  Conf.sCheckBox7.Checked := False;
  Conf.sCheckBox40.Checked := False;
  Conf.sCheckBox41.Checked := False;
  Conf.sbar_mame_emulatrionspeed.Position := 1;
  Conf.sbar_mame_pausebrightness.Position := 0;
  Conf.sbar_mame_gammacorrection.Position := 10;
  Conf.sbar_mame_brightnesscorrection.Position := 10;
  Conf.sbar_mame_contrastcorrection.Position := 10;
  Conf.sbar_mame_Fgamma.Position := 10;
  Conf.sbar_mame_Fbrightness.Position := 10;
  Conf.sbar_mame_Fcontrast.Position := 10;
  Conf.sbar_mame_secondstorun.Position := 0;
  Conf.sbar_mame_scalescreen.Position := 1;
  Conf.sComboBox20.ItemIndex := 0;
  Conf.sComboBox2.ItemIndex := 0;
  Conf.sComboBox3.ItemIndex := 0;
  Conf.sComboBox4.ItemIndex := 0;
  Conf.sComboBox5.ItemIndex := 0;
  Conf.sComboBox6.ItemIndex := 0;
  Conf.sComboBox7.ItemIndex := 0;
  Conf.sComboBox8.ItemIndex := 0;
  Conf.sComboBox9.ItemIndex := 0;
  Conf.sEdit1.Text := '';
  Conf.sButton5.Enabled := False;
  Conf.sButton1.Enabled := False;
end;

procedure ResetToDefaultTopic_MameGraphics;
begin
  Conf.sCheckBox3.Checked := False;
  Conf.sCheckBox4.Checked := True;
  Conf.sCheckBox5.Checked := True;
  Conf.sCheckBox6.Checked := True;
  Conf.sbar_mame_emulatrionspeed.Position := 100;
  MameEmulationSpeedChange;
  Conf.sComboBox20.Text := 'Default';
  Conf.sCheckBox41.Checked := False;
  Conf.sCheckBox40.Checked := False;
  Conf.sbar_mame_pausebrightness.Position := 65;
  MamePauseChange;
  Conf.sbar_mame_gammacorrection.Position := 100;
  MameGammaChange;
  Conf.sbar_mame_brightnesscorrection.Position := 100;
  MameBrightnessChange;
  Conf.sbar_mame_contrastcorrection.Position := 100;
  MameContrastChange;
  Conf.sCheckBox15.Checked := False;
  Conf.sComboBox9.Text := 'Draw Every Frame';
  Conf.sComboBox2.Text := 'Direct 3D';
  Conf.sCheckBox7.Checked := True;
  Conf.sComboBox3.Text := 'Version 9';
  Conf.sCheckBox8.Checked := True;
  Conf.sbar_mame_Fgamma.Position := 100;
  MameFullscreenGammaChange;
  Conf.sbar_mame_Fbrightness.Position := 100;
  MameFullscreenBrightnessChange;
  Conf.sbar_mame_Fcontrast.Position := 100;
  MameFullscreenContrastChange;
  Conf.sCheckBox9.Checked := False;
  Conf.sCheckBox11.Checked := False;
  Conf.sCheckBox12.Checked := False;
  Conf.sCheckBox13.Checked := False;
  Conf.sCheckBox14.Checked := False;
  Conf.sbar_mame_secondstorun.Position := 0;
  MameSecondsToRunChange;
  Conf.sbar_mame_scalescreen.Position := 1;
  MameScaleScreenChange;
  Conf.sEdit1.Text := 'none';
  Conf.sComboBox5.Text := 'auto';
  Conf.sComboBox6.Text := 'auto';
  Conf.sComboBox7.Text := 'auto';
  Conf.sComboBox8.Text := 'auto';
  Conf.sButton5.Enabled := False;
  CheckTopicsConfig;
end;

procedure CheckMameGraphics_TopicSettings;
begin
  Conf.sButton5.Enabled := False;
  if Mame_Exe <> '' then
    begin
      if Conf.sCheckBox3.Checked <> False then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox4.Checked <> True then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox5.Checked <> True then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox6.Checked <> True then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_emulatrionspeed.Position <> 100 then
        Conf.sButton5.Enabled := True;
      if Conf.sComboBox20.Text <> 'Default' then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox41.Checked <> False then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox40.Checked <> False then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_pausebrightness.Position <> 65 then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_gammacorrection.Position <> 100 then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_brightnesscorrection.Position <> 100 then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_contrastcorrection.Position <> 100 then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox15.Checked <> False then
        Conf.sButton5.Enabled := True;
      if Conf.sComboBox9.Text <> 'Draw Every Frame' then
        Conf.sButton5.Enabled := True;
      if Conf.sComboBox2.Text <> 'Direct 3D' then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox7.Checked <> True then
        Conf.sButton5.Enabled := True;
      if Conf.sComboBox3.Text <> 'Version 9' then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox8.Checked <> True then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_Fgamma.Position <> 100 then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_Fbrightness.Position <> 100 then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_Fcontrast.Position <> 100 then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox9.Checked <> False then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox11.Checked <> False then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox12.Checked <> False then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox13.Checked <> False then
        Conf.sButton5.Enabled := True;
      if Conf.sCheckBox14.Checked <> False then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_secondstorun.Position <> 0 then
        Conf.sButton5.Enabled := True;
      if Conf.sbar_mame_scalescreen.Position <> 1 then
        Conf.sButton5.Enabled := True;
      if Conf.sEdit1.Text <> 'none' then
        Conf.sButton5.Enabled := True;
      if Conf.sComboBox5.Text <> 'auto' then
        Conf.sButton5.Enabled := True;
      if Conf.sComboBox6.Text <> 'auto' then
        Conf.sButton5.Enabled := True;
      if Conf.sComboBox7.Text <> 'auto' then
        Conf.sButton5.Enabled := True;
      if Conf.sComboBox8.Text <> 'auto' then
        Conf.sButton5.Enabled := True;
    end;
end;

procedure CheckButtonTopicsConfig_MameGraphics;
begin
  FromMame_GrpaphicsToFindGraphics := True;
  CheckMameGraphics_TopicSettings;
  CheckTopicsConfig;
end;

procedure Show_mame_graphicspanel;
begin
  if (Cmenustate = 'em_arcade_mame_paths') then
    em_mame_dirs_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_sound') then
    em_mame_sound_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_others') then
    em_mame_others_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_builds') then
    em_mame_builds_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_database') then
    em_mame_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'em_arcade_mame_graphics';
  em_mame_graphics_ShowDynamicComps;
  ShowButtonDown(7,'EM_ARCADE_MAME_GRAPHICS');
  CheckButtonTopicsConfig_MameGraphics;
  ShowHidePanel(CurrentPanel,'Pem_mame_graphics');
end;

procedure em_mame_graphics_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_mame_graphics,'media\confeditor\images\mame\mame.png',
              -10,587,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pem_mame_graphics,'media\confeditor\images\mame\mame_image.png',
              558,381,169,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_mame_graphics,'media\confeditor\images\mame\graphics.png',
              593,2,136,71,i,'',True,False);
      end;
    end;
end;

procedure em_mame_graphics_FreeDynamicComps;
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
