unit psx2;

interface

uses
  SysUtils, Graphics, Controls, inifiles, FunctionX, main,
  mame_database,psx;

  Procedure pSXcdImages;
  Procedure pSXcards;
  Procedure pSXsaves;
  Procedure pSXscreenshots;
  Procedure pSXmemcard(i : Integer);
//  Procedure pSXtypeControllerCheck;
//  Procedure pSXrumbleCheck;
  Procedure pSXbilinearCheck;
  Procedure pSXframeCheck;
  Procedure pSXpauseCheck;
  Procedure pSXstatusicosCheck;
  Procedure pSXwinVerticalSyncCheck;
  Procedure pSXmonitorCheck;
  Procedure pSXfullAspectRatio;
  Procedure pSXpalCheck;
  Procedure pSXntscCheck;
  Procedure pSXfullVerticalSyncCheck;
  Procedure pSXsleepCheck;
//  Procedure pSXgammaCheck;
//  Procedure pSXbrightnessCheck;
//  Procedure pSXcontrastCheck;
//  Procedure pSXresetCheck;
  Procedure pSXKeyLeft(Key:Word);
  Procedure pSXKeyRight(Key:Word);
  Procedure pSXKeyDown(Key:Word);
  Procedure pSXKeyUp(Key:Word);
  Procedure pSXKeyStart(Key:Word);
  Procedure pSXKeySelect(Key:Word);
  Procedure pSXKeySquare(Key:Word);
  Procedure pSXKeyCircle(Key:Word);
  Procedure pSXKeyTriangle(Key:Word);
  Procedure pSXKeyCross(Key:Word);
  Procedure pSXKeyStatusDisplay(Key:Word);
  Procedure pSXKeyIncGamma(Key:Word);
  Procedure pSXKeyDecGamma(Key:Word);
  Procedure pSXKeyIncBrightness(Key:Word);
  Procedure pSXKeyDecBrightness(Key:Word);
  Procedure pSXKeyIncContrast(Key:Word);
  Procedure pSXKeyDecContrast(Key:Word);
  Procedure pSXKeyScreenshot(Key:Word);
  Procedure pSXKeySoundStatus(Key:Word);
  Procedure pSXKeyMuteSound(Key:Word);
  Procedure pSXKeyIncVolume(Key:Word);
  Procedure pSXKeyDecVolume(Key:Word);
  Procedure pSXKeyIncXAVolume(Key:Word);
  Procedure pSXKeyDecXAVolume(Key:Word);
  Procedure pSXKeyFastForward(Key:Word);
  Procedure pSXKeyShowVRam(Key:Word);
  Procedure pSXsoundDeviceCheck;
  Procedure pSXsampleRateCheck;
  Procedure pSXsameAsEmulatedMachiceCheck;
  Procedure pSXreverbCheck;
  Procedure pSXsyncSoundCheck;
  Procedure pSXinterpolateCheck;
  Procedure pSXlatanceCheck;
  Procedure pSXxaLatanceCheck;
  Procedure pSXcdromDriverCheck;
  Procedure pSXsubcodeCheck;
  Procedure pSXscreenshotFormatCheck;
  Procedure pSXejectMemCard1Check;
  Procedure pSXejectMemCard2Check;


implementation

Procedure pSXcdImages;
Begin
{  if Conf.Find_Dirs.Directory <> '' then
    begin
      if Conf.Find_Dirs.Directory = Program_Path + 'emulators\psx\cdimages' then
        begin
          Conf.sEdit8.Text := 'cdimages ( Default pSX directory )';
          RealpSXIni.WriteString('Paths','CDImagePath','cdimages');
        end
      else
        begin
          Conf.sEdit8.Text := Conf.Find_Dirs.Directory;
          RealpSXIni.WriteString('Paths','CDImagePath',Conf.Find_Dirs.Directory);
        end;
    end;}
end;

