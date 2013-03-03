unit mame_hlsl;

interface
uses
  SysUtils,StdCtrls,Controls,Classes,ExtCtrls,
  sEdit,sScrollbar,sLabel;
  
  procedure SetMame_HlslFromMameIni;
  procedure SaveMame_HlslAtExit;

  procedure Enable_HLSL(enable: Boolean);
  procedure HLSL_ButtonSwithcesClick;
  procedure HLSL_ButtonSurface_ColorClick;
  procedure HLSL_ButtonNTSCClick;
  procedure Enable_HLSL_YIQ(enable: Boolean);

  procedure HLSL_MovingScrollbar(strScrollbar,strLabel,strPerCent: string; dia: integer);
  procedure SetRGBValues(sValue,seRed,seGreen,seBlue: string);
  
// Menu actions
  procedure Show_mame_hlslpanel;
  procedure em_mame_hlsl_ShowDynamicComps;
  procedure em_mame_hlsl_FreeDynamicComps;  

var
  FromMame_BuildsToFindBuilds,FontFromSystem,IPSRunFirst: Boolean;
  IPSPath,HiScoreFile,HiScorePath,ipsNotFoundImg: String;
  IsIPSChecked,IsApplyChecked,NewIPSDir: Boolean;

implementation
uses
  main,mainconf,FunctionX,global,menu,onflycomponents,
  form_general,form_splash,
  mame_dirs,mame_graphics,mame_sound,mame_others,mame_database,
  ce_logsession;


procedure SetMame_HlslFromMameIni;
var
  MameIniFile: TextFile;
  value,text,t1,t2,rt1,rt2: String;
  r,rPos: Integer;
  DiffNum: Extended;  
