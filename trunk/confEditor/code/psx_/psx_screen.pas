unit psx_screen;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetpSX_ScreenfrompSXIni;
  procedure SavepSX_ScreenAtExit;


  procedure pSX_gammaChange;
  procedure pSX_brightnessChange;
  procedure pSX_contrastChange;
  procedure pSX_ResetGraphs;


// Menu actions
  procedure Show_psx_screenpanel;
  procedure em_psx_screen_ShowDynamicComps;
  procedure em_psx_screen_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  psx_paths,psx_sound,psx_others,psx_database;


procedure SetpSX_ScreenfrompSXIni;
var
  Screen_Str: string;
  Screen_Int,res: Integer;
  DiffNum: Extended;
begin
  if pSX_Exe <> '' then
    begin
      Screen_Str := pSX_Ini.ReadString('Graphics','BilinearInterpolation',Screen_Str);
      if Screen_Str = '0' then
        Conf.sCheckBox103.Checked := False
      else
        Conf.sCheckBox103.Checked := True;
      Screen_Str := pSX_Ini.ReadString('Graphics','FrameSkip',Screen_Str);
      if Screen_Str = '0' then
        Conf.sCheckBox104.Checked := False
      else
        Conf.sCheckBox104.Checked := True;
      Screen_Str := pSX_Ini.ReadString('Graphics','PauseWhenDefocused',Screen_Str);
      if Screen_Str = '0' then
        Conf.sCheckBox105.Checked := False
      else
        Conf.sCheckBox105.Checked := True;
      Screen_Str := pSX_Ini.ReadString('Graphics','StatusIcons',Screen_Str);
      if Screen_Str = '0' then
        Conf.sCheckBox106.Checked := False
      else
        Conf.sCheckBox106.Checked := True;
      FindDisplays('%dx%d %dHz');
      Conf.sComboBox58.Items.Clear;
      Conf.sComboBox58.Items.Add('Default');
      for res := 0 to resolutions.Count -1 do
        Conf.sComboBox58.Items.Add(resolutions.Strings[res]);
      Screen_Int := pSX_Ini.ReadInteger('Graphics','PALWidth',Screen_Int);
      if Screen_Int = -1 then
        Conf.sComboBox58.ItemIndex := 0
      else
        begin
          Screen_Int := pSX_Ini.ReadInteger('Graphics','PALWidth',Screen_Int);
          Screen_Str := IntToStr(Screen_Int);
          Screen_Int := pSX_Ini.ReadInteger('Graphics','PALHeight',Screen_Int);
          Screen_Str := Screen_Str + 'x' + IntToStr(Screen_Int);
          Screen_Int := pSX_Ini.ReadInteger('Graphics','PALRefresh',Screen_Int);
          Screen_Str := Screen_Str + ' ' + IntToStr(Screen_Int) + 'Hz';
          Conf.sComboBox58.Text := Screen_Str;
        end;
      FindDisplays('%dx%d %dHz');
      Conf.sComboBox59.Items.Clear;
      Conf.sComboBox59.Items.Add('Default');
      for res := 0 to resolutions.Count -1 do
        Conf.sComboBox59.Items.Add(resolutions.Strings[res]);
      Screen_Int := pSX_Ini.ReadInteger('Graphics','NTSCWidth',Screen_Int);
      if Screen_Int = -1 then
        Conf.sComboBox59.ItemIndex := 0
      else
        begin
          Screen_Int := pSX_Ini.ReadInteger('Graphics','NTSCWidth',Screen_Int);
          Screen_Str := IntToStr(Screen_Int);
          Screen_Int := pSX_Ini.ReadInteger('Graphics','NTSCHeight',Screen_Int);
          Screen_Str := Screen_Str + 'x' + IntToStr(Screen_Int);
          Screen_Int := pSX_Ini.ReadInteger('Graphics','NTSCRefresh',Screen_Int);
          Screen_Str := Screen_Str + ' ' + IntToStr(Screen_Int) + 'Hz';
          Conf.sComboBox59.Text := Screen_Str;
        end;
      Screen_Int := pSX_Ini.ReadInteger('Graphics','FullscreenAspectRatio',Screen_Int);
      Conf.sComboBox61.ItemIndex := Screen_Int + 1;
      Conf.DMI1.Active := True;
      Conf.sComboBox60.Items.Clear;
      Conf.sComboBox60.Items.Add('Auto');
      for Screen_Int := 0 to Conf.DMI1.ObjectsCount - 1 do
        begin
          if Screen_Int = 0 then
            Conf.sComboBox60.Items.Add(IntToStr(Screen_Int + 1) + ' : ' + Conf.DMI1.DesktopMonitorProperties.Description + ' (Primary)')
          else
            Conf.sComboBox60.Items.Add(IntToStr(Screen_Int + 1) + ' : ' + Conf.DMI1.DesktopMonitorProperties.Description);
        end;
      Conf.DMI1.Active := False;
      Screen_Int := pSX_Ini.ReadInteger('Graphics','FullscreenAdapter',Screen_Int);
      Conf.sComboBox60.ItemIndex := Screen_Int + 1;      
      Screen_Str := pSX_Ini.ReadString('Graphics','FullscreenVSync',Screen_Str);
      if Screen_Str = '0' then
        Conf.sCheckBox107.Checked := False
      else
        Conf.sCheckBox107.Checked := True;
      Screen_Str := pSX_Ini.ReadString('Graphics','SleepWhenIdle',Screen_Str);
      if Screen_Str = '0' then
        Conf.sCheckBox108.Checked := False
      else
        Conf.sCheckBox108.Checked := True;
      Screen_Str := pSX_Ini.ReadString('Graphics','WindowedSync',Screen_Str);
      if Screen_Str = '0' then
        Conf.sCheckBox109.Checked := False
      else
        Conf.sCheckBox109.Checked := True;
      Screen_Str := pSX_Ini.ReadString('Graphics','Gamma',Screen_Str);
      DecimalSeparator := '.';
      DiffNum := StrToFloat(Screen_Str) * 100;
      Conf.sbar_psx_gamma.Position := Round(DiffNum);
      pSX_gammaChange;
      Screen_Str := pSX_Ini.ReadString('Graphics','Brightness',Screen_Str);
      DecimalSeparator := '.';
      DiffNum := StrToFloat(Screen_Str) * 100;
      Conf.sbar_psx_brightness.Position := Round(DiffNum);
      pSX_brightnessChange;
      Screen_Str := pSX_Ini.ReadString('Graphics','Contrast',Screen_Str);
      DecimalSeparator := '.';
      DiffNum := StrToFloat(Screen_Str) * 100;
      Conf.sbar_psx_contrast.Position := Round(DiffNum);
      pSX_contrastChange;
    end;
