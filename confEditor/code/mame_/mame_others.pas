unit mame_others;

interface
uses
  SysUtils,Classes,ExtCtrls,StdCtrls;

  procedure SetMame_OthersFromMameIni;
  procedure SaveMame_OthersAtExit;
  
  procedure MameBeamWidthChange;
  procedure MameFlickerChange;
  procedure MameThreadPriorityChange;

  procedure ResetToDefaultTopic_MameOthers;
  procedure CheckMameOthers_TopicSettings;
  procedure CheckButtonTopicsConfig_MameOthers;

  procedure MameOthers_Clear;

// Menu actions
  procedure Show_mame_otherspanel;
  procedure em_mame_others_ShowDynamicComps;
  procedure em_mame_others_FreeDynamicComps;  

var
  FromMame_OthersToFindOthers: Boolean;

implementation

uses
  main,mainconf,menu,onflycomponents,FunctionX,
  mame_dirs,mame_graphics,mame_sound,mame_builds,mame_database;

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
    end;
  Started := False;
end;

procedure SaveMame_OthersAtExit;
var
  k,x: Integer;
  value,t1,t2: string;
  Comp: TComponent;
begin
  if Mame_Exe <> '' then
    begin
      Comp := FindComponentEx('Conf.MemoEmu1');
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
    end;
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

procedure Show_mame_otherspanel;
begin
  if (Cmenustate = 'em_arcade_mame_graphics') then
    em_mame_graphics_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_sound') then
    em_mame_sound_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_paths') then
    em_mame_dirs_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_builds') then
    em_mame_builds_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_mame_database') then
    em_mame_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn9.Caption,False,True);
  Cmenustate := 'em_arcade_mame_others';
  em_mame_others_ShowDynamicComps;
  ShowButtonDown(9,'EM_ARCADE_MAME_OTHERS');
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
              -10,587,155,85,i,True);
        2 : Image_Comp(Conf.Pem_mame_others,'media\confeditor\images\mame\mame_image.png',
              558,381,169,280,i,True);
        3 : Image_Comp(Conf.Pem_mame_others,'media\confeditor\images\mame\others.png',
              609,2,136,71,i,True);
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
