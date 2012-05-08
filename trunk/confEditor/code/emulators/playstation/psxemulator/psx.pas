unit psx;

interface
uses
  SysUtils,Graphics, Controls, Forms, StdCtrls, inifiles, FunctionX,
  Main,mame_database,mainconf,psxdata;

  Procedure RunpSX;
  Procedure EnablepSX(What: Boolean);
  Procedure pSXCanClose(Name: String);
  Procedure CreateDefaultIni;
  Procedure SetpSXSettings;
  Procedure pSXKeyCode(Key: Word);
  Procedure CNumberToShowString(what: integer);
  Procedure pSXStats;
  procedure pSXFindFilesCanClose;
  procedure pSXLoad;
  procedure psxButtonFindClick;
  procedure psxFindSystemRom;

  var
    RealpSXIni : TIniFile;
    pSXKey,pSXKeyC,ShowString : String;

implementation

Procedure RunPSX;
Begin
  //not needed
 
  //needed and configureded

  //Page one
  Conf.sEdit8.BoundLabel.Caption := 'CdImages';
  Conf.sEdit8.Left := 78;
  Conf.sEdit8.Top := 60;
  Conf.sEdit8.Width := 241;
  Conf.sEdit8.Height := 21;
  Conf.sEdit3.BoundLabel.Caption := 'Screenshots';
  Conf.sEdit3.Left := 78;
  Conf.sEdit3.Top := 90;
  Conf.sEdit3.Width := 241;
  Conf.sEdit3.Height := 21;
  Conf.sEdit4.BoundLabel.Caption := 'Save States';
  Conf.sEdit4.Left := 78;
  Conf.sEdit4.Top := 120;
  Conf.sEdit4.Width := 241;
  Conf.sEdit4.Height := 21;
  Conf.sEdit5.BoundLabel.Caption := 'Memory Cards';
  Conf.sEdit5.Left := 78;
  Conf.sEdit5.Top := 150;
  Conf.sEdit5.Width := 241;
  Conf.sEdit5.Height := 21;
  Conf.sEdit6.BoundLabel.Caption := 'MC -- Slot 1';
  Conf.sEdit6.Left := 78;
  Conf.sEdit6.Top := 204;
  Conf.sEdit6.Width := 179;
  Conf.sEdit6.Height := 21;
  Conf.sEdit7.BoundLabel.Caption := 'MC -- Slot 2';
  Conf.sEdit7.Left := 78;
  Conf.sEdit7.Top := 234;
  Conf.sEdit7.Width := 179;
  Conf.sEdit7.Height := 21;
  Conf.sWebLabel1.Caption := 'here.';
  Conf.sWebLabel1.URL := 'http://www.azrael.co.cc/downloads/emulators/psx/psxemulator/memorycard.mcr';
  Conf.sWebLabel1.Left := 196;
  Conf.sWebLabel1.Top := 270;
  Conf.sWebLabel2.Caption := 'here.';
  Conf.sWebLabel2.URL := 'http://www.azrael.co.cc/downloads/emulators/psx/psxemulator/d3dx9_26.dll';
  Conf.sWebLabel2.Left := 248;
  Conf.sWebLabel2.Top := 290;

  //Page two
  Conf.sCheckBox3.Caption := 'Bilinear Interpolation';
  Conf.sCheckBox3.Left := 8;
  Conf.sCheckBox3.Top := 8;
  Conf.sCheckBox3.AutoSize := true;
  Conf.sCheckBox4.Caption := 'Frame Skipping';
  Conf.sCheckBox4.Left := 8;
  Conf.sCheckBox4.Top := 28;
  Conf.sCheckBox4.AutoSize := true;
  Conf.sCheckBox5.Caption := 'Pause When Not Focused';
  Conf.sCheckBox5.Left := 8;
  Conf.sCheckBox5.Top := 48;
  Conf.sCheckBox5.AutoSize := true;
  Conf.sCheckBox6.Caption := 'Status Icons';
  Conf.sCheckBox6.Left := 8;
  Conf.sCheckBox6.Top := 68;
  Conf.sCheckBox6.AutoSize := true;
  Conf.sCheckBox40.Caption := 'Vertical Sync';
  Conf.sCheckBox40.Left := 40;
  Conf.sCheckBox40.Top := 32;
  Conf.sCheckBox40.AutoSize := true;
  Conf.sCheckBox41.Caption := 'Sleep When Idle';
  Conf.sCheckBox41.Left := 40;
  Conf.sCheckBox41.Top := 56;
  Conf.sCheckBox41.AutoSize := true;
  Conf.sComboBox4.Left := 160;
  Conf.sComboBox4.Top := 8;
  Conf.sComboBox4.Width := 145;
  Conf.sComboBox4.Height := 21;
  Conf.sComboBox5.Left := 160;
  Conf.sComboBox5.Top := 32;
  Conf.sComboBox5.Width := 145;
  Conf.sComboBox5.Height := 21;
  Conf.sComboBox6.BoundLabel.Caption := 'Pal';
  Conf.sComboBox6.Left := 58;
  Conf.sComboBox6.Top := 16;
  Conf.sComboBox6.Width := 151;
  Conf.sComboBox6.Height := 21;
  Conf.sComboBox7.BoundLabel.Caption := 'Ntsc';
  Conf.sComboBox7.Left := 58;
  Conf.sComboBox7.Top := 40;
  Conf.sComboBox7.Width := 151;
  Conf.sComboBox7.Height := 21;
  Conf.sLabel8.Caption := '1.00';
  Conf.sLabel8.Left := 283;
  Conf.sLabel8.Top := 60;
  Conf.sLabel8.AutoSize := True;
  Conf.sLabel7.Caption := '1.00';
  Conf.sLabel7.Left := 283;
  Conf.sLabel7.Top := 80;
  Conf.sLabel7.AutoSize := True;
  Conf.sLabel6.Caption := '1.00';
  Conf.sLabel6.Left := 283;
  Conf.sLabel6.Top := 100;
  Conf.sLabel6.AutoSize := True;

  //Page three
  Conf.sComboBox22.BoundLabel.Caption := 'Device';
  Conf.sComboBox22.Left := 56;
  Conf.sComboBox22.Top := 24;
  Conf.sComboBox22.Width := 161;
  Conf.sComboBox22.Height := 21;
  Conf.sCheckBox25.Caption := 'Same as Emulated Machine';
  Conf.sCheckBox25.Left := 8;
  Conf.sCheckBox25.Top := 48;
  Conf.sCheckBox25.AutoSize := true;
  Conf.sComboBox18.BoundLabel.Caption := 'Frequency';
  Conf.sComboBox18.Left := 112;
  Conf.sComboBox18.Top := 72;
  Conf.sComboBox18.Width := 105;
  Conf.sComboBox18.Height := 21;
  Conf.sCheckBox26.Caption := 'Reverb';
  Conf.sCheckBox26.Left := 8;
  Conf.sCheckBox26.Top := 132;
  Conf.sCheckBox26.AutoSize := true;
  Conf.sCheckBox43.Caption := 'Sync Sound';
  Conf.sCheckBox43.Left := 8;
  Conf.sCheckBox43.Top := 160;
  Conf.sCheckBox43.AutoSize := true;
  Conf.sLabel13.Caption := 'Latency';
  Conf.sLabel13.Left := 8;
  Conf.sLabel13.Top := 272;
  Conf.sLabel13.AutoSize := true;
  Conf.sLabel14.Caption := 'XA Latency';
  Conf.sLabel14.Left := 8;
  Conf.sLabel14.Top := 312;
  Conf.sLabel14.AutoSize := true;
  Conf.sLabel16.Caption := '0ms';
  Conf.sLabel16.Left := 196;
  Conf.sLabel16.Top := 304;
  Conf.sLabel16.AutoSize := true;
  Conf.sLabel15.Caption := '0ms';
  Conf.sLabel15.Left := 196;
  Conf.sLabel15.Top := 344;
  Conf.sLabel15.AutoSize := true;

  //Page Four
  Conf.sComboBox23.BoundLabel.Caption := 'Driver';
  Conf.sComboBox23.Left := 92;
  Conf.sComboBox23.Top := 32;
  Conf.sComboBox23.Width := 100;
  Conf.sComboBox23.Height := 21;
  Conf.sComboBox24.BoundLabel.Caption := 'Subcode Reading';
  Conf.sComboBox24.Left := 92;
  Conf.sComboBox24.Top := 72;
  Conf.sComboBox24.Width := 100;
  Conf.sComboBox24.Height := 21;
  Conf.sComboBox25.BoundLabel.Caption := 'Format';
  Conf.sComboBox25.Left := 156;
  Conf.sComboBox25.Top := 304;
  Conf.sComboBox25.Width := 57;
  Conf.sComboBox25.Height := 21;
