unit kigb_sound;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetKigb_SoundfromKigbIni;
  procedure SaveKigb_SoundAtExit;

// Menu actions
  procedure Show_kigb_soundpanel;
  procedure em_kigb_sound_ShowDynamicComps;
  procedure em_kigb_sound_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  kigb_screen,kigb_paths,kigb_others,kigb_database;

procedure SetKigb_SoundfromKigbIni;
var
  KigbCfgFile: TextFile;
  x: Integer;
  text,t1,t2: string;
begin
  if Kigb_Exe <> '' then
    begin
      AssignFile(KigbCfgFile,KigbCfg_File);
      Reset(KigbCfgFile);
      while not Eof(KigbCfgFile) do
        begin
          Readln(KigbCfgFile,text);
          x := Pos('=',text);
          t1 := Trim(Copy(text,0,x - 1));
          t2 := Trim(Copy(text,x + 1,Length(text) - x));
          if t1 = 'SOUND_ON' then
            begin
              if t2 = '1' then
                Conf.rb54.Checked := True
              else
                Conf.rb55.Checked := True;
            end
          else if t1 = 'SOUND_VOLUME' then
            Conf.sbar_kigb_soundvolume.Position := StrToInt(t2)
          else if t1 = 'SOUND_PAN' then
            Conf.sbar_kigb_soundpan.Position := StrToInt(t2)
          else if t1 = 'SOUND_QUALITY' then
            begin
              if t2 = '1' then
                Conf.sComboBox67.ItemIndex := 0
              else if t2 = '2' then
                Conf.sComboBox67.ItemIndex := 1
              else if t2 = '4' then
                Conf.sComboBox67.ItemIndex := 2;
            end
          else if t1 = 'SOUND_CHANNEL' then
            begin
              if t2 = '2' then
                Conf.sCheckBox126.Checked := True;            
            end
          else if t1 = 'SOUND_CHANNEL_1' then
            begin
              if t2 = '1' then
                Conf.sCheckBox121.Checked := True;
            end
          else if t1 = 'SOUND_CHANNEL_2' then
            begin
              if t2 = '1' then
                Conf.sCheckBox122.Checked := True;
            end
          else if t1 = 'SOUND_CHANNEL_3' then
            begin
              if t2 = '1' then
                Conf.sCheckBox123.Checked := True;
            end
          else if t1 = 'SOUND_CHANNEL_4' then
            begin
              if t2 = '1' then
                Conf.sCheckBox124.Checked := True;
            end
          else if t1 = 'SOUND_DIGITAL' then
            begin
              if t2 = '1' then
                Conf.sCheckBox125.Checked := True;
            end
//       Apo edo kai kato einai to keycode mapping...
        end;
    end;
end;

procedure SaveKigb_SoundAtExit;
begin
//
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_kigb_soundpanel;
begin
  if (Cmenustate = 'em_handheld_kigb_screen') then
    em_kigb_screen_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_paths') then
    em_kigb_paths_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_others') then
    em_kigb_others_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_database') then
    em_kigb_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,True);
  Cmenustate := 'em_handheld_kigb_sound';
  em_kigb_sound_ShowDynamicComps;
  ShowButtonDown(8,'EM_HANDHELDS_NINTENDO_KIGB_SOUND');
  ShowHidePanel(CurrentPanel,'Pem_kigb_sound');
end;

procedure em_kigb_sound_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_kigb_sound,'media\confeditor\images\kigb\kigb.png',
              3,590,90,71,i,True);
        2 : Image_Comp(Conf.Pem_kigb_sound,'media\confeditor\images\kigb\kigb_image.png',
              582,538,147,120,i,True);
        3 : Image_Comp(Conf.Pem_kigb_sound,'media\confeditor\images\kigb\sound.png',
              450,2,278,71,i,True);
      end;
    end;
end;

procedure em_kigb_sound_FreeDynamicComps;
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
 