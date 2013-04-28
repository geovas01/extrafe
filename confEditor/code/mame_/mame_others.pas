unit mame_others;

interface
uses
  SysUtils,Classes,ExtCtrls,StdCtrls,ComCtrls,Graphics,Forms,
  Windows,Messages,Controls,Dialogs,FileCtrl,
  NativeXML,
  NxColumnClasses,NxGrid,NxCustomGridControl,pngimage;
  
  procedure SetMame_OthersFromMameIni;
  procedure SaveMame_OthersAtExit;

  procedure Others_ButtonOthersClick;
  procedure Others_ButtonMamePlusClick;
  procedure Others_ButtonToolsClick;
  
  //Mame others extra TabSheet
  procedure MameBeamWidthChange;
  procedure MameFlickerChange;
  procedure MameThreadPriorityChange;

  procedure ResetToDefaultTopic_MameOthers;
  procedure CheckMameOthers_TopicSettings;
  procedure CheckButtonTopicsConfig_MameOthers;

  procedure MameOthers_Clear;
  
  //Mame Plus TabSheet  
  procedure EnableBuild_Mameplus(What: Boolean);
  procedure HiScorePath_MamePlus;
  procedure FindHiScoreDat_MamePlus;
  procedure FindHiScoreDat_MamePlusReturn;
  procedure MameUITrasparentChange_MamePlus;
  procedure SetupIPSMameGrid(Name:string);
  procedure IpsMamePlus_Expand(ARow: Integer);
  procedure IpsMamePlus_CellClick(Acol,Arow: Integer);
  procedure CloseShowingIPSImage_MameBuilds;
  procedure SetTheNewIPSDir_MamePlus;
  procedure ChangeColorInFont_MameBuilds;
  procedure DefaultColorInFont_MameBuilds;
  procedure ChangeImage2x_MameBuilds;
  procedure IPSEnableClick_MamePlus;
  procedure FindIPSDir_MamePlus;

  procedure ResetToDefaultTopic_MameBuilds;
  procedure CheckMameHlsl_TopicSettings;
  procedure CheckButtonTopicsConfig_MameHlsl;

  procedure MameBuilds_Clear;
  procedure GetMamePlus_IPS;
  procedure Assigned_IPS;
  
  //Mame Tools TabSheet
  procedure Tools_SystemFont_RadioButtonClick;
  procedure Tools_DirectoryFont_RadioButtonClick;
  procedure Tools_FontComboBoxChange;
  procedure Tools_FontSizeComboBoxChange;
  procedure Tools_FindFontFromDirClick;
  procedure Tools_CreateFont;
  
// Menu actions
  procedure Show_mame_otherspanel;
  procedure em_mame_others_ShowDynamicComps;
  procedure em_mame_others_FreeDynamicComps;  

var
  FromMame_OthersToFindOthers: Boolean;
  FXml_IPS: TNativeXml;

implementation

uses
  main,mainconf,menu,onflycomponents,FunctionX,global,
  form_general,form_splash,
  mame_dirs,mame_graphics,mame_sound,mame_hlsl,mame_database,
  ce_logsession;

Procedure MameBeamWidthChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_beamwidth.Position;
  Conf.sLabel18.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameFlickerChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_mame_flicker.Position;
  Conf.sLabel20.Caption := FormatFloat('0.00',(PosNum / 100));
end;

Procedure MameThreadPriorityChange;
Begin
  Conf.sLabel28.Caption := IntToStr(Conf.sbar_mame_threadpriority.Position);
end;

procedure SetMame_OthersFromMameIni;
var
  MameIniFile: TextFile;
  value,text,t1,t2,t3: string;
  r: integer;
  DiffNum: Single;
  rec : TSearchRec;
  CheckIps,CheckHiscore: Boolean;
