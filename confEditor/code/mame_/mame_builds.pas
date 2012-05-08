unit mame_builds;

interface
uses
  SysUtils,Forms,Graphics,Classes,Controls,Dialogs,FileCtrl,StdCtrls,ExtCtrls,
  OmniXML,OmniXMLUtils,
  NxColumnClasses,NxGrid,NxCustomGridControl,
  pngimage;

  procedure SetMame_BuildsFromMameIni;
  procedure SaveMame_BuildsAtExit;

  procedure BuildsClick;
  procedure ToolsClick;
  procedure Builds_MamePlus;
  procedure Builds_MameXT;
  procedure EnableBuild_Mameplus(What: Boolean);
  procedure EnableBuild_MamePlusXT(What: Boolean);
  procedure HiScorePath_MamePlus;
  procedure HiScorePath_MameXT;
  procedure FindHiScoreDat_MamePlus;
  procedure FindHiScoreDat_MameXT;
  procedure FindHiScoreDat_MamePlusReturn;
  procedure FindHiScoreDat_MameXTReturn;
  procedure MameUITrasparentChange_MameXT;
  procedure MameUITrasparentChange_MamePlus;
  procedure IPSEnableClick_MamePlus;
  procedure FindIPSDir_MamePlus;
  procedure FindIPSDir_MameXT;
  procedure IPSEnableClick_MameXT;
  procedure GetIPS_MamePlus;
  procedure SetupIPSMameGrid(Name:string);
  procedure IpsMamePlus_Expand(ARow: Integer);
  procedure IpsMameXT_Expand(ARow: Integer);
  procedure IpsMamePlus_CellClick(Acol,Arow: Integer);
  procedure IpsMameXT_CellClick(Acol,Arow: Integer);
  procedure CloseShowingIPSImage_MameBuilds;
  procedure SetTheNewIPSDir_MamePlus;
  procedure SetTheNewIPSDir_MameXT;
  procedure ChangeColorInFont_MameBuilds;
  procedure DefaultColorInFont_MameBuilds;
  procedure ChangeImage2x_MameBuilds;
  procedure GetIPS_MameXT;
  procedure GetMameXT_GamesList;
  procedure GetMameXT_Game_CountTime;
  procedure RunGameCount_PlayTime_MameXT_Memo;
  procedure ZeroPlayTime_Count(GameName:String);
  procedure Tools_SystemFont_RadioButtonClick;
  procedure Tools_DirectoryFont_RadioButtonClick;
  procedure Tools_FontComboBoxChange;
  procedure Tools_FontSizeComboBoxChange;
  procedure Tools_FindFontFromDirClick;
  procedure Tools_CreateFont;

  procedure ResetToDefaultTopic_MameBuilds;
  procedure CheckMameBuilds_TopicSettings;
  procedure CheckButtonTopicsConfig_MameBuilds;

  procedure MameBuilds_Clear;

// Menu actions
  procedure Show_mame_buildspanel;
  procedure em_mame_builds_ShowDynamicComps;
  procedure em_mame_builds_FreeDynamicComps;  

var
  FromMame_BuildsToFindBuilds,FontFromSystem,IPSRunFirst: Boolean;
  IPSPath,HiScoreFile,HiScorePath,ipsNotFoundImg: String;
  IsIPSChecked,IsApplyChecked,NewIPSDir: Boolean;
  GamePlayTime_Memo: TMemo;

implementation
uses
  main,mainconf,FunctionX,global,menu,onflycomponents,
  form_general,form_splash,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_database;

procedure BuildsClick;
begin
  Conf.sBitBtn44.Down := True;
  Conf.sBitBtn43.Down := False;
  if (ExtractFileName(Mame_Exe) <> 'mamep.exe') and (ExtractFileName(Mame_Exe) <> 'mamepuiXT_x86.exe') and (ExtractFileName(Mame_Exe) <> 'mamepuiXT_x64.exe') then
    begin
      Conf.sBitBtn45.Down := False;
      Conf.sBitBtn46.Down := False;
      Conf.PBuilds_MameBuilds.BringToFront;
      Conf.PBuilds_MamePlus.BringToFront;
    end
  else if ExtractFileName(Mame_Exe) = 'mamep.exe' then
    begin
      Conf.sBitBtn45.Down := True;
      Conf.sBitBtn46.Down := False;
      Conf.PBuilds_MameBuilds.BringToFront;
      Conf.PBuilds_MamePlus.BringToFront;
    end
  else if (ExtractFileName(Mame_Exe) = 'mamepuiXT_x86.exe') or (ExtractFileName(Mame_Exe) = 'mamepuiXT_x64.exe') then
    begin
      Conf.sBitBtn45.Down := False;
      Conf.sBitBtn46.Down := True;
      Conf.PBuilds_MameBuilds.BringToFront;
      Conf.PBuilds_MameXT.BringToFront;    
    end;
end;

procedure ToolsClick;
begin
  Conf.sBitBtn44.Down := False;
  Conf.sBitBtn43.Down := True;
  Conf.PBuilds_MameTools.BringToFront;
end;

procedure Builds_MamePlus;
begin
  Conf.sBitBtn45.Down := True;
  Conf.sBitBtn46.Down := False;
  Conf.PBuilds_MamePlus.BringToFront;
end;

procedure Builds_MameXT;
begin
  Conf.sBitBtn45.Down := False;
  Conf.sBitBtn46.Down := True;
  Conf.PBuilds_MameXT.BringToFront;
end;

procedure MameUITrasparentChange_MameXT;
begin
  Conf.sLabel37.Caption := IntToStr(Conf.sbar_Mame_UITransparent_MameXT.Position);
end;

procedure MameUITrasparentChange_MamePlus;
begin
  Conf.sLabel34.Caption := IntToStr(Conf.sbar_Mame_UITransparent_MamePlus.Position);
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
      MameXmlUseDoc.DocumentElement.SetAttribute('IpsChecked','False');
      MameXmlUseDoc.Save(MameDatabaseFile,ofNone);
    end
  else
    begin
      Conf.sEdit13.Enabled := True;
      Conf.sEdit13.Text := IPSPath;
      Conf.sBitBtn98.Enabled := True;
      Conf.sLabel35.Enabled := True;
      Conf.nxtgrd_ips_mameplus.Enabled := True;
      MameXmlUseDoc.DocumentElement.SetAttribute('IpsChecked','True');
      MameXmlUseDoc.Save(MameDatabaseFile,ofNone);
      GetIPS_MamePlus;
    end;