end;

procedure SavepSX_ScreenAtExit;
begin
  if pSX_Exe <> '' then
    begin
      if Conf.sCheckBox103.Checked = False then
        pSX_Ini.WriteInteger('Graphics','BilinearInterpolation',0)
      else
        pSX_Ini.WriteInteger('Graphics','BilinearInterpolation',1);
      if Conf.sCheckBox104.Checked = False then
        pSX_Ini.WriteInteger('Graphics','FrameSkip',0)
      else
        pSX_Ini.WriteInteger('Graphics','FrameSkip',1);
      if Conf.sCheckBox105.Checked = False then
        pSX_Ini.WriteInteger('Graphics','PauseWhenDefocused',0)
      else
        pSX_Ini.WriteInteger('Graphics','PauseWhenDefocused',1);
      if Conf.sCheckBox106.Checked = False then
        pSX_Ini.WriteInteger('Graphics','StatusIcons',0)
      else
        pSX_Ini.WriteInteger('Graphics','StatusIcons',1);
      if Conf.sComboBox58.ItemIndex = 0 then
        begin
          pSX_Ini.WriteInteger('Graphics','PALWidth',-1);
          pSX_Ini.WriteInteger('Graphics','PALHeight',-1);
          pSX_Ini.WriteInteger('Graphics','PALRefresh',-1);
        end
      else
        begin
//        synexeia apo edo kai kato          
        end;
    end;
end;

procedure pSX_gammaChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_psx_gamma.Position;
  Conf.sLabel87.Caption := FormatFloat('0.00',(PosNum / 100));
end;

procedure pSX_brightnessChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_psx_brightness.Position;
  Conf.sLabel88.Caption := FormatFloat('0.00',(PosNum / 100));
end;

procedure pSX_contrastChange;
var
  PosNum: Single;
Begin
  PosNum := Conf.sbar_psx_contrast.Position;
  Conf.sLabel89.Caption := FormatFloat('0.00',(PosNum / 100));
end;

procedure pSX_ResetGraphs;
begin
  Conf.sbar_psx_gamma.Position := 100;
  pSX_gammaChange;
  Conf.sbar_psx_brightness.Position := 0;
  pSX_brightnessChange;
  Conf.sbar_psx_contrast.Position := 0;
  pSX_contrastChange;
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_psx_screenpanel;
begin
  if (Cmenustate = 'em_consoles_psx_paths') then
    em_psx_paths_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_sound') then
    em_psx_sound_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_others') then
    em_psx_others_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_database') then
    em_psx_database_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'em_consoles_psx_screen';
  em_psx_screen_ShowDynamicComps;
  ShowButtonDown(7,'EM_CONSOLES_SONY_PSX_SCREEN');
  Conf.Pem_psx_sound.Tag := 0;
  Conf.Pem_psx_others.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_psx_screen');
end;

procedure em_psx_screen_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_psx_screen,'media\confeditor\images\psx\psx.png',
              3,590,100,71,i,True);
        2 : Image_Comp(Conf.Pem_psx_screen,'media\confeditor\images\psx\psx_image.png',
              587,381,150,280,i,True);
        3 : Image_Comp(Conf.Pem_psx_screen,'media\confeditor\images\psx\screen.png',
              608,2,120,71,i,True);
      end;
    end;
end;

procedure em_psx_screen_FreeDynamicComps;
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
 