end;

Procedure EnablePSX(What: Boolean);
Begin
  //page one
  Conf.sEdit2.Enabled := what;
  Conf.sEdit3.Enabled := what;
  Conf.sEdit4.Enabled := what;
  Conf.sEdit5.Enabled := what;
  Conf.sEdit6.Enabled := what;
  Conf.sEdit7.Enabled := what;
  Conf.sEdit8.Enabled := what;;
  Conf.sWebLabel1.Enabled := What;
  Conf.sWebLabel2.Enabled := What;

  //page two
  Conf.sCheckBox3.Enabled := what;
  Conf.sCheckBox4.Enabled := what;
  Conf.sCheckBox5.Enabled := what;
  Conf.sCheckBox6.Enabled := what;
  Conf.sComboBox4.Enabled := what;
  Conf.sComboBox5.Enabled := what;
  Conf.sComboBox6.Enabled := what;
  Conf.sComboBox7.Enabled := what;
  Conf.sCheckBox40.Enabled := what;
  Conf.sCheckBox41.Enabled := what;
  Conf.sLabel8.Enabled := what;
  Conf.sLabel7.Enabled := what;
  Conf.sLabel6.Enabled := what;

  //page three
  Conf.sComboBox22.Enabled := what;
  Conf.sCheckBox22.Enabled := what;
  Conf.sComboBox18.Enabled := what;
  Conf.sCheckBox26.Enabled := what;
  Conf.sCheckBox43.Enabled := what;
  Conf.sLabel13.Enabled := what;
  Conf.sLabel14.Enabled := what;
  Conf.sLabel16.Enabled := what;
  Conf.sLabel15.Enabled := what;

  //page four
  Conf.sComboBox23.Enabled := what;
  Conf.sComboBox24.Enabled := what;
  Conf.sComboBox25.Enabled := what;
end;


Procedure PSXCanClose(Name: String);
var
  WhatFile,psxFullDir,PsxExe: String;
  i: Integer;
Begin
{  if name = 'ff1' then
    begin
      //writing the exe
      //i := Conf.sEdit1.GetTextLen;
      //PsxExe:= Trim(copy(Conf.sEdit1.Text,i-9,i+3));
      //PsxIni.WriteString('Path','ExeName',PsxExe);
      //writing the source drive
      //i := pos('\',Conf.sEdit1.Text);
      //WhatFile := Trim(Copy(Conf.sEdit1.Text,0,i));
//      PsxIni.WriteString('Path','InitDir',WhatFile);
      //writing the full dir
      //i := pos('.',Conf.sEdit1.Text);
      //WhatFile := Trim(copy(Conf.sEdit1.Text,0,i-7));
      //PsxIni.WriteString('Path','FullDir',whatfile);
      psxFullDir := WhatFile;
      //
      WhatFile := psxIni.ReadString('Temp','Edit',WhatFile);
        if WhatFile <> Conf.Find_Files.FileName then
          begin
            //if Conf.sEdit18.Enabled = false then
              begin
                if FileExists(psxFullDir+'bios\scph1001.bin') then
                  begin
                    //Conf.sEdit18.Text := Conf.Find_Files.FileName;
                    PsxIni.WriteString('Path','RomPath',Conf.Find_Files.FileName);
                    WhatFile := psxIni.ReadString('Temp','Edit',WhatFile);
                    if WhatFile <> Conf.Find_Files.FileName then
                      begin
                        EnablePsx(true);
                        CreateDefaultIni;
                        ShowExtraKeys;
//                        RunDataBase;
                        SetPsxSettings;
                        //Conf.sEdit18.Enabled := true;
                      end;
                  end
                else
                  begin
                    Conf.skinM.UpdateSkin;
                    EnablePSX(false);
                  end
              end;
            //else
              begin
                EnablePSX(false);
              end;
          end
    end
  else if name = 'ff2' then
    begin
      //Conf.sEdit18.Text := Conf.Find_Files.FileName;
      PsxIni.WriteString('Path','RomPath',Conf.Find_Files.FileName);
      WhatFile := psxIni.ReadString('Temp','Edit',WhatFile);
      if WhatFile <> Conf.Find_Files.FileName then
        begin
          EnablePsx(true);
          CreateDefaultIni;
          ShowExtraKeys;
//          RunDataBase;
          SetPsxSettings;
        end;
    end
  else if name = 'ff3' then
    begin
      WhatFile := pSXIni.ReadString('Temp','CurPath',WhatFile);
      if WhatFile <> Conf.Find_Files.FileName then
        begin
          Conf.sEdit6.Text := Conf.Find_Files.FileName;
          RealpSXIni.WriteString('Cards','Card1',Conf.Find_Files.FileName);
        end;
    end
  else if name = 'ff4' then
    begin
      WhatFile := pSXIni.ReadString('Temp','CurPath',WhatFile);
      if WhatFile <> Conf.Find_Files.FileName then
        begin
          Conf.sEdit7.Text := Conf.Find_Files.FileName;
          RealpSXIni.WriteString('Cards','Card2',Conf.Find_Files.FileName);
        end;
    end;}
end;

Procedure CreateDefaultIni;
var
  pSXPath: String;
Begin
{  psxPath := PsxIni.ReadString('Path','FullDir',psxPath);
  RealpSXIni := TIniFile.Create(psxPath+'psx.ini');
  //paths
  RealpSXIni.WriteString('Paths','SaveStatePath','saves');
  RealpSXIni.WriteString('Paths','MemoryCardPath','cards');
  RealpSXIni.WriteString('Paths','CDImagePath','cdimages');
  RealpSXIni.WriteString('Paths','ScreenShotsPath','screenshots');
  PsxIni.WriteString('ConfPaths','Videos','videos');
  //bios
  RealpSXIni.WriteString('BIOS','PS1','bios\scph1001.bin');
  RealpSXIni.WriteString('BIOS','PS2','bios\scph39001.bin');
  //Input
  RealpSXIni.WriteInteger('Input','Key1Select',57);
  RealpSXIni.WriteInteger('Input','Key1Start',28);
  RealpSXIni.WriteInteger('Input','Key1Up',200);
  RealpSXIni.WriteInteger('Input','Key1Right',205);
  RealpSXIni.WriteInteger('Input','Key1Down',208);
  RealpSXIni.WriteInteger('Input','Key1Left',203);
  RealpSXIni.WriteInteger('Input','Key1L2',29);
  RealpSXIni.WriteInteger('Input','Key1R2',157);
  RealpSXIni.WriteInteger('Input','Key1L1',42);
  RealpSXIni.WriteInteger('Input','Key1R1',54);
  RealpSXIni.WriteInteger('Input','Key1Triangle',30);
  RealpSXIni.WriteInteger('Input','Key1Circle',31);
  RealpSXIni.WriteInteger('Input','Key1Cross',44);
  RealpSXIni.WriteInteger('Input','Key1Square',45);
  RealpSXIni.WriteInteger('Input','Key1L3',-1);
  RealpSXIni.WriteInteger('Input','Key1R3',-1);
  RealpSXIni.WriteInteger('Input','Key1LStickX',-1);
  RealpSXIni.WriteInteger('Input','Key1LStickY',-1);
  RealpSXIni.WriteInteger('Input','Key1RStickX',-1);
  RealpSXIni.WriteInteger('Input','Key1RStickY',-1);
  RealpSXIni.WriteInteger('Input','Joy1SelectType',0);
  RealpSXIni.WriteInteger('Input','Joy1SelectDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1StartType',0);
  RealpSXIni.WriteInteger('Input','Joy1StartDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1UpType',0);
  RealpSXIni.WriteInteger('Input','Joy1UpDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1RightType',0);
  RealpSXIni.WriteInteger('Input','Joy1RightDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1DownType',0);
  RealpSXIni.WriteInteger('Input','Joy1DownDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1LeftType',0);
  RealpSXIni.WriteInteger('Input','Joy1LeftDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1L2Type',0);
  RealpSXIni.WriteInteger('Input','Joy1L2Def',-1);
  RealpSXIni.WriteInteger('Input','Joy1R2Type',0);
  RealpSXIni.WriteInteger('Input','Joy1R2Def',-1);
  RealpSXIni.WriteInteger('Input','Joy1L1Type',0);
  RealpSXIni.WriteInteger('Input','Joy1L1Def',-1);
  RealpSXIni.WriteInteger('Input','Joy1R1Type',0);
  RealpSXIni.WriteInteger('Input','Joy1R1Def',-1);
  RealpSXIni.WriteInteger('Input','Joy1TriangleType',0);
  RealpSXIni.WriteInteger('Input','Joy1TriangleDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1CircleType',0);
  RealpSXIni.WriteInteger('Input','Joy1CircleDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1CrossType',0);
  RealpSXIni.WriteInteger('Input','Joy1CrossDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1SquareType',0);
  RealpSXIni.WriteInteger('Input','Joy1SquareDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1L3Type',0);
  RealpSXIni.WriteInteger('Input','Joy1L3Def',-1);
  RealpSXIni.WriteInteger('Input','Joy1R3Type',0);
  RealpSXIni.WriteInteger('Input','Joy1R3Def',-1);
  RealpSXIni.WriteInteger('Input','Joy1LStickXType',0);
  RealpSXIni.WriteInteger('Input','Joy1LStickXDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1LStickYType',0);
  RealpSXIni.WriteInteger('Input','Joy1LStickYDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1RStickXType',0);
  RealpSXIni.WriteInteger('Input','Joy1RStickXDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1RStickYType',0);
  RealpSXIni.WriteInteger('Input','Joy1RStickYDef',-1);
  RealpSXIni.WriteInteger('Input','Joy1Rumble',1);
  RealpSXIni.WriteInteger('Input','Key2Select',-1);
  RealpSXIni.WriteInteger('Input','Key2Start',-1);
  RealpSXIni.WriteInteger('Input','Key2Up',-1);
  RealpSXIni.WriteInteger('Input','Key2Right',-1);
  RealpSXIni.WriteInteger('Input','Key2Down',-1);
  RealpSXIni.WriteInteger('Input','Key2Left',-1);
  RealpSXIni.WriteInteger('Input','Key2L2',-1);
  RealpSXIni.WriteInteger('Input','Key2R2',-1);
  RealpSXIni.WriteInteger('Input','Key2L1',-1);
  RealpSXIni.WriteInteger('Input','Key2R1',-1);
  RealpSXIni.WriteInteger('Input','Key2Triangle',-1);
  RealpSXIni.WriteInteger('Input','Key2Circle',-1);
  RealpSXIni.WriteInteger('Input','Key2Cross',-1);
  RealpSXIni.WriteInteger('Input','Key2Square',-1);
  RealpSXIni.WriteInteger('Input','Key2L3',-1);
  RealpSXIni.WriteInteger('Input','Key2R3',-1);
  RealpSXIni.WriteInteger('Input','Key2LStickX',-1);
  RealpSXIni.WriteInteger('Input','Key2LStickY',-1);
  RealpSXIni.WriteInteger('Input','Key2RStickX',-1);
  RealpSXIni.WriteInteger('Input','Key2RStickY',-1);
  RealpSXIni.WriteInteger('Input','Joy2SelectType',0);
  RealpSXIni.WriteInteger('Input','Joy2SelectDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2StartType',0);
  RealpSXIni.WriteInteger('Input','Joy2StartDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2UpType',0);
  RealpSXIni.WriteInteger('Input','Joy2UpDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2RightType',0);
  RealpSXIni.WriteInteger('Input','Joy2RightDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2DownType',0);
  RealpSXIni.WriteInteger('Input','Joy2DownDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2LeftType',0);
  RealpSXIni.WriteInteger('Input','Joy2LeftDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2L2Type',0);
  RealpSXIni.WriteInteger('Input','Joy2L2Def',-1);
  RealpSXIni.WriteInteger('Input','Joy2R2Type',0);
  RealpSXIni.WriteInteger('Input','Joy2R2Def',-1);
  RealpSXIni.WriteInteger('Input','Joy2L1Type',0);
  RealpSXIni.WriteInteger('Input','Joy2L1Def',-1);
  RealpSXIni.WriteInteger('Input','Joy2R1Type',0);
  RealpSXIni.WriteInteger('Input','Joy2R1Def',-1);
  RealpSXIni.WriteInteger('Input','Joy2TriangleType',0);
  RealpSXIni.WriteInteger('Input','Joy2TriangleDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2CircleType',0);
  RealpSXIni.WriteInteger('Input','Joy2CircleDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2CrossType',0);
  RealpSXIni.WriteInteger('Input','Joy2CrossDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2SquareType',0);
  RealpSXIni.WriteInteger('Input','Joy2SquareDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2L3Type',0);
  RealpSXIni.WriteInteger('Input','Joy2L3Def',-1);
  RealpSXIni.WriteInteger('Input','Joy2R3Type',0);
  RealpSXIni.WriteInteger('Input','Joy2R3Def',-1);
  RealpSXIni.WriteInteger('Input','Joy2LStickXType',0);
  RealpSXIni.WriteInteger('Input','Joy2LStickXDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2LStickYType',0);
  RealpSXIni.WriteInteger('Input','Joy2LStickYDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2RStickXType',0);
  RealpSXIni.WriteInteger('Input','Joy2RStickXDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2RStickYType',0);
  RealpSXIni.WriteInteger('Input','Joy2RStickYDef',-1);
  RealpSXIni.WriteInteger('Input','Joy2Rumble',1);
  RealpSXIni.WriteInteger('Input','KeyStatusDisplay',15);
  RealpSXIni.WriteInteger('Input','KeyMute',156);
  RealpSXIni.WriteInteger('Input','KeyIncVolume',78);
  RealpSXIni.WriteInteger('Input','KeyDecVolume',74);
  RealpSXIni.WriteInteger('Input','KeyIncXAVolume',209);
  RealpSXIni.WriteInteger('Input','KeyDecXAVolume',201);
  RealpSXIni.WriteInteger('Input','KeySoundStatus',181);
  RealpSXIni.WriteInteger('Input','KeyFastForward',14);
  RealpSXIni.WriteInteger('Input','KeyShowVram',87);
  RealpSXIni.WriteInteger('Input','KeyIncGamma',73);
  RealpSXIni.WriteInteger('Input','KeyDecGamma',81);
  RealpSXIni.WriteInteger('Input','KeyIncBrightness',72);
  RealpSXIni.WriteInteger('Input','KeyDecBrightness',80);
  RealpSXIni.WriteInteger('Input','KeyIncContrast',71);
  RealpSXIni.WriteInteger('Input','KeyDecContrast',79);
  RealpSXIni.WriteInteger('Input','KeyScreenShot',88);
  RealpSXIni.WriteInteger('Input','EscapeMode',0);
  RealpSXIni.WriteString('Input','JoystickDevice1','NULL');
  RealpSXIni.WriteString('Input','JoystickDevice2','NULL');
  //Controllers
  RealpSXIni.WriteInteger('Controllers','Controller1Type',0);
  RealpSXIni.WriteInteger('Controllers','Controller2Type',-1);
  //Sound
  RealpSXIni.WriteInteger('Sound','Frequency',-1);
  RealpSXIni.WriteInteger('Sound','Sync',1);
  RealpSXIni.WriteInteger('Sound','Reverb',1);
  RealpSXIni.WriteInteger('Sound','Interpolate',1);
  RealpSXIni.WriteInteger('Sound','Latency',20);
  RealpSXIni.WriteInteger('Sound','XALatency',20);
  RealpSXIni.WriteString('Sound','Device','00000000000000000000000000000000');
  //Graphics
  RealpSXIni.WriteInteger('Graphics','BilinearInterpolation',1);
  RealpSXIni.WriteInteger('Graphics','FrameSkip',0);
  RealpSXIni.WriteInteger('Graphics','SleepWhenIdle',1);
  RealpSXIni.WriteInteger('Graphics','PauseWhenDefocused',1);
  RealpSXIni.WriteInteger('Graphics','StatusIcons',0);
  RealpSXIni.WriteInteger('Graphics','NTSCWidth',-1);
  RealpSXIni.WriteInteger('Graphics','NTSCHeight',-1);
  RealpSXIni.WriteInteger('Graphics','NTSCRefresh',-1);
  RealpSXIni.WriteInteger('Graphics','PALWidth',-1);
  RealpSXIni.WriteInteger('Graphics','PALHeight',-1);
  RealpSXIni.WriteInteger('Graphics','PALRefresh',-1);
  RealpSXIni.WriteInteger('Graphics','FullscreenVSync',1);
  RealpSXIni.WriteInteger('Graphics','WindowedSync',1);
  RealpSXIni.WriteString('Graphics','Gamma','1.000000');
  RealpSXIni.WriteString('Graphics','Brightness','-0.120000');
  RealpSXIni.WriteString('Graphics','Contrast','0.000000');
  RealpSXIni.WriteInteger('Graphics','ScreenshotFormat',0);
  RealpSXIni.WriteInteger('Graphics','FullscreenAdapter',-1);
  RealpSXIni.WriteInteger('Graphics','FullscreenAspectRatio',-1);
  //CDROM
  RealpSXIni.WriteInteger('CDROM','Driver',-1);
  RealpSXIni.WriteInteger('CDROM','SubcodeReading',-1);
  //MainWindow  //Not Used In ExtraFe
  RealpSXIni.WriteInteger('MainWindow','XPosition',48);
  RealpSXIni.WriteInteger('MainWindow','YPosition',96);
  //Cards
  RealpSXIni.WriteString('Cards','Card1','');
  RealpSXIni.WriteString('Cards','Card2','');
  //Language //Not Used In ExtraFe
  RealpSXIni.WriteString('Language','CurrentLanguage','45006e0067006c006900730068000000');}
end;


Procedure SetPsxSettings;
var
  ReadMeFile,Line,Line1,Line2,Line3: String;
  ReadmeLine: TextFile;
  r: Integer;
Begin
//  ReadMeFile := PsxIni.ReadString('Path','FullDir',ReadMeFile);
  ReadMeFile := ReadMeFile +'Readme.txt';
  AssignFile(ReadMeLine,ReadMeFile);
  Reset(ReadMeLine);
  while not EOF(ReadMeLine) do
    begin
      ReadLn(ReadMeLine, Line);
     end;
  CloseFile(ReadMeLine);
  Line := RealPsxIni.ReadString('Paths','SaveStatePath',Line);
  if Line = 'saves' then
    Conf.sEdit4.Text := Line +' ( Default pSX directory )'
  else
    Conf.sEdit4.Text := Line;
  Line := RealPsxIni.ReadString('Paths','MemoryCardPath',Line);
  if Line = 'cards' then
    Conf.sEdit5.Text := Line +' ( Default pSX directory )'
  else
    Conf.sEdit5.Text := Line;
  Line := RealPsxIni.ReadString('Paths','ScreenShotsPath',Line);
  if Line = 'screenshots' then
    Conf.sEdit3.Text := Line +' ( Default pSX directory )'
  else
    Conf.sEdit4.Text := Line;
  Line := RealPsxIni.ReadString('Paths','CDImagePath',line);
  if Line = 'cdimages' then
    Conf.sEdit8.Text := Line +' ( Default pSX directory )'
  else
    Conf.sEdit8.Text := Line;
  Line := RealPsxIni.ReadString('Cards','Card1',Line);
  Conf.sEdit6.Text := Line;
  Line := RealPsxIni.ReadString('Cards','Card2',Line);
  Conf.sEdit7.Text := Line;
  //Line := RealpSXIni.ReadString('Input','JoystickDevice1',line);
  Line := RealpSXIni.ReadString('Controllers','Controller1Type',Line);
