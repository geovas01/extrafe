unit zinc_graphics;

interface
uses
  SysUtils;

  procedure UseZinc_OpenGL_Settings;
  procedure UseZinc_D3D_Settings;
  procedure UseZinc_Glide_Settings;
  procedure UseZinc_Soft_Settings;

  procedure PrepareGraphicsState;
  procedure WhatUse(GraphicsType: string);

implementation

uses
  main,mainconf;

procedure UseZinc_OpenGL_Settings;
begin
  PrepareGraphicsState;
  WhatUse('opengl');
end;

procedure UseZinc_D3D_Settings;
begin
  PrepareGraphicsState;
  WhatUse('d3d');
end;

procedure UseZinc_Glide_Settings;
begin
  PrepareGraphicsState;
  WhatUse('glide');
end;

procedure UseZinc_Soft_Settings;
begin
  PrepareGraphicsState;
  WhatUse('soft');
end;

procedure WhatUse(GraphicsType: string);
begin
  if GraphicsType = 'opengl' then
    begin
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

end.
