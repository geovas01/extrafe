unit onflycomponents;

interface

uses
  Graphics,Windows,SysUtils,ExtCtrls,Controls,Forms,
  pngimage,sLabel;

  procedure Image_Comp(Location: TWinControl; Picture_path: string; Pic_Left,Pic_Top,Pic_Width,Pic_Height,Numofcomp: Integer; Pic_Trans: Boolean);
  procedure Label_Comp(Location: TWinControl; Text: String; Label_Left,Label_Top,Numofcomp: Integer; Label_Autosize,Label_FontBold,Label_Trans: Boolean);

var
  MyImage: TImage;
  MyLabel: TsLabel;

implementation

uses
  main;

procedure Image_Comp(Location: TWinControl; Picture_path: string; Pic_Left,Pic_Top,Pic_Width,Pic_Height,Numofcomp: Integer; Pic_Trans: Boolean);
begin
  MyImage := TImage.Create(Conf);
  MyImage.Name := 'Pic'+IntToStr(Numofcomp);
  MyImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+Picture_path);
  MyImage.Parent := Location;
  MyImage.Left := Pic_Left;
  MyImage.Top := Pic_Top;
  MyImage.Width := Pic_Width;
  MyImage.Height := Pic_Height;
  MyImage.Transparent := Pic_Trans;
end;

procedure Label_Comp(Location: TWinControl; Text: String; Label_Left,Label_Top,Numofcomp: Integer; Label_Autosize,Label_FontBold,Label_Trans: Boolean);
begin
  MyLabel := TsLabel.Create(Conf);
  MyLabel.Name := 'Label'+IntToStr(Numofcomp);
  MyLabel.Parent := Location;
  MyLabel.Caption := Text;
  MyLabel.Left := Label_Left;
  MyLabel.Top := Label_Top;
  MyLabel.Font.Name := 'Tahoma';
  MyLabel.Font.Size := 8;
  MyLabel.Font.Color := clWindowText;
  MyLabel.AutoSize := Label_Autosize;
  if Label_FontBold = True then
    MyLabel.Font.Style := MyLabel.Font.Style + [fsBold];
  MyLabel.Transparent := Label_Trans;
  MyLabel.Visible := True;
end;

end.