//  Case StrToInt(line) of
//    -1 : Conf.sComboBox27.ItemIndex := 0;
//     0 : Conf.sComboBox27.ItemIndex := 1;
//     1 : Conf.sComboBox27.ItemIndex := 2;
//     2 : Conf.sComboBox27.ItemIndex := 3;
//     3 : Conf.sComboBox27.ItemIndex := 4;
//  end;
  Line := RealpSXIni.ReadString('Input','Joy1Rumble',line);
//  if Line = '1' then
//    Conf.sCheckBox49.Checked := true
//  else
//    Conf.sCheckBox49.Checked := false;
  Line := RealPsxIni.ReadString('Sound','Frequency',Line);
  if Line = '-1' then
    begin
      Conf.sCheckBox25.Checked := true;
      Conf.sComboBox18.Enabled := false
    end
  else
    begin
      Conf.sCheckBox25.Checked := false;
      Conf.sComboBox18.Text := Line;
    end;
  Line := RealPsxIni.ReadString('Sound','Reverb',Line);
  if Line = '1' then
    Conf.sCheckBox43.Checked := true
  else
    Conf.sCheckBox43.Checked := false;
  Line := RealPsxIni.ReadString('Sound','Sync',Line);
  if Line = '1' then
    Conf.sCheckBox26.Checked := true
  else
    Conf.sCheckBox26.Checked := false;
  Line := RealPsxIni.ReadString('Sound','Interpolate',Line);
  if Line = '1' then
//    Conf.sCheckBox44.Checked := true
  else
//    Conf.sCheckBox44.Checked := false;
  Line := RealPsxIni.ReadString('Sound','Latency',Line);
//  Conf.sScrollBar11.Position := StrToInt(line);
  Conf.sLabel16.Caption := Line+'ms';
  Line := RealPsxIni.ReadString('Sound','XALatency',Line);
//  Conf.sScrollBar12.Position := StrToInt(line);
  Conf.sLabel15.Caption := Line+'ms';
  Line := RealPsxIni.ReadString('Sound','Device',Line);
  if line = 'ffffffffffffffffffffffffffffffff' then
    Conf.sComboBox22.ItemIndex := 0
  else if (line = '00000000000000000000000000000000') or (line <> 'ffffffffffffffffffffffffffffffff') then
    Conf.sComboBox22.ItemIndex := 1;
  Line := RealPsxIni.ReadString('Graphics','BilinearInterpolation',Line);
  if line = '1' then
    Conf.sCheckBox3.Checked := true
  else
    Conf.sCheckBox3.Checked := false;
  Line := RealPsxIni.ReadString('Graphics','FrameSkip',Line);
  if line = '1' then
    Conf.sCheckBox4.Checked := true
  else
    Conf.sCheckBox4.Checked := false;
  Line := RealPsxIni.ReadString('Graphics','PauseWhenDefocused',Line);
  if line = '1' then
    Conf.sCheckBox5.Checked := true
  else
    Conf.sCheckBox5.Checked := false;
  Line := RealPsxIni.ReadString('Graphics','StatusIcons',Line);
  if line = '1' then
    Conf.sCheckBox6.Checked := true
  else
    Conf.sCheckBox6.Checked := false;
  Line := RealPsxIni.ReadString('Graphics','SleepWhenIdle',Line);
  if line = '1' then
    Conf.sCheckBox40.Checked := true
  else
    Conf.sCheckBox40.Checked := false;
  Line := RealPsxIni.ReadString('Graphics','WindowedSync',Line);
  if line = '1' then
    Conf.sCheckBox41.Checked := true
  else
    Conf.sCheckBox41.Checked := false;

  Line := RealPsxIni.ReadString('Graphics','FullscreenVSync',Line);
  if line = '1' then
//    Conf.sCheckBox10.Checked := true
  else
//    Conf.sCheckBox10.Checked := false;
  Line := RealPsxIni.ReadString('Graphics','FullscreenAdapter',Line);
  Conf.sComboBox4.ItemIndex := StrToInt(line)+1;
  Line := RealPsxIni.ReadString('Graphics','NTSCWidth',Line);
  if line = '-1' then
    Conf.sComboBox7.ItemIndex := 0
  else
    begin
      Line1 := RealPsxIni.ReadString('Graphics','NTSCHeight',Line1);
      Line := Line+'x'+Line1;
      Line1 := RealPsxIni.ReadString('Graphics','NTSCRefresh',Line1);
      Line := Line+' '+Line1+' Hz';
      Conf.sComboBox7.Text := Line;
    end;
  Line := RealPsxIni.ReadString('Graphics','PALWidth',Line);
  if line = '-1' then
    Conf.sComboBox6.ItemIndex := 0
  else
    begin
      Line1 := RealPsxIni.ReadString('Graphics','PALHeight',Line1);
      Line := Line+'x'+Line1;
      Line1 := RealPsxIni.ReadString('Graphics','PALRefresh',Line1);
      Line := Line+' '+Line1+' Hz';
      Conf.sComboBox6.Text := Line;
    end;
  Line := RealPsxIni.ReadString('Graphics','Gamma',Line);
  r := pos('.',Line);
  Line1 := Trim(Copy(Line,0,r-1));
  Line2 := Trim(Copy(Line,r+1,2));
  Line := Line1+Line2;
//  Conf.sScrollBar5.Position := StrToInt(Line);
  Line := RealPsxIni.ReadString('Graphics','Brightness',Line);
  r := pos('.',Line);
  Line1 := Trim(Copy(Line,0,r-1));
  Line2 := Trim(Copy(Line,r+1,2));
  Line3 := Trim(Copy(Line,0,r-2));
  if line3 = '-' then
    begin
      if Line1 = '-0' then
        begin
          Line := '-'+Line2;
//          Conf.sScrollBar6.Position := StrToInt(Line);
        end
      else
        begin
          Line := '-1'+Line2;
//          Conf.sScrollBar6.Position := StrToInt(Line);
        end;
    end
  else
    begin
      Line := Line1+Line2;
//      Conf.sScrollBar6.Position := StrToInt(Line);
    end;
  Line := RealPsxIni.ReadString('Graphics','Contrast',Line);
  r := pos('.',Line);
  Line1 := Trim(Copy(Line,0,r-1));
  Line2 := Trim(Copy(Line,r+1,2));
  Line3 := Trim(Copy(Line,0,r-2));
  if line3 = '-' then
    begin
      if Line1 = '-0' then
        begin
          Line := '-'+Line2;
//          Conf.sScrollBar7.Position := StrToInt(Line);
        end
      else
        begin
          Line := '-1'+Line2;
//          Conf.sScrollBar7.Position := StrToInt(Line);
        end;
    end
  else
    begin
      Line := Line1+Line2;
//      Conf.sScrollBar7.Position := StrToInt(Line);
    end;
  Line := RealPsxIni.ReadString('Graphics','FullscreenAspectRatio',Line);
  Conf.sComboBox5.ItemIndex := StrToInt(Line)+1;
  Line := RealPsxIni.ReadString('Graphics','ScreenshotFormat',Line);
  Conf.sComboBox25.ItemIndex := StrToInt(Line);
  Line := RealPsxIni.ReadString('CDROM','Driver',Line);
  Conf.sComboBox23.ItemIndex := StrToInt(Line)+1;
  Line := RealPsxIni.ReadString('CDROM','SubcodeReading',Line);
  Conf.sComboBox24.ItemIndex := StrToInt(Line)+1;

