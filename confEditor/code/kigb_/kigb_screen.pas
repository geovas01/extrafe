unit kigb_screen;

interface
uses
  SysUtils,Classes,ExtCtrls,StdCtrls,Controls;

  procedure SetKigb_ScreenfromKigbIni;
  procedure SaveKigb_ScreenAtExit;

  procedure OnPallete_CustomClick;
  procedure OnPallete_AllOtherExeptCustomClick;
  procedure OnPallete_ColorPanelClick(Color: Integer);
  procedure OnPallete_ChangeCustomColor;

// Menu actions
  procedure Show_kigb_screenpanel;
  procedure em_kigb_screen_ShowDynamicComps;
  procedure em_kigb_screen_FreeDynamicComps;

var
  PanelColor: Integer;  

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  kigb_paths,kigb_sound,kigb_others,kigb_database;

procedure SetKigb_ScreenfromKigbIni;
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
          if t1 = 'SIZE_FACTOR' then
            begin
              if t2 = '1' then
                Conf.rb39.Checked := True
              else if t2 = '2' then
                Conf.rb40.Checked := True
              else if t2 = '3' then
                Conf.rb41.Checked := True;
            end
          else if t1 = 'FULL_SCREEN' then
            begin
              if t2 = '1' then
                Conf.rb41.Checked := True
            end
          else if t1 = 'SPRITE_SHADOW' then
            begin
              if t2 = '1' then
                Conf.sCheckBox116.Checked := True;
            end
          else if t1 = 'MIX_FRAME' then
            begin
              if t2 = '1' then
                Conf.sCheckBox118.Checked := True;  
            end
          else if t1 = 'VIDEO_FILTER' then
            case StrToInt(t2) of
              0 : Conf.rb48.Checked := True;
              1 : Conf.rb49.Checked := True;
              2 : Conf.rb50.Checked := True;
              3 : Conf.rb51.Checked := True;
              4 : Conf.rb52.Checked := True;
              5 : Conf.rb53.Checked := True;
            end
          else if t1 = 'PALETTE' then
            case StrToInt(t2) of
              0 : Conf.rb43.Checked := True;
              1 : Conf.rb44.Checked := True;
              2 : Conf.rb45.Checked := True;
              3 : Conf.rb46.Checked := True;
              4 : Conf.rb47.Checked := True;
            end
        end;
      CloseFile(KigbCfgFile);
    end;
end;

procedure SaveKigb_ScreenAtExit;
var
  Comp: TComponent;
  k,l: Integer;
  Text,t1,t2: string;
begin
  if Kigb_Exe <> '' then
    begin
      Comp := FindComponentEx('Conf.MemoEmu_Kigb');
      for k:= 0 to TMemo(Comp).Lines.Count - 1 do
        begin
          Text := TMemo(Comp).Lines.Strings[k];
          l := Pos('=',Text);
          t1 := Trim(Copy(Text,0,l - 1));
          if t1 = 'SIZE_FACTOR' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.rb39.Checked = True then
                t2 := '1'
              else if Conf.rb40.Checked = True then
                t2 := '2'
              else if Conf.rb41.Checked = True then
                t2 := '3';
              TMemo(Comp).Lines.Insert(k,'SIZE_FACTOR = '+ t2);
            end
          else if t1 = 'FULL_SCREEN' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.rb41.Checked = True then
                TMemo(Comp).Lines.Insert(k,'FULL_SCREEN = 1')
              else
                TMemo(Comp).Lines.Insert(k,'FULL_SCREEN = 0');
            end
          else if t1 = 'SPRITE_SHADOW' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox116.Checked = True then
                TMemo(Comp).Lines.Insert(k,'SPRITE_SHADOW = 1')
              else
                TMemo(Comp).Lines.Insert(k,'SPRITE_SHADOW = 0');
            end
          else if t1 = 'MIX_FRAME' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.sCheckBox118.Checked = True then
                TMemo(Comp).Lines.Insert(k,'MIX_FRAME = 1')
              else
                TMemo(Comp).Lines.Insert(k,'MIX_FRAME = 0');
            end
          else if t1 = 'VIDEO_FILTER' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.rb48.Checked = True then
                t2 := '0'
              else if Conf.rb49.Checked = True then
                t2 := '1'
              else if Conf.rb50.Checked = True then
                t2 := '2'
              else if Conf.rb51.Checked = True then
                t2 := '3'
              else if Conf.rb52.Checked = True then
                t2 := '4'
              else if Conf.rb53.Checked = True then
                t2 := '5';
              TMemo(Comp).Lines.Insert(k,'VIDEO_FILTER = '+ t2);
            end
          else if t1 = 'PALETTE' then
            begin
              TMemo(Comp).Lines.Delete(k);
              if Conf.rb43.Checked = True then
                t2 := '0'
              else if Conf.rb44.Checked = True then
                t2 := '1'
              else if Conf.rb45.Checked = True then
                t2 := '2'
              else if Conf.rb46.Checked = True then
                t2 := '3'
              else if Conf.rb47.Checked = True then
                t2 := '4';
              TMemo(Comp).Lines.Insert(k,'PALETTE = '+ t2);
            end;
        end;
    end;
