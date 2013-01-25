unit kigb_others;

interface
uses
  SysUtils,Classes,ExtCtrls,StdCtrls;

  procedure SetKigb_OthersfromKigbIni;
  procedure SaveKigb_OthersAtExit;

  procedure SetGB_Device(Num: Integer);
  procedure CheckNone_GB_Device;
  procedure CheckBGPrinter_GB_Device;
  procedure CheckBarcodeBoy_GB_Device;

// Menu actions
  procedure Show_kigb_otherspanel;
  procedure em_kigb_others_ShowDynamicComps;
  procedure em_kigb_others_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  kigb_screen,kigb_sound,kigb_paths,kigb_database;

procedure SetKigb_OthersfromKigbIni;
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
          if t1 = 'GB_DEVICE' then
            SetGB_Device(StrToInt(t2));
        end;
      CloseFile(KigbCfgFile);
    end;
end;

procedure SaveKigb_OthersAtExit;
var
  Comp: TComponent;
  k,l: Integer;
  Text,t1,t2: string;
begin
  Comp := FindComponentEx('Conf.MemoEmu_Kigb');
  for k:= 0 to TMemo(Comp).Lines.Count - 1 do
    begin
      Text := TMemo(Comp).Lines.Strings[k];
      l := Pos('=',Text);
      t1 := Trim(Copy(Text,0,l - 1));
      if t1 = 'GB_DEVICE' then
        begin
          TMemo(Comp).Lines.Delete(k);
          if Conf.rb36.Checked then
            t2 := '0'
          else if Conf.rb37.Checked then
            t2 := '1'
          else if Conf.rb38.Checked then
            t2 := '2';
          TMemo(Comp).Lines.Insert(k,'GB_DEVICE = ' + t2);
        end;
    end;
end;

procedure SetGB_Device(Num: Integer);
begin
  case num of
    0 : Conf.rb36.Checked := True;
    1 : Conf.rb37.Checked := True;
    2 : Conf.rb38.Checked := True;
  end;
end;

procedure CheckNone_GB_Device;
begin
  Conf.sCheckBox114.Enabled := False;
  Conf.sEdit96.Enabled := False;
  Conf.sEdit96.Text := '';
  Conf.sEdit97.Enabled := False;
  Conf.sEdit97.Text := '';
  Conf.sBitBtn95.Enabled := False;
  Conf.sBitBtn96.Enabled := False;
end;

procedure CheckBGPrinter_GB_Device;
begin
  Conf.sCheckBox114.Enabled := False;
  Conf.sEdit96.Enabled := False;
  Conf.sEdit96.Text := '';
  Conf.sEdit97.Enabled := False;
  Conf.sEdit97.Text := '';
  Conf.sBitBtn95.Enabled := False;
  Conf.sBitBtn96.Enabled := False;
end;

procedure CheckBarcodeBoy_GB_Device;
begin
  Conf.sCheckBox114.Enabled := True;
  Conf.sEdit96.Enabled := True;
  Conf.sEdit97.Enabled := True;
  Conf.sBitBtn95.Enabled := True;
  Conf.sBitBtn96.Enabled := True;
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_kigb_otherspanel;
begin
  if (Cmenustate = 'em_handheld_kigb_screen') then
    em_kigb_screen_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_sound') then
    em_kigb_sound_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_paths') then
    em_kigb_paths_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_database') then
    em_kigb_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn9.Caption,False,True);
  Cmenustate := 'em_handheld_kigb_others';
  em_kigb_others_ShowDynamicComps;
  ShowButtonDown(9,'EM_HANDHELDS_NINTENDO_KIGB_OTHERS');
  Conf.Pem_kigb_sound.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_kigb_others');
end;

procedure em_kigb_others_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_kigb_others,'media\confeditor\images\kigb\kigb.png',
              3,590,90,71,i,'',True,False);
        2 : Image_Comp(Conf.Pem_kigb_others,'media\confeditor\images\kigb\kigb_image.png',
              582,538,147,120,i,'',True,False);
        3 : Image_Comp(Conf.Pem_kigb_others,'media\confeditor\images\kigb\others.png',
              608,2,120,71,i,'',True,False);
      end;
    end;
end;

procedure em_kigb_others_FreeDynamicComps;
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
 