unit zinc_graphics;

interface
uses
  SysUtils,Windows;

  procedure SetZinc_GraphicsFromZincIni;

  procedure SetZincGraph_Settings(GraphType,Setting,Value:string);
  procedure Glide_Num_Resolution(GetOrSet,Number: string);
  procedure Glide_Num_Keys(GetOrSet,Number: string;Num: Integer);

  procedure UseZinc_OpenGL_Settings;
  procedure UseZinc_D3D_Settings;
  procedure UseZinc_Glide_Settings;
  procedure UseZinc_Soft_Settings;
  procedure CopyRendererToIni(Graph_Name: string);

  procedure PrepareGraphicsState;
  procedure WhatUse(GraphicsType: string);

implementation

uses
  main,mainconf;

var
  graph_selected,FinalGraph: string;
  GraphicState: Byte; // 0:OpenGL - 1:D3D - 2:Glide - 3:Soft

procedure UseZinc_OpenGL_Settings;
begin
  PrepareGraphicsState;
  WhatUse('opengl');
  Zinc_Config.WriteString('Zinc_Conf','Graphics','OpenGL');
  if Started = False then
    begin      
      case GraphicState of
        0 : CopyRendererToIni('opengl_renderer.cfg');
        1 : CopyRendererToIni('d3d_renderer.cfg');
        2 : CopyRendererToIni('glide_renderer.cfg');
        3 : CopyRendererToIni('soft_renderer.cfg');
      end;
      CopyFile(PChar(ExtractFilePath(Zinc_ini) + 'opengl_renderer.cfg'),  PChar(FullPathZinc_Exe + 'renderer.cfg'), False);
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
      case GraphicState of
        0 : CopyRendererToIni('opengl_renderer.cfg');
        1 : CopyRendererToIni('d3d_renderer.cfg');
        2 : CopyRendererToIni('glide_renderer.cfg');
        3 : CopyRendererToIni('soft_renderer.cfg');
      end;
      CopyFile(PChar(ExtractFilePath(Zinc_ini) + 'd3d_renderer.cfg'),  PChar(FullPathZinc_Exe + 'renderer.cfg'), False);
      graph_selected := 'D3D';
      SetZinc_GraphicsFromZincIni;
    end;
end;

procedure UseZinc_Glide_Settings;
begin
  PrepareGraphicsState;
  WhatUse('glide');
  Zinc_Config.WriteString('Zinc_Conf','Graphics','Glide');
  if Started = False then
    begin      
      case GraphicState of
        0 : CopyRendererToIni('opengl_renderer.cfg');
        1 : CopyRendererToIni('d3d_renderer.cfg');
        2 : CopyRendererToIni('glide_renderer.cfg');
        3 : CopyRendererToIni('soft_renderer.cfg');
      end;
      CopyFile(PChar(ExtractFilePath(Zinc_ini) + 'glide_renderer.cfg'),  PChar(FullPathZinc_Exe + 'renderer.cfg'), False);
      graph_selected := 'Glide';
      SetZinc_GraphicsFromZincIni;
    end;
end;