Procedure pSXcards;
Begin
{  if Conf.Find_Dirs.Directory <> '' then
    begin
      if Conf.Find_Dirs.Directory = Program_Path + 'emulators\psx\cards' then
        begin
          Conf.sEdit5.Text := 'cards ( Default pSX directory )';
          RealpSXIni.WriteString('Paths','MemoryCardPath','cards');
        end
      else
        begin
          Conf.sEdit5.Text := Conf.Find_Dirs.Directory;
          RealpSXIni.WriteString('Paths','MemoryCardPath',Conf.Find_Dirs.Directory);
        end;
    end;}
end;

Procedure pSXsaves;
Begin
{  if Conf.Find_Dirs.Directory <> '' then
    begin
      if Conf.Find_Dirs.Directory = Program_Path + 'emulators\psx\saves' then
        begin
          Conf.sEdit4.Text := 'saves ( Default pSX directory )';
          RealpSXIni.WriteString('Paths','SaveStatePath','saves');
        end
      else
        begin
          Conf.sEdit4.Text := Conf.Find_Dirs.Directory;
          RealpSXIni.WriteString('Paths','SaveStatePath',Conf.Find_Dirs.Directory);
        end;
    end;}
end;

Procedure pSXscreenshots;
Begin
{  if Conf.Find_Dirs.Directory <> '' then
    begin
      if Conf.Find_Dirs.Directory = Program_Path + 'emulators\psx\screenshots' then
        begin
          Conf.sEdit3.Text := 'screenshots ( Default pSX directory )';
          RealpSXIni.WriteString('Paths','ScreenShotsPath','screenshots');
        end
      else
        begin
          Conf.sEdit3.Text := Conf.Find_Dirs.Directory;
          RealpSXIni.WriteString('Paths','ScreenShotsPath',Conf.Find_Dirs.Directory);
        end;
    end;}
end;

Procedure pSXmemcard(i : Integer);
var
  text: String;
Begin
  Case i of
    1 : Begin

        end;
    2 : ;
  end;
end;

{Procedure pSXtypeControllerCheck;
Begin
  if Conf.RadioButton1.Checked = true then
    begin
      Case Conf.sComboBox27.ItemIndex of
        0 : RealPsxIni.WriteInteger('Controllers','Controller1Type',-1);
        1 : RealPsxIni.WriteInteger('Controllers','Controller1Type',0);
        2 : RealPsxIni.WriteInteger('Controllers','Controller1Type',1);
        3 : RealPsxIni.WriteInteger('Controllers','Controller1Type',2);
        4 : RealPsxIni.WriteInteger('Controllers','Controller1Type',3);
      end;
    end
  else
    begin
      Case Conf.sComboBox27.ItemIndex of
        0 : RealPsxIni.WriteInteger('Controllers','Controller2Type',-1);
        1 : RealPsxIni.WriteInteger('Controllers','Controller2Type',0);
        2 : RealPsxIni.WriteInteger('Controllers','Controller2Type',1);
        3 : RealPsxIni.WriteInteger('Controllers','Controller2Type',2);
        4 : RealPsxIni.WriteInteger('Controllers','Controller2Type',3);
      end;
    end;
end;

Procedure pSXrumbleCheck;
Begin
  if Conf.RadioButton1.Checked = true then
    begin
      if Conf.sCheckBox49.Checked = true then
        RealPsxIni.WriteInteger('Input','Joy1Rumble',1)
      else
        RealPsxIni.WriteInteger('Input','Joy1Rumble',0);
    end
  else
    begin
      if Conf.sCheckBox49.Checked = true then
        RealPsxIni.WriteInteger('Input','Joy2Rumble',1)
      else
        RealPsxIni.WriteInteger('Input','Joy2Rumble',0);
    end;
end;}

Procedure pSXbilinearCheck;
Begin
  if Conf.sCheckBox3.Checked = true then
    RealpSXIni.WriteInteger('Graphics','BilinearInterpolation',1)
  else
    RealpSXIni.WriteInteger('Graphics','BilinearInterpolation',0);
