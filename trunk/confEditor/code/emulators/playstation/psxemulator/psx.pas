unit psx;

interface
uses
  SysUtils,Graphics, Controls, Forms, StdCtrls, inifiles, FunctionX;

  Procedure pSXKeyCode(Key: Word);

var
    pSXKey,pSXKeyC,ShowString : String;

implementation

Procedure pSXKeyCode(Key: word);
Begin
  if Key = 27 then
    begin
      pSXKey := '1';
      pSXKeyC := 'ESC';
    end;
  if Key = 49 then
    begin
      pSXKey := '2';
      pSXKeyC := '1';
    end;
  if Key = 50 then
    begin
      pSXKey := '3';
      pSXKeyC := '2';
    end;
  if Key = 51 then
    begin
      pSXKey := '4';
      pSXKeyC := '3';
    end;
  if Key = 52 then
    begin
      pSXKey := '5';
      pSXKeyC := '4';
    end;
  if Key = 53 then
    begin
      pSXKey := '6';
      pSXKeyC := '5';
    end;
  if Key = 54 then
    begin
      pSXKey := '7';
      pSXKeyC := '6';
    end;
  if Key = 55 then
    begin
      pSXKey := '8';
      pSXKeyC := '7';
    end;
  if Key = 56 then
    begin
      pSXKey := '9';
      pSXKeyC := '8';
    end;
  if Key = 57 then
    begin
      pSXKey := '10';
      pSXKeyC := '9';
    end;
  if Key = 48 then
    begin
      pSXKey := '11';
      pSXKeyC := '0';
    end;
  if Key = 189 then
    begin
      pSXKey := '12';
      pSXKeyC := '-';
    end;
  if Key = 187 then
    begin
      pSXKey := '13';
      pSXKeyC := '=';
    end;
  if Key = 8 then
    begin
      pSXKey := '14';
      pSXKeyC := 'BACKSPACE';
    end;
  if Key = 81 then
    begin
      pSXKey := '16';
      pSXKeyC := 'Q';
    end;
  if Key = 87 then
    begin
      pSXKey := '17';
      pSXKeyC := 'W';
    end;
  if Key = 69 then
    begin
      pSXKey := '18';
      pSXKeyC := 'E';
    end;
  if Key = 82 then
    begin
      pSXKey := '19';
      pSXKeyC := 'R';
    end;
  if Key = 84 then
    begin
      pSXKey := '20';
      pSXKeyC := 'T';
    end;
  if Key = 89 then
    begin
      pSXKey := '21';
      pSXKeyC := 'Y';
    end;
  if Key = 85 then
    begin
      pSXKey := '22';
      pSXKeyC := 'U';
    end;
  if Key = 73 then
    begin
      pSXKey := '23';
      pSXKeyC := 'I';
    end;
  if Key = 79 then
    begin
      pSXKey := '24';
      pSXKeyC := 'O';
    end;
  if Key = 80 then
    begin
      pSXKey := '25';
      pSXKeyC := 'P';
    end;
  if Key = 219 then
    begin
      pSXKey := '26';
      pSXKeyC := '{';
    end;
  if Key = 221 then
    begin
      pSXKey := '27';
      pSXKeyC := '}';
    end;
  if Key = 13 then
    begin
      pSXKey := '28';
      pSXKeyC := 'ENTER';
    end;
  if Key = 17 then
    begin
      pSXKey := '29';
      pSXKeyC := 'CTRL';
    end;
  if Key = 65 then
    begin
      pSXKey := '30';
      pSXKeyC := 'A';
    end;
  if Key = 83 then
    begin
      pSXKey := '31';
      pSXKeyC := 'S';
    end;
  if Key = 68 then
    begin
      pSXKey := '32';
      pSXKeyC := 'D';
    end;
  if Key = 70 then
    begin
      pSXKey := '33';
      pSXKeyC := 'F';
    end;
  if Key = 71 then
    begin
      pSXKey := '34';
      pSXKeyC := 'G';
    end;
  if Key = 72 then
    begin
      pSXKey := '35';
      pSXKeyC := 'H';
    end;
  if Key = 74 then
    begin
      pSXKey := '36';
      pSXKeyC := 'J';
    end;
  if Key = 75 then
    begin
      pSXKey := '37';
      pSXKeyC := 'K';
    end;
  if Key = 76 then
    begin
      pSXKey := '38';
      pSXKeyC := 'L';
    end;
  if Key = 186 then
    begin
      pSXKey := '39';
      pSXKeyC := ';';
    end;
  if Key = 222 then
    begin
      pSXKey := '40';
      pSXKeyC := '"';
    end;
  if Key = 192 then
    begin
      pSXKey := '41';
      pSXKeyC := '`';
    end;
  if Key = 16 then
    begin
      pSXKey := '42';
      pSXKeyC := 'SHIFT';
    end;
  if Key = 220 then
    begin
      pSXKey := '43';
      pSXKeyC := '\';
    end;
  if Key = 90 then
    begin
      pSXKey := '44';
      pSXKeyC := 'Z';
    end;
  if Key = 88 then
    begin
      pSXKey := '45';
      pSXKeyC := 'X';
    end;
  if Key = 67 then
    begin
      pSXKey := '46';
      pSXKeyC := 'C';
    end;
  if Key = 86 then
    begin
      pSXKey := '47';
      pSXKeyC := 'V';
    end;
  if Key = 66 then
    begin
      pSXKey := '48';
      pSXKeyC := 'B';
    end;
  if Key = 78 then
    begin
      pSXKey := '49';
      pSXKeyC := 'N';
    end;
  if Key = 77 then
    begin
      pSXKey := '50';
      pSXKeyC :='M';
    end;
  if Key = 188 then
    begin
      pSXKey := '51';
      pSXKeyC := ',';
    end;
  if Key = 190 then
    begin
      pSXKey := '52';
      pSXKeyC := '.';
    end;
  if Key = 191 then
    begin
      pSXKey := '53';
      pSXKeyC := '/';
    end;
  if Key = 16 then
    begin
      pSXKey := '54';
      pSXKeyC := 'SHIFT';
    end;
  if Key = 106 then
    begin
      pSXKey := '55';
      pSXKeyC := '*';
    end;
  if Key = 18 then
    begin
      pSXKey := '56';
      pSXKeyC := 'ALT';
    end;
  if Key = 32 then
    begin
      pSXKey := '57';
      pSXKeyC := 'SPACE';
    end;
  if Key = 20 then
    begin
      pSXKey := '58';
      pSXKeyC := 'CAPS LOCK';
    end;
  if Key = 112 then
    begin
      pSXKey := '59';
      pSXKeyC := 'F1';
    end;
  if Key = 113 then
    begin
      pSXKey := '60';
      pSXKeyC := 'F2';
    end;
  if Key = 114 then
    begin
      pSXKey := '61';
      pSXKeyC := 'F3';
    end;
  if Key = 115 then
    begin
      pSXKey := '62';
      pSXKeyC := 'F4';
    end;
  if Key = 116 then
    begin
      pSXKey := '63';
      pSXKeyC := 'F5';
    end;
  if Key = 117 then
    begin
      pSXKey := '64';
      pSXKeyC := 'F6';
    end;
  if Key = 118 then
    begin
      pSXKey := '65';
      pSXKeyC := 'F7';
    end;
  if Key = 119 then
    begin
      pSXKey := '66';
      pSXKeyC := 'F8';
    end;
  if Key = 120 then
    begin
      pSXKey := '67';
      pSXKeyC := 'F9';
    end;
  if Key = 121 then
    begin
      pSXKey := '68';
      pSXKeyC := 'F10';
    end;
  if Key = 144 then
    begin
      pSXKey := '69';
      pSXKeyC := 'NUM LOCK';
    end;
  if Key = 145 then
    begin
      pSXKey := '70';
      pSXKeyC := 'SCROLL LOCK';
    end;
  if Key = 103 then
    begin
      pSXKey := '71';
      pSXKeyC := 'NUM 7';
    end;
  if Key = 104 then
    begin
      pSXKey := '72';
      pSXKeyC := 'NUM 8';
    end;
  if Key = 105 then
    begin
      pSXKey := '73';
      pSXKeyC := 'NUM 9';
    end;
  if Key = 109 then
    begin
      pSXKey := '74';
      pSXKeyC := 'NUM -';
    end;
  if Key = 100 then
    begin
      pSXKey := '75';
      pSXKeyC := 'NUM 4';
    end;
  if Key = 101 then
    begin
      pSXKey := '76';
      pSXKeyC := 'NUM 5';
    end;
  if Key = 102 then
    begin
      pSXKey := '77';
      pSXKeyC := 'NUM 6';
    end;
  if Key = 107 then
    begin
      pSXKey := '78';
      pSXKeyC := 'NUM +';
    end;
  if Key = 97 then
    begin
      pSXKey := '79';
      pSXKeyC := 'NUM 1';
    end;
  if Key = 98 then
    begin
      pSXKey := '80';
      pSXKeyC := 'NUM 2';
    end;
  if Key = 99 then
    begin
      pSXKey := '81';
      pSXKeyC := 'NUM 3';
    end;
  if Key = 96 then
    begin
      pSXKey := '82';
      pSXKeyC := 'NUM 0';
    end;
  if Key = 110 then
    begin
      pSXKey := '83';
      pSXKeyC := 'NUM .';
    end;
	//84
	//85
	//86
  if Key = 122 then
    begin
      pSXKey := '87';
      pSXKeyC := 'F11';
    end;
  if Key = 123 then
    begin
      pSXKey := '88';
      pSXKeyC := 'F12';
    end;
	//89
	//90
	//91
	//92
	//93
	//94
	//95
  if Key = 13 then
    begin
      pSXKey := '96';
      pSXKeyC := 'ENTER';
    end;
  if Key = 17 then
    begin
      pSXKey := '97';
      pSXKeyC := 'CTRL';
    end;
  if Key = 111 then
    begin
      pSXKey := '181';
      pSXKeyC := 'NUM /';
    end;
  //if Key = 'prt scr' then pSXKey := '99';
  if Key = 18 then
    begin
      pSXKey := '100';
      pSXKeyC := 'ALT';
    end;
	//101
  if Key = 36 then
    begin
      pSXKey := '210';
      pSXKeyC := 'HOME';
    end;
  if Key = 38 then
    begin
      pSXKey := '208';
      pSXKeyC := 'ARROW UP';
    end;
  if Key = 33 then
    begin
      pSXKey := '201';
      pSXKeyC := 'PAGE UP';
    end;
  if Key = 37 then
    begin
      pSXKey := '205';
      pSXKeyC := 'ARROW LEFT';
    end;
  if Key = 39 then
    begin
      pSXKey := '203';
      pSXKeyC := 'ARROW RIGHT';
    end;
  if Key = 35 then
    begin
      pSXKey := '211';
      pSXKeyC := 'END';
    end;
  if Key = 40 then
    begin
      pSXKey := '200';
      pSXKeyC := 'ARROW DOWN';
    end;
  if Key = 34 then
    begin
      pSXKey := '209';
      pSXKeyC := 'PAGE DOWN';
    end;
  if Key = 45 then
    begin
      pSXKey := '119';
      pSXKeyC := 'INSERT';
    end;
  if Key = 46 then
    begin
      pSXKey := '207';
      pSXKeyC := 'DELETE';
    end;
	//112
	//113
	//114
	//115
	//116
	//117
	//118
  if Key = 19 then
    begin
      pSXKey := '119';
      pSXKeyC := 'PAUSE BREAK';
    end;
end;
end.
