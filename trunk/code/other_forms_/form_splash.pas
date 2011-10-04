unit form_splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sGauge, ExtCtrls, JvExExtCtrls, JvImageRotate,
  ImgList, JvExControls, JvBmpAnimator,main, sSkinProvider, acPNG;

type
  TSplash_Screen = class(TForm)
    sGauge_Splash: TsGauge;
    JvBmpAnimator1: TJvBmpAnimator;
    ImageList_Splash: TImageList;
    sSkinProvider1: TsSkinProvider;
    sLabel1: TsLabel;
    img1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Progress_Label(num: Integer; Words: string);
    { Public declarations }
  end;

var
  Splash_Screen: TSplash_Screen;

implementation

{$R *.dfm}

procedure TSplash_Screen.FormCreate(Sender: TObject);
begin
  JvBmpAnimator1.Active := True;
end;

procedure TSplash_Screen.FormDestroy(Sender: TObject);
begin
  JvBmpAnimator1.Active := False;
end;

procedure TSplash_Screen.Progress_Label(num: Integer; Words: string);
begin
  sGauge_Splash.Progress := num;
  sLabel1.Caption := Words;
  Application.ProcessMessages;
end;

end.
