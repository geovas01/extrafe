unit form_general;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvLinkLabel, ExtCtrls, StdCtrls, sButton;

type
  TFGeneral = class(TForm)
    img1: TImage;
    sButton1: TsButton;
    lbl1: TLabel;
    procedure sButton1Click(Sender: TObject);
    procedure lbl1MouseEnter(Sender: TObject);
    procedure lbl1MouseLeave(Sender: TObject);
    procedure lbl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGeneral: TFGeneral;

implementation

uses
  mame_others;  
{$R *.dfm}

procedure TFGeneral.sButton1Click(Sender: TObject);
begin
  CloseShowingIPSImage_MameBuilds;
end;

procedure TFGeneral.lbl1MouseEnter(Sender: TObject);
begin
  ChangeColorInFont_MameBuilds;
end;

procedure TFGeneral.lbl1MouseLeave(Sender: TObject);
begin
  DefaultColorInFont_MameBuilds;
end;

procedure TFGeneral.lbl1Click(Sender: TObject);
begin
  ChangeImage2x_MameBuilds;
end;

end.