end;

procedure IPSEnableClick_MameXT;
begin
  if FromArrows_Mamedirs = True then
    Conf.sCheckBox130.Checked := False;
  if Conf.sCheckBox130.Checked = False then
    begin
      Conf.sEdit17.Enabled := False;
      Conf.sEdit17.Text := '';
      Conf.sBitBtn100.Enabled := False;
      Conf.sLabel38.Enabled := False;
      Conf.nxtgrd_ips_mamext.ClearRows;
      Conf.nxtgrd_ips_mamext.Columns.Clear;
      Conf.nxtgrd_ips_mamext.Enabled := False;
      MameXmlUseDoc.DocumentElement.SetAttribute('IpsChecked','False');
      MameXmlUseDoc.Save(MameDatabaseFile,ofNone);
    end
  else
    begin
      Conf.sEdit17.Enabled := True;
      Conf.sEdit17.Text := IPSPath;
      Conf.sBitBtn100.Enabled := True;
      Conf.sLabel38.Enabled := True;
      Conf.nxtgrd_ips_mamext.Enabled := True;
      MameXmlUseDoc.DocumentElement.SetAttribute('IpsChecked','True');
      MameXmlUseDoc.Save(MameDatabaseFile,ofNone);
      GetIPS_MameXT;
    end;
end;

procedure SetMame_BuildsFromMameIni;
var
  MameIniFile: TextFile;
  value,text,t1,t2,t3,CheckIps,CheckHiscore: string;
  r: integer;
begin
  if Started = True then
    begin
      Tools_SystemFont_RadioButtonClick;
      if (Mame_Exe <> 'mamep.exe') and (Mame_Exe <> 'mamepuiXT_x86.exe') and (Mame_Exe <> 'mamepuiXT_x64.exe') then
        begin
          EnableBuild_Mameplus(False);
          EnableBuild_MamePlusXT(False);
          ToolsClick;
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
              EnableBuild_MamePlusXT(False);
              BuildsClick;
              Builds_MamePlus;
            end
          else if (ExtractFileName(Mame_Exe) = 'mamepuiXT_x86.exe') or (ExtractFileName(Mame_Exe) = 'mamepuiXT_x64.exe') then
            begin
              EnableBuild_MamePlus(False);
              EnableBuild_MamePlusXT(True);
              BuildsClick;
              Builds_MameXT;
            end;
          nodegame := MameXmlUseDoc.SelectSingleNode('MameInfo');
          CheckIps := GetNodeAttrStr(nodegame,'IpsChecked');
          CheckHiscore := GetNodeAttrStr(nodegame,'HiScoreChecked');
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
                  else
                    Conf.sCheckBox44.Checked := StrToBool(t2);
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
                      if CheckHiscore = 'True' then
                        Conf.sCheckBox33.Checked := StrToBool(CheckHiscore)
                      else
                        HiScorePath_MamePlus;
                    end
                  else
                    begin
                      if CheckHiscore = 'True' then
                        Conf.sCheckBox129.Checked := StrToBool(CheckHiscore)
                      else
                        HiScorePath_MameXT;
                    end;
                end
              else if t1 = 'ui_transparency' then
                begin
                  if Mame_Exe = 'mamep.exe' then
                    begin
                      Conf.sbar_Mame_UITransparent_MamePlus.Position := StrToInt(t2);
                      MameUITrasparentChange_MamePlus;
                    end
                  else
                    begin
                      Conf.sbar_Mame_UITransparent_MameXT.Position := StrToInt(t2);
                      MameUITrasparentChange_MameXT;
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
                      if CheckIps = 'True' then
                        Conf.sCheckBox34.Checked := StrToBool(CheckIps)
                      else
                        IPSEnableClick_MamePlus;
                    end
                  else
                    begin
                      if CheckIps = 'True' then
                        Conf.sCheckBox130.Checked := StrToBool(CheckIps)
                      else
                        IPSEnableClick_MameXT;
                    end;
                end;
            end;
          CloseFile(MameIniFile);
          if Mame_Exe <> 'mamep.exe' then
            begin
              GetMameXT_GamesList;
              RunGameCount_PlayTime_MameXT_Memo;
            end;
          if (FromArrows_Mamedirs = True) or (FromDatabase = True) then
            SaveMame_BuildsAtExit;
        end;
      CheckMameBuilds_TopicSettings;
      CheckTopicsConfig;
    end;
  IsApplyChecked := False;
  Started := False;
end;

procedure SaveMame_BuildsAtExit;
var
  k,x: Integer;
  value,t1,t2: string;
  FoundHiScoreDir: Boolean;
