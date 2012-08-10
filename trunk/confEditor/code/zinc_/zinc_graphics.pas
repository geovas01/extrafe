unit zinc_graphics;

interface
uses
  SysUtils,Windows,ExtCtrls,Classes,Forms;

  procedure SetZinc_GraphicsFromZincIni;
  procedure SaveZinc_GraphicsAtExit;

  procedure SetZincGraph_Settings(GraphType,Setting,Value:string);

  procedure UseZinc_OpenGL_Settings;
  procedure UseZinc_D3D_Settings;

  procedure PrepareGraphicsState;
  procedure WhatUse(GraphicsType: string);

// Menu actions
  procedure Show_zinc_graphicspanel;
  procedure em_zinc_graphics_ShowDynamicComps;
  procedure em_zinc_graphics_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,onflycomponents,FunctionX,
  zinc_paths,zinc_sound,zinc_database;

var
  graph_selected,FinalGraph: string;

procedure UseZinc_OpenGL_Settings;
begin
  PrepareGraphicsState;
  WhatUse('opengl');
  Zinc_Config.WriteString('Zinc_Conf','Graphics','OpenGL');
  if Started = False then
    begin
      graph_selected := 'OpenGL';
      SetZinc_GraphicsFromZincIni;
    end;
end;

procedure UseZinc_D3D_Settings;
begin
  PrepareGraphicsState;
  WhatUse('d3d');
  Zinc_Config.WriteString('Zinc_Conf','Graphics','D3D');
  if Started = False then
    begin
      graph_selected := 'D3D';
      SetZinc_GraphicsFromZincIni;
    end;
end;

procedure WhatUse(GraphicsType: string);
begin
  if GraphicsType = 'opengl' then
    begin
      Conf.rb9.Checked := True;
      Conf.grp21.Enabled := True;
      Conf.grp22.Enabled := True;
      Conf.grp23.Enabled := True;
      Conf.grp24.Enabled := True;
      Conf.grp19.Enabled := True;
      Conf.rb3.Enabled := True;
      Conf.rb4.Enabled := True;
      Conf.sComboBox26.Enabled := True;
      Conf.sCheckBox48.Enabled := True;
      Conf.sComboBox27.Enabled := True;
      Conf.sComboBox28.Enabled := True;
      Conf.sCheckBox49.Enabled := True;
      Conf.sCheckBox50.Enabled := True;
      Conf.sCheckBox51.Enabled := True;
      Conf.sCheckBox52.Enabled := True;
      Conf.sEdit65.Enabled := True;
      Conf.sComboBox29.Enabled := True;
      Conf.sComboBox30.Enabled := True;
      Conf.sComboBox31.Enabled := True;
      Conf.sCheckBox53.Enabled := True;
    end
  else if GraphicsType = 'd3d' then
    begin
      Conf.rb10.Checked := True;
      Conf.grp25.Enabled := True;
      Conf.grp26.Enabled := True;
      Conf.grp27.Enabled := True;
      Conf.grp28.Enabled := True;
      Conf.grp29.Enabled := True;
      Conf.rb5.Enabled := True;
      Conf.rb6.Enabled := True;
      Conf.sComboBox32.Enabled := True;
      Conf.sCheckBox54.Enabled := True;
      Conf.sComboBox33.Enabled := True;
      Conf.sComboBox34.Enabled := True;
      Conf.sCheckBox55.Enabled := True;
      Conf.sCheckBox56.Enabled := True;
      Conf.sCheckBox57.Enabled := True;
      Conf.sCheckBox58.Enabled := True;
      Conf.sEdit66.Enabled := True;
      Conf.sComboBox35.Enabled := True;
      Conf.sComboBox36.Enabled := True;
      Conf.sComboBox37.Enabled := True;
      Conf.sCheckBox59.Enabled := True;
    end;
end;

procedure PrepareGraphicsState;
begin
  //OpenGl
  Conf.grp21.Enabled := False;
  Conf.grp22.Enabled := False;
  Conf.grp23.Enabled := False;
  Conf.grp24.Enabled := False;
  Conf.grp19.Enabled := False;
  Conf.rb3.Enabled := False;
  Conf.rb4.Enabled := False;
  Conf.sComboBox26.Enabled := False;
  Conf.sCheckBox48.Enabled := False;
  Conf.sComboBox27.Enabled := False;
  Conf.sComboBox28.Enabled := False;
  Conf.sCheckBox49.Enabled := False;
  Conf.sCheckBox50.Enabled := False;
  Conf.sCheckBox51.Enabled := False;
  Conf.sCheckBox52.Enabled := False;
  Conf.sEdit65.Enabled := False;
  Conf.sComboBox29.Enabled := False;
  Conf.sComboBox30.Enabled := False;
  Conf.sComboBox31.Enabled := False;
  Conf.sCheckBox53.Enabled := False;
  //D3D
  Conf.grp25.Enabled := False;
  Conf.grp26.Enabled := False;
  Conf.grp27.Enabled := False;
  Conf.grp28.Enabled := False;
  Conf.grp29.Enabled := False;
  Conf.rb5.Enabled := False;
  Conf.rb6.Enabled := False;
  Conf.sComboBox32.Enabled := False;
  Conf.sCheckBox54.Enabled := False;
  Conf.sComboBox33.Enabled := False;
  Conf.sComboBox34.Enabled := False;
  Conf.sCheckBox55.Enabled := False;
  Conf.sCheckBox56.Enabled := False;
  Conf.sCheckBox57.Enabled := False;
  Conf.sCheckBox58.Enabled := False;
  Conf.sEdit66.Enabled := False;
  Conf.sComboBox35.Enabled := False;
  Conf.sComboBox36.Enabled := False;
  Conf.sComboBox37.Enabled := False;
  Conf.sCheckBox59.Enabled := False;
end;

procedure SetZinc_GraphicsFromZincIni;
var
  render: TextFile;
  exist_graph: Boolean;
  render_path,file_t,t1,t2: string;
  r: Integer;
begin
  if Started = True then
    begin
      exist_graph := Zinc_Config.ReadBool('Zinc_Files','Zinc_OpenGL',exist_graph);
      Conf.rb9.Enabled := exist_graph;
      exist_graph := Zinc_Config.ReadBool('Zinc_Files','Zinc_D3D',exist_graph);
      Conf.rb10.Enabled := exist_graph;
      graph_selected := Zinc_Config.ReadString('Zinc_Conf','Graphics',graph_selected);
      render_path := FullPathZinc_Exe + '\renderer.cfg';      
    end
  else
    begin
      if graph_selected = 'OpenGL' then
        render_path := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\opengl_renderer.cfg';
      if graph_selected = 'D3D' then
        render_path := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\d3d_renderer.cfg';
    end;
  if graph_selected = 'OpenGL' then
    begin
      if Started  = True then
        UseZinc_OpenGL_Settings;
      AssignFile(render,render_path);
      Reset(render);
      FinalGraph := '';
      while not Eof(render) do
        begin
          Readln(render,file_t);
          r := Pos('=',file_t);
          if r > 0 then
            begin
              t1 := Trim(Copy(file_t,0,r-1));
              t2 := Trim(Copy(file_t,r+1,Length(file_t)-r-1));
              SetZincGraph_Settings('OpenGL',t1,t2);
            end;
        end;
      CloseFile(render);
      if Started = True then
        begin
          render_path := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\d3d_renderer.cfg';
          AssignFile(render,render_path);
          Reset(render);
          FinalGraph := '';
          while not Eof(render) do
            begin
              Readln(render,file_t);
              r := Pos('=',file_t);
              if r > 0 then
                begin
                  t1 := Trim(Copy(file_t,0,r-1));
                  t2 := Trim(Copy(file_t,r+1,Length(file_t)-r-1));
                  SetZincGraph_Settings('D3D',t1,t2);
                end;
            end;
          CloseFile(render);
        end;
    end
  else if graph_selected = 'D3D' then
    begin
      if Started = True then
        UseZinc_D3D_Settings;
      AssignFile(render,render_path);
      Reset(render);
      FinalGraph := '';
      while not Eof(render) do
        begin
          Readln(render,file_t);
          r := Pos('=',file_t);
          if r > 0 then
            begin
              t1 := Trim(Copy(file_t,0,r-1));
              t2 := Trim(Copy(file_t,r+1,Length(file_t)-r-1));
              SetZincGraph_Settings('D3D',t1,t2);
            end;
        end;
      CloseFile(render);
      if Started = True then
        begin
          render_path := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\opengl_renderer.cfg';
          AssignFile(render,render_path);
          Reset(render);
          FinalGraph := '';
          while not Eof(render) do
            begin
              Readln(render,file_t);
              r := Pos('=',file_t);
              if r > 0 then
                begin
                  t1 := Trim(Copy(file_t,0,r-1));
                  t2 := Trim(Copy(file_t,r+1,Length(file_t)-r-1));
                  SetZincGraph_Settings('OpenGL',t1,t2);
                end;
            end;
          CloseFile(render);
        end;
    end;
end;

procedure SetZincGraph_Settings(GraphType,Setting,Value:string);
begin
  if GraphType = 'OpenGL' then
    begin
      if Setting = 'XSize' then
        FinalGraph := Value + 'X'
      else if Setting = 'YSize' then
        FinalGraph := FinalGraph + Value + '_'
      else if Setting = 'FullScreen' then
        begin
          if Value = '1' then
            Conf.rb3.Checked := True
          else
            Conf.rb4.Checked := True
        end
      else if Setting = 'ColorDepth' then
        begin
          FinalGraph := FinalGraph + Value + 'bit Color';
          Conf.sComboBox26.Text := FinalGraph;
        end
      else if Setting = 'ScanLines' then
        Conf.sComboBox28.Text :=  Value
      else if Setting = 'Filtering' then
        Conf.sComboBox29.Text := Value
      else if Setting = 'Blending' then
        Conf.sComboBox27.Text := Value
      else if Setting = 'Dithering' then
        Conf.sCheckBox48.Checked := StrToBool(Value)
      else if Setting = 'ShowFPS' then
        Conf.sCheckBox49.Checked := StrToBool(Value)
      else if Setting = 'FrameLimitation' then
        Conf.sCheckBox52.Checked := StrToBool(Value)
      else if Setting = 'FrameSkipping' then
        Conf.sCheckBox51.Checked := StrToBool(Value)
      else if Setting = 'FramerateDetection' then
        Conf.sCheckBox50.Checked := StrToBool(Value)
      else if Setting = 'FramerateManual' then
        Conf.sEdit65.Text := Value
      else if Setting = 'TextureType' then
        Conf.sComboBox30.Text := Value
      else if Setting = 'TextureCaching' then
        Conf.sComboBox31.Text := Value
//      else if Setting = 'TurnDisplay' then
      else if Setting = 'EnableKeys' then
        Conf.sCheckBox53.Checked := StrToBool(Value);
//      else if Setting = 'FastExcel' then
    end
  else if GraphType = 'D3D' then
    begin
      if Setting = 'XSize' then
        FinalGraph := Value + 'X'
      else if Setting = 'YSize' then
        FinalGraph := FinalGraph + Value + '_'
      else if Setting = 'FullScreen' then
        begin
          if Value = '1' then
            Conf.rb5.Checked := True
          else
            Conf.rb6.Checked := True
        end
      else if Setting = 'ColorDepth' then
        begin
          FinalGraph := FinalGraph + Value + 'bit Color';
          Conf.sComboBox32.Text := FinalGraph;
        end
      else if Setting = 'ScanLines' then
        Conf.sComboBox34.Text :=  Value
      else if Setting = 'Filtering' then
        Conf.sComboBox35.Text := Value
      else if Setting = 'Blending' then
        Conf.sComboBox33.Text := Value
      else if Setting = 'Dithering' then
        Conf.sCheckBox54.Checked := StrToBool(Value)
      else if Setting = 'ShowFPS' then
        Conf.sCheckBox55.Checked := StrToBool(Value)
      else if Setting = 'FrameLimitation' then
        Conf.sCheckBox58.Checked := StrToBool(Value)
      else if Setting = 'FrameSkipping' then
        Conf.sCheckBox51.Checked := StrToBool(Value)
      else if Setting = 'FramerateDetection' then
        Conf.sCheckBox56.Checked := StrToBool(Value)
      else if Setting = 'FramerateManual' then
        Conf.sEdit66.Text := Value
      else if Setting = 'TextureType' then
        Conf.sComboBox36.Text := Value
      else if Setting = 'TextureCaching' then
        Conf.sComboBox37.Text := Value
//      else if Setting = 'TurnDisplay' then
      else if Setting = 'EnableKeys' then
        Conf.sCheckBox59.Checked := StrToBool(Value);
//      else if Setting = 'FastExcel' then
    end;
end;

procedure SaveZinc_GraphicsAtExit;
var
  render: TextFile;
  render_path,file_t,t1,t2,t3,t4,t5: string;
  OGLXSize,OGLYSize,OGLBitColor: string;
  D3DXSize,D3DYSize,D3DBitColor: string;
  r: Integer;
  graphicssave,graphicssavedis: TStringList;
begin
  if Zinc_Exe <> '' then
    begin
  render_path := FullPathZinc_Exe + '\renderer.cfg';
// OpegGL screen divided settings
  t1 := Conf.sComboBox26.Text;
  r := Pos('X',t1);
  OGLXSize := Trim(Copy(t1,0,r-1));
  t2 := Trim(Copy(t1,r+1,Length(t1)-r));
  r := Pos('_',t2);
  OGLYSize := Trim(Copy(t2,0,r-1));
  t3 := Trim(Copy(t2,r+1,Length(t2)-r));
  r := Pos('bit',t3);
  OGLBitColor := Trim(Copy(t3,0,r-1));
// D3D screen divided settings
  t1 := Conf.sComboBox32.Text;
  r := Pos('X',t1);
  D3DXSize := Trim(Copy(t1,0,r-1));
  t2 := Trim(Copy(t1,r+1,Length(t1)-r));
  r := Pos('_',t2);
  D3DYSize := Trim(Copy(t2,0,r-1));
  t3 := Trim(Copy(t2,r+1,Length(t2)-r));
  r := Pos('bit',t3);
  D3DBitColor := Trim(Copy(t3,0,r-1));
//
  graphicssave := TStringList.Create;
  graphicssavedis := TStringList.Create;
  AssignFile(render,render_path);
  Reset(render);
  while not Eof(render) do
    begin
      Readln(render,file_t);
      r := Pos('=',file_t);
      if r > 0 then
        begin
          t1 := Trim(Copy(file_t,0,r-1));
          if t1 = 'XSize' then
            if Conf.rb9.Checked = True then
              begin
                t2 := OGLXSize;
                t4 := D3DXSize;
              end
            else
              begin
                t2 := D3DXSize;
                t4 := OGLXSize;
              end
          else if t1 = 'YSize' then
            if Conf.rb9.Checked = True then
              begin
                t2 := OGLYSize;
                t4 := D3DYSize;
              end
            else
              begin
                t2 := D3DYSize;
                t4 := OGLYSize;
              end
          else if t1 = 'ColorDepth' then
            if Conf.rb9.Checked = True then
              begin
                t2 := OGLBitColor;
                t4 := D3DBitColor;
              end
            else
              begin
                t2 := D3DBitColor;
                t4 := OGLBitColor;
              end
          else if t1 =  'FullScreen' then
            if Conf.rb9.Checked = True then
              begin
                t2 := BoolToStr(Conf.rb3.Checked);
                t4 := BoolToStr(Conf.rb5.Checked);
              end
            else
              begin
                t2 := BoolToStr(Conf.rb5.Checked);
                t4 := BoolToStr(Conf.rb3.Checked);
              end
          else if t1 = 'ScanLines' then
            if Conf.rb9.Checked = True then
              begin
                t2 := Conf.sComboBox28.Text;
                t4 := Conf.sComboBox34.Text;
              end
            else
              begin
                t2 := Conf.sComboBox34.Text;
                t4 := Conf.sComboBox28.Text;
              end
          else if t1 = 'Dithering' then
            if Conf.rb9.Checked = True then
              begin
                t2 := BoolToStr(Conf.sCheckBox48.Checked);
                t4 := BoolToStr(Conf.sCheckBox54.Checked);
              end
            else
              begin
                t2 := BoolToStr(Conf.sCheckBox54.Checked);
                t4 := BoolToStr(Conf.sCheckBox48.Checked);
              end
          else if t1 = 'Blending' then
            if Conf.rb9.Checked = True then
              begin
                t2 := Conf.sComboBox27.Text;
                t4 := Conf.sComboBox33.Text;
              end
            else
              begin
                t2 := Conf.sComboBox33.Text;
                t4 := Conf.sComboBox27.Text;
              end
          else if t1 = 'ShowFPS' then
            if Conf.rb9.Checked = True then
              begin
                t2 := BoolToStr(Conf.sCheckBox49.Checked);
                t4 := BoolToStr(Conf.sCheckBox55.Checked);
              end
            else
              begin
                t2 := BoolToStr(Conf.sCheckBox55.Checked);
                t4 := BoolToStr(Conf.sCheckBox49.Checked);
              end
          else if t1 = 'FramerateDetection' then
            if Conf.rb9.Checked = True then
              begin
                t2 := BoolToStr(Conf.sCheckBox50.Checked);
                t4 := BoolToStr(Conf.sCheckBox56.Checked);
              end
            else
              begin
                t2 := BoolToStr(Conf.sCheckBox56.Checked);
                t4 := BoolToStr(Conf.sCheckBox50.Checked);
              end
          else if t1 = 'FrameSkipping' then
            if Conf.rb9.Checked = True then
              begin
                t2 := BoolToStr(Conf.sCheckBox51.Checked);
                t4 := BoolToStr(Conf.sCheckBox57.Checked);
              end
            else
              begin
                t2 := BoolToStr(Conf.sCheckBox57.Checked);
                t4 := BoolToStr(Conf.sCheckBox51.Checked);
              end
          else if t1 = 'FrameLimitation' then
            if Conf.rb9.Checked = True then
              begin
                t2 := BoolToStr(Conf.sCheckBox52.Checked);
                t4 := BoolToStr(Conf.sCheckBox58.Checked);
              end
            else
              begin
                t2 := BoolToStr(Conf.sCheckBox58.Checked);
                t4 := BoolToStr(Conf.sCheckBox52.Checked);
              end
          else if t1 = 'FramerateManual' then
            if Conf.rb9.Checked = True then
              begin
                t2 := Conf.sEdit65.Text;
                t4 := Conf.sEdit66.Text;
              end
            else
              begin
                t2 := Conf.sEdit66.Text;
                t4 := Conf.sEdit65.Text;
              end
          else if t1 = 'Filtering' then
            if Conf.rb9.Checked = True then
              begin
                t2 := Conf.sComboBox29.Text;
                t4 := Conf.sComboBox35.Text;
              end
            else
              begin
                t2 := Conf.sComboBox35.Text;
                t4 := Conf.sComboBox29.Text;
              end
          else if t1 = 'TextureCaching' then
            if Conf.rb9.Checked = True then
              begin
                t2 := Conf.sComboBox31.Text;
                t4 := Conf.sComboBox37.Text;
              end
            else
              begin
                t2 := Conf.sComboBox37.Text;
                t4 := Conf.sComboBox31.Text;
              end
          else if t1 = 'TextureType' then
            if Conf.rb9.Checked = True then
              begin
                t2 := Conf.sComboBox30.Text;
                t4 := Conf.sComboBox36.Text;
              end
            else
              begin
                t2 := Conf.sComboBox36.Text;
                t4 := Conf.sComboBox30.Text;
              end
          else if t1 = 'EnableKeys' then
            if Conf.rb9.Checked = True then
              begin
                t2 := BoolToStr(Conf.sCheckBox53.Checked);
                t4 := BoolToStr(Conf.sCheckBox59.Checked);
              end
            else
              begin
                t2 := BoolToStr(Conf.sCheckBox59.Checked);
                t4 := BoolToStr(Conf.sCheckBox53.Checked);
              end
          else if t1 = 'TurnDisplay' then
            begin
              t2 := '0';
              t4 := '0';
            end
          else if t1 = 'FastExcel' then
            begin
              t2 := '0';
              t4 := '0';
            end;
          if t2 = '-1' then
            t2 := '1';
          if t4 = '-1' then
            t4 := '1';
          t3 := t1 + '          =' + t2 + ';';
          t5 := t1 + '          =' + t4 + ';';
        end
      else
        begin
          t3 := file_t;
          t5 := file_t;
        end;
      graphicssave.Add(t3);
      graphicssavedis.Add(t5);
    end;
  CloseFile(render);
  graphicssave.SaveToFile(FullPathZinc_Exe + '\renderer.cfg');
  if Conf.rb9.Checked = True then
    begin
      graphicssave.SaveToFile(ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\opengl_renderer.cfg');
      graphicssavedis.SaveToFile(ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\d3d_renderer.cfg');
    end
  else
    begin
      graphicssavedis.SaveToFile(ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\opengl_renderer.cfg');
      graphicssave.SaveToFile(ExtractFilePath(Application.ExeName)+'media\emulators\arcade\zinc\config\d3d_renderer.cfg');
    end;
  graphicssave.Free;
  graphicssavedis.Free;
  end;
end;

procedure Show_zinc_graphicspanel;
begin
  if (Cmenustate = 'em_arcade_zinc_paths') then
    em_zinc_paths_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_zinc_sound') then
    em_zinc_sound_FreeDynamicComps
  else if (Cmenustate = 'em_arcade_zinc_database') then
    em_zinc_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'em_arcade_zinc_graphics';
  em_zinc_graphics_ShowDynamicComps;
  ShowButtonDown(7,'EM_ARCADE_ZINC_GRAPHICS');
  ShowHidePanel(CurrentPanel,'Pem_zinc_graphics');
end;

procedure em_zinc_graphics_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_zinc_graphics,'media\confeditor\images\zinc\zinc.png',
              3,590,97,75,i,True);
        2 : Image_Comp(Conf.Pem_zinc_graphics,'media\confeditor\images\zinc\zinc_image.png',
              580,483,150,175,i,True);
        3 : Image_Comp(Conf.Pem_zinc_graphics,'media\confeditor\images\zinc\graphics.png',
              591,2,136,71,i,True);
      end;
    end;
end;

procedure em_zinc_graphics_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end
end;

end.