end;

Procedure pSXKeyCode(Key: word);
Begin
  if Key = 27 then
    begin
      pSXKey := '1';
      pSXKeyC := 'ESC';
    end;
  if Key = 49 then
    begin
      pSXKey := '2';
      pSXKeyC := '1';
    end;
  if Key = 50 then
    begin
      pSXKey := '3';
      pSXKeyC := '2';
    end;
  if Key = 51 then
    begin
      pSXKey := '4';
      pSXKeyC := '3';
    end;
  if Key = 52 then
    begin
      pSXKey := '5';
      pSXKeyC := '4';
    end;
  if Key = 53 then
    begin
      pSXKey := '6';
      pSXKeyC := '5';
    end;
  if Key = 54 then
    begin
      pSXKey := '7';
      pSXKeyC := '6';
    end;
  if Key = 55 then
    begin
      pSXKey := '8';
      pSXKeyC := '7';
    end;
  if Key = 56 then
    begin
      pSXKey := '9';
      pSXKeyC := '8';
    end;
  if Key = 57 then
    begin
      pSXKey := '10';
      pSXKeyC := '9';
    end;
  if Key = 48 then
    begin
      pSXKey := '11';
      pSXKeyC := '0';
    end;
  if Key = 189 then
    begin
      pSXKey := '12';
      pSXKeyC := '-';
    end;
  if Key = 187 then
    begin
      pSXKey := '13';
      pSXKeyC := '=';
    end;
  if Key = 8 then
    begin
      pSXKey := '14';
      pSXKeyC := 'BACKSPACE';
    end;
  if Key = 81 then
    begin
      pSXKey := '16';
      pSXKeyC := 'Q';
    end;
  if Key = 87 then
    begin
      pSXKey := '17';
      pSXKeyC := 'W';
    end;
  if Key = 69 then
    begin
      pSXKey := '18';
      pSXKeyC := 'E';
    end;
  if Key = 82 then
    begin
      pSXKey := '19';
      pSXKeyC := 'R';
    end;
  if Key = 84 then
    begin
      pSXKey := '20';
      pSXKeyC := 'T';
    end;
  if Key = 89 then
    begin
      pSXKey := '21';
      pSXKeyC := 'Y';
    end;
  if Key = 85 then
    begin
      pSXKey := '22';
      pSXKeyC := 'U';
    end;
  if Key = 73 then
    begin
      pSXKey := '23';
      pSXKeyC := 'I';
    end;
  if Key = 79 then
    begin
      pSXKey := '24';
      pSXKeyC := 'O';
    end;
  if Key = 80 then
    begin
      pSXKey := '25';
      pSXKeyC := 'P';
    end;
  if Key = 219 then
    begin
      pSXKey := '26';
      pSXKeyC := '{';
    end;
  if Key = 221 then
    begin
      pSXKey := '27';
      pSXKeyC := '}';
    end;
  if Key = 13 then
    begin
      pSXKey := '28';
      pSXKeyC := 'ENTER';
    end;
  if Key = 17 then
    begin
      pSXKey := '29';
      pSXKeyC := 'CTRL';
    end;
  if Key = 65 then
    begin
      pSXKey := '30';
      pSXKeyC := 'A';
    end;
  if Key = 83 then
    begin
      pSXKey := '31';
      pSXKeyC := 'S';
    end;
  if Key = 68 then
    begin
      pSXKey := '32';
      pSXKeyC := 'D';
    end;
  if Key = 70 then
    begin
      pSXKey := '33';
      pSXKeyC := 'F';
    end;
  if Key = 71 then
    begin
      pSXKey := '34';
      pSXKeyC := 'G';
    end;
  if Key = 72 then
    begin
      pSXKey := '35';
      pSXKeyC := 'H';
    end;
  if Key = 74 then
    begin
      pSXKey := '36';
      pSXKeyC := 'J';
    end;
  if Key = 75 then
    begin
      pSXKey := '37';
      pSXKeyC := 'K';
    end;
  if Key = 76 then
    begin
      pSXKey := '38';
      pSXKeyC := 'L';
    end;
  if Key = 186 then
    begin
      pSXKey := '39';
      pSXKeyC := ';';
    end;
  if Key = 222 then
    begin
      pSXKey := '40';
      pSXKeyC := '"';
    end;
  if Key = 192 then
    begin
      pSXKey := '41';
      pSXKeyC := '`';
    end;
  if Key = 16 then
    begin
      pSXKey := '42';
      pSXKeyC := 'SHIFT';
    end;
  if Key = 220 then
    begin
      pSXKey := '43';
      pSXKeyC := '\';
    end;
  if Key = 90 then
    begin
      pSXKey := '44';
      pSXKeyC := 'Z';
    end;
  if Key = 88 then
    begin
      pSXKey := '45';
      pSXKeyC := 'X';
    end;
  if Key = 67 then
    begin
      pSXKey := '46';
      pSXKeyC := 'C';
    end;
  if Key = 86 then
    begin
      pSXKey := '47';
      pSXKeyC := 'V';
    end;
  if Key = 66 then
    begin
      pSXKey := '48';
      pSXKeyC := 'B';
    end;
  if Key = 78 then
    begin
      pSXKey := '49';
      pSXKeyC := 'N';
    end;
  if Key = 77 then
    begin
      pSXKey := '50';
      pSXKeyC :='M';
    end;
  if Key = 188 then
    begin
      pSXKey := '51';
      pSXKeyC := ',';
    end;
  if Key = 190 then
    begin
      pSXKey := '52';
      pSXKeyC := '.';
    end;
  if Key = 191 then
    begin
      pSXKey := '53';
      pSXKeyC := '/';
    end;
  if Key = 16 then
    begin
      pSXKey := '54';
      pSXKeyC := 'SHIFT';
    end;
  if Key = 106 then
    begin
      pSXKey := '55';
      pSXKeyC := '*';
    end;
  if Key = 18 then
    begin
      pSXKey := '56';
      pSXKeyC := 'ALT';
    end;
  if Key = 32 then
    begin
      pSXKey := '57';
      pSXKeyC := 'SPACE';
    end;
  if Key = 20 then
    begin
      pSXKey := '58';
      pSXKeyC := 'CAPS LOCK';
    end;
  if Key = 112 then
    begin
      pSXKey := '59';
      pSXKeyC := 'F1';
    end;
  if Key = 113 then
    begin
      pSXKey := '60';
      pSXKeyC := 'F2';
    end;
  if Key = 114 then
    begin
      pSXKey := '61';
      pSXKeyC := 'F3';
    end;
  if Key = 115 then
    begin
      pSXKey := '62';
      pSXKeyC := 'F4';
    end;
  if Key = 116 then
    begin
      pSXKey := '63';
      pSXKeyC := 'F5';
    end;
  if Key = 117 then
    begin
      pSXKey := '64';
      pSXKeyC := 'F6';
    end;
  if Key = 118 then
    begin
      pSXKey := '65';
      pSXKeyC := 'F7';
    end;
  if Key = 119 then
    begin
      pSXKey := '66';
      pSXKeyC := 'F8';
    end;
  if Key = 120 then
    begin
      pSXKey := '67';
      pSXKeyC := 'F9';
    end;
  if Key = 121 then
    begin
      pSXKey := '68';
      pSXKeyC := 'F10';
    end;
  if Key = 144 then
    begin
      pSXKey := '69';
      pSXKeyC := 'NUM LOCK';
    end;
  if Key = 145 then
    begin
      pSXKey := '70';
      pSXKeyC := 'SCROLL LOCK';
    end;
  if Key = 103 then
    begin
      pSXKey := '71';
      pSXKeyC := 'NUM 7';
    end;
  if Key = 104 then
    begin
      pSXKey := '72';
      pSXKeyC := 'NUM 8';
    end;
  if Key = 105 then
    begin
      pSXKey := '73';
      pSXKeyC := 'NUM 9';
    end;
  if Key = 109 then
    begin
      pSXKey := '74';
      pSXKeyC := 'NUM -';
    end;
  if Key = 100 then
    begin
      pSXKey := '75';
      pSXKeyC := 'NUM 4';
    end;
  if Key = 101 then
    begin
      pSXKey := '76';
      pSXKeyC := 'NUM 5';
    end;
  if Key = 102 then
    begin
      pSXKey := '77';
      pSXKeyC := 'NUM 6';
    end;
  if Key = 107 then
    begin
      pSXKey := '78';
      pSXKeyC := 'NUM +';
    end;
  if Key = 97 then
    begin
      pSXKey := '79';
      pSXKeyC := 'NUM 1';
    end;
  if Key = 98 then
    begin
      pSXKey := '80';
      pSXKeyC := 'NUM 2';
    end;
  if Key = 99 then
    begin
      pSXKey := '81';
      pSXKeyC := 'NUM 3';
    end;
  if Key = 96 then
    begin
      pSXKey := '82';
      pSXKeyC := 'NUM 0';
    end;
  if Key = 110 then
    begin
      pSXKey := '83';
      pSXKeyC := 'NUM .';
    end;
	//84
	//85
	//86
  if Key = 122 then
    begin
      pSXKey := '87';
      pSXKeyC := 'F11';
    end;
  if Key = 123 then
    begin
      pSXKey := '88';
      pSXKeyC := 'F12';
    end;
	//89
	//90
	//91
	//92
	//93
	//94
	//95
  if Key = 13 then
    begin
      pSXKey := '96';
      pSXKeyC := 'ENTER';
    end;
  if Key = 17 then
    begin
      pSXKey := '97';
      pSXKeyC := 'CTRL';
    end;
  if Key = 111 then
    begin
      pSXKey := '181';
      pSXKeyC := 'NUM /';
    end;
  //if Key = 'prt scr' then pSXKey := '99';
  if Key = 18 then
    begin
      pSXKey := '100';
      pSXKeyC := 'ALT';
    end;
	//101
  if Key = 36 then
    begin
      pSXKey := '210';
      pSXKeyC := 'HOME';
    end;
  if Key = 38 then
    begin
      pSXKey := '208';
      pSXKeyC := 'ARROW UP';
    end;
  if Key = 33 then
    begin
      pSXKey := '201';
      pSXKeyC := 'PAGE UP';
    end;
  if Key = 37 then
    begin
      pSXKey := '205';
      pSXKeyC := 'ARROW LEFT';
    end;
  if Key = 39 then
    begin
      pSXKey := '203';
      pSXKeyC := 'ARROW RIGHT';
    end;
  if Key = 35 then
    begin
      pSXKey := '211';
      pSXKeyC := 'END';
    end;
  if Key = 40 then
    begin
      pSXKey := '200';
      pSXKeyC := 'ARROW DOWN';
    end;
  if Key = 34 then
    begin
      pSXKey := '209';
      pSXKeyC := 'PAGE DOWN';
    end;
  if Key = 45 then
    begin
      pSXKey := '119';
      pSXKeyC := 'INSERT';
    end;
  if Key = 46 then
    begin
      pSXKey := '207';
      pSXKeyC := 'DELETE';
    end;
	//112
	//113
	//114
	//115
	//116
	//117
	//118
  if Key = 19 then
    begin
      pSXKey := '119';
      pSXKeyC := 'PAUSE BREAK';
    end;