end;

Procedure pSXframeCheck;
Begin
  if Conf.sCheckBox4.Checked = true then
    RealpSXIni.WriteInteger('Graphics','FrameSkip',1)
  else
    RealpSXIni.WriteInteger('Graphics','FrameSkip',0);
end;

Procedure pSXpauseCheck;
Begin
  if Conf.sCheckBox5.Checked = true then
    RealpSXIni.WriteInteger('Graphics','PauseWhenDefocused',1)
  else
    RealpSXIni.WriteInteger('Graphics','PauseWhenDefocused',0);
end;

Procedure pSXstatusicosCheck;
Begin
  if Conf.sCheckBox6.Checked = true then
    RealpSXIni.WriteInteger('Graphics','StatusIcons',1)
  else
    RealpSXIni.WriteInteger('Graphics','StatusIcons',0);
end;

Procedure pSXwinVerticalSyncCheck;
Begin
  if Conf.sCheckBox40.Checked = true then
    RealpSXIni.WriteInteger('Graphics','WindowedSync',1)
  else
    RealpSXIni.WriteInteger('Graphics','WindowedSync',0);
end;

Procedure pSXmonitorCheck;
Begin
  RealpSXIni.WriteInteger('Graphics','FullscreenAdapter',Conf.sComboBox4.ItemIndex - 1);  
end;

Procedure pSXfullAspectRatio;
Begin
  RealpSXIni.WriteInteger('Graphics','FullscreenAspectRatio',Conf.sComboBox4.ItemIndex - 1);
end;

Procedure pSXpalCheck;
var
  i,k,l: Integer;
  t1,t2,t3: String;
Begin
  if Conf.sComboBox6.Text = 'auto' then
    begin
      RealpSXIni.WriteInteger('Graphics','PALWidth',-1);
      RealpSXIni.WriteInteger('Graphics','PALHeight',-1);
      RealpSXIni.WriteInteger('Graphics','PALRefresh',-1);
    end
  else
    begin
      i := Pos('x',Conf.sComboBox6.Text);
      k := Pos('',Conf.sComboBox6.Text);
      l := Pos('H',Conf.sComboBox6.Text);
      t1 := Trim(copy(Conf.sComboBox6.Text,0,i-1));
      t2 := Trim(Copy(Conf.sComboBox6.Text,i+1,k+4));
      t3 := Trim(Copy(Conf.sComboBox6.Text,l-4,3));
      RealpSXIni.WriteInteger('Graphics','PALWidth',StrToInt(t1));
      RealpSXIni.WriteInteger('Graphics','PALHeight',StrToInt(t2));
      RealpSXIni.WriteInteger('Graphics','PALRefresh',StrToInt(t2));
    end;
end;

Procedure pSXntscCheck;
var
  i,k,l: Integer;
  t1,t2,t3: String;
Begin
  if Conf.sComboBox7.Text = 'auto' then
    begin
      RealpSXIni.WriteInteger('Graphics','NTSCWidth',-1);
      RealpSXIni.WriteInteger('Graphics','NTSCHeight',-1);
      RealpSXIni.WriteInteger('Graphics','NTSCRefresh',-1);
    end
  else
    begin
      i := Pos('x',Conf.sComboBox7.Text);
      k := Pos('',Conf.sComboBox7.Text);
      l := Pos('H',Conf.sComboBox7.Text);
      t1 := Trim(copy(Conf.sComboBox7.Text,0,i-1));
      t2 := Trim(Copy(Conf.sComboBox7.Text,i+1,k+4));
      t3 := Trim(Copy(Conf.sComboBox7.Text,l-4,3));
      RealpSXIni.WriteInteger('Graphics','NTSCWidth',StrToInt(t1));
      RealpSXIni.WriteInteger('Graphics','NTSCHeight',StrToInt(t2));
      RealpSXIni.WriteInteger('Graphics','NTSCRefresh',StrToInt(t2));
    end;
