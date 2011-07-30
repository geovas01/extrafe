unit mame;

interface

uses
  Windows, Messages,SysUtils, Controls, Dialogs, StdCtrls, ShellAPI, ComCtrls, inifiles, FunctionX,
  Main,mame_database,mainconf,wizard;

  Procedure MameRotationChange;
  procedure HistoryButtonFindClick;
  procedure MameInfoButtonFindClick;


implementation

//{$R *.dfm}


Procedure MameRotationChange;
Begin
  Case Conf.sComboBox20.ItemIndex of
    0 : begin
        end;
    1 : begin
        end;
    2 : begin
        end;
    3 : begin
          MameIni.WriteString('MameIni','Rotate','0');
          MameIni.WriteString('MameIni','Ror','0');
          MameIni.WriteString('MameIni','Rol','0');
          MameIni.WriteString('MameIni','Autoror','0');
          MameIni.WriteString('MameIni','Autorol','0');
        end;
    4 : begin
        end;
    5 : begin
        end;
  end;
end;


procedure HistoryButtonFindClick;
var
  mamedir: String;
begin
  ConfIni.WriteString('Find','FindFilesWho','MameHistory');
  mamedir := ConfIni.ReadString('Path','FullDir',mamedir);
  Conf.Find_Files.InitialDir := mamedir;
  Conf.Find_Files.FileName := '';
  Conf.Find_Files.Filter := 'History.dat |History.dat';
  MameIni.WriteString('Temp','Edit',conf.sEdit56.Text);
  Conf.Find_Files.Execute;
end;

procedure MameInfoButtonFindClick;
var
  mamedir: String;
begin
  ConfIni.WriteString('Find','FindFilesWho','MameInfo');
  mamedir := ConfIni.ReadString('Path','FullDir',mamedir);
  Conf.Find_Files.InitialDir := mamedir;
  Conf.Find_Files.FileName := '';
  Conf.Find_Files.Filter := 'Mameinfo.dat| Mameinfo.dat';
  MameIni.WriteString('Temp','Edit',conf.sEdit57.Text);
  Conf.Find_Files.Execute;
end;

end.