end;

Procedure CNumberToShowString(what: integer);
begin
  case what of
    -1 : ShowString := '-/-';
    1 : ShowString := 'ESC';
    2 : ShowString := '1';
    3 : ShowString := '2';
    4 : ShowString := '3';
    5 : ShowString := '4';
    6 : ShowString := '5';
    7 : ShowString := '6';
    8 : ShowString := '7';
    9 : ShowString := '8';
    10 : ShowString := '9';
    11 : ShowString := '0';
    12 : ShowString := '-';
    13 : ShowString := '=';
    14 : ShowString := 'BACKSPACE';
    //15 : 
    16 : ShowString := 'Q';
    17 : ShowString := 'W';
    18 : ShowString := 'E';
    19 : ShowString := 'R';
    20 : ShowString := 'T';
    21 : ShowString := 'Y';
    22 : ShowString := 'U';
    23 : ShowString := 'I';
    24 : ShowString := 'O';
    25 : ShowString := 'P';
    26 : ShowString := '{';
    27 : ShowString := '}';
    28 : ShowString := 'ENTER';
    29 : ShowString := 'CTRL';
    30 : ShowString := 'A';
    31 : ShowString := 'S';
    32 : ShowString := 'D';
    33 : ShowString := 'F';
    34 : ShowString := 'G';
    35 : ShowString := 'H';
    36 : ShowString := 'J';
    37 : ShowString := 'K';
    38 : ShowString := 'L';
    39 : ShowString := ';';
    40 : ShowString := '"';
    41 : ShowString := '`';
    42 : ShowString := 'SHIFT';
    43 : ShowString := '\';
    44 : ShowString := 'Z';
    45 : ShowString := 'X';
    46 : ShowString := 'C';
    47 : ShowString := 'V';
    48 : ShowString := 'B';
    49 : ShowString := 'N';
    50 : ShowString := 'M';
    51 : ShowString := ',';
    52 : ShowString := '.';
    53 : ShowString := '/';
    54 : ShowString := 'SHIFT';
    55 : ShowString := '*';
    56 : ShowString := 'ALT';
    57 : ShowString := 'SPACE';
    58 : ShowString := 'CAPS LOCK';
    59 : ShowString := 'F1';
    60 : ShowString := 'F2';
    61 : ShowString := 'F3';
    62 : ShowString := 'F4';
    63 : ShowString := 'F5';
    64 : ShowString := 'F6';
    65 : ShowString := 'F7';
    66 : ShowString := 'F8';
    67 : ShowString := 'F9';
    68 : ShowString := 'F10';
    69 : ShowString := 'NUM LOCK';
    70 : ShowString := 'SCROLL LOCK';
    71 : ShowString := 'NUM 7';
    72 : ShowString := 'NUM 8';
    73 : ShowString := 'NUM 9';
    74 : ShowString := 'NUM -';
    75 : ShowString := 'NUM 4';
    76 : ShowString := 'NUM 5';
    77 : ShowString := 'NUM 6';
    78 : ShowString := 'NUM +';
    79 : ShowString := 'NUM 1';
    80 : ShowString := 'NUM 2';
    81 : ShowString := 'NUM 3';
    82 : ShowString := 'NUM 0';
    83 : ShowString := 'NUM .';
    //84 : ShowString := 'ESC';
    //85 : ShowString := 'ESC';
    //86 : ShowString := 'ESC';
    87 : ShowString := 'F11';
    88 : ShowString := 'F12';
    //89 : ShowString := 'ESC';
    //90 : ShowString := 'ESC';
    //91 : ShowString := 'ESC';
    //92 : ShowString := 'ESC';
    //93 : ShowString := 'ESC';
    //94 : ShowString := 'ESC';
    //95 : ShowString := 'ESC';
    96 : ShowString := 'ENTER';
    97 : ShowString := 'CTRL';
    98 : ShowString := 'NUM /';
    //99 : ShowString := 'ESC';
    100 : ShowString := 'ALT';
    //101 : ShowString := 'ESC';
    210 : ShowString := 'HOME';
    //103 : ShowString := 'ESC';
    201 : ShowString := 'PAGE UP';
    //105 : ShowString := 'ESC';
    //106 : ShowString := 'ESC';
    211 : ShowString := 'END';
    //108 : ShowString := 'ESC';
    209 : ShowString := 'PAGE DOWN';
    119 : ShowString := 'INSERT';
    207 : ShowString := 'DELETE';
    //112 : ShowString := 'ESC';
    //113 : ShowString := 'ESC';
    //114 : ShowString := 'ESC';
    //115 : ShowString := 'ESC';
    //116 : ShowString := 'ESC';
    //117 : ShowString := 'ESC';
    //118 : ShowString := 'ESC';
    //119 : ShowString := 'PAUSE BREAK';
    208 : ShowString := 'ARROW UP';
    205 : ShowString := 'ARROW LEFT';
    203 : ShowString := 'ARROW RIGHT';
    200 : ShowString := 'ARROW DOWN';
  end;