end;

Procedure pSXfullVerticalSyncCheck;
Begin
//  if Conf.sCheckBox10.Checked = true then
//    RealpSXIni.WriteInteger('Graphics','FullscreenVSync',1)
//  else
//    RealpSXIni.WriteInteger('Graphics','FullscreenVSync',0);
end;

Procedure pSXsleepCheck;
Begin
  if Conf.sCheckBox41.Checked = true then
    RealpSXIni.WriteInteger('Graphics','SleepWhenIdle',1)
  else
    RealpSXIni.WriteInteger('Graphics','SleepWhenIdle',0);
end;

{Procedure pSXgammaCheck;
Begin
      if Conf.sScrollBar5.Position > 499 then
        Conf.sLabel8.Caption := '5.00'
      else if Conf.sScrollBar5.Position > 399 then
        Conf.sLabel8.Caption := '4.' + Trim(Copy(IntToStr(Conf.sScrollBar5.Position),2,2))
      else if Conf.sScrollBar5.Position > 299 then
        Conf.sLabel8.Caption := '3.' + Trim(Copy(IntToStr(Conf.sScrollBar5.Position),2,2))
      else if Conf.sScrollBar5.Position > 199 then
        Conf.sLabel8.Caption := '2.' + Trim(Copy(IntToStr(Conf.sScrollBar5.Position),2,2))
      else if Conf.sScrollBar5.Position > 99 then
        Conf.sLabel8.Caption := '1.' + Trim(Copy(IntToStr(Conf.sScrollBar5.Position),2,2))
      else if Conf.sScrollBar5.Position < 99 then
        Conf.sLabel8.Caption :=  '0.'+IntToStr(Conf.sScrollBar5.Position);
//      RealpSXIni.WriteString('Graphics','Gamma',Conf.sLabel8.Caption+'0000');
end;

Procedure pSXbrightnessCheck;
Begin
      if Conf.sScrollBar6.Position > 99 then
        Conf.sLabel7.Caption := '1.00'
      else if Conf.sScrollBar6.Position > 9 then
        Conf.sLabel7.Caption := '0.' + Trim(Copy(IntToStr(Conf.sScrollBar6.Position),1,2))
      else if Conf.sScrollBar6.Position > 0 then
        Conf.sLabel7.Caption := '0.0' + Trim(Copy(IntToStr(Conf.sScrollBar6.Position),1,2))
      else if Conf.sScrollBar6.Position = 0 then
        Conf.sLabel7.Caption := '0.00'
      else if Conf.sScrollBar6.Position = -100 then
        Conf.sLabel7.Caption := '-1.00'
      else if Conf.sScrollBar6.Position < -9 then
        Conf.sLabel7.Caption := '-0.' + Trim(Copy(IntToStr(Conf.sScrollBar6.Position),2,2))
      else if Conf.sScrollBar6.Position < 0 then
        Conf.sLabel7.Caption := '-0.0' + Trim(Copy(IntToStr(Conf.sScrollBar6.Position),2,2));
//      RealpSXIni.WriteString('Graphics','Brightness',Conf.sLabel7.Caption+'0000');
end;

Procedure pSXcontrastCheck;
Begin
      if Conf.sScrollBar7.Position > 99 then
        Conf.sLabel6.Caption := '1.00'
      else if Conf.sScrollBar7.Position > 9 then
        Conf.sLabel6.Caption := '0.' + Trim(Copy(IntToStr(Conf.sScrollBar7.Position),1,2))
      else if Conf.sScrollBar7.Position > 0 then
        Conf.sLabel6.Caption := '0.0' + Trim(Copy(IntToStr(Conf.sScrollBar7.Position),1,2))
      else if Conf.sScrollBar7.Position = 0 then
        Conf.sLabel6.Caption := '0.00'
      else if Conf.sScrollBar7.Position = -100 then
        Conf.sLabel6.Caption := '-1.00'
      else if Conf.sScrollBar7.Position < -9 then
        Conf.sLabel6.Caption := '-0.' + Trim(Copy(IntToStr(Conf.sScrollBar7.Position),2,2))
      else if Conf.sScrollBar7.Position < 0 then
        Conf.sLabel6.Caption := '-0.0' + Trim(Copy(IntToStr(Conf.sScrollBar7.Position),2,2));
//      RealpSXIni.WriteString('Graphics','Contrast',Conf.sLabel6.Caption+'0000');
end;

Procedure pSXresetCheck;
Begin
  Conf.sScrollBar5.Position := 100;
  pSXgammaCheck;
  Conf.sScrollBar7.Position := 0;
  pSXbrightnessCheck;
  Conf.sScrollBar6.Position := 0;
  pSXcontrastCheck;
end;}

Procedure pSXKeyLeft;
Begin
  if Conf.sEdit35.Color = clRed then
    begin
      Conf.sEdit35.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Left',pSXKey);
        RealPsxIni.WriteString('Input','Key2Left',pSXKey);
      Conf.sEdit35.Text := pSXKeyC;
      Conf.sEdit36.SetFocus;
      Conf.sEdit36.SelStart := 0;
      RedKey(36);
    end;
end;

Procedure pSXKeyRight(Key:Word);
Begin
  if Conf.sEdit36.Color = clRed then
    begin
      Conf.sEdit36.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Right',pSXKey);
        RealPsxIni.WriteString('Input','Key2Right',pSXKey);
      Conf.sEdit36.Text := pSXKeyC;
      Conf.sEdit37.SetFocus;
      Conf.sEdit37.SelStart := 0;
      RedKey(37);
    end;
end;

Procedure pSXKeyDown(Key:Word);
Begin
  if Conf.sEdit37.Color = clRed then
    begin
      Conf.sEdit37.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Down',pSXKey);
        RealPsxIni.WriteString('Input','Key2Down',pSXKey);
      Conf.sEdit37.Text := pSXKeyC;
      Conf.sEdit38.SetFocus;
      Conf.sEdit38.SelStart := 0;
      RedKey(38);
    end;
end;

Procedure pSXKeyUp(Key:Word);
Begin
  if Conf.sEdit38.Color = clRed then
    begin
      Conf.sEdit38.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Up',pSXKey);
        RealPsxIni.WriteString('Input','Key2Up',pSXKey);
      Conf.sEdit38.Text := pSXKeyC;
      Conf.sEdit39.SetFocus;
      Conf.sEdit39.SelStart := 0;
      RedKey(39);
    end;
end;

Procedure pSXKeyStart(Key:Word);
Begin
  if Conf.sEdit39.Color = clRed then
    begin
      Conf.sEdit39.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Start',pSXKey);
        RealPsxIni.WriteString('Input','Key2Start',pSXKey);
      Conf.sEdit39.Text := pSXKeyC;
      Conf.sEdit40.SetFocus;
      Conf.sEdit40.SelStart := 0;
      RedKey(40);
    end;
end;

Procedure pSXKeySelect(Key:Word);
Begin
  if Conf.sEdit40.Color = clRed then
    begin
      Conf.sEdit40.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Select',pSXKey);
        RealPsxIni.WriteString('Input','Key2Select',pSXKey);
      Conf.sEdit40.Text := pSXKeyC;
      Conf.sEdit41.SetFocus;
      Conf.sEdit41.SelStart := 0;
      RedKey(41);
    end;
end;

Procedure pSXKeySquare(Key:Word);
Begin
  if Conf.sEdit44.Color = clRed then
    begin
      Conf.sEdit44.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Square',pSXKey);
        RealPsxIni.WriteString('Input','Key2Square',pSXKey);
      Conf.sEdit44.Text := pSXKeyC;
      Conf.sEdit44.Color := clWhite;
    end;
end;