begin
  if Started = True then
    begin
      value := FullPathMame_Exe + 'mame.ini';
      AssignFile(MameIniFile,value);
      Reset(MameIniFile);
      while not Eof(MameIniFile) do
        begin
          Readln( MameIniFile,text);
          r := Pos(' ',text);
          t1 := Trim(Copy(text,0,r));
          t2 := Trim(Copy(text,r,100));
          if t1 = 'hlsl_enable' then
            begin
              if t2 = '0' then
                Enable_HLSL(False)
              else if t2 = '1' then
                Enable_HLSL(True);                
            end
          else if t1 = 'hlslpath' then
            begin 
              if t2 = 'hlsl' then 
                Conf.sEdit16.Text := FullPathMame_Exe + 'hlsl\'
              else 
                Conf.sEdit16.Text := t2;
            end
          else if t1 = 'hlsl_ini_read' then
            Conf.sCheckBox66.Checked := StrToBool(t2)
          else if t1 = 'hlsl_ini_write' then
            Conf.sCheckBox67.Checked := StrToBool(t2)
          else if t1 = 'hlsl_write' then
            begin
              if (t2 = '') or (t2 = '0')  then
                Conf.sCheckBox68.Checked := False
              else
                Conf.sCheckBox68.Checked := True;
            end
          else if t1 = 'hlsl_preset' then
            begin
              if t2 = '-1' then 
                Conf.sComboBox76.ItemIndex := 0
              else
                Conf.sComboBox76.ItemIndex := StrToInt(t2) + 1;
            end
          else if t1 = 'hlsl_snap_width' then 
            Conf.sEdit17.Text := t2
          else if t1 = 'hlsl_snap_height' then
            Conf.sEdit32.Text := t2
          //  First tab is over here....
          else if t1 = 'shadow_mask_alpha' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 100;
              Conf.sScrollBar1.Position := Round(DiffNum);
              HLSL_MovingScrollbar('sScrollbar1','lbl35','0.00',100);
            end
          else if t1 = 'shadow_mask_texture' then
            begin
              if StrScan(PChar(t2),'\') <> nil then                
                Conf.sEdit35.Text := t2
              else
                Conf.sEdit35.Text := FullPathMame_Exe + 'artwork\' + t2;
            end
          else if t1 = 'shadow_mask_usize' then 
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 1000000;
              Conf.sScrollBar2.Position := Round(DiffNum);
              HLSL_MovingScrollbar('sScrollbar2','lbl37','0.000000',1000000);
            end
          else if t1 = 'shadow_mask_vsize' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 1000000;
              Conf.sScrollBar3.Position := Round(DiffNum);
              HLSL_MovingScrollbar('sScrollbar3','lbl39','0.000000',1000000);
            end
          else if t1 = 'curvature' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 100;
              Conf.sScrollBar4.Position := Round(DiffNum);
              HLSL_MovingScrollbar('sScrollbar4','lbl41','0.00',100);
            end
          else if t1 = 'pincushion' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 100;
              Conf.sScrollBar5.Position := Round(DiffNum);
              HLSL_MovingScrollbar('sScrollbar5','lbl43','0.00',100);
            end
          else if t1 = 'scanline_alpha' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 100;
              Conf.sScrollBar6.Position := Round(DiffNum);
              HLSL_MovingScrollbar('sScrollbar6','lbl45','0.00',100);
            end
          else if t1 = 'scanline_size' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 100;
              Conf.sScrollBar7.Position := Round(DiffNum);
              HLSL_MovingScrollbar('sScrollbar7','lbl47','0.00',100);
            end
          else if t1 = 'scanline_height' then
            Conf.sEdit113.Text := t2 
          else if t1 = 'scanline_bright_scale' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 100;
              Conf.sScrollBar8.Position := Round(DiffNum);
              HLSL_MovingScrollbar('sScrollbar8','lbl49','0.00',100);
            end
          else if t1 = 'scanline_bright_offset' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 100;
              Conf.sScrollBar9.Position := Round(DiffNum);            
              HLSL_MovingScrollbar('sScrollbar9','lbl51','0.00',100);
            end
          else if t1 = 'scanline_jitter' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 100;
              Conf.sScrollBar10.Position := Round(DiffNum);            
              HLSL_MovingScrollbar('sScrollbar10','lbl53','0.00',100);
            end
          else if t1 = 'defocus' then
            begin
              rPos := Pos(',',t2);
              rt1 := Trim(Copy(t2,0,(rPos - 1)));
              rt2 := Trim(Copy(t2,(rPos + 1),100));
              Conf.sEdit114.Text := rt1;
              Conf.sEdit115.Text := rt2;
            end
          else if t1 = 'saturation' then
            begin
              DecimalSeparator := '.';
              DiffNum := StrToFloat(t2) * 100;
              Conf.sScrollBar11.Position := Round(DiffNum);            
              HLSL_MovingScrollbar('sScrollbar11','lbl55','0.00',100);
            end
          else if t1 = 'converge_x' then
            SetRGBValues(t2,'sEdit36','sEdit34','sEdit33')
          else if t1 = 'converge_y' then
            SetRGBValues(t2,'sEdit37','sEdit38','sEdit39')
          else if t1 = 'radial_converge_x' then
            SetRGBValues(t2,'sEdit40','sEdit41','sEdit42')
          else if t1 = 'radial_converge_y' then
            SetRGBValues(t2,'sEdit43','sEdit44','sEdit45')
          else if t1 = 'red_ratio' then
            SetRGBValues(t2,'sEdit46','sEdit47','sEdit48')
          else if t1 = 'grn_ratio' then
            SetRGBValues(t2,'sEdit49','sEdit50','sEdit51')
          else if t1 = 'blu_ratio' then
            SetRGBValues(t2,'sEdit52','sEdit63','sEdit67')
          else if t1 = 'offset' then
            SetRGBValues(t2,'sEdit68','sEdit69','sEdit70')
          else if t1 = 'scale' then
            SetRGBValues(t2,'sEdit71','sEdit72','sEdit73')
          else if t1 = 'power' then
            SetRGBValues(t2,'sEdit76','sEdit77','sEdit78')
          else if t1 = 'floor' then
            SetRGBValues(t2,'sEdit79','sEdit80','sEdit98')
          else if t1 = 'phosphor_life' then
            SetRGBValues(t2,'sEdit99','sEdit100','sEdit101')
          // Second Tab is over here...
          else if t1 = 'yiq_enable' then
            begin
              Conf.sCheckBox65.Checked := StrToBool(t2);
              Enable_HLSL_YIQ(StrToBool(t2));            
            end
          else if t1 = 'yiq_cc' then 
            Conf.sEdit102.Text := t2
          else if t1 = 'yiq_a' then
            Conf.sEdit103.Text := t2
          else if t1 = 'yiq_b' then 
            Conf.sEdit104.Text := t2
          else if t1 = 'yiq_o' then
            Conf.sEdit105.Text := t2
          else if t1 = 'yiq_p' then
            Conf.sEdit106.Text := t2 
          else if t1 = 'yiq_n' then
            Conf.sEdit107.Text := t2
          else if t1 = 'yiq_y' then
            Conf.sEdit108.Text := t2
          else if t1 = 'yiq_i' then
            Conf.sEdit109.Text := t2
          else if t1 = 'yiq_q' then
            Conf.sEdit110.Text := t2
          else if t1 = 'yiq_scan_time' then
            Conf.sEdit111.Text := t2
          else if t1 = 'yiq_phase_count' then
            Conf.sEdit112.Text := t2;
          // Third Tab is over here...
        end;
      CloseFile(MameIniFile);
    end;
end;

procedure SaveMame_HlslAtExit;
begin
//
end;

procedure HLSL_MovingScrollbar(strScrollbar,strLabel,strPerCent: string; dia: integer);
var
  PosNum: Single;
  comp: Tcomponent;
begin
  comp := FindComponentEx('Conf.' + strScrollbar);
  PosNum := TsScrollBar(comp).Position;
  comp := FindComponentEx('Conf.' + strLabel);
  TsLabel(comp).Caption := FormatFloat(strPerCent,(PosNum / dia));
end;

procedure SetRGBValues(sValue,seRed,seGreen,seBlue: string);
var
  i,iPos: integer;
  t1,t2: String;
  comp: Tcomponent;
begin
  i := 0;
  repeat 
    if i = 0 then 
      begin
        iPos := Pos(',',sValue);
        t1 := Trim(Copy(sValue,0,(iPos - 1)));
        t2 := Trim(Copy(sValue,(iPos + 1),100));
      end
    else
      begin
        iPos := Pos(',',t2);
        t1 := Trim(Copy(t2,0,(iPos - 1)));
        t2 := Trim(Copy(t2,(iPos + 1),100));                    
      end;                
    case i of
      0 : begin
            comp := FindComponentEx('Conf.' + seRed);
            TsEdit(comp).Text := t1;
          end;
      1 : begin
            comp := FindComponentEx('Conf.' + seGreen);      
            TsEdit(comp).Text := t1;
            comp := FindComponentEx('Conf.' + seBlue);      
            TsEdit(comp).Text := t2;
          end;
    end;
    i := i + 1;
  until i = 2;   
end;


procedure Enable_HLSL(enable: Boolean);

  procedure LightUp(Light: Boolean);
  begin
    Conf.sBitBtn44.Enabled := Light;
    Conf.sBitBtn45.Enabled := Light;
    Conf.sBitBtn46.Enabled := Light;
    Conf.sPanel86.Enabled := Light;
    Conf.sPanel86.Visible := Light;
    Conf.sPanel87.Visible := Light;
    Conf.sPanel90.Visible := Light;
    Conf.sBitBtn33.Enabled := Light;
    Conf.sCheckBox65.Enabled := Light;
    Conf.sCheckBox66.Enabled := Light;
    Conf.sCheckBox67.Enabled := Light;
    Conf.sCheckBox68.Enabled := Light;
    Conf.sComboBox76.Enabled := Light;
    Conf.sEdit16.Enabled := Light;
    Conf.sEdit17.Enabled := Light;
    Conf.sEdit32.Enabled := Light;
  end;
begin
  if enable = True then
    begin
      LightUp(enable);
      Conf.sPanel87.Visible := False;
    Conf.sPanel90.Visible := False;
    end
  else
    begin
      LightUp(enable);
      Conf.sBitBtn44.Down := True;
      Conf.sBitBtn45.Down := False;
      Conf.sBitBtn46.Down := False;
      Conf.sPanel86.Visible := True;      
    end;
end;

procedure HLSL_ButtonSwithcesClick;
begin
  Conf.sBitBtn44.Down := True;
  Conf.sBitBtn45.Down := False;
  Conf.sBitBtn46.Down := False;
  Conf.sPanel86.Visible := True;
  Conf.sPanel87.Visible := False;
  Conf.sPanel90.Visible := False;
end;

procedure HLSL_ButtonSurface_ColorClick;
begin
  Conf.sBitBtn44.Down := False;
  Conf.sBitBtn45.Down := True;
  Conf.sBitBtn46.Down := False;
  Conf.sPanel86.Visible := False;
  Conf.sPanel87.Visible := True;
  Conf.sPanel90.Visible := False;
end;

procedure HLSL_ButtonNTSCClick;
begin
  Conf.sBitBtn44.Down := False;
  Conf.sBitBtn45.Down := False;
  Conf.sBitBtn46.Down := True;
  Conf.sPanel86.Visible := False;
  Conf.sPanel87.Visible := False;
  Conf.sPanel90.Visible := True;
end;

procedure Enable_HLSL_YIQ(enable: Boolean);
begin
  Conf.sEdit102.Enabled := enable;
  Conf.sEdit103.Enabled := enable;
  Conf.sEdit104.Enabled := enable;
  Conf.sEdit105.Enabled := enable;
  Conf.sEdit106.Enabled := enable;
  Conf.sEdit107.Enabled := enable;
  Conf.sEdit108.Enabled := enable;
  Conf.sEdit109.Enabled := enable;
  Conf.sEdit110.Enabled := enable;
  Conf.sEdit111.Enabled := enable;
  Conf.sEdit112.Enabled := enable;
end;

/////////////////////////////////////////////////////////////

procedure Show_mame_hlslpanel;
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
  ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,True);
  Cmenustate := 'em_arcade_mame_hlsl';
  em_mame_hlsl_ShowDynamicComps;
  ShowButtonDown(8,'EM_ARCADE_MAME_BUILDS');
  CheckButtonTopicsConfig_MameHlsl;
  ShowHidePanel(CurrentPanel,'Pem_mame_hlsl');
end;

procedure em_mame_hlsl_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_mame_hlsl,'media\confeditor\images\mame\mame.png',
              -10,587,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pem_mame_hlsl,'media\confeditor\images\mame\mame_image.png',
              558,381,169,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_mame_hlsl,'media\confeditor\images\mame\hlsl.png',
              613,2,132,71,i,'',True,False);
      end;
    end;
end;

procedure em_mame_hlsl_FreeDynamicComps;
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