end;

procedure OnPallete_CustomClick;
var
  Comp: TComponent;
  k: Integer;
begin
  Conf.grp81.Visible := True;
  for k := 0 to 3 do
    begin
      Comp := FindComponentEx('Conf.pnl'+ IntToStr(k + 1));
      TPanel(Comp).BevelInner := bvNone;
    end;
end;

procedure OnPallete_AllOtherExeptCustomClick;
begin
  Conf.grp81.Visible := False;
  Conf.JvOfficeColorPanel1.Visible := False;
end;

procedure OnPallete_ColorPanelClick(Color: Integer);
var
  Comp: TComponent;
  k: Integer;
begin
  Conf.JvOfficeColorPanel1.Visible := True;
  PanelColor := Color;
  for k := 0 to 3 do
    begin
      Comp := FindComponentEx('Conf.pnl'+ IntToStr(k + 1));
      TPanel(Comp).BevelInner := bvNone;
    end;
  Comp := FindComponentEx('Conf.pnl'+ IntToStr(PanelColor+1));
  TPanel(Comp).BevelInner := bvLowered;
end;

procedure OnPallete_ChangeCustomColor;
var
  Comp: TComponent;
begin
  Comp := FindComponentEx('Conf.pnl'+ IntToStr(PanelColor+1));
  TPanel(Comp).Color := Conf.JvOfficeColorPanel1.SelectedColor;
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_kigb_screenpanel;
begin
  if (Cmenustate = 'em_handheld_kigb_paths') then
    em_kigb_paths_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_sound') then
    em_kigb_sound_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_others') then
    em_kigb_others_FreeDynamicComps
  else if (Cmenustate = 'em_handheld_kigb_database') then
    em_kigb_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'em_handheld_kigb_screen';
  em_kigb_screen_ShowDynamicComps;
  ShowButtonDown(7,'EM_HANDHELDS_NINTENDO_KIGB_SCREEN');
  Conf.Pem_kigb_sound.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_kigb_screen');
end;

procedure em_kigb_screen_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_kigb_screen,'media\confeditor\images\kigb\kigb.png',
              3,590,90,71,i,'',True,False);
        2 : Image_Comp(Conf.Pem_kigb_screen,'media\confeditor\images\kigb\kigb_image.png',
              582,538,147,120,i,'',True,False);
        3 : Image_Comp(Conf.Pem_kigb_screen,'media\confeditor\images\kigb\screen.png',
              607,2,120,71,i,'',True,False);
      end;
    end;
end;

procedure em_kigb_screen_FreeDynamicComps;
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
 