procedure UseZinc_Soft_Settings;
begin
  PrepareGraphicsState;
  WhatUse('soft');
  Zinc_Config.WriteString('Zinc_Conf','Graphics','Soft');
  if Started = False then
    begin      
      case GraphicState of
        0 : CopyRendererToIni('opengl_renderer.cfg');
        1 : CopyRendererToIni('d3d_renderer.cfg');
        2 : CopyRendererToIni('glide_renderer.cfg');
        3 : CopyRendererToIni('soft_renderer.cfg');
      end;
      CopyFile(PChar(ExtractFilePath(Zinc_ini) + 'soft_renderer.cfg'),  PChar(FullPathZinc_Exe + 'renderer.cfg'), False);
      graph_selected := 'Soft';
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
    end
  else if GraphicsType = 'glide' then
    begin
      Conf.rb11.Checked := True;
      Conf.grp20.Enabled := True;
      Conf.grp30.Enabled := True;
      Conf.grp17.Enabled := True;
      Conf.grp31.Enabled := True;
      Conf.sComboBox39.Enabled := True;
      Conf.sComboBox38.Enabled := True;
      Conf.sCheckBox60.Enabled := True;
      Conf.sCheckBox61.Enabled := True;
      Conf.sCheckBox62.Enabled := True;
      Conf.sCheckBox63.Enabled := True;
      Conf.sEdit67.Enabled := True;
      Conf.sEdit68.Enabled := True;
      Conf.sEdit69.Enabled := True;
      Conf.sEdit70.Enabled := True;
      Conf.sEdit71.Enabled := True;
      Conf.sEdit72.Enabled := True;
    end
  else if GraphicsType = 'soft' then
    begin
      Conf.rb12.Checked := True;
      Conf.grp18.Enabled := True;
      Conf.grp32.Enabled := True;
      Conf.grp33.Enabled := True;
      Conf.grp34.Enabled := True;
      Conf.grp35.Enabled := True;
      Conf.sCheckBox64.Enabled := True;
      Conf.sCheckBox65.Enabled := True;
      Conf.sCheckBox66.Enabled := True;
      Conf.sCheckBox67.Enabled := True;
      Conf.sCheckBox68.Enabled := True;
      Conf.sCheckBox69.Enabled := True;
      Conf.sCheckBox70.Enabled := True;
      Conf.sCheckBox71.Enabled := True;
      Conf.sCheckBox72.Enabled := True;
      Conf.sCheckBox73.Enabled := True;
      Conf.sCheckBox74.Enabled := True;
      Conf.sCheckBox75.Enabled := True;
      Conf.sCheckBox76.Enabled := True;
      Conf.sCheckBox77.Enabled := True;
      Conf.sCheckBox78.Enabled := True;
      Conf.rb7.Enabled := True;
      Conf.rb8.Enabled := True;
      Conf.sComboBox40.Enabled := True;
      Conf.sComboBox41.Enabled := True;
      Conf.sComboBox42.Enabled := True;
      Conf.sEdit73.Enabled := True;
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
  //Glide
  Conf.grp20.Enabled := False;
  Conf.grp30.Enabled := False;
  Conf.grp17.Enabled := False;
  Conf.grp31.Enabled := False;
  Conf.sComboBox39.Enabled := False;
  Conf.sComboBox38.Enabled := False;
  Conf.sCheckBox60.Enabled := False;
  Conf.sCheckBox61.Enabled := False;
  Conf.sCheckBox62.Enabled := False;
  Conf.sCheckBox63.Enabled := False;
  Conf.sEdit67.Enabled := False;
  Conf.sEdit68.Enabled := False;
  Conf.sEdit69.Enabled := False;
  Conf.sEdit70.Enabled := False;
  Conf.sEdit71.Enabled := False;
  Conf.sEdit72.Enabled := False;
  //Soft
  Conf.grp18.Enabled := False;
  Conf.grp32.Enabled := False;
  Conf.grp33.Enabled := False;
  Conf.grp34.Enabled := False;
  Conf.grp35.Enabled := False;
  Conf.sCheckBox64.Enabled := False;
  Conf.sCheckBox65.Enabled := False;
  Conf.sCheckBox66.Enabled := False;
  Conf.sCheckBox67.Enabled := False;
  Conf.sCheckBox68.Enabled := False;
  Conf.sCheckBox69.Enabled := False;
  Conf.sCheckBox70.Enabled := False;
  Conf.sCheckBox71.Enabled := False;
  Conf.sCheckBox72.Enabled := False;
  Conf.sCheckBox73.Enabled := False;
  Conf.sCheckBox74.Enabled := False;
  Conf.sCheckBox75.Enabled := False;
  Conf.sCheckBox76.Enabled := False;
  Conf.sCheckBox77.Enabled := False;
  Conf.sCheckBox78.Enabled := False;
  Conf.rb7.Enabled := False;
  Conf.rb8.Enabled := False;
  Conf.sComboBox40.Enabled := False;
  Conf.sComboBox41.Enabled := False;
  Conf.sComboBox42.Enabled := False;
  Conf.sEdit73.Enabled := False;
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
      exist_graph := Zinc_Config.ReadBool('Zinc_Files','Zinc_Glide',exist_graph);
      Conf.rb11.Enabled := exist_graph;
      exist_graph := Zinc_Config.ReadBool('Zinc_Files','Zinc_Soft',exist_graph);
      Conf.rb12.Enabled := exist_graph;
      graph_selected := Zinc_Config.ReadString('Zinc_Conf','Graphics',graph_selected);
    end;
  render_path := Zinc_Config.ReadString('Zinc_Paths','Zinc_Renderer',render_path);
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
      GraphicState := 0;
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
      GraphicState := 1;
    end
  else if graph_selected = 'Glide' then
    begin
      if Started = True then
        UseZinc_Glide_Settings;
      AssignFile(render,render_path);
      Reset(render);
      while not Eof(render) do
        begin
          Readln(render,t1);
          r := Pos('=',file_t);
          if r > 0 then
            begin
              t1 := Trim(Copy(file_t,0,r-1));
              t2 := Trim(Copy(file_t,r+1,Length(file_t)-r-1));
              SetZincGraph_Settings('Glide',t1,t2);
            end;
        end;
      CloseFile(render);
      GraphicState := 2;
    end
  else if graph_selected = 'Soft' then
    begin
      if Started = True then
        UseZinc_Soft_Settings;
      AssignFile(render,render_path);
      Reset(render);
      FinalGraph := '';
      while not Eof(render) do
        begin
          Readln(render,t1);
          r := Pos('=',file_t);
          if r > 0 then
            begin
              t1 := Trim(Copy(file_t,0,r-1));
              t2 := Trim(Copy(file_t,r+1,Length(file_t)-r-1));
              SetZincGraph_Settings('Soft',t1,t2);
            end;
        end;
      CloseFile(render);
      GraphicState := 3;
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
    end
  else if GraphType = 'Glide' then
    begin
      if Setting = 'Resolution' then
        Glide_Num_Resolution('get',Value)
      else if Setting = 'Filtering' then
        Conf.sComboBox38.Text := Value
      else if Setting = 'ShowFPS' then
        Conf.sCheckBox60.Checked := StrToBool(Value)
      else if Setting = 'FrameLimitation' then
        Conf.sCheckBox63.Checked := StrToBool(Value)
      else if Setting = 'FrameSkipping' then
        Conf.sCheckBox62.Checked := StrToBool(Value)
      else if Setting = 'FramerateDetection' then
        Conf.sCheckBox61.Checked := StrToBool(Value)
      else if Setting = 'FramerateManual' then
        Conf.sEdit67.Text := Value
      else if Setting = 'Key_Filtering' then
        Glide_Num_Keys('get',Value,0)
    end
  else if GraphType = 'Soft' then
    begin
    
    end;
end;

procedure Glide_Num_Resolution(GetOrSet,Number: string);
begin
  if GetOrSet = 'get' then
    begin
      case StrToInt(Number) of
        0 : Conf.sComboBox39.Text := '320x200';
        1 : Conf.sComboBox39.Text := '320x240';
        2 : Conf.sComboBox39.Text := '400x256';
        3 : Conf.sComboBox39.Text := '512x384';
        4 : Conf.sComboBox39.Text := '640x200';
        5 : Conf.sComboBox39.Text := '640x350';
        6 : Conf.sComboBox39.Text := '640x400';
        7 : Conf.sComboBox39.Text := '640x480';
        8 : Conf.sComboBox39.Text := '800x600';
        9 : Conf.sComboBox39.Text := '960x720';
        10 : Conf.sComboBox39.Text := '856x480';
        11 : Conf.sComboBox39.Text := '512x256';
        12 : Conf.sComboBox39.Text := '1024x768';
        13 : Conf.sComboBox39.Text := '1280x1024';
        14 : Conf.sComboBox39.Text := '1600x1200';
        15 : Conf.sComboBox39.Text := '400x300';
        16 : Conf.sComboBox39.Text := '1152x864';
        17 : Conf.sComboBox39.Text := '1280x960';
        18 : Conf.sComboBox39.Text := '1600x1024';
        19 : Conf.sComboBox39.Text := '1792x1344';
        20 : Conf.sComboBox39.Text := '1856x1392';
        21 : Conf.sComboBox39.Text := '1920x1440';
        22 : Conf.sComboBox39.Text := '2048x1536';
        23 : Conf.sComboBox39.Text := '2048x2048';
      end;
    end;
end;

procedure Glide_Num_Keys(GetOrSet,Number: string;Num: Integer);
var
  Text_Key  : string;
begin
  if GetOrSet = 'get' then
    begin
      if Number = '0x08' then
        Text_Key := 'BackSpace'
      else if Number = '0x09' then
        Text_Key := 'Tab'
      else if Number = '0x0c' then
        Text_Key := 'Clear'
      else if Number = '0x0d' then
        Text_Key := 'Return'
      else if Number = '0x10' then
        Text_Key := 'Shift'
      else if Number = '0x11' then
        Text_Key := 'Control'
      else if Number = '0x12' then
        Text_Key := 'Menu'
      else if Number = '0x13' then
        Text_Key := 'Pause'
      else if Number = '0x14' then
        Text_Key := 'Capital'
      else if Number = '0x1B' then
        Text_Key := 'Escape'
      else if Number = '0x20' then
        Text_Key := 'SpaceBar'
      else if Number = '0x21' then
        Text_Key := 'PageUp'
      else if Number = '0x22' then
        Text_Key := 'PageDown'
      else if Number = '0x23' then
        Text_Key := 'End'
      else if Number = '0x24' then
        Text_Key := 'Home'
      else if Number = '0x25' then
        Text_Key := 'LeftArrow'
      else if Number = '0x26' then
        Text_Key := 'UpArrow'
      else if Number = '0x27' then
        Text_Key := 'RightArrow'
      else if Number = '0x28' then
        Text_Key := 'DownArrow'
      else if Number = '0x29' then
        Text_Key := 'Select'
      else if Number = '0x2A' then
        Text_Key := 'Print'
      else if Number = '0x2B' then
        Text_Key := 'Execute'
      else if Number = '0x2C' then
        Text_Key := 'PrintScreen'
      else if Number = '0x2D' then
        Text_Key := 'Insert'
      else if Number = '0x2E' then
        Text_Key := 'Delete'
      else if Number = '0x2F' then
        Text_Key := 'Help'
      else if Number = '0' then
        Text_Key := '0x30'
      else if Number = '1' then
        Text_Key := '0x31'
      else if Number = '2' then
        Text_Key := '0x32'
      else if Number = '3' then
        Text_Key := '0x33'
      else if Number = '4' then
        Text_Key := '0x34'
      else if Number = '5' then
        Text_Key := '0x35'
      else if Number = '6' then
        Text_Key := '0x36'
      else if Number = '7' then
        Text_Key := '0x37'
      else if Number = '8' then
        Text_Key := '0x38'
      else if Number = '9' then
        Text_Key  := '0x39'
      else if Number = 'A' then
        Text_Key := '0x41'
      else if Number = 'B' then
        Text_Key := '0x42'
      else if Number = 'C' then
        Text_Key := '0x43'
      else if Number = 'D' then
        Text_Key := '0x44'
      else if Number = 'E' then
        Text_Key := '0x45'
      else if Number = 'F' then
        Text_Key := '0x46'
      else if Number = 'G' then
        Text_Key := '0x47'
      else if Number = 'H' then
        Text_Key := '0x48'
      else if Number = 'I' then
        Text_Key := '0x49'
      else if Number = 'J' then
        Text_Key := '0x4A'
      else if Number = 'K' then
        Text_Key := '0x4B'
      else if Number = 'L' then
        Text_Key := '0x4C'
      else if Number = 'M' then
        Text_Key := '0x4D'
      else if Number = 'N' then
        Text_Key := '0x4E'
      else if Number = 'O' then
        Text_Key := '0x4F'
      else if Number = 'P' then
        Text_Key := '0x50'
      else if Number = 'Q' then
        Text_Key := '0x51'
      else if Number = 'R' then
        Text_Key := '0x52'
      else if Number = 'S' then
        Text_Key := '0x53'
      else if Number = 'T' then
        Text_Key := '0x54'
      else if Number = 'U' then
        Text_Key := '0x55'
      else if Number = 'V' then
        Text_Key := '0x56'
      else if Number = 'W' then
        Text_Key := '0x57'
      else if Number = 'X' then
        Text_Key := '0x58'
      else if Number = 'Y' then
        Text_Key := '0x59'
      else if Number = 'Z' then
        Text_Key := '0x5A'
      else if Number = 'LeftWin' then
        Text_Key := '0x5B'
      else if Number = 'RightWin' then
        Text_Key := '0x5C'
      else if Number = 'AppsWin' then
        Text_Key := '0x5D'
      else if Number = 'Sleep' then
        Text_Key := '0x5F'
      else if Number = 'NUMPAD0' then
        Text_Key := '0x60'
      else if Number = 'NUMPAD1' then
        Text_Key := '0x61'
      else if Number = 'NUMPAD2' then
        Text_Key := '0x62'
      else if Number = 'NUMPAD3' then
        Text_Key := '0x63'
      else if Number = 'NUMPAD4' then
        Text_Key := '0x64'
      else if Number = 'NUMPAD5' then
        Text_Key := '0x65'
      else if Number = 'NUMPAD6' then
        Text_Key := '0x66'
      else if Number = 'NUMPAD7' then
        Text_Key := '0x67'
      else if Number = 'NUMPAD8' then
        Text_Key := '0x68'
      else if Number = 'NUMPAD9' then
        Text_Key := '0x69'
      else if Number = 'NP_MULTIPLY' then
        Text_Key := '0x6A'
      else if Number = 'NP_ADD' then
        Text_Key := '0x6B'
      else if Number = 'NP_SEPARATOR' then
        Text_Key := '0x6C'
      else if Number = 'NP_SUBTRACT' then
        Text_Key := '0x6D'
      else if Number = 'NP_DECIMAL' then
        Text_Key := '0x6E'
      else  if Number = 'NP_DIVIDE' then
        Text_Key := '0x6F'
      else if Number = 'F1' then
        Text_Key := '0x70'
      else if Number = 'F2' then
        Text_Key := '0x71'
      else if Number = 'F3' then
        Text_Key := '0x72'
      else if Number = 'F4' then
        Text_Key := '0x73'
      else if Number = 'F5' then
        Text_Key := '0x74'
      else if Number = 'F6' then
        Text_Key := '0x75'
      else if Number = 'F7' then
        Text_Key := '0x76'
      else if Number = 'F8' then
        Text_Key := '0x77'
      else if Number = 'F9' then
        Text_Key := '0x78'
      else if Number = 'F10' then
        Text_Key := '0x79'
      else if Number = 'F11' then
        Text_Key := '0x7A'
      else if Number = 'F12' then
        Text_Key := '0x7B'
      else if Number = 'NumLock' then
        Text_Key := '0x90'
      else if Number = 'ScrollLock' then
        Text_Key := '0x91'
    end;
end;

procedure CopyRendererToIni(Graph_Name: string);
begin
  CopyFile(PChar(FullPathZinc_Exe + 'renderer.cfg'), PChar(ExtractFilePath(Zinc_ini) + Graph_Name), False);
end;

end.