Procedure pSXKeyCircle(Key:Word);
Begin
  if Conf.sEdit41.Color = clRed then
    begin
      Conf.sEdit41.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Circle',pSXKey);
        RealPsxIni.WriteString('Input','Key2Circle',pSXKey);
      Conf.sEdit41.Text := pSXKeyC;
      Conf.sEdit42.SetFocus;
      Conf.sEdit42.SelStart := 0;
      RedKey(42);
    end;
end;

Procedure pSXKeyTriangle(Key:Word);
Begin
  if Conf.sEdit42.Color = clRed then
    begin
      Conf.sEdit42.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Triangle',pSXKey);
        RealPsxIni.WriteString('Input','Key2Triangle',pSXKey);
      Conf.sEdit42.Text := pSXKeyC;
      Conf.sEdit43.SetFocus;
      Conf.sEdit43.SelStart := 0;
      RedKey(43);
    end;
end;

Procedure pSXKeyCross(Key:Word);
Begin
  if Conf.sEdit43.Color = clRed then
    begin
      Conf.sEdit43.Text := '';
      pSXKeyCode(key);
        RealPsxIni.WriteString('Input','Key1Cross',pSXKey);
        RealPsxIni.WriteString('Input','Key2Cross',pSXKey);
      Conf.sEdit43.Text := pSXKeyC;
      Conf.sEdit44.SetFocus;
      Conf.sEdit44.SelStart := 0;
      RedKey(44);
    end;
end;

Procedure pSXKeyStatusDisplay(Key:Word);
Begin
  if Conf.sEdit27.Color = clRed then
    begin
      Conf.sEdit27.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyStatusDisplay',pSXKey);
      Conf.sEdit27.Text := pSXKeyC;
      Conf.sEdit28.SetFocus;
      Conf.sEdit28.SelStart := 0;
      RedKey(28);
    end;
end;

Procedure pSXKeyIncGamma(Key:Word);
Begin
  if Conf.sEdit28.Color = clRed then
    begin
      Conf.sEdit28.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyIncGamma',pSXKey);
      Conf.sEdit28.Text := pSXKeyC;
      Conf.sEdit29.SetFocus;
      Conf.sEdit29.SelStart := 0;
      RedKey(29);
    end;
end;

Procedure pSXKeyDecGamma(Key:Word);
Begin
  if Conf.sEdit29.Color = clRed then
    begin
      Conf.sEdit29.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyDecGamma',pSXKey);
      Conf.sEdit29.Text := pSXKeyC;
      Conf.sEdit30.SetFocus;
      Conf.sEdit30.SelStart := 0;
      RedKey(30);
    end;
end;

Procedure pSXKeyIncBrightness(Key:Word);
Begin
  if Conf.sEdit30.Color = clRed then
    begin
      Conf.sEdit30.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyIncBrightness',pSXKey);
      Conf.sEdit30.Text := pSXKeyC;
      Conf.sEdit31.SetFocus;
      Conf.sEdit31.SelStart := 0;
      RedKey(31);
    end;
end;

Procedure pSXKeyDecBrightness(Key:Word);
Begin
  if Conf.sEdit31.Color = clRed then
    begin
      Conf.sEdit31.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyDecBrightness',pSXKey);
      Conf.sEdit31.Text := pSXKeyC;
      Conf.sEdit32.SetFocus;
      Conf.sEdit32.SelStart := 0;
      RedKey(32);
    end;
end;

Procedure pSXKeyIncContrast(Key:Word);
Begin
  if Conf.sEdit32.Color = clRed then
    begin
      Conf.sEdit32.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyIncContrast',pSXKey);
      Conf.sEdit32.Text := pSXKeyC;
      Conf.sEdit33.SetFocus;
      Conf.sEdit33.SelStart := 0;
      RedKey(33);
    end;
end;

Procedure pSXKeyDecContrast(Key:Word);
Begin
  if Conf.sEdit33.Color = clRed then
    begin
      Conf.sEdit33.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyDecContrast',pSXKey);
      Conf.sEdit33.Text := pSXKeyC;
      Conf.sEdit34.SetFocus;
      Conf.sEdit34.SelStart := 0;
      RedKey(34);
    end;
