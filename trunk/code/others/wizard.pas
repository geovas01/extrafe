unit wizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,main, Buttons, sBitBtn, sEdit;

type
  TFormWizard = class(TForm)
    mmo1: TMemo;
    btn1: TButton;
    btn2: TButton;
    img1: TImage;
    sEdit1: TsEdit;
    sBitBtn1: TsBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWizard: TFormWizard;
  RunGenres: Boolean;

implementation

{$R *.dfm}

uses
  mainconf;

procedure TFormWizard.btn1Click(Sender: TObject);
var
  mamepath: string;
begin
  mamepath := MameIni.ReadString('Path','FullDir',mamepath);
  if (FileExists(mamepath + 'catver.ini')) or (sEdit1.Text <> '') then
    begin
      RunGenres := True;
      FormWizard.Close;
    end
  else
    begin
      sbitbtn1.Visible := true;
      sEdit1.Visible := true;
      mmo1.Lines.Add('The Catver.ini doesnt found in Mame directory');
      mmo1.Lines.Add('Please add it manually or skip the process');
      mmo1.Lines.Add('Remember that you can do this action from then database statistics form');
    end;
end;

procedure TFormWizard.sBitBtn1Click(Sender: TObject);
var
  mamedir: String;
begin
  ConfIni.WriteString('Find','FindFilesWho','Catver');
  mamedir := ConfIni.ReadString('Path','FullDir',mamedir);
  Conf.Find_Files.InitialDir := mamedir;
  Conf.Find_Files.FileName := '';
  Conf.Find_Files.Filter := 'Catver.ini |Catver.ini';
  MameIni.WriteString('Temp','Edit',sEdit1.Text);
  Conf.Find_Files.Execute;
end;

procedure TFormWizard.btn2Click(Sender: TObject);
begin
  RunGenres := False;
  FormWizard.Close;
end;

end.
