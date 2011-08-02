unit form_color;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExExtCtrls, JvExtComponent, JvPanel,
  JvOfficeColorPanel;

type
  Tfrm_color = class(TForm)
    JvOfficeColorPanel1: TJvOfficeColorPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_color: Tfrm_color;

implementation

{$R *.dfm}

end.
