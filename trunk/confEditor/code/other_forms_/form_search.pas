unit form_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  StdCtrls, Buttons, sBitBtn, sEdit, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDButtonControl, LMDRadioButton, ExtCtrls, sPanel;

type
  TfSearch = class(TForm)
    sEdit1: TsEdit;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sBitBtn3: TsBitBtn;
    sPanel1: TsPanel;
    rMameGameName: TLMDRadioButton;
    rMameRomName: TLMDRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sEdit1Enter(Sender: TObject);
    procedure sEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSearch: TfSearch;

implementation

{$R *.dfm}

uses
   Main;

procedure TfSearch.FormCreate(Sender: TObject);
var
  x,y: integer;
begin
  FormStyle := fsStayOnTop;
  sBitBtn1.Images := Conf.InBitBtn_Imagelist;
  sBitBtn1.ImageIndex := 2;
  sBitBtn2.Images := Conf.InBitBtn_Imagelist;
  sBitBtn2.ImageIndex := 0;
  sBitBtn3.Images := Conf.InBitBtn_Imagelist;
  sBitBtn3.ImageIndex := 21;
  x := Conf.Left;
  y := Conf.Top;
  x := x + Conf.Main_Panel.Left;
  y := y + Conf.Main_Panel.Top;
  x := x + Conf.nxtgrd_mame.Left - 10;
  y := y + Conf.nxtgrd_mame.Top + 27;
  Left := x;
  Top := y;
end;

procedure TfSearch.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfSearch.sBitBtn1Click(Sender: TObject);
begin
  if sEdit1.Text <> '' then
    begin
      if rMameGameName.Checked = true then
        Conf.nxtgrd_mame.SearchNext(1,sEdit1.Text)
      else if rMameRomName.Checked = true then
        Conf.nxtgrd_mame.SearchNext(2,sEdit1.Text);
    end;
end;

procedure TfSearch.sEdit1Enter(Sender: TObject);
begin
  sBitBtn1.Click;
end;

procedure TfSearch.sEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      sBitBtn1.Down := True;
      sBitBtn1.Click;
      sBitBtn1.Down := False;
    end;
end;

procedure TfSearch.sBitBtn3Click(Sender: TObject);
begin
  sBitBtn3.Down := not sBitBtn3.Down;
  if sBitBtn3.Down = true then
    Height := Height + 60
  else
    Height := Height - 60;    
end;

end.