end;

Procedure pSXKeyScreenshot(Key:Word);
Begin
  if Conf.sEdit34.Color = clRed then
    begin
      Conf.sEdit34.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyScreenShot',pSXKey);
      Conf.sEdit34.Text := pSXKeyC;
      Conf.sEdit19.SetFocus;
      Conf.sEdit19.SelStart := 0;
      RedKey(19);
    end;
end;

Procedure pSXKeySoundStatus(Key:Word);
Begin
  if Conf.sEdit19.Color = clRed then
    begin
      Conf.sEdit19.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeySoundStatus',pSXKey);
      Conf.sEdit19.Text := pSXKeyC;
      Conf.sEdit20.SetFocus;
      Conf.sEdit20.SelStart := 0;
      RedKey(20);
    end;
end;

Procedure pSXKeyMuteSound(Key:Word);
Begin
  if Conf.sEdit20.Color = clRed then
    begin
      Conf.sEdit20.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyMute',pSXKey);
      Conf.sEdit20.Text := pSXKeyC;
      Conf.sEdit21.SetFocus;
      Conf.sEdit21.SelStart := 0;
      RedKey(21);
    end;
end;

Procedure pSXKeyIncVolume(Key:Word);
Begin
  if Conf.sEdit21.Color = clRed then
    begin
      Conf.sEdit21.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyIncVolume',pSXKey);
      Conf.sEdit21.Text := pSXKeyC;
      Conf.sEdit22.SetFocus;
      Conf.sEdit22.SelStart := 0;
      RedKey(22);
    end;
end;

Procedure pSXKeyDecVolume(Key:Word);
Begin
  if Conf.sEdit22.Color = clRed then
    begin
      Conf.sEdit22.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyDecVolume',pSXKey);
      Conf.sEdit22.Text := pSXKeyC;
      Conf.sEdit23.SetFocus;
      Conf.sEdit23.SelStart := 0;
      RedKey(23);
    end;
end;

Procedure pSXKeyIncXAVolume(Key:Word);
Begin
  if Conf.sEdit23.Color = clRed then
    begin
      Conf.sEdit23.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyIncXAVolume',pSXKey);
      Conf.sEdit23.Text := pSXKeyC;
      Conf.sEdit24.SetFocus;
      Conf.sEdit24.SelStart := 0;
      RedKey(24);
    end;
end;

Procedure pSXKeyDecXAVolume(Key:Word);
Begin
  if Conf.sEdit24.Color = clRed then
    begin
      Conf.sEdit24.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyDecXAVolume',pSXKey);
      Conf.sEdit24.Text := pSXKeyC;
      Conf.sEdit25.SetFocus;
      Conf.sEdit25.SelStart := 0;
      RedKey(25);
    end;
end;

Procedure pSXKeyFastForward(Key:Word);
Begin
  if Conf.sEdit25.Color = clRed then
    begin
      Conf.sEdit25.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyFastForward',pSXKey);
      Conf.sEdit25.Text := pSXKeyC;
      Conf.sEdit26.SetFocus;
      Conf.sEdit26.SelStart := 0;
      RedKey(26);
    end;
end;

Procedure pSXKeyShowVRam(Key:Word);
Begin
  if Conf.sEdit26.Color = clRed then
    begin
      Conf.sEdit26.Text := '';
      pSXKeyCode(key);
      RealPsxIni.WriteString('Input','KeyShowVram',pSXKey);
      Conf.sEdit26.Text := pSXKeyC;
      Conf.sEdit26.Color := clWhite;
    end;
end;

Procedure pSXsoundDeviceCheck;
Begin
  if Conf.sComboBox22.ItemIndex = 0 then
    RealPsxIni.WriteString('Sound','Device','ffffffffffffffffffffffffffffffff')
  else if Conf.sComboBox22.ItemIndex = 1 then
    RealPsxIni.WriteString('Sound','Device','00000000000000000000000000000000');