begin
  if Started = True then
    begin
      if Mame_Exe <> '' then
        begin
          FromMame_OthersToFindOthers := True;
          value := FullPathMame_Exe + 'mame.ini';
          AssignFile(MameIniFile,value);
          Reset(MameIniFile);
          while not Eof(MameIniFile) do
            begin
              Readln(MameIniFile,text);
              r := Pos(' ',text);
              t1 := Trim(Copy(text,0,r));
              t2 := Trim(Copy(text,r,100));
              if t1 = 'cheat' then
                Conf.sCheckBox24.Checked := StrToBool(t2)
              else if t1 = 'sleep' then
                Conf.sCheckBox27.Checked := StrToBool(t2)
              else if t1 = 'skip_gameinfo' then
                Conf.sCheckBox28.Checked := StrToBool(t2)
              else if t1 = 'autosave' then
                Conf.sCheckBox29.Checked := StrToBool(t2)
              else if t1 = 'multithreading' then
                conf.sCheckBox30.Checked := StrToBool(t2)
              else if t1 = 'coin_lockout' then
                Conf.sCheckBox31.Checked := StrToBool(t2)
              else if t1 = 'priority' then
                Conf.sbar_mame_threadpriority.Position := StrToInt(t2)
              else if t1 = 'antialias' then
                Conf.sCheckBox39.Checked := StrToBool(t2)
              else if t1 = 'beam' then
                begin
                  DiffNum := StrToFloat(t2) * 100;
                  Conf.sbar_mame_beamwidth.Position := Round(DiffNum);
                  MameBeamWidthChange;
                end
              else if t1 = 'flicker' then
                begin
                  DiffNum := StrToFloat(t2) * 100;
                  Conf.sbar_mame_flicker.Position := Round(DiffNum);
                  MameFlickerChange;
                end
              else if t1 = 'snapsize' then
                Conf.sComboBox73.Text := t2
              else if t1 = 'snapview' then
                Conf.sComboBox19.Text := t2
              else if t1 = 'use_backdrops' then
                Conf.sCheckBox35.Checked := StrToBool(t2)
              else if t1 = 'use_bezels' then
                Conf.sCheckBox36.Checked := StrToBool(t2)
              else if t1 = 'use_overlays' then
                Conf.sCheckBox37.Checked := StrToBool(t2)
              else if t1 = 'artwork_crop' then
                Conf.sCheckBox38.Checked := StrToBool(t2)
              else if t1 = 'uifont' then
                begin
                  Conf.sComboBox75.Clear;
                  Conf.sComboBox75.Items.Add('default');
                  if FindFirst(ExtractFilePath(Mame_Exe)+'\*.*' , faAnyFile, Rec) = 0 then
                    repeat
                      if  (Rec.Attr and faDirectory) <> faDirectory  then
                        begin
                          t3 := Trim(Copy(rec.Name,Length(rec.Name)-3,4));
                          if t3 = '.bdf' then
                            Conf.sComboBox75.Items.Add(rec.Name);
                        end;
                    until FindNext(rec) <> 0;
                  Conf.sComboBox75.Text := t2;
                end;
            end;
          CloseFile(MameIniFile);
        end;
      CheckMameOthers_TopicSettings;
      CheckTopicsConfig;
      Log_NewTextEnter(#9 + 'Found all Settings OK');
      Tools_SystemFont_RadioButtonClick;
      if (Mame_Exe <> 'mamep.exe') then
        begin
          EnableBuild_Mameplus(False);
        end
      else
        begin
          ipsNotFoundImg :=  Program_Path+'media\emulators\arcade\mame\imgaes\ipsnotfound.png';
          if not DirectoryExists(FullPathMame_Exe+'hi') then
            CreateDir(FullPathMame_Exe+'hi');
          if not DirectoryExists(FullPathMame_Exe+'ips') then
            CreateDir(FullPathMame_Exe+'ips');
          if Mame_Exe = 'mamep.exe' then
            begin
              EnableBuild_MamePlus(True);
            end;
          CheckIps := FXml_MameDatabase.Root.ReadAttributeBool('IpsChecked');
          CheckHiscore := FXml_MameDatabase.Root.ReadAttributeBool('HiScoreChecked');
          FromMame_BuildsToFindBuilds := True;
          value := FullPathMame_Exe+'mame.ini';
          AssignFile(MameIniFile,value);
          Reset(MameIniFile);
          while not Eof(MameIniFile) do
            begin
              Readln(MameIniFile,text);
              r := Pos(' ',text);
              t1 := Trim(Copy(text,0,r));
              t2 := Trim(Copy(text,r,100));
              if t1 = 'confirm_quit' then
                begin
                  if Mame_Exe = 'mamep.exe' then
                    Conf.sCheckBox32.Checked := StrToBool(t2)
                end
              else if t1 = 'audio_sync' then
                begin
                  if Mame_Exe = 'mamep.exe' then
                    Conf.sCheckBox10.Checked := StrToBool(t2)
                  else
                    Conf.sCheckBox28.Checked := StrToBool(t2);
                end
              else if t1 = 'hiscore_directory' then
                begin
                  if t2 = 'hi' then
                    t3 := FullPathMame_Exe+'hi\'
                  else
                    t3 := t2;
                  HiScorePath := t3;
                end
              else if t1 = 'hiscore_file' then
                begin
                  HiScorefile := HiScorePath+t2;
                  if Mame_Exe = 'mamep.exe' then
                    begin
                      if CheckHiscore = True then
                        Conf.sCheckBox33.Checked := CheckHiscore
                      else
                        HiScorePath_MamePlus;
                    end;
                end
              else if t1 = 'ui_transparency' then
                begin
                  if Mame_Exe = 'mamep.exe' then
                    begin
                      Conf.sbar_Mame_UITransparent_MamePlus.Position := StrToInt(t2);
                      MameUITrasparentChange_MamePlus;
                    end;
                end
              else if t1 = 'ipspath' then
                begin
                  if t2 = 'ips' then
                    t3 := FullPathMame_Exe+'ips'
                  else
                    t3 := t2;
                  IPSPath := t3;
                  if Mame_Exe = 'mamep.exe' then
                    begin
                      if CheckIps = True then
                        Conf.sCheckBox34.Checked := CheckIps
                      else
                        IPSEnableClick_MamePlus;
                    end;
                end;
            end;
          CloseFile(MameIniFile);
          if (FromArrows_Mamedirs = True) or (FromDatabase = True) then
            SaveMame_HlslAtExit;
        end;
      CheckMameHlsl_TopicSettings;
      CheckTopicsConfig;
      Log_NewTextEnter(#9 + 'Found all Settings OK');
    end;
  IsApplyChecked := False;
  Started := False;
  Others_ButtonOthersClick;
end;

procedure SaveMame_OthersAtExit;
var
  k,x: Integer;
  value,t1,t2: string;
  FoundHiScoreDir: Boolean;
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
          if t1 = 'cheat' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox24.Checked = True then
                TMemo(Comp).Lines.Insert(k,'cheat          1')
              else
                TMemo(Comp).Lines.Insert(k,'cheat          0');
            end
          else if t1 = 'sleep' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox27.Checked = True then
                TMemo(Comp).Lines.Insert(k,'sleep          1')
              else
                TMemo(Comp).Lines.Insert(k,'sleep          0');                
            end
          else if t1 = 'skip_gameinfo' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox28.Checked = True then
                TMemo(Comp).Lines.Insert(k,'skip_gameinfo          1')
              else
                TMemo(Comp).Lines.Insert(k,'skip_gameinfo          0');
            end
          else if t1 = 'autosave' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox29.Checked = True then
                TMemo(Comp).Lines.Insert(k,'autosave          1')
              else
                TMemo(Comp).Lines.Insert(k,'autosave          0');
            end
          else if t1 = 'multithreading' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox30.Checked = True then
                TMemo(Comp).Lines.Insert(k,'multithreading          1')
              else
                TMemo(Comp).Lines.Insert(k,'multithreading          0');
            end
          else if t1 = 'coin_lockout' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox31.Checked = True then
                TMemo(Comp).Lines.Insert(k,'coin_lockout          1')
              else
                TMemo(Comp).Lines.Insert(k,'coin_lockout          0');
            end
          else if t1 = 'priority' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'priority          '+IntToStr(Conf.sbar_mame_threadpriority.Position));
            end
          else if t1 = 'antialias' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox39.Checked = True then
                TMemo(Comp).Lines.Insert(k,'antialias          1')
              else
                TMemo(Comp).Lines.Insert(k,'antialias          0');
            end
          else if t1 = 'beam' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'beam          '+Conf.sLabel18.Caption);
            end
          else if t1 = 'flicker' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'flicker          '+IntToStr(Conf.sbar_mame_flicker.Position));
            end
          else if t1 = 'snapsize' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'snapsize          '+Conf.sComboBox73.Text);
            end
          else if t1 = 'snapview' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'snapview          '+Conf.sComboBox19.Text);
            end
          else if t1 = 'use_backdrops' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox35.Checked = True then
                TMemo(Comp).Lines.Insert(k,'use_backdrops          1')
              else
                TMemo(Comp).Lines.Insert(k,'use_backdrops          0');
            end
          else if t1 = 'use_bezels' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox36.Checked = True then
                TMemo(Comp).Lines.Insert(k,'use_bezels          1')
              else
                TMemo(Comp).Lines.Insert(k,'use_bezels          0');
            end
          else if t1 = 'use_overlays' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox37.Checked = True then
                TMemo(Comp).Lines.Insert(k,'use_overlays          1')
              else
                TMemo(Comp).Lines.Insert(k,'use_overlays          0');
            end
          else if t1 = 'artwork_crop' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox38.Checked = True then
                TMemo(Comp).Lines.Insert(k,'artwork_crop          1')
              else
                TMemo(Comp).Lines.Insert(k,'artwork_crop          0');
            end
          else if t1 = 'uifont' then
            begin
              TMemo(Comp).Lines.Delete(k);
              TMemo(Comp).Lines.Insert(k,'uifont          '+Conf.sComboBox75.Text);
            end;
        end;
      TMemo(Comp).Lines.SaveToFile(FullPathMame_Exe+'mame.ini');
      FromMame_OthersToFindOthers := False;
      if (Mame_Exe = 'mamep.exe')  then
        begin
          FoundHiScoreDir := False;
          Comp := FindComponentEx('Conf.MemoEmu_Mame');
          for k := 0 to TMemo(Comp).Lines.Count - 1 do
            begin
              value := TMemo(Comp).Lines.Strings[k];
              x := Pos(' ',value);
              t1 := Trim(Copy(value,0,x));
              t2 := Trim(Copy(value,x,100));
              if t1 = 'confirm_quit' then
                begin
                  TMemo(Comp).Lines.Delete(k);
                  if (Conf.sCheckBox32.Checked = True) then
                    TMemo(Comp).Lines.Insert(k,'confirm_quit          1')
                  else
                    TMemo(Comp).Lines.Insert(k,'confirm_quit          0');
                end
              else if t1 = 'audio_sync' then
                begin
                  TMemo(Comp).Lines.Delete(k);
                  if (Conf.sCheckBox10.Checked = True) or (Conf.sCheckBox28.Checked = True) then
                    TMemo(Comp).Lines.Insert(k,'audio_sync          1')
                  else
                    TMemo(Comp).Lines.Insert(k,'audio_sync          0');
                end
              else if t1 = 'hiscore_directory' then
                begin
                  TMemo(Comp).Lines.Delete(k);
                  if (Conf.sCheckBox33.Checked = True) then
                    if Mame_Exe = 'mamep.exe' then
                      TMemo(Comp).Lines.Insert(k,'hiscore_directory          '+Trim(Copy(Conf.sEdit12.Text,0,Length(Conf.sEdit12.Text)-11)));
                  FoundHiScoreDir := True;
                end
              else if t1 = 'ui_transparency' then
                begin
                  TMemo(Comp).Lines.Delete(k);
                  if Mame_Exe = 'mamep.exe' then
                    TMemo(Comp).Lines.Insert(k,'ui_transparency          '+Conf.sLabel34.Caption);
                end
              else if t1 = 'ipspath' then
                begin
                  TMemo(Comp).Lines.Delete(k);
                  if Mame_Exe = 'mamep.exe' then
                    TMemo(Comp).Lines.Insert(k,'ipspath          '+Conf.sEdit13.Text);
                end;
            end;
          if IsApplyChecked = True then
            begin
              Conf.nxtgrd_ips_mameplus.SaveToXMLFile(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml');
              IsApplyChecked := False;
            end;
          if FoundHiScoreDir = False then
            begin
              TMemo(Comp).Lines.Add('');
              TMemo(Comp).Lines.Add('#');
              TMemo(Comp).Lines.Add('# EXTRAFE EXTRA OPTIONS');
              TMemo(Comp).Lines.Add('#');
              TMemo(Comp).Lines.Add('hiscore_directory          hi');
              TMemo(Comp).Lines.Add('hiscore_file          hiscore.dat');
              TMemo(Comp).Lines.Add('ipspath                   ips');
              TMemo(Comp).Lines.Add('ips');
            end;
          TMemo(Comp).Lines.SaveToFile(FullPathMame_Exe+'mame.ini');
          FromMame_BuildsToFindBuilds:= False;
        end;
    end;
end;

procedure Others_ButtonOthersClick;
begin
  Conf.sBitBtn43.Down := True;
  Conf.sBitBtn99.Down := False;
  Conf.sBitBtn100.Down := False;
  Conf.sPanel83.Visible := True;
  Conf.sPanel84.Visible := False;
  Conf.sPanel85.Visible := False;
end;

procedure Others_ButtonMamePlusClick;
begin
  Conf.sBitBtn43.Down := False;
  Conf.sBitBtn99.Down := True;
  Conf.sBitBtn100.Down := False;
  Conf.sPanel83.Visible := False;
  Conf.sPanel84.Visible := True;
  Conf.sPanel85.Visible := False;
end;

procedure Others_ButtonToolsClick;
begin
  Conf.sBitBtn43.Down := False;
  Conf.sBitBtn99.Down := False;
  Conf.sBitBtn100.Down := True;
  Conf.sPanel83.Visible := False;
  Conf.sPanel84.Visible := False;
  Conf.sPanel85.Visible := True;
end;


procedure MameOthers_Clear;
begin
  Conf.sCheckBox24.Checked := False;
  Conf.sCheckBox27.Checked := False;
  Conf.sCheckBox28.Checked := False;
  Conf.sCheckBox29.Checked := False;
  Conf.sCheckBox30.Checked := False;
  Conf.sCheckBox31.Checked := False;
  Conf.sCheckBox35.Checked := False;
  Conf.sCheckBox36.Checked := False;
  Conf.sCheckBox37.Checked := False;
  Conf.sCheckBox38.Checked := False;
  Conf.sCheckBox39.Checked := False;
  Conf.sComboBox75.ItemIndex := 0;
  Conf.sComboBox73.ItemIndex := 0;
  Conf.sComboBox19.ItemIndex := 0;
  Conf.sbar_mame_threadpriority.Position := -15;
  Conf.sbar_mame_beamwidth.Position := 100;
  Conf.sbar_mame_flicker.Position := 0;
  Conf.sButton7.Enabled := False;
  Conf.sButton3.Enabled := False;
end;

procedure ResetToDefaultTopic_MameOthers;
begin
  Conf.sCheckBox24.Checked := False;
  Conf.sCheckBox27.Checked := True;
  Conf.sCheckBox28.Checked := False;
  Conf.sCheckBox29.Checked := False;
  Conf.sCheckBox30.Checked := False;
  Conf.sCheckBox31.Checked := True;
  Conf.sComboBox75.Text := 'default';
  Conf.sbar_mame_threadpriority.Position := 0;
  MameThreadPriorityChange;
  Conf.sCheckBox39.Checked := True;
  Conf.sbar_mame_beamwidth.Position := 100;
  MameBeamWidthChange;
  Conf.sbar_mame_flicker.Position := 0;
  MameFlickerChange;
  Conf.sComboBox73.Text := 'auto';
  Conf.sComboBox19.Text := 'internal';
  Conf.sCheckBox35.Checked := True;
  Conf.sCheckBox36.Checked := True;
  Conf.sCheckBox37.Checked := True;
  Conf.sCheckBox38.Checked := False;
  Conf.sButton7.Enabled := False;
  CheckTopicsConfig;
end;

procedure CheckMameOthers_TopicSettings;
begin
  Conf.sButton7.Enabled := False;
  if Mame_Exe <> '' then
    begin
      if Conf.sCheckBox24.Checked <> False then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox27.Checked <> True then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox28.Checked <> False then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox29.Checked <> False then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox30.Checked <> False then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox31.Checked <> True then
        Conf.sButton7.Enabled := True;
      if Conf.sComboBox75.Text <> 'default' then
        Conf.sButton7.Enabled := True;
      if Conf.sbar_mame_threadpriority.Position <> 0 then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox39.Checked <> True then
        Conf.sButton7.Enabled := True;
      if Conf.sbar_mame_beamwidth.Position <> 100 then
        Conf.sButton7.Enabled := True;
      if Conf.sbar_mame_flicker.Position <> 0 then
        Conf.sButton7.Enabled := True;
      if Conf.sComboBox73.Text <> 'auto' then
        Conf.sButton7.Enabled := True;
      if Conf.sComboBox19.Text <> 'internal' then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox35.Checked <> True then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox36.Checked <> True then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox37.Checked <> True then
        Conf.sButton7.Enabled := True;
      if Conf.sCheckBox38.Checked <> False then
        Conf.sButton7.Enabled := True;
    end;
end;

procedure CheckButtonTopicsConfig_MameOthers;
begin
  FromMame_OthersToFindOthers := True;
  CheckMameOthers_TopicSettings;
  CheckTopicsConfig;
end;

//Mame Plus TabSheet
procedure EnableBuild_Mameplus(What: Boolean);
begin
  Conf.sCheckBox32.Enabled := What;
  Conf.sCheckBox10.Enabled := What;
  Conf.sCheckBox33.Enabled := What;
  Conf.sCheckBox34.Enabled := What;
  Conf.sEdit12.Enabled := What;
  Conf.sEdit13.Enabled := What;
  Conf.nxtgrd_ips_mameplus.Enabled := What;
  Conf.sLabel35.Enabled := What;
  Conf.sLabel34.Enabled := What;
  Conf.sLabel33.Enabled := What;
  Conf.sBitBtn1.Enabled := What;
  Conf.sBitBtn98.Enabled := What;
  Conf.grp117.Enabled := What;
  Conf.grp118.Enabled := What;
  Conf.sbar_Mame_UITransparent_MamePlus.Enabled := What;
end;

procedure HiScorePath_MamePlus;
begin
  if Conf.sCheckBox33.Checked = True then
    begin
      Conf.sEdit12.Enabled := True;
      Conf.sEdit12.Text := HiScoreFile;
      if not FileExists(HiScoreFile) then
        Conf.sLabel102.Visible := True;
      Conf.sBitBtn1.Enabled := True;
      FXml_MameDatabase.Root.WriteAttributeBool('HiScoreChecked',True);
      FXml_MameDatabase.SaveToFile(MameDatabaseFile);
    end
  else
    begin
      Conf.sEdit12.Enabled := False;
      Conf.sEdit12.Text := '';
      Conf.sLabel102.Visible := False;
      Conf.sBitBtn1.Enabled := False;
      FXml_MameDatabase.Root.WriteAttributeBool('HiScoreChecked',False);
      FXml_MameDatabase.SaveToFile(MameDatabaseFile);
    end;
end;

procedure FindHiScoreDat_MamePlus;
begin
  gFindFiles := 'hiscoredat_mameplus';
  Conf.Find_Files.InitialDir := HiScorePath;
  Conf.Find_Files.Filter := 'HiScore.dat|hiscore.dat';
  Conf.Find_Files.Execute;
end;

procedure FindHiScoreDat_MamePlusReturn;
begin
  Conf.sEdit12.Text := Conf.Find_Files.FileName;
  Conf.sLabel102.Visible := False;
end;

procedure MameUITrasparentChange_MamePlus;
begin
  Conf.sLabel34.Caption := IntToStr(Conf.sbar_Mame_UITransparent_MamePlus.Position);
end;

procedure SetupIPSMameGrid(Name:string);
begin
  if Name = 'MamePlus' then
    begin
      Conf.nxtgrd_ips_mameplus.Columns.Add(TNxTreeColumn,'Game Name ID');
      Conf.nxtgrd_ips_mameplus.Columns.Add(TNxCheckBoxColumn,'Apply');
      Conf.nxtgrd_ips_mameplus.Columns.Add(TNxTextColumn,'IPS Name');
      Conf.nxtgrd_ips_mameplus.Columns.Add(TNxTextColumn,'Hacker');
      Conf.nxtgrd_ips_mameplus.Columns.Add(TNxTextColumn,'Translator');
      Conf.nxtgrd_ips_mameplus.Columns.Add(TNxTextColumn,'Description');
      Conf.nxtgrd_ips_mameplus.Columns.Add(TNxTextColumn,'Date');
      Conf.nxtgrd_ips_mameplus.Columns.Add(TNxGraphicColumn,'Game Image');
      Conf.nxtgrd_ips_mameplus.Columns.Add(TNxTextColumn,'Image_Path');
      Conf.nxtgrd_ips_mameplus.Columns[1].Alignment := taCenter;
      Conf.nxtgrd_ips_mameplus.Columns[8].Visible := False;
    end;
end;

procedure IpsMamePlus_Expand(ARow: Integer);
var
  GamePic: TPNGObject;
  k: Integer;
  ImagePath: string;
begin
  if Started = False then
    begin
      if IsIPSChecked = False then
        begin
          for k := 1 to 10 do
            if (ARow + k) > conf.nxtgrd_ips_mameplus.RowCount -1 then
              Break
            else
              if Conf.nxtgrd_ips_mameplus.Cell[0,ARow+k].AsString = '' then
                begin
                  GamePic := TPNGObject.Create;
                  ImagePath := Conf.nxtgrd_ips_mameplus.Cell[8,ARow+k].AsString;
                  GamePic.LoadFromFile(ImagePath);
                  Conf.nxtgrd_ips_mameplus.Cell[7,ARow+k].ObjectReference := GamePic;
                end
              else
                Break;
        end
      else if (IsIPSChecked = True) and (Conf.nxtgrd_ips_mameplus.RowCount -1 = ARow + 1) then
        IsIPSChecked := False;
    end;
end;

procedure IpsMamePlus_CellClick(Acol,Arow: Integer);
var
  NormPic: TPNGObject;
  ImagePath,ImageName: string;
  i: Integer;  
begin
  if Acol = 7 then
    begin
      ImagePath := Conf.nxtgrd_ips_mameplus.Cell[Acol+1,Arow].AsString;
      if ImagePath <> '' then
        begin
          ImageName := '';
          i := Arow;
          NormPic := TPNGObject.Create;
          NormPic.LoadFromFile(ImagePath);
          FGeneral.Width := NormPic.Width + 15;
          FGeneral.Height := NormPic.Height + 60;
          FGeneral.img1.Top := 5;
          FGeneral.img1.Left := 5;
          FGeneral.img1.Height := NormPic.Height;
          FGeneral.img1.Width := NormPic.Width;
          FGeneral.sButton1.Top := 5 + NormPic.Height + 4;
          FGeneral.sButton1.Left := (NormPic.Width div 2) - 20;
          FGeneral.lbl1.Top := 5 + NormPic.Height + 4;
          FGeneral.lbl1.Left := NormPic.Width - 10;
          NormPic.Free;
          FGeneral.img1.Picture.LoadFromFile(ImagePath);
          repeat
            i := i - 1;
            ImageName := Conf.nxtgrd_ips_mameplus.Cell[0,i].AsString;
          until ImageName <> '';
          FGeneral.Caption := 'Image of '+ ImageName;
          FGeneral.Repaint;
          FGeneral.ShowModal;
        end;
    end
  else if Acol = 1 then
    IsApplyChecked := True;
end;

procedure CloseShowingIPSImage_MameBuilds;
begin
  FGeneral.lbl1.Caption := '2X';
  FGeneral.Close;
end;

procedure ChangeColorInFont_MameBuilds;
begin
  FGeneral.lbl1.Font.Color := clRed;
end;

procedure DefaultColorInFont_MameBuilds;
begin
  FGeneral.lbl1.Font.Color := clWindowText;
end;

procedure ChangeImage2x_MameBuilds;
begin
  if FGeneral.lbl1.Caption = '2X' then
    begin
      FGeneral.img1.Height := FGeneral.img1.Picture.Height * 2;
      FGeneral.img1.Width := FGeneral.img1.Picture.Width * 2;
      FGeneral.lbl1.Caption := '1X';
    end
  else
    begin
      FGeneral.img1.Height := FGeneral.img1.Picture.Height;
      FGeneral.img1.Width := FGeneral.img1.Picture.Width;
      FGeneral.lbl1.Caption := '2X';
    end;
  FGeneral.Width := FGeneral.img1.Width + 15;
  FGeneral.Height := FGeneral.img1.Height + 60;
  FGeneral.sButton1.Top := 5 + FGeneral.img1.Height + 4;
  FGeneral.sButton1.Left := (FGeneral.img1.Width div 2) - 20;
  FGeneral.lbl1.Top := 5 + FGeneral.img1.Height + 4;
  FGeneral.lbl1.Left := FGeneral.img1.Width - 10;
end;


procedure SetTheNewIPSDir_MamePlus;
begin
  Conf.sEdit13.Text := IPSPath;
  Conf.nxtgrd_ips_mameplus.Columns.Clear;
  Conf.nxtgrd_ips_mameplus.ClearRows;
  Conf.nxtgrd_ips_mameplus.Caption := 'I Have no Data to Show.';
  NewIpsDir:= True;
  Conf.sCheckBox34.Checked := False;
  Conf.sCheckBox34.Checked := True;
end;

procedure IPSEnableClick_MamePlus;
begin
  if FromArrows_Mamedirs = True then
    Conf.sCheckBox34.Checked := False;
  if Conf.sCheckBox34.Checked = False then
    begin
      Conf.sEdit13.Enabled := False;
      Conf.sEdit13.Text := '';
      Conf.sBitBtn98.Enabled := False;
      Conf.sLabel35.Enabled := False;
      Conf.nxtgrd_ips_mameplus.ClearRows;
      Conf.nxtgrd_ips_mameplus.Columns.Clear;
      Conf.nxtgrd_ips_mameplus.Enabled := False;
      FXml_MameDatabase.Root.WriteAttributeBool('IpsChecked',False);
      FXml_MameDatabase.SaveToFile(MameDatabaseFile);
    end
  else
    begin
      Conf.sEdit13.Enabled := True;
      Conf.sEdit13.Text := IPSPath;
      Conf.sBitBtn98.Enabled := True;
      Conf.sLabel35.Enabled := True;
      Conf.nxtgrd_ips_mameplus.Enabled := True;
      FXml_MameDatabase.Root.WriteAttributeBool('IpsChecked',True);
      FXml_MameDatabase.SaveToFile(MameDatabaseFile);
      GetmamePlus_IPS;
    end;
end;

procedure FindIPSDir_MamePlus;
begin
  gFindDirs := 'IPSDir_mameplus';
  if SelectDirectory(IPSPath, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
    global_Find_DirsClose;
end;

procedure ResetToDefaultTopic_MameBuilds;
begin
  if Mame_Exe = 'mamep.exe'  then
    begin
      Conf.sCheckBox32.Checked := True;
      Conf.sCheckBox10.Checked := False;
      Conf.sCheckBox33.Checked := False;
      Conf.sEdit12.Text := '';
      Conf.sbar_Mame_UITransparent_MamePlus.Position := 215;
      MameUITrasparentChange_MamePlus;
      Conf.sCheckBox34.Checked := False;
      Conf.sEdit13.Text := '';
      Conf.nxtgrd_ips_mameplus.Columns.Clear;
      Conf.nxtgrd_ips_mameplus.ClearRows;
      Conf.nxtgrd_ips_mameplus.Caption := 'I Have no Data to Show.';
      Conf.sButton8.Enabled := False;
      CheckTopicsConfig;
    end
end;

procedure CheckMameHlsl_TopicSettings;
begin
  Conf.sButton8.Enabled := False;
  if Mame_Exe = 'mamep.exe'  then
    begin
      if Conf.sCheckBox32.Checked <> True then
        Conf.sButton8.Enabled := True;
      if Conf.sCheckBox10.Checked <> False then
        Conf.sButton8.Enabled := True;
      if Conf.sCheckBox33.Checked <> False then
        Conf.sButton8.Enabled := True;
      if Conf.sbar_Mame_UITransparent_MamePlus.Position <> 215 then
        Conf.sButton8.Enabled := True;
      if Conf.sCheckBox34.Checked <> False then
        Conf.sButton8.Enabled := True;
    end
end;

procedure CheckButtonTopicsConfig_MameHlsl;
begin
  CheckMameHlsl_TopicSettings;
  CheckTopicsConfig;
end;

procedure MameBuilds_Clear;
begin
  Conf.sCheckBox32.Checked := False;
  Conf.sCheckBox10.Checked := False;
  Conf.sCheckBox33.Checked := False;
  Conf.sCheckBox34.Checked := False;
  Conf.sEdit12.Text := '';
  Conf.sEdit13.Text := '';
  Conf.sbar_Mame_UITransparent_MamePlus.Position := 0;
  Conf.nxtgrd_ips_mameplus.Columns.Clear;
  Conf.nxtgrd_ips_mameplus.ClearRows;
  Conf.nxtgrd_ips_mameplus.Caption := 'I Have no Data to Show.';
  Conf.LMDFontComboBox1.ItemIndex := -1;
end;

procedure GetMamePlus_IPS;
var
  rec,recdat : TSearchRec;
  FindDat,DatString,t1,t2: String;
  k1,k2,CountF: Integer;
  CountDat: Byte;
  DatFile: TextFile;
  CheckIPSFolder_MamePlus: Boolean;
  i: Integer;
  node: TXmlNode;
  
begin
  if (FromDatabase = True) and FileExists(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml') then
    DeleteFile(PChar(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml'));
  if (FileExists(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml')) and (NewIPSDir = False) then
    begin
      CheckIPSFolder_MamePlus := True;
      Assigned_IPS;
      if Started = True then
        progressComesFrom := 'Ips_Start'
      else
        begin
          IsIPSChecked := true;
          Conf.sGauge_IPSMamePlus.Visible := True;
          Conf.sLabel110.Visible := True;
          Conf.sLabel110.Caption := 'Please Wait';
        end;
          FXml_IPS.LoadFromFile(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml');
          CountF := CountFilesOrFolders(IPSPath,'folders');
          SetupIPSMameGrid('MamePlus');
          with FXml_IPS.Root do
            for i := 0 to NodeCount - 1 do
              begin
                node := FXml_IPS.Root.Nodes[i];
                if node.Name = 'Row' then
                  if node.ReadAttributeString('GameNameID') <> '' then
                    begin
                      k2 := k2 + 1;
                      t1 := node.ReadAttributeString('GameNameID');
                      Conf.nxtgrd_ips_mameplus.AddRow();
                      Conf.nxtgrd_ips_mameplus.Cell[0,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := t1;
                      Conf.nxtgrd_ips_mameplus.Cell[1,Conf.nxtgrd_ips_mameplus.LastAddedRow].Empty := True;
                      Conf.nxtgrd_ips_mameplus.RowHeight[Conf.nxtgrd_ips_mameplus.LastAddedRow] := 16;
                      Conf.nxtgrd_ips_mameplus.SelectLastRow();
                      if Started = True then
                        begin
                          Splash_Screen.Progress_Label((100 * k2) div (CountF-1),'Try to Sotring IPS ('+t1+')');
                          Splash_Screen.sGauge_Splash.Suffix := '% ('+IntToStr(k2)+'/'+IntToStr(CountF - 1)+')';
                        end
                      else
                        begin
                          Conf.sLabel110.Caption := 'Try to Sotring IPS ('+t1+')';
                          Conf.sGauge_IPSMamePlus.Progress := (100 * k2) div (CountF-1);
                          Conf.sGauge_IPSMamePlus.Suffix := '% ('+IntToStr(k2)+'/'+IntToStr(CountF - 1)+')';
                        end;
                    end
                  else
                    begin
                      Conf.nxtgrd_ips_mameplus.AddChildRow(Conf.nxtgrd_ips_mameplus.SelectedRow,crlast);
                      Conf.nxtgrd_ips_mameplus.Cell[1,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsBoolean := StrToBool(node.ReadAttributeString('Apply'));
                      if node.ReadAttributeString('IPSName') <> '' then
                        Conf.nxtgrd_ips_mameplus.Cell[2,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := node.ReadAttributeString('IPSName');
                      if node.ReadAttributeString('Hacker') <> '' then
                        Conf.nxtgrd_ips_mameplus.Cell[3,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := node.ReadAttributeString('Hacker');
                      if node.ReadAttributeString('Translator') <> '' then
                        Conf.nxtgrd_ips_mameplus.Cell[4,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := node.ReadAttributeString('Translator');
                      if node.ReadAttributeString('Description') <> '' then
                        Conf.nxtgrd_ips_mameplus.Cell[5,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := node.ReadAttributeString('Description');
                      if node.ReadAttributeString('Date') <> '' then
                        Conf.nxtgrd_ips_mameplus.Cell[6,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := node.ReadAttributeString('Date');
                      if node.ReadAttributeString('Image_Path') <> '' then
                        begin
                          Conf.nxtgrd_ips_mameplus.Cell[8,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := node.ReadAttributeString('Image_Path');
                          Conf.nxtgrd_ips_mameplus.RowHeight[Conf.nxtgrd_ips_mameplus.LastAddedRow] := 80;
                        end;
                    end;
              end;
          Conf.nxtgrd_ips_mameplus.EndUpdate;
          Conf.nxtgrd_ips_mameplus.BestFitColumn(1,bfHeader);
          if Started = True then
            Splash_Screen.sGauge_Splash.Suffix := '%'
          else
            begin
              Conf.sLabel110.Visible := False;
              Conf.sGauge_IPSMamePlus.Visible := False;
            end;
    end
  else
    begin
      CheckIPSFolder_MamePlus := False;
      CountF := CountFilesOrFolders(IPSPath,'folders');
      i := 0;
      if FindFirst(IPSPath+'\*',faDirectory, Rec) = 0 then
        begin
          if NewIPSDir = False then
            Screen.Cursor := AniBusy;
          if FromDatabase = False then
            begin
              Conf.sGauge_IPSMamePlus.Visible := True;
              Conf.sLabel110.Visible := True;
              Conf.sLabel110.Caption := 'Please Wait';
            end
          else
            Conf.sLabel109.Caption := 'Found IPS Files for MamePlus. Now sorted to IPS String (Please Wait)';
          Application.ProcessMessages;
          SetupIPSMameGrid('MamePlus');
          repeat
            Conf.nxtgrd_ips_mameplus.BeginUpdate;
            if  (Rec.Attr and faDirectory) = faDirectory  then
              begin
                if (rec.Name <> '.') and (rec.Name <> '..') then
                  begin
                    Conf.nxtgrd_ips_mameplus.AddRow();
                    Conf.nxtgrd_ips_mameplus.Cell[0,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := rec.Name;
                    Conf.nxtgrd_ips_mameplus.Cell[1,Conf.nxtgrd_ips_mameplus.LastAddedRow].Empty := True;
                    Conf.nxtgrd_ips_mameplus.RowHeight[Conf.nxtgrd_ips_mameplus.LastAddedRow] := 16;
                    Conf.nxtgrd_ips_mameplus.SelectLastRow();
                    if FindFirst(IPSPath+'\'+Rec.Name+'\*.*', faAnyFile, recdat) = 0 then
                      repeat
                        FindDat := Trim(Copy(recdat.Name,Length(recdat.Name)-3,4));
                        if FindDat = '.dat' then
                          begin
                            Conf.nxtgrd_ips_mameplus.AddChildRow(Conf.nxtgrd_ips_mameplus.SelectedRow,crlast);
                            Conf.nxtgrd_ips_mameplus.Cell[1,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsBoolean := False;
                            if FileExists(IPSPath+'\'+rec.Name+'\'+Trim(Copy(recdat.Name,0,Length(recdat.Name)-4))+'.png') then
                              t1 := IPSPath+'\'+rec.Name+'\'+Trim(Copy(recdat.Name,0,Length(recdat.Name)-4))+'.png'
                            else
                              t1 := ipsNotFoundImg;
                            Conf.nxtgrd_ips_mameplus.Cell[8,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := t1;
                            Conf.nxtgrd_ips_mameplus.RowHeight[Conf.nxtgrd_ips_mameplus.LastAddedRow] := 80;
                            CountDat := 0;
                            AssignFile(DatFile,ExtractFilePath(Mame_Exe)+'\IPS\'+rec.Name+'\'+recdat.Name);
                            Reset(DatFile);
                            while not Eof(DatFile) do
                              begin
                                Readln(DatFile,DatString);
                                k1 := Pos('[',DatString);
                                k2 := Pos(':',DatString);
                                if (k1 <> 0) and (k2 = 0) then
                                  CountDat := CountDat + 1;
                                if CountDat < 2 then
                                  begin
                                    if CountDat = 1 then
                                      begin
                                        if (DatString <> '') and (k2 = 0) and (k1 = 0) then
                                          begin
                                            if Conf.nxtgrd_ips_mameplus.Cell[2,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString <> '' then
                                              Conf.nxtgrd_ips_mameplus.Cell[6,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := DatString
                                            else
                                              Conf.nxtgrd_ips_mameplus.Cell[2,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := DatString;
                                            if CheckIPSFolder_MamePlus = False then
                                              CheckIPSFolder_MamePlus := True;  
                                          end;
                                        if k2 <> 0 then
                                          begin
                                            t1 := Trim(Copy(DatString,0,k2-1));
                                            t2 := Trim(Copy(DatString,k2+1,Length(DatString)-k2));
                                            if t1 = 'Hacker' then
                                              Conf.nxtgrd_ips_mameplus.Cell[3,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := t2
                                            else if t1 = 'Date' then
                                              Conf.nxtgrd_ips_mameplus.Cell[6,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := t2
                                            else if t1 = 'Translation' then
                                              Conf.nxtgrd_ips_mameplus.Cell[4,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := t2
                                            else if t1 = 'Description' then
                                              Conf.nxtgrd_ips_mameplus.Cell[5,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := t2;
                                          end;
                                      end
                                  end
                                else
                                  Break;
                              end;
                            CloseFile(DatFile);
                          end;
                      until FindNext(recdat) <> 0;
                    SysUtils.FindClose(recdat);
                    if FromDatabase = False then
                      begin
                        Conf.sLabel110.Caption := 'Try to Sotring IPS ('+rec.Name+')';
                        Conf.sGauge_IPSMamePlus.Progress := (100 * i) div (CountF - 1);
                        Conf.sGauge_IPSMamePlus.Suffix := '% ('+IntToStr(i)+'/'+IntToStr(CountF - 1)+')';
                      end
                    else
                      begin
                        Conf.sGauge_MameData.Progress := (100 * i) div (CountF - 1);
                        Conf.sGauge_MameData.Suffix := '% ('+IntToStr(i)+'/'+IntToStr(CountF - 1)+')';
                        Conf.sLabel109.Caption := rec.Name;
                      end;
                    i := i + 1;
                    Application.ProcessMessages;
                  end;
              end;
          until FindNext(rec) <> 0;
          if CheckIPSFolder_MamePlus = False then
            begin
              Conf.nxtgrd_ips_mameplus.Columns.Clear;
              Conf.nxtgrd_ips_mameplus.ClearRows;
              Conf.nxtgrd_ips_mameplus.Caption := 'I Have no Data to Show.';
            end
          else
            begin
              Conf.nxtgrd_ips_mameplus.EndUpdate;
              Conf.nxtgrd_ips_mameplus.BestFitColumn(1,bfHeader);
              if FromDatabase = False then
                Conf.sLabel110.Caption := 'Saving Changes'
              else
                Conf.sGauge_MameData.Suffix := '%';
            end;
          Application.ProcessMessages;
          if CheckIPSFolder_MamePlus = True then
            Conf.nxtgrd_ips_mameplus.SaveToXMLFile(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml');
          SysUtils.FindClose(rec);
        end;
      Conf.sLabel110.Visible := False;
      Conf.sGauge_IPSMamePlus.Visible := False;
      NewIPSDir := False;
    end;
  if CheckIPSFolder_MamePlus = True then
    begin
      Conf.nxtgrd_ips_mameplus.BestFitColumn(0,bfBoth);
      for k1 := 0 to Conf.nxtgrd_ips_mameplus.RowCount - 1  do
        Conf.nxtgrd_ips_mameplus.Expanded[k1] := False;
      Conf.nxtgrd_ips_mameplus.SelectFirstRow();
    end;
end;


procedure Assigned_IPS;
begin
  if not Assigned(FXml_IPS) then
    begin
      FXml_IPS := TNativeXml.CreateName('MameIps');
      FXml_IPS.XmlFormat := xfReadable;
    end;
end;

//Mame Tools TabSheet
procedure Tools_SystemFont_RadioButtonClick;
begin
  Conf.rb56.Checked := True;
  Conf.sLabel42.Enabled := True;
  Conf.LMDFontComboBox1.Init;
  Conf.LMDFontComboBox1.Enabled := True;
  Conf.sLabel43.Enabled := False;
  Conf.sEdit125.Enabled := False;
  Conf.sEdit125.Text := '';
  Conf.sBitBtn103.Enabled := False;
  Conf.sLabel41.Enabled := False;
  Conf.LMDFontSizeComboBox1.Enabled := False;
  Conf.LMDFontSizeComboBox1.Clear;
  Conf.sBitBtn104.Enabled := False;
  FontFromSystem := True;
end;

procedure Tools_DirectoryFont_RadioButtonClick;
begin
  Conf.rb57.Checked := True;
  Conf.sLabel42.Enabled := False;
  Conf.LMDFontComboBox1.Items.Text := '';
  Conf.LMDFontComboBox1.Enabled := False;
  Conf.sLabel43.Enabled := True;
  Conf.sEdit125.Enabled := True;
  Conf.sBitBtn103.Enabled := True;
  Conf.sLabel41.Enabled := False;
  Conf.LMDFontSizeComboBox1.Enabled := False;
  Conf.LMDFontSizeComboBox1.Items.Clear;
  Conf.sBitBtn104.Enabled := False;
  FontFromSystem := False;
end;

procedure Tools_FontComboBoxChange;
begin
  if Mame_Exe <> '' then
    begin
      Conf.LMDFontSizeComboBox1.Items.Clear;
      Conf.sLabel41.Enabled := True;
      Conf.LMDFontSizeComboBox1.FontName := Conf.LMDFontComboBox1.Font.Name;
      Conf.LMDFontSizeComboBox1.Init;
      Conf.LMDFontSizeComboBox1.Enabled := True;
    end;
end;

procedure Tools_FontSizeComboBoxChange;
begin
  Conf.sBitBtn104.Enabled := True;
end;

procedure Tools_FindFontFromDirClick;
begin
  Conf.LMDFontSizeComboBox1.Items.Clear;
  gFindFiles := 'MameTools_FontName';
  Conf.Find_Files.InitialDir := Program_Path + 'emulators';
  Conf.Find_Files.Filter := 'TrueType Fonts(*.ttf)|*.ttf';
  Conf.Find_Files.Execute;
  Conf.sLabel41.Enabled := True;
  Conf.LMDFontSizeComboBox1.FontName := Conf.sEdit125.Text;
  Conf.LMDFontSizeComboBox1.Init;
  Conf.LMDFontSizeComboBox1.Enabled := True;
end;

procedure Tools_CreateFont;
var
  FontName,FontSize: String;
begin
  if FontFromSystem = True then
    begin
      FontName := Conf.LMDFontComboBox1.Items.Strings[Conf.LMDFontComboBox1.ItemIndex];
      FontSize := IntToStr(Conf.LMDFontSizeComboBox1.FontSize);
      ShellExecAndWait(Program_Path+'otf2bdf.exe','-p '+FontSize+' '+FontName+' -o '+ExtractFilePath(Mame_Exe)+'ui.bdf','',0);
    end;
end;

/////////////////////////////////////////////////////////////

procedure Show_mame_otherspanel;
begin
  if (Cmenustate = 'em_arcade_mame_graphics') then
    em_mame_graphics_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_sound') then
    em_mame_sound_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_paths') then
    em_mame_dirs_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_hlsl') then
    em_mame_hlsl_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_database') then
    em_mame_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn10.Caption,False,True);
  Cmenustate := 'em_arcade_mame_others';
  em_mame_others_ShowDynamicComps;
  ShowButtonDown(10,'EM_ARCADE_MAME_OTHERS');
  CheckButtonTopicsConfig_MameOthers;
  ShowHidePanel(CurrentPanel,'Pem_mame_others');
end;

procedure em_mame_others_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_mame_others,'media\confeditor\images\mame\mame.png',
              -10,587,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pem_mame_others,'media\confeditor\images\mame\mame_image.png',
              558,381,169,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_mame_others,'media\confeditor\images\mame\others.png',
              609,2,136,71,i,'',True,False);
      end;
    end;
end;

procedure em_mame_others_FreeDynamicComps;
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
