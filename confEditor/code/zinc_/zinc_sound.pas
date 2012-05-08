unit zinc_sound;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetZinc_SoundFromZincIni;
  procedure SaveZinc_SoundAtExit;

  procedure Zinc_FilterEnabled;
  procedure Zinc_SurroundLiteEnabled;

// Menu actions
  procedure Show_zinc_soundpanel;
  procedure em_zinc_sound_ShowDynamicComps;
  procedure em_zinc_sound_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,onflycomponents,FunctionX,
  zinc_graphics,zinc_paths,zinc_database;

procedure Zinc_FilterEnabled;
begin
  Conf.sEdit74.Enabled := Conf.sCheckBox84.Checked;
end;

procedure Zinc_SurroundLiteEnabled;
begin
  Conf.sEdit75.Enabled := Conf.sCheckBox85.Checked;
end;


procedure SetZinc_SoundFromZincIni;
var
  sound_textfile: TextFile;
  sound_path,t1,t2,TFile: string;
  r: Integer;
  ok: Boolean;

begin
  if Started = True then
    sound_path := Zinc_Config.ReadString('Zinc_Paths','Zinc_Sound',sound_path);
  AssignFile(sound_textfile,sound_path);
  Reset(sound_textfile);
  while not Eof(sound_textfile) do
    begin
      Readln(sound_textfile,Tfile);
      r := Pos('=',TFile);
      if r > 0 then
        begin
          t1 := Trim(Copy(TFile,0,r-1));
          t2 := Trim(Copy(TFile,r+1,Length(TFile)-r));
          if t2 = 'yes' then
            ok := True
          else
            ok := False;
          if t1 = '--use-sound' then
            Conf.sCheckBox79.Checked := ok
          else if t1 = '--sound-filter-enable' then
            begin
              Conf.sCheckBox84.Checked := ok;
              Zinc_FilterEnabled;
            end
          else if t1 = '--sound-filter-cutoff' then
              Conf.sEdit74.Text := t2
          else if t1 = '--sound-surround-lite-enable' then
            begin
              Conf.sCheckBox85.Checked := ok;
              Zinc_SurroundLiteEnabled;
            end
          else if t1 = '--sound-surround-lite-multiplier' then
            Conf.sEdit75.Text := t2
          else if t1 = '--sound-stereo-exciter' then
            Conf.sCheckBox80.Checked := ok
          else if t1 = '--use-slow-geometry' then
            Conf.sCheckBox81.Checked := ok
          else if t1 = '--use-stackinram-hack' then
            Conf.sCheckBox82.Checked := ok
          else if t1 = '--use-mem-predict' then
            Conf.sCheckBox83.Checked := ok
        end;
    end;
  CloseFile(sound_textfile);
end;

procedure SaveZinc_SoundAtExit;
var
  sound_textfile: TextFile;
  sound_path,t1,t2,t3,TFile: string;
  SoundSave: TStringList;
  r: Integer;
  ok: Boolean;
begin
  if Zinc_Exe <> '' then
    begin
  sound_path := Zinc_Config.ReadString('Zinc_Paths','Zinc_Sound',sound_path);
  SoundSave := TStringList.Create;
  AssignFile(sound_textfile,sound_path);
  Reset(sound_textfile);
  while not Eof(sound_textfile) do
    begin
      Readln(sound_textfile,Tfile);
      r := Pos('=',TFile);
      if r > 0 then
        begin
          t1 := Trim(Copy(TFile,0,r-1));
          if t1 = '--use-sound' then
            begin
              if Conf.sCheckBox79.Checked = True then
                t2 := 'yes'
              else
                t2 := 'no';
            end
          else if t1 = '--sound-filter-enable' then
            begin
              if Conf.sCheckBox84.Checked = True then
                t2 := 'yes'
              else
                t2 := 'no';
            end
          else if t1 = '--sound-filter-cutoff' then
            t2 := Conf.sEdit74.Text
          else if t1 = '--sound-surround-lite-enable' then
            begin
              if Conf.sCheckBox85.Checked = True then
                t2 := 'yes'
              else
                t2 := 'no';
            end
          else if t1 = '--sound-surround-lite-multiplier' then
            t2 := Conf.sEdit75.Text
          else if t1 = '--sound-stereo-exciter' then
            begin
              if Conf.sCheckBox80.Checked = True then
                t2 := 'yes'
              else
                t2 := 'no';
            end
          else if t1 = '--use-slow-geometry' then
            begin
              if Conf.sCheckBox81.Checked = True then
                t2 := 'yes'
              else
                t2 := 'no';
            end
          else if t1 = '--use-stackinram-hack' then
            begin
              if Conf.sCheckBox82.Checked = True then
                t2 := 'yes'
              else
                t2 := 'no';
            end
          else if t1 = '--use-mem-predict' then
            begin
              if Conf.sCheckBox83.Checked = True then
                t2 := 'yes'
              else
                t2 := 'no';
            end;
          t3 := t1 + '=' + t2;
        end
      else
        t3 := TFile;
      SoundSave.Add(t3);
    end;
  CloseFile(sound_textfile);
  SoundSave.SaveToFile(sound_path);
  SoundSave.Free;
  end;
end;

procedure Show_zinc_soundpanel;
begin
  if (Cmenustate = 'em_arcade_zinc_graphics') then
    em_zinc_graphics_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_zinc_paths') then
    em_zinc_paths_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_zinc_database') then
    em_zinc_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,True);
  Cmenustate := 'em_arcade_zinc_sound';
  em_zinc_sound_ShowDynamicComps;
  ShowButtonDown(8,'EM_ARCADE_ZINC_SOUND');
  ShowHidePanel(CurrentPanel,'Pem_zinc_sound');
end;

procedure em_zinc_sound_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_zinc_sound,'media\confeditor\images\zinc\zinc.png',
              3,590,97,75,i,True);
        2 : Image_Comp(Conf.Pem_zinc_sound,'media\confeditor\images\zinc\zinc_image.png',
              580,483,150,175,i,True);
        3 : Image_Comp(Conf.Pem_zinc_sound,'media\confeditor\images\zinc\sound.png',
              626,2,112,71,i,True);
      end;
    end;
end;

procedure em_zinc_sound_FreeDynamicComps;
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