end;

Procedure pSXsameAsEmulatedMachiceCheck;
Begin
  if Conf.sCheckBox25.Checked = true then
    begin
      Conf.sComboBox18.Enabled := false;
      RealpSXIni.WriteInteger('Sound','Frequency',-1);
    end
  else
    begin
      Conf.sComboBox18.Enabled := true;
      RealpSXIni.WriteString('Sound','Frequency',Conf.sComboBox18.Text);
    end;
end;

Procedure pSXsampleRateCheck;
Begin
  Case Conf.sComboBox18.ItemIndex of
    0 : RealPsxIni.WriteInteger('Sound','Frequency',11025);
    1 : RealPsxIni.WriteInteger('Sound','Frequency',22050);
    2 : RealPsxIni.WriteInteger('Sound','Frequency',44100);
    3 : RealPsxIni.WriteInteger('Sound','Frequency',48000);
  end;
end;

Procedure pSXreverbCheck;
Begin
  if Conf.sCheckBox26.Checked = true then
    RealpSXIni.WriteInteger('Sound','Reverb',1)
  else
    RealpSXIni.WriteInteger('Sound','Reverb',0);
end;

Procedure pSXsyncSoundCheck;
Begin
  if Conf.sCheckBox43.Checked = true then
    RealpSXIni.WriteInteger('Sound','Sync',1)
  else
    RealpSXIni.WriteInteger('Sound','Sync',0);
end;

Procedure pSXinterpolateCheck;
Begin
//  if Conf.sCheckBox44.Checked = true then
//    RealpSXIni.WriteInteger('Sound','Interpolate',1)
//  else
//    RealpSXIni.WriteInteger('Sound','Interpolate',0);
end;

Procedure pSXlatanceCheck;
Begin
//      RealpSXIni.WriteInteger('Sound','Latency',Conf.sScrollBar11.Position);
//      Conf.sLabel16.Caption := IntToStr(Conf.sScrollBar11.Position)+'ms';
end;

Procedure pSXxaLatanceCheck;
Begin
//      RealpSXIni.WriteInteger('Sound','XALatency',Conf.sScrollBar12.Position);
//      Conf.sLabel15.Caption := IntToStr(Conf.sScrollBar12.Position)+'ms';
end;

Procedure pSXcdromDriverCheck;
Begin
  Case Conf.sComboBox23.ItemIndex of
    0 : RealPsxIni.WriteInteger('CDROM','Driver',-1);
    1 : RealPsxIni.WriteInteger('CDROM','Driver',1);
    2 : RealPsxIni.WriteInteger('CDROM','Driver',2);
  end;
end;

Procedure pSXsubcodeCheck;
Begin
  Case Conf.sComboBox24.ItemIndex of
    0 : RealPsxIni.WriteInteger('CDROM','SubcodeReading',-1);
    1 : RealPsxIni.WriteInteger('CDROM','SubcodeReading',0);
    2 : RealPsxIni.WriteInteger('CDROM','SubcodeReading',1);
    3 : RealPsxIni.WriteInteger('CDROM','SubcodeReading',2);
  end;
end;

Procedure pSXscreenshotFormatCheck;
Begin
  Case Conf.sComboBox25.ItemIndex of
    0 : RealPsxIni.WriteInteger('Graphics','ScreenshotFormat',0);
    1 : RealPsxIni.WriteInteger('Graphics','ScreenshotFormat',1);
    2 : RealPsxIni.WriteInteger('Graphics','ScreenshotFormat',2);
  end;
end;

Procedure pSXejectMemCard1Check;
Begin
  Conf.sEdit6.Text := '';
  RealpSXIni.WriteString('Cards','Card1','');
end;

Procedure pSXejectMemCard2Check;
Begin
  Conf.sEdit7.Text := '';
  RealpSXIni.WriteString('Cards','Card2','');
end;


end.