begin
  if (Mame_Exe = 'mamep.exe') or (Mame_Exe = 'mamepuiXT_x86.exe') or (Mame_Exe = 'mamepuiXT_x64.exe') then
    begin
      FoundHiScoreDir := False;
      for k := 0 to Mame_Global_MemoIni.Lines.Count - 1 do
        begin
          value := Mame_Global_MemoIni.Lines.Strings[k];
          x := Pos(' ',value);
          t1 := Trim(Copy(value,0,x));
          t2 := Trim(Copy(value,x,100));
          if t1 = 'confirm_quit' then
            begin
              Mame_Global_MemoIni.Lines.Delete(k);
              if (Conf.sCheckBox32.Checked = True) or (Conf.sCheckBox44.Checked = True) then
                Mame_Global_MemoIni.Lines.Insert(k,'confirm_quit          1')
              else
                Mame_Global_MemoIni.Lines.Insert(k,'confirm_quit          0');
            end
          else if t1 = 'audio_sync' then
            begin
              Mame_Global_MemoIni.Lines.Delete(k);
              if (Conf.sCheckBox10.Checked = True) or (Conf.sCheckBox28.Checked = True) then
                Mame_Global_MemoIni.Lines.Insert(k,'audio_sync          1')
              else
                Mame_Global_MemoIni.Lines.Insert(k,'audio_sync          0');
            end
          else if t1 = 'hiscore_directory' then
            begin
              Mame_Global_MemoIni.Lines.Delete(k);
              if (Conf.sCheckBox33.Checked = True) or (Conf.sCheckBox129.Checked = True) then
                if Mame_Exe = 'mamep.exe' then
                  Mame_Global_MemoIni.Lines.Insert(k,'hiscore_directory          '+Trim(Copy(Conf.sEdit12.Text,0,Length(Conf.sEdit12.Text)-11)))
                else
                  Mame_Global_MemoIni.Lines.Insert(k,'hiscore_directory          '+Trim(Copy(Conf.sEdit16.Text,0,Length(Conf.sEdit16.Text)-11)));
              FoundHiScoreDir := True;
            end
          else if t1 = 'ui_transparency' then
            begin
              Mame_Global_MemoIni.Lines.Delete(k);
              if Mame_Exe = 'mamep.exe' then
                Mame_Global_MemoIni.Lines.Insert(k,'ui_transparency          '+Conf.sLabel34.Caption)
              else
                Mame_Global_MemoIni.Lines.Insert(k,'ui_transparency          '+Conf.sLabel37.Caption);
            end
          else if t1 = 'ipspath' then
            begin
              Mame_Global_MemoIni.Lines.Delete(k);
              if Mame_Exe = 'mamep.exe' then
                Mame_Global_MemoIni.Lines.Insert(k,'ipspath          '+Conf.sEdit13.Text)
              else
                Mame_Global_MemoIni.Lines.Insert(k,'ipspath          '+Conf.sEdit17.Text);
            end;
        end;
      if IsApplyChecked = True then
        begin
          Conf.nxtgrd_ips_mameplus.SaveToXMLFile(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml');
          IsApplyChecked := False;
        end;
      if FoundHiScoreDir = False then
        begin
          Mame_Global_MemoIni.Lines.Add('');
          Mame_Global_MemoIni.Lines.Add('#');
          Mame_Global_MemoIni.Lines.Add('# EXTRAFE EXTRA OPTIONS');
          Mame_Global_MemoIni.Lines.Add('#');
          Mame_Global_MemoIni.Lines.Add('hiscore_directory          hi');
          Mame_Global_MemoIni.Lines.Add('hiscore_file          hiscore.dat');
          Mame_Global_MemoIni.Lines.Add('ipspath                   ips');
          Mame_Global_MemoIni.Lines.Add('ips');
        end;
      Mame_Global_MemoIni.Lines.SaveToFile(FullPathMame_Exe+'mame.ini');
      FromMame_BuildsToFindBuilds:= False;
    end;
end;

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

procedure EnableBuild_MamePlusXT(What: Boolean);
begin
  Conf.sCheckBox44.Enabled := What;
  Conf.sCheckBox128.Enabled := What;
  Conf.sCheckBox129.Enabled := What;
  Conf.sCheckBox130.Enabled := What;
  Conf.sEdit16.Enabled := What;
  Conf.sEdit17.Enabled := What;
  Conf.nxtgrd_ips_mamext.Enabled := What;
  Conf.sLabel36.Enabled := What;
  Conf.sLabel37.Enabled := What;
  Conf.sLabel38.Enabled := What;
  Conf.sLabel39.Enabled := What;
  Conf.sLabel40.Enabled := What;
  Conf.sBitBtn99.Enabled := What;
  Conf.sBitBtn100.Enabled := What;
  Conf.sBitBtn101.Enabled := What;
  Conf.grp119.Enabled := What;
  Conf.grp120.Enabled := What;
  Conf.grp121.Enabled := What;
  Conf.sbar_Mame_UITransparent_MameXT.Enabled := What;
end;

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

procedure GetIPS_MamePlus;
var
  xmlDoc: IXMLDocument;
  nodegame: IXMLNode;
  gameList : IXMLNodeList;
  rec,recdat : TSearchRec;
  FindDat,DatString,t1,t2: String;
  k1,k2,iNode,CountF: Integer;
  CountDat: Byte;
  DatFile: TextFile;
  CheckIPSFolder_MamePlus: Boolean;
begin
  if (FromDatabase = True) and FileExists(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml') then
    DeleteFile(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml');
  if (FileExists(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml')) and (NewIPSDir = False) then
    begin
      CheckIPSFolder_MamePlus := True;
      try
        XMLDoc := CreateXMLDoc;
        try
          if Started = True then
            begin
              Splash_Screen.sLabel1.Caption := 'Found IPS Files for MamePlus. Try to Sotring (Please Wait...)';
              Application.ProcessMessages;
            end
          else
            begin
              IsIPSChecked := true;
              Conf.sGauge_IPSMamePlus.Visible := True;
              Conf.sLabel110.Visible := True;
              Conf.sLabel110.Caption := 'Please Wait';
            end;
          XMLDoc.PreserveWhiteSpace := True;
          XMLDoc.Load(Program_Path+'\media\emulators\arcade\mame\database\ips_mamep.xml');
        finally
          CountF := CountFilesOrFolders(IPSPath,'folders');
          SetupIPSMameGrid('MamePlus');
          gameList := xmlDoc.SelectNodes('/NxGrid/Row');
          k2 := -1;
          Conf.nxtgrd_ips_mameplus.BeginUpdate;
          for iNode := 0 to gameList.Length - 1 do
            begin
              nodegame := gameList.Item[iNode];
              if GetNodeTextStr(nodegame,'GameNameID','') <> '' then
                begin
                  Application.ProcessMessages;
                  k2 := k2 + 1;
                  t1 := GetNodeTextStr(nodegame,'GameNameID');
                  Conf.nxtgrd_ips_mameplus.AddRow();
                  Conf.nxtgrd_ips_mameplus.Cell[0,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := GetNodeTextStr(nodegame,'GameNameID');
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
                  Conf.nxtgrd_ips_mameplus.Cell[1,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsBoolean := StrToBool(GetNodeTextStr(nodegame,'Apply'));
                  if GetNodeTextStr(nodegame,'IPSName','') <> '' then
                    Conf.nxtgrd_ips_mameplus.Cell[2,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := GetNodeTextStr(nodegame,'IPSName');
                  if GetNodeTextStr(nodegame,'Hacker','') <> '' then
                    Conf.nxtgrd_ips_mameplus.Cell[3,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Hacker');
                  if GetNodeTextStr(nodegame,'Translator','') <> '' then
                    Conf.nxtgrd_ips_mameplus.Cell[4,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Translator');
                  if GetNodeTextStr(nodegame,'Description','') <> '' then
                    Conf.nxtgrd_ips_mameplus.Cell[5,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Description');
                  if GetNodeTextStr(nodegame,'Date','') <> '' then
                    Conf.nxtgrd_ips_mameplus.Cell[6,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Date');
                  if GetNodeTextStr(nodegame,'Image_Path','') <> '' then
                    begin
                      Conf.nxtgrd_ips_mameplus.Cell[8,Conf.nxtgrd_ips_mameplus.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Image_Path');
                      Conf.nxtgrd_ips_mameplus.RowHeight[Conf.nxtgrd_ips_mameplus.LastAddedRow] := 80;
                    end;
                end;
            end;
          Conf.nxtgrd_ips_mameplus.EndUpdate;
          Conf.nxtgrd_ips_mameplus.BestFitColumn(1,bfHeader);
        end;
      finally
        xmlDoc := nil;
        if Started = True then
          Splash_Screen.sGauge_Splash.Suffix := '%'
        else
          begin
            Conf.sLabel110.Visible := False;
            Conf.sGauge_IPSMamePlus.Visible := False;
          end;
      end;
    end
  else
    begin
      CheckIPSFolder_MamePlus := False;
      CountF := CountFilesOrFolders(IPSPath,'folders');
      iNode := -1;
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
                    iNode := iNode + 1;
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
                    FindClose(recdat);
                    if FromDatabase = False then
                      begin
                        Conf.sLabel110.Caption := 'Try to Sotring IPS ('+rec.Name+')';
                        Conf.sGauge_IPSMamePlus.Progress := (100 * iNode) div (CountF - 1);
                        Conf.sGauge_IPSMamePlus.Suffix := '% ('+IntToStr(iNode)+'/'+IntToStr(CountF - 1)+')';
                      end
                    else
                      begin
                        Conf.sGauge_MameData.Progress := (100 * iNode) div (CountF - 1);
                        Conf.sGauge_MameData.Suffix := '% ('+IntToStr(iNode)+'/'+IntToStr(CountF - 1)+')';
                        Conf.sLabel109.Caption := rec.Name;
                      end;
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
          FindClose(rec);
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

procedure IpsMameXT_CellClick(Acol,Arow: Integer);
var
  NormPic: TPNGObject;
  ImagePath,ImageName: string;
  i: Integer;
begin
  if Acol = 7 then
    begin
      ImagePath := Conf.nxtgrd_ips_mamext.Cell[Acol+1,Arow].AsString;
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
            ImageName := Conf.nxtgrd_ips_mamext.Cell[0,i].AsString;
          until ImageName <> '';
          FGeneral.Caption := 'Image of '+ ImageName;
          FGeneral.Repaint;
          FGeneral.ShowModal;
        end;
    end
  else if Acol = 1 then
    IsApplyChecked := True;
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

procedure CloseShowingIPSImage_MameBuilds;
begin
  FGeneral.lbl1.Caption := '2X';
  FGeneral.Close;
end;

procedure GetIPS_MameXT;
var
  xmlDoc: IXMLDocument;
  nodegame: IXMLNode;
  gameList : IXMLNodeList;
  rec,recdat : TSearchRec;
  FindDat,DatString,t1,t2: String;
  k1,k2,iNode,CountF: Integer;
  CountDat: Byte;
  DatFile: TextFile;
  CheckIPSFolder_MameXT: Boolean;
begin
  if (FromDatabase = True) and FileExists(Program_Path+'\media\emulators\arcade\mame\database\ips_mamext.xml') then
    DeleteFile(Program_Path+'\media\emulators\arcade\mame\database\ips_mamext.xml');
  if (FileExists(Program_Path+'\media\emulators\arcade\mame\database\ips_mamext.xml')) and (NewIPSDir = False) then
    begin
      CheckIPSFolder_MameXT := True;
      try
        XMLDoc := CreateXMLDoc;
        try
          if Started = True then
            begin
              Splash_Screen.sLabel1.Caption := 'Found IPS Files for MameXT. Try to Sotring (Please Wait...)';
              Application.ProcessMessages;
            end
          else
            begin
              IsIPSChecked := true;
              Conf.sGauge_IPSMameXT.Visible := True;
              Conf.sLabel111.Visible := True;
              Conf.sLabel111.Caption := 'Please Wait';
            end;
          XMLDoc.PreserveWhiteSpace := True;
          XMLDoc.Load(Program_Path+'\media\emulators\arcade\mame\database\ips_mamext.xml');
        finally
          CountF := CountFilesOrFolders(IPSPath,'folders');
          SetupIPSMameGrid('MameXT');
          gameList := xmlDoc.SelectNodes('/NxGrid/Row');
          k2 := -1;
          Conf.nxtgrd_ips_mamext.BeginUpdate;
          for iNode := 0 to gameList.Length - 1 do
            begin
              nodegame := gameList.Item[iNode];
              if GetNodeTextStr(nodegame,'GameNameID','') <> '' then
                begin
                  Application.ProcessMessages;
                  k2 := k2 + 1;
                  t1 := GetNodeTextStr(nodegame,'GameNameID');
                  Conf.nxtgrd_ips_mamext.AddRow();
                  Conf.nxtgrd_ips_mamext.Cell[0,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := GetNodeTextStr(nodegame,'GameNameID');
                  Conf.nxtgrd_ips_mamext.Cell[1,Conf.nxtgrd_ips_mamext.LastAddedRow].Empty := True;
                  Conf.nxtgrd_ips_mamext.RowHeight[Conf.nxtgrd_ips_mamext.LastAddedRow] := 16;
                  Conf.nxtgrd_ips_mamext.SelectLastRow();
                  if FromArrows_Mamedirs = False then
                    begin
                      if Started = True then
                        begin
                          Splash_Screen.Progress_Label((100 * k2) div (CountF-1),'Try to Sotring IPS ('+t1+')');
                          Splash_Screen.sGauge_Splash.Suffix := '% ('+IntToStr(k2)+'/'+IntToStr(CountF - 1)+')';
                        end
                      else
                        begin
                          Conf.sLabel111.Caption := 'Try to Sotring IPS ('+t1+')';
                          Conf.sGauge_IPSMameXT.Progress := (100 * k2) div (CountF-1);
                          Conf.sGauge_IPSMameXT.Suffix := '% ('+IntToStr(k2)+'/'+IntToStr(CountF - 1)+')';
                        end;
                    end
                  else
                    begin
                      Conf.sLabel112.Caption := 'Try to Sotring IPS ('+t1+')';
                      Conf.sGauge_MameChange.Progress := (100 * k2) div (CountF-1);
                      Conf.sGauge_MameChange.Suffix := '% ('+IntToStr(k2)+'/'+IntToStr(CountF - 1)+')';
                    end;
                end
              else
                begin
                  Conf.nxtgrd_ips_mamext.AddChildRow(Conf.nxtgrd_ips_mamext.SelectedRow,crlast);
                  Conf.nxtgrd_ips_mamext.Cell[1,Conf.nxtgrd_ips_mamext.LastAddedRow].AsBoolean := StrToBool(GetNodeTextStr(nodegame,'Apply'));
                  if GetNodeTextStr(nodegame,'IPSName','') <> '' then
                    Conf.nxtgrd_ips_mamext.Cell[2,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := GetNodeTextStr(nodegame,'IPSName');
                  if GetNodeTextStr(nodegame,'Hacker','') <> '' then
                    Conf.nxtgrd_ips_mamext.Cell[3,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Hacker');
                  if GetNodeTextStr(nodegame,'Translator','') <> '' then
                    Conf.nxtgrd_ips_mamext.Cell[4,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Translator');
                  if GetNodeTextStr(nodegame,'Description','') <> '' then
                    Conf.nxtgrd_ips_mamext.Cell[5,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Description');
                  if GetNodeTextStr(nodegame,'Date','') <> '' then
                    Conf.nxtgrd_ips_mamext.Cell[6,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Date');
                  if GetNodeTextStr(nodegame,'Image_Path','') <> '' then
                    begin
                      Conf.nxtgrd_ips_mamext.Cell[8,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := GetNodeTextStr(nodegame,'Image_Path');
                      Conf.nxtgrd_ips_mamext.RowHeight[Conf.nxtgrd_ips_mamext.LastAddedRow] := 80;
                    end;
                end;
            end;
          Conf.nxtgrd_ips_mamext.EndUpdate;
          Conf.nxtgrd_ips_mamext.BestFitColumn(1,bfHeader);
        end;
      finally
        xmlDoc := nil;
        if Started = True then
          Splash_Screen.sGauge_Splash.Suffix := '%'
        else
          begin
            Conf.sLabel111.Visible := False;
            Conf.sGauge_IPSMameXT.Visible := False;
          end;
      end;
    end
  else
    begin
      CheckIPSFolder_MameXT := False;
      CountF := CountFilesOrFolders(IPSPath,'folders');
      iNode := -1;
      if SysUtils.FindFirst(IPSPath+'\*',faDirectory, Rec) = 0 then
        begin
          if NewIPSDir = False then
            Screen.Cursor := AniBusy;
          if FromDatabase = False then
            begin
              Conf.sGauge_IPSMameXT.Visible := True;
              Conf.sLabel111.Visible := True;
              Conf.sLabel111.Caption := 'Please Wait';
            end
          else
            Conf.sLabel109.Caption := 'Found IPS Files for MamePlus. Now sorted to IPS String (Please Wait)';
          Application.ProcessMessages;
          SetupIPSMameGrid('MameXT');
          repeat
            Conf.nxtgrd_ips_mamext.BeginUpdate;
            if  (Rec.Attr and faDirectory) = faDirectory  then
              begin
                if (rec.Name <> '.') and (rec.Name <> '..') then
                  begin
                    Conf.nxtgrd_ips_mamext.AddRow();
                    iNode := iNode + 1;
                    Conf.nxtgrd_ips_mamext.Cell[0,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := rec.Name;
                    Conf.nxtgrd_ips_mamext.Cell[1,Conf.nxtgrd_ips_mamext.LastAddedRow].Empty := True;
                    Conf.nxtgrd_ips_mamext.RowHeight[Conf.nxtgrd_ips_mamext.LastAddedRow] := 16;
                    Conf.nxtgrd_ips_mamext.SelectLastRow();
                    if FindFirst(IPSPath+'\'+Rec.Name+'\*.*', faAnyFile, recdat) = 0 then
                      repeat
                        FindDat := Trim(Copy(recdat.Name,Length(recdat.Name)-3,4));
                        if FindDat = '.dat' then
                          begin
                            Conf.nxtgrd_ips_mamext.AddChildRow(Conf.nxtgrd_ips_mamext.SelectedRow,crlast);
                            Conf.nxtgrd_ips_mamext.Cell[1,Conf.nxtgrd_ips_mamext.LastAddedRow].AsBoolean := False;
                            if FileExists(IPSPath+'\'+rec.Name+'\'+Trim(Copy(recdat.Name,0,Length(recdat.Name)-4))+'.png') then
                              t1 := IPSPath+'\'+rec.Name+'\'+Trim(Copy(recdat.Name,0,Length(recdat.Name)-4))+'.png'
                            else
                              t1 := ipsNotFoundImg;
                            Conf.nxtgrd_ips_mamext.Cell[8,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := t1;
                            Conf.nxtgrd_ips_mamext.RowHeight[Conf.nxtgrd_ips_mamext.LastAddedRow] := 80;
                            CountDat := 0;
                            AssignFile(DatFile,FullPathMame_Exe+'\IPS\'+rec.Name+'\'+recdat.Name);
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
                                            if Conf.nxtgrd_ips_mamext.Cell[2,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString <> '' then
                                              Conf.nxtgrd_ips_mamext.Cell[6,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := DatString
                                            else
                                              Conf.nxtgrd_ips_mamext.Cell[2,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := DatString;
                                            if CheckIPSFolder_MameXT = False then
                                              CheckIPSFolder_MameXT := True;
                                          end;
                                        if k2 <> 0 then
                                          begin
                                            t1 := Trim(Copy(DatString,0,k2-1));
                                            t2 := Trim(Copy(DatString,k2+1,Length(DatString)-k2));
                                            if t1 = 'Hacker' then
                                              Conf.nxtgrd_ips_mamext.Cell[3,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := t2
                                            else if t1 = 'Date' then
                                              Conf.nxtgrd_ips_mamext.Cell[6,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := t2
                                            else if t1 = 'Translation' then
                                              Conf.nxtgrd_ips_mamext.Cell[4,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := t2
                                            else if t1 = 'Description' then
                                              Conf.nxtgrd_ips_mamext.Cell[5,Conf.nxtgrd_ips_mamext.LastAddedRow].AsString := t2;
                                          end;
                                      end
                                  end
                                else
                                  Break;
                              end;
                            CloseFile(DatFile);
                          end;
                      until FindNext(recdat) <> 0;
                    FindClose(recdat);
                    if FromDatabase = False then
                      begin
                        Conf.sLabel111.Caption := 'Try to Sotring IPS ('+rec.Name+')';
                        Conf.sGauge_IPSMameXT.Progress := (100 * iNode) div (CountF - 1);
                        Conf.sGauge_IPSMameXT.Suffix := '% ('+IntToStr(iNode)+'/'+IntToStr(CountF - 1)+')';
                      end
                    else
                      begin
                        Conf.sGauge_MameData.Progress := (100 * iNode) div (CountF - 1);
                        Conf.sGauge_MameData.Suffix := '% ('+IntToStr(iNode)+'/'+IntToStr(CountF - 1)+')';
                        Conf.sLabel109.Caption := rec.Name;
                      end;
                    Application.ProcessMessages;
                  end;
              end;
          until FindNext(rec) <> 0;
          if CheckIPSFolder_MameXT = False then
            begin
              Conf.nxtgrd_ips_mamext.Columns.Clear;
              Conf.nxtgrd_ips_mamext.ClearRows;
              Conf.nxtgrd_ips_mamext.Caption := 'I Have no Data to Show.';
            end
          else
            begin
              Conf.nxtgrd_ips_mamext.EndUpdate;
              Conf.nxtgrd_ips_mamext.BestFitColumn(1,bfHeader);
              if FromDatabase = False then
                Conf.sLabel111.Caption := 'Saving Changes'
              else
                Conf.sGauge_MameData.Suffix := '%';
            end;
          Application.ProcessMessages;
          if CheckIPSFolder_MameXT = True then
            Conf.nxtgrd_ips_mamext.SaveToXMLFile(Program_Path+'\media\emulators\arcade\mame\database\ips_mamext.xml');
          FindClose(rec);
        end;
      Conf.sLabel111.Visible := False;
      Conf.sGauge_IPSMameXT.Visible := False;
      NewIPSDir := False;
    end;
  if CheckIPSFolder_MameXT = True then
    begin
      Conf.nxtgrd_ips_mamext.BestFitColumn(0,bfBoth);
      for k1 := 0 to Conf.nxtgrd_ips_mamext.RowCount - 1  do
        Conf.nxtgrd_ips_mamext.Expanded[k1] := False;
      Conf.nxtgrd_ips_mamext.SelectFirstRow();
    end;
end;

procedure GetMameXT_GamesList;
var
  GameCount: TextFile;
  Game,GamePath: string;
  i: Integer;
begin
  Conf.sComboBox76.Items.Add('Please Choose a Game');
  GamePath := FullPathMame_Exe+'ini\mameui.ini';
  AssignFile(GameCount,GamePath);
  Reset(GameCount);
  while not Eof(GameCount) do
    begin
      Readln(GameCount,Game);
      if (Game <> '# DISPLAY STATE OPTIONS') and (Game <> '# INTERFACE OPTIONS') and (Game <> '# SEARCH PATH OPTIONS') and
        (Game <> '# FILENAME OPTIONS') and (Game <> '# NAVIGATION KEY CODES') and (Game <> '# NAVIGATION JOYSTICK CODES') then
        begin
          i := Pos('#',Game);
          if i <> 0 then
            begin
              Delete(Game,1,2);
              if Game <> '' then
                Conf.sComboBox76.Items.Add(Game);
            end;
        end;
    end;
  Conf.sComboBox76.ItemIndex := 0;
  CloseFile(GameCount);
end;

procedure GetMameXT_Game_CountTime;
var
  GameCount: TextFile;
  Game,GamePath,GameCT: string;
  i: Integer;
begin
  GamePath := FullPathMame_Exe+'ini\mameui.ini';
  AssignFile(GameCount,GamePath);
  Reset(GameCount);
  while not Eof(GameCount) do
    begin
      Readln(GameCount,Game);
      if (Game <> '# DISPLAY STATE OPTIONS') and (Game <> '# INTERFACE OPTIONS') and (Game <> '# SEARCH PATH OPTIONS') and
        (Game <> '# FILENAME OPTIONS') and (Game <> '# NAVIGATION KEY CODES') and (Game <> '# NAVIGATION JOYSTICK CODES') then
        begin
          i := Pos('#',Game);
          if i <> 0 then
            begin
              Delete(Game,1,2);
              if (Game <> '') and (Game = Conf.sComboBox76.Text) then
                begin
                  Readln(GameCount,Game);
                  Readln(GameCount,Game);
                  i := Pos(' ',Game);
                  GameCT := Trim(Copy(Game,i,Length(Game)-i+1));
                  Conf.sLabel39.Caption := 'Play Count : '+GameCT;
                  if StrToInt(GameCT) = 0 then
                    Conf.sBitBtn101.Enabled := False
                  else
                    Conf.sBitBtn101.Enabled := True;
                  Readln(GameCount,Game);
                  GameCT := Trim(Copy(Game,i,Length(Game)-i+1));
                  Conf.sLabel40.Caption := 'Play Time : '+GameCT;
                end;
            end;
        end;
    end;
  CloseFile(GameCount);
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
      MameXmlUseDoc.DocumentElement.SetAttribute('HiScoreChecked','True');
      MameXmlUseDoc.Save(MameDatabaseFile,ofIndent);
    end
  else
    begin
      Conf.sEdit12.Enabled := False;
      Conf.sEdit12.Text := '';
      Conf.sLabel102.Visible := False;
      Conf.sBitBtn1.Enabled := False;
      MameXmlUseDoc.DocumentElement.SetAttribute('HiScoreChecked','False');
      MameXmlUseDoc.Save(MameDatabaseFile,ofIndent);
    end;
end;

procedure HiScorePath_MameXT;
begin
  if Conf.sCheckBox129.Checked = True then
    begin
      Conf.sEdit16.Enabled := True;
      Conf.sEdit16.Text := HiScoreFile;
      if not FileExists(HiScoreFile) then
        Conf.sLabel103.Visible := True;
      Conf.sBitBtn99.Enabled := True;
      MameXmlUseDoc.DocumentElement.SetAttribute('HiScoreChecked','True');
      MameXmlUseDoc.Save(MameDatabaseFile,ofNone);
    end
  else
    begin
      Conf.sEdit16.Enabled := False;
      Conf.sEdit16.Text := '';
      Conf.sLabel103.Visible := False;
      Conf.sBitBtn99.Enabled := False;
      MameXmlUseDoc.DocumentElement.SetAttribute('HiScoreChecked','False');
      MameXmlUseDoc.Save(MameDatabaseFile,ofNone);
    end;
end;

procedure FindHiScoreDat_MamePlus;
begin
  gFindFiles := 'hiscoredat_mameplus';
  Conf.Find_Files.InitialDir := HiScorePath;
  Conf.Find_Files.Filter := 'HiScore.dat|hiscore.dat';
  Conf.Find_Files.Execute;
end;

procedure FindHiScoreDat_MameXT;
begin
  gFindFiles := 'hiscoredat_mamext';
  Conf.Find_Files.InitialDir := HiScorePath;
  Conf.Find_Files.Filter := 'HiScore.dat|hiscore.dat';
  Conf.Find_Files.Execute;
end;

procedure FindHiScoreDat_MamePlusReturn;
begin
  Conf.sEdit12.Text := Conf.Find_Files.FileName;
  Conf.sLabel102.Visible := False;
end;

procedure FindHiScoreDat_MameXTReturn;
begin
  Conf.sEdit16.Text := Conf.Find_Files.FileName;
  Conf.sLabel103.Visible := False;
end;

procedure FindIPSDir_MamePlus;
begin
  gFindDirs := 'IPSDir_mameplus';
  if SelectDirectory(IPSPath, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
    global_Find_DirsClose;
end;

procedure FindIPSDir_MameXT;
begin
  gFindDirs := 'IPSDir_mamext';
  if SelectDirectory(IPSPath, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
    global_Find_DirsClose;
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
    end
  else if Name = 'MameXT' then
    begin
      Conf.nxtgrd_ips_mamext.Columns.Add(TNxTreeColumn,'Game Name ID');
      Conf.nxtgrd_ips_mamext.Columns.Add(TNxCheckBoxColumn,'Apply');
      Conf.nxtgrd_ips_mamext.Columns.Add(TNxTextColumn,'IPS Name');
      Conf.nxtgrd_ips_mamext.Columns.Add(TNxTextColumn,'Hacker');
      Conf.nxtgrd_ips_mamext.Columns.Add(TNxTextColumn,'Translator');
      Conf.nxtgrd_ips_mamext.Columns.Add(TNxTextColumn,'Description');
      Conf.nxtgrd_ips_mamext.Columns.Add(TNxTextColumn,'Date');
      Conf.nxtgrd_ips_mamext.Columns.Add(TNxGraphicColumn,'Game Image');
      Conf.nxtgrd_ips_mamext.Columns.Add(TNxTextColumn,'Image_Path');
      Conf.nxtgrd_ips_mamext.Columns[1].Alignment := taCenter;
      Conf.nxtgrd_ips_mamext.Columns[8].Visible := False;    
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

procedure IpsMameXT_Expand(ARow: Integer);
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
            if (ARow + k) > conf.nxtgrd_ips_mamext.RowCount -1 then
              Break
            else
              if Conf.nxtgrd_ips_mamext.Cell[0,ARow+k].AsString = '' then
                begin
                  GamePic := TPNGObject.Create;
                  ImagePath := Conf.nxtgrd_ips_mamext.Cell[8,ARow+k].AsString;
                  GamePic.LoadFromFile(ImagePath);
                  Conf.nxtgrd_ips_mamext.Cell[7,ARow+k].ObjectReference := GamePic;
                end
              else
                Break;
        end
      else if (IsIPSChecked = True) and (Conf.nxtgrd_ips_mamext.RowCount -1 = ARow + 1) then
        IsIPSChecked := False;
    end;
end;

procedure MameBuilds_Clear;
begin
  Conf.sCheckBox44.Checked := False;
  Conf.sCheckBox128.Checked := False;
  Conf.sCheckBox129.Checked := False;
  Conf.sCheckBox130.Checked := False;
  Conf.sCheckBox32.Checked := False;
  Conf.sCheckBox10.Checked := False;
  Conf.sCheckBox33.Checked := False;
  Conf.sCheckBox34.Checked := False;
  Conf.sEdit12.Text := '';
  Conf.sEdit13.Text := '';
  Conf.sEdit16.Text := '';
  Conf.sEdit17.Text := '';
  Conf.sbar_Mame_UITransparent_MamePlus.Position := 0;
  Conf.sbar_Mame_UITransparent_MameXT.Position := 0;
  Conf.sComboBox76.ItemIndex := 0;
  Conf.sLabel39.Caption := 'Play Count : 0';
  Conf.sLabel40.Caption := 'Play Time : 0';
  Conf.nxtgrd_ips_mameplus.Columns.Clear;
  Conf.nxtgrd_ips_mameplus.ClearRows;
  Conf.nxtgrd_ips_mameplus.Caption := 'I Have no Data to Show.';
  Conf.nxtgrd_ips_mamext.Columns.Clear;
  Conf.nxtgrd_ips_mamext.ClearRows;
  Conf.nxtgrd_ips_mamext.Caption := 'I Have no Data to Show.';
  Conf.LMDFontComboBox1.ItemIndex := -1;
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
  else if (Mame_Exe = 'mamepuiXT_x86.exe') or (Mame_Exe = 'mamepuiXT_x64.exe') then
    begin
      Conf.sCheckBox44.Checked := True;
      Conf.sCheckBox128.Checked := False;
      Conf.sCheckBox129.Checked := False;
      Conf.sEdit16.Text := '';
      Conf.sbar_Mame_UITransparent_MameXT.Position := 215;
      MameUITrasparentChange_MameXT;
      Conf.sCheckBox130.Checked := False;
      Conf.sEdit17.Text := '';
      Conf.nxtgrd_ips_mamext.Columns.Clear;
      Conf.nxtgrd_ips_mamext.ClearRows;
      Conf.nxtgrd_ips_mamext.Caption := 'I Have no Data to Show.';
      Conf.sButton8.Enabled := False;
      CheckTopicsConfig;
    end;
end;

procedure CheckMameBuilds_TopicSettings;
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
  else if (Mame_Exe = 'mamepuiXT_x86.exe') or (Mame_Exe = 'mamepuiXT_x64.exe') then
    begin
      if Conf.sCheckBox44.Checked <> True then
        Conf.sButton8.Enabled := True;
      if Conf.sCheckBox128.Checked <> False then
        Conf.sButton8.Enabled := True;
      if Conf.sCheckBox129.Checked <> False then
        Conf.sButton8.Enabled := True;
      if Conf.sbar_Mame_UITransparent_MameXT.Position <> 215 then
        Conf.sButton8.Enabled := True;
      if Conf.sCheckBox130.Checked <> False then
        Conf.sButton8.Enabled := True;
    end;
end;

procedure CheckButtonTopicsConfig_MameBuilds;
begin
  CheckMameBuilds_TopicSettings;
  CheckTopicsConfig;
end;

procedure ZeroPlayTime_Count(GameName:String);
var
  Game,GamePath,GameCT,GameLine: string;
  i,i1,k,k1: Integer;
begin
  if MessageDlg('Game Name = ('+GameName+')'+#10+#13+'This action will zero the game play count and the time play count.'+#10+#13+'Do you really want to do this?',
    mtWarning,mbOKCancel,0) = mrOk then
    begin
      GamePath := ExtractFilePath(Mame_Exe)+'ini\mameui.ini';
      k:= 0;
      for i:= k to GamePlayTime_Memo.Lines.Count -1 do
        begin
          Game := GamePlayTime_Memo.Lines.Strings[i];
          if (Game <> '# DISPLAY STATE OPTIONS') and (Game <> '# INTERFACE OPTIONS') and (Game <> '# SEARCH PATH OPTIONS') and
            (Game <> '# FILENAME OPTIONS') and (Game <> '# NAVIGATION KEY CODES') and (Game <> '# NAVIGATION JOYSTICK CODES') then
            begin
              k1 := Pos('#',Game);
              if k1 <> 0 then
                begin
                  Delete(Game,1,2);
                  if (Game <> '') and (Game = Conf.sComboBox76.Text) then
                    begin
                      GameLine := GamePlayTime_Memo.Lines.Strings[i+2];
                      i1 := Pos(' ',GameLine);
                      GameCT := Trim(Copy(GameLine,0,i1-1));
                      GamePlayTime_Memo.Lines.Delete(i+2);
                      GamePlayTime_Memo.Lines.Insert(i+2,GameCT+'        0');
                      GameLine := GamePlayTime_Memo.Lines.Strings[i+3];
                      i1 := Pos(' ',GameLine);
                      GameCT := Trim(Copy(GameLine,0,i1-1));
                      GamePlayTime_Memo.Lines.Delete(i+3);
                      GamePlayTime_Memo.Lines.Insert(i+3,GameCT+'        0');
                      Conf.sLabel39.Caption := 'Play Count : 0';
                      Conf.sLabel40.Caption := 'Play Time : 0';
                      Break;
                    end;
                end;
            end;
        end;
      GamePlayTime_Memo.Lines.SaveToFile(GamePath);
    end;
end;

procedure RunGameCount_PlayTime_MameXT_Memo;
var
  GamePath,Game: string;
  GameCount: TextFile;
  Lines,Count: Integer;
begin
  lines := 0;
  Count := 0;
  GamePlayTime_Memo := TMemo.Create(Conf);
  GamePlayTime_Memo.Parent := Conf;
  GamePlayTime_Memo.Visible := False;
  GamePlayTime_Memo.Align := alClient;
  GamePlayTime_Memo.WordWrap := False;
  GamePath := FullPathMame_Exe+'ini\mameui.ini';
  AssignFile(GameCount,GamePath);
  Reset(GameCount);
    while not Eof(GameCount) do
      begin
        Readln(GameCount,Game);
        Lines := Lines + 1;
      end;
  CloseFile(GameCount);
  AssignFile(GameCount,GamePath);
  Reset(GameCount);
    while not Eof(GameCount) do
      begin
        Readln(GameCount,Game);
        Count := Count + 1;
        GamePlayTime_Memo.Lines.Add(Game);
        if FromArrows_Mamedirs = False then
          begin
            if FromDatabase = False then
              begin
                Splash_Screen.Progress_Label(((100 * Count) div (Lines-1)),'Loading MameXT Play/Time Count List');
                Splash_Screen.sGauge_Splash.Suffix := '%';
              end
            else
              begin
                Conf.sGauge_MameData.Progress := (100 * Count) div (Lines-1);
                Conf.sGauge_MameData.Suffix := '%';
                Conf.sLabel109.Caption := 'Loading MameXT Play/Time Count List';
              end;
          end
        else
          begin
            Conf.sGauge_MameChange.Progress := (100 * Count) div (Lines-1);
            Conf.sGauge_MameChange.Suffix := '%';
            Conf.sLabel112.Caption := 'Loading MameXT Play/Time Count List';
          end;
        Application.ProcessMessages;
      end;
  CloseFile(GameCount);
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

procedure SetTheNewIPSDir_MameXT;
begin
  Conf.sEdit17.Text := IPSPath;
  Conf.nxtgrd_ips_mamext.Columns.Clear;
  Conf.nxtgrd_ips_mamext.ClearRows;
  Conf.nxtgrd_ips_mamext.Caption := 'I Have no Data to Show.';
  NewIpsDir:= True;
  Conf.sCheckBox130.Checked := False;
  Conf.sCheckBox130.Checked := True;
end;

procedure Show_mame_buildspanel;
begin
  if (Cmenustate = 'em_arcade_mame_graphics') then
    em_mame_graphics_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_sound') then
    em_mame_sound_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_others') then
    em_mame_others_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_paths') then
    em_mame_dirs_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_database') then
    em_mame_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn10.Caption,False,True);
  Cmenustate := 'em_arcade_mame_builds';
  em_mame_builds_ShowDynamicComps;
  ShowButtonDown(10,'EM_ARCADE_MAME_BUILDS');
  CheckButtonTopicsConfig_MameBuilds;
  ShowHidePanel(CurrentPanel,'Pem_mame_builds');
end;

procedure em_mame_builds_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_mame_builds,'media\confeditor\images\mame\mame.png',
              -10,587,155,85,i,True);
        2 : Image_Comp(Conf.Pem_mame_builds,'media\confeditor\images\mame\mame_image.png',
              558,381,169,280,i,True);
        3 : Image_Comp(Conf.Pem_mame_builds,'media\confeditor\images\mame\builds.png',
              613,2,132,71,i,True);
      end;
    end;
end;

procedure em_mame_builds_FreeDynamicComps;
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
