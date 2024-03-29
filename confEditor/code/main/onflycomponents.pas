unit onflycomponents;

interface

uses
  Graphics,Windows,SysUtils,ExtCtrls,Controls,Forms,StdCtrls,Classes,
  pngimage,JvGIF,sLabel,sPanel,sBitBtn,AnalogClock;

  procedure Image_Comp(Location: TWinControl; Picture_path: string; Pic_Left,Pic_Top,Pic_Width,Pic_Height,Numofcomp: Integer; NameOwn:string; Pic_Trans,Pic_Stretch: Boolean);
  procedure pImage_Comp(Location: TWinControl; Picture_path: string; Pic_Left,Pic_Top,Pic_Width,Pic_Height,Numofcomp: Integer; NameOwn:string; Pic_Trans,Pic_Stretch: Boolean);
  procedure Label_Comp(Location: TWinControl; Text: String; Label_Left,Label_Top,Numofcomp: Integer; NameOwn: string; Label_Autosize,Label_FontBold,Label_Trans: Boolean);
  procedure Memo_Comp(Location: TWinControl; NumOfComp: Integer; Aling:string; Memo_Left, Memo_Top, Memo_Width, Memo_Height: Integer; Memo_Visible: Boolean);
  procedure MemoEmu_Comp(Location: TWinControl; Name: string);
  procedure Panel_Comp(Location: TWinControl; NameOwn: string; NumOfComp: Integer; Left,Top,Height,Width: Integer);
  procedure BitBtn_Comp(Location: TWinControl; NumOfComp: Integer; Caption: string; Left,Top,Height,Width,ImageNum: Integer);
  procedure AnalogClock_Comp(Location: TWinControl; NumOfComp: Integer; Left,Top,Height,Width: Integer; NewTime: TTime; Visible: Boolean);

var
  MyImage: TImage;
  MyGIPImage: TImage;
  MyLabel: TsLabel;
  MyMemoEmu,MyMemo: TMemo;
  MyPanel: TsPanel;
  MyBitBtn: TsBitBtn;
  MyAnalogClock: TAnalogClock;

implementation

uses
  main,wg_weather,mainconf;

procedure Image_Comp(Location: TWinControl; Picture_path: string; Pic_Left,Pic_Top,Pic_Width,Pic_Height,Numofcomp: Integer; NameOwn:string; Pic_Trans,Pic_Stretch: Boolean);
begin
  MyImage := TImage.Create(Conf);
  MyImage.Name := 'Pic' + NameOwn + IntToStr(Numofcomp);
  MyImage.Picture.LoadFromFile(Program_Path + Picture_path);
  MyImage.Parent := Location;
  MyImage.Left := Pic_Left;
  MyImage.Top := Pic_Top;
  MyImage.Width := Pic_Width;
  MyImage.Height := Pic_Height;
  MyImage.Transparent := Pic_Trans;
  MyImage.Stretch := Pic_Stretch;
end;

procedure pImage_Comp(Location: TWinControl; Picture_path: string; Pic_Left,Pic_Top,Pic_Width,Pic_Height,Numofcomp: Integer; NameOwn:string; Pic_Trans,Pic_Stretch: Boolean);
begin
  MyGIPImage := TImage.Create(Conf);
  MyGIPImage.Name := 'Pic' + NameOwn + IntToStr(Numofcomp);
  MyGIPImage.Picture.LoadFromFile(Picture_path);
  MyGIPImage.Parent := Location;
  MyGIPImage.Left := Pic_Left;
  MyGIPImage.Top := Pic_Top;
  MyGIPImage.Width := Pic_Width;
  MyGIPImage.Height := Pic_Height;
  MyGIPImage.Transparent := Pic_Trans;
  MyGIPImage.Stretch := Pic_Stretch;
end;

procedure Label_Comp(Location: TWinControl; Text: String; Label_Left,Label_Top,Numofcomp: Integer; NameOwn: string; Label_Autosize,Label_FontBold,Label_Trans: Boolean);
begin
  MyLabel := TsLabel.Create(Conf);
  MyLabel.Name := 'Label' + NameOwn + IntToStr(Numofcomp);
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

procedure Memo_Comp(Location: TWinControl; NumOfComp: Integer; Aling:string; Memo_Left, Memo_Top, Memo_Width, Memo_Height: Integer; Memo_Visible: Boolean);
begin
//
end;

procedure MemoEmu_Comp(Location: TWinControl; Name: string);
begin
  MyMemoEmu := TMemo.Create(Conf);
  MyMemoEmu.Name := 'MemoEmu_' + Name;
  MyMemoEmu.Parent := Location;
  MyMemoEmu.Visible := False;
  MyMemoEmu.Align := alClient;
  MyMemoEmu.WordWrap := False;
end;

procedure Panel_Comp(Location: TWinControl; NameOwn: string; NumOfComp: Integer; Left,Top,Height,Width: Integer);
begin
  MyPanel := TsPanel.Create(Conf);
  MyPanel.Name := 'MyPanel'+ NameOwn + IntToStr(NumOfComp);
  MyPanel.Parent := Location;
  MyPanel.Left := Left;
  MyPanel.Top := Top;
  MyPanel.Height := Height;
  MyPanel.Width := width;
  MyPanel.Cursor := Arrow; 
  MyPanel.Caption := '';
  if (NameOwn = '_weather') then
    begin
      MyPanel.Color := clSkyBlue;
      MyPanel.Tag := NumOfComp;
      MyPanel.OnClick := Conf.ClickOnWidgetPanels;
    end;
end;

procedure BitBtn_Comp(Location: TWinControl; NumOfComp: Integer; Caption: string; Left,Top,Height,Width,ImageNum: Integer);
begin
  MyBitBtn := TsBitBtn.Create(Conf);
  MyBitBtn.Name := 'MyBitBtn' + IntToStr(NumOfComp);
  MyBitBtn.Parent := Location;
  MyBitBtn.Left := Left;
  MyBitBtn.Top := Top;
  MyBitBtn.Height := Height;
  MyBitBtn.Width := Width;
  MyBitBtn.ShowCaption := False;
  MyBitBtn.Images := Conf.InBitBtn_Imagelist;
  MyBitBtn.ImageIndex := ImageNum;
  MyBitBtn.Cursor := Arrow;
  if Caption = 'weather' then
    MyBitBtn.Tag := NumOfComp
  else if Caption = 'datetime' then
    MyBitBtn.Tag := NumOfComp;
  MyBitBtn.OnClick := Conf.ClosePanel;
end;

procedure AnalogClock_Comp(Location: TWinControl; NumOfComp: Integer; Left,Top,Height,Width: Integer; NewTime: TTime; Visible: Boolean);
begin
  MyAnalogClock := TAnalogClock.Create(Conf);
  MyAnalogClock.Name := 'MyAnalogClock' + IntToStr(NumOfComp);
  MyAnalogClock.Parent := Location;
  MyAnalogClock.Left := Left;
  MyAnalogClock.Top := Top;
  MyAnalogClock.Height := Height;
  MyAnalogClock.Width := Width;
  MyAnalogClock.Style := acModern;
  MyAnalogClock.Tag := NumOfComp;
  MyAnalogClock.Visible := Visible;
  MyAnalogClock.Active := True;
  MyAnalogClock.TimeOffset := NewTime;
  MyAnalogClock.Cursor := Arrow;
end;

end.