end;

Procedure pSXStats;
var
  pSXDat: TIniFile;
  text: String;
  i: Integer;
Begin
//  Conf.Grid1.Visible := true;
  Conf.sLabel4.Visible := false;
  Conf.sLabel12.Visible := False;
  Conf.Height := 408;
  Conf.sGauge1.Visible := false;
//  Text := pSXIni.ReadString('Path','ExeName',Text);
  Conf.sWebLabel1.Caption := text;
  Conf.sWebLabel1.URL := 'http://psxemulator.gazaxian.com/';
  Conf.sLabel1.Caption := '1.13';
  Conf.sLabelFX3.Caption := 'Games Listed :';
//  Text := PsxIni.ReadString('Totalgames','Total',text);
  Conf.sLabel2.Caption := Text;
  Conf.sGauge2.CalcPercents := false;
  Conf.sGauge2.MaxValue := StrToInt(Text);
  Conf.sGauge2.Progress := StrToInt(Text);
  Conf.sGauge2.Suffix := ' game names in Database';
  ///Conf.pSXGamesFind;
//  Conf.sGauge3.CalcPercents := false;
//  Conf.sGauge3.Progress := (StrToInt(Text) * pSXGF) div (StrToInt(Text)-1);
//  if pSXGF = 0 then
//    Conf.sGauge3.Suffix := ' Games found please add some'
//  else if pSXGF = 1 then
//    Conf.sGauge3.Suffix := ' Game ready to play from Database'
//  else if pSXGF > 1 then
//    Conf.sGauge3.Suffix := ' Games ready to play from Database';
//  listGamseCountry('Europe');
//  i := pSXGFC - pSXGFCW;
//  Conf.sGauge4.MaxValue := pSXGFC;
//  Conf.sGauge4.Progress := pSXGFC;
//  Conf.sGauge4.Suffix :=' Tested : '+IntToStr(pSXGFCW)+' works and '+IntToStr(i)+' not working';
//  Conf.sGauge4.Visible := True;
//  Conf.sGauge5.CalcPercents := False;
//  listGamseCountry('America');
//  i := pSXGFC - pSXGFCW;
//  Conf.sGauge5.MaxValue := pSXGFC;
//  Conf.sGauge5.Progress := pSXGFC;
//  Conf.sGauge5.Suffix :=' Tested : '+IntToStr(pSXGFCW)+' works and '+IntToStr(i)+' not working';
//  Conf.sGauge5.Visible := True;
//  Conf.sGauge6.CalcPercents := False;
//  listGamseCountry('Japan');
//  i := pSXGFC - pSXGFCW;
//  Conf.sGauge6.MaxValue := pSXGFC;
//  Conf.sGauge6.Progress := pSXGFC;
//  Conf.sGauge6.Suffix :=' Tested : '+IntToStr(pSXGFCW)+' works and '+IntToStr(i)+' not working';
//  Conf.sGauge6.Visible := True;
//  Conf.Caption := 'Manage pSX Database';
//  Conf.Show;
end;

procedure pSXFindFilesCanClose;
var
  whatfile: string;
begin
//  whatfile :=  ConfIni.ReadString('Find','FindFileswho',WhatFile);
  if whatfile = 'pSX' then
    pSXCanClose('ff1')
  else if whatfile = 'RomPsx' then
    pSXCanClose('ff2')
  else if whatfile = 'MemCard1' then
    pSXCanClose('ff3')
  else if whatfile = 'MemCard2' then
    pSXCanClose('ff4');
end;

procedure pSXLoad;
begin
//  if textset = '' then
//    begin
//      RunPSX;
//      EnablePSX(False);
//    end;
//      RunPSX;
//      SystemRom := PsxIni.ReadString('Path','RomPath',SystemRom);
//      if Systemrom <> '' then
//        begin
//          psxPath := PsxIni.ReadString('Path','FullDir',psxPath);
//          RealpSXIni := TIniFile.Create(psxPath+'psx.ini');
//          EnablePSX(True);
//          ShowExtraKeys;
//          SetpSXSettings;
//        end
//      else
//        begin
//          EnablePSX(false);
//        end;
//  Conf.Grid1.Columns.Clear;
end;

procedure psxButtonFindClick;
begin
//  ConfIni.WriteString('Find','FindFilesWho','pSX');
  Conf.Find_Files.InitialDir := Program_Path+'emulators';
  Conf.Find_Files.FileName := '';
  Conf.Find_Files.Filter := 'Execute (exe)|*.exe';
  Conf.Find_Files.Execute;
end;

procedure psxFindSystemRom;
begin
//  ConfIni.WriteString('Find','FindFilesWho','RomPsx');
  Conf.Find_Files.InitialDir := Program_Path+'emulators';
  Conf.Find_Files.FileName := '';
  Conf.Find_Files.Filter := 'SCPH1001.BIN (bin)|*.bin';
  Conf.Find_Files.Execute;
end;


end.
