unit vitru_key;

interface

uses
  Classes,Graphics,SysUtils,
  GLScene,GLHUDObjects,GLObjects,GLMaterial,GLBitmapFont,
  VectorGeometry,GLRenderContextInfo,BaseClasses,
  used_pro,loadT,uMain_ListBox;

const
  fKeys: array [0..36] of string = ('1','2','3','4','5','6','7','8','9','0','<','Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z','X','C','V','B','N','M');

procedure CreateKeyboard;
function IsVKeyboardCreated: boolean;
function IsVKeyboardShowing: boolean;
procedure ShowVKeyboard(show: boolean);
procedure DoVSAction(TheKey: Word; ShiftS: TShiftState);

procedure DoSearchResult(ToSearch: String);

var
  MyVKeyboard: TGLHUDSprite;
  MyVSearchBar: TGLHUDSprite;
  MyTextSearch: TGLHUDText;
  MyTextNoResult: TGLHUDText;
  MyVKGlow: TGLHUDSprite;
  MySearchIcon: TGLHUDSprite;

implementation

uses
  GLCrossPlatform,mame,main,GlKeyboard;

procedure CreateKeyboard;
begin
  AddMaterials(MatLib,ProgramPath + 'media\extrafe\virtualkey\',['vKeyboard','searchbar','b_t'],['VKeyboard','VSearch','KeyMark']);

  MyVKeyboard := TGLHUDSprite.CreateAsChild(MainForm.Dummy_VirtualKey);
  MyVKeyboard.Material.MaterialLibrary := MatLib;
  MyVKeyboard.Name := 'MyVirtualKeyboard0';
  MyVKeyboard.Material.LibMaterialName := 'VKeyboard';
  MyVKeyboard.Width := MyVKeyboard.Material.GetActualPrimaryTexture.Image.Width;
  MyVKeyboard.Height := MyVKeyboard.Material.GetActualPrimaryTexture.Image.Height;
  MyVKeyboard.Position.SetPoint(512,600,0);
  MyVKeyboard.Visible := False;

  MyVSearchBar := TGLHUDSprite.CreateAsChild(MainForm.Dummy_VirtualKey);
  MyVSearchBar.Material.MaterialLibrary := MatLib;
  MyVSearchBar.Name := 'MyVirtualSearchBar0';
  MyVSearchBar.Material.LibMaterialName := 'VSearch';
  MyVSearchBar.Width := MyVSearchBar.Material.GetActualPrimaryTexture.Image.Width;
  MyVSearchBar.Height := MyVSearchBar.Material.GetActualPrimaryTexture.Image.Height;
  MyVSearchBar.Position.SetPoint(512,480,0);
  MyVSearchBar.Visible := False;

  MyTextSearch := TGLHUDText.CreateAsChild(MainForm.Dummy_virtualtext);
  MyTextSearch.BitmapFont := loadT.fexistFont;
  MyTextSearch.ModulateColor.AsWinColor := clWhite;
  MyTextSearch.Name := 'MySearchText0';
  MyTextSearch.Text := '';
  MyTextSearch.Position.SetPoint(260,470,0);
  MyTextSearch.Visible := False;

  MyTextNoResult := TGLHUDText.CreateAsChild(MainForm.Dummy_virtualtext);
  MyTextNoResult.BitmapFont := loadT.fexistFont;
  MyTextNoResult.ModulateColor.AsWinColor := clWhite;
  MyTextNoResult.Name := 'MySearchText1';
  MyTextNoResult.Text := '';
  MyTextNoResult.Alignment := taCenter;
  MyTextNoResult.Position.SetPoint(512,440,0);
  MyTextNoResult.Visible := False;

  MyVKGlow := TGLHUDSprite.CreateAsChild(MainForm.Dummy_virtualtext);
  MyVKGlow.Material.MaterialLibrary := MatLib;
  MyVKGlow.Name := 'MyVirtualKeyGlow0';
  MyVKGlow.Material.LibMaterialName := 'KeyMark';
  MyVKGlow.Width := MyVKGlow.Material.GetActualPrimaryTexture.Image.Width;
  MyVKGlow.Height := MyVKGlow.Material.GetActualPrimaryTexture.Image.Height;
  MyVKGlow.Position.SetPoint(266,532,0);
  MyVKGlow.Visible := False;

  MySearchIcon := TGLHUDSprite.CreateAsChild(MainForm.Dummy_virtualtext);
  MySearchIcon.Material.MaterialLibrary := MatLib;
  MySearchIcon.Name := 'MySearchIconGlow0';
  MySearchIcon.Material.LibMaterialName := 'mSearch_Glow';
  MySearchIcon.Width := MySearchIcon.Material.GetActualPrimaryTexture.Image.Width;
  MySearchIcon.Height := MySearchIcon.Material.GetActualPrimaryTexture.Image.Height;
  MySearchIcon.SetSize(64,64);
  MySearchIcon.Position.SetPoint(230,460,0);
  MySearchIcon.Visible := False;

  VK_Create := True;
  ShowVKeyBoard(true);
end;

function IsVKeyboardCreated: boolean;
begin
  if Assigned(MyVKeyboard) then
    Result := true;
end;

function IsVKeyboardShowing: boolean;
begin
  if VK_Create = True then
    result := MyVKeyboard.Visible;
end;

procedure ShowVKeyboard(show: boolean);
begin
  if show = true then
    begin
      fade_blurS := True;
      if VK_Create = false then
        CreateKeyboard;
      MainForm.video.Visible := false;
      if PlayVideo = true then
        begin
          MyVideo.SetAudioVolume(50);
          Sleep(200);
        end;
      MyTextSearch.Text := '';
    end
  else
    begin
      fade_blurS := False;
      Sleep(200);
      if PlayVideo = true then
        begin
          MainForm.video.Visible := true;
          MyVideo.SetAudioVolume(100);
        end;
    end;
  MyVKeyboard.Visible := show;
  MyVSearchBar.Visible := show;
  MyTextSearch.Visible := show;
  MyTextNoResult.Visible := show;
  MyVKGlow.Visible := show;
  MySearchIcon.Visible := show;
end;

procedure DoVSAction(TheKey: Word; ShiftS: TShiftState);
const
  fKeysFirstLine: array [0..9] of string = ('1','2','3','4','5','6','7','8','9','0');
  fKeysSecondLine: array [0..9] of string = ('q','w','e','r','t','y','u','i','o','p');
  fKeysThirdLine: array [0..8] of string = ('a','s','d','f','g','h','j','k','l');
  fKeysFourthLine: array [0..6] of string = ('z','x','c','v','b','n','m');
  fSpecialKeys: array[0..15] of Integer = (27,192,189,8,219,221,220,20,186,222,13,16,32,188,190,191);
  LineOneHeight = 534;
  LineTwoHeight = 567;
  LineThirdHeight = 601;
  LineFourthHeight = 634;
  LineBackSpaceHeight = 669;

  procedure GlowKey(GKey: String; gKeyLine,gKeyNum: Integer);
  var
    gKeyX,gKeyY: Integer;
  begin
    case gKeyLine of
      1 : begin
            gKeyX := 266 + (gKeyNum * 34);
            if gKeyNum = 13 then
              gKeyX := gKeyX + 23
            else if gKeyNum > 5 then
              gKeyX := gKeyX - 1;
            gKeyY := 532;
            MyVKGlow.Position.SetPoint(gKeyX,gKeyY,0);
          end;
      2 : begin
            gKeyX := 317 + (gKeyNum * 34);
            if gKeyNum = 12 then
              gKeyX := gKeyX + 15
            else if gKeyNum > 8 then
              gKeyX := gKeyX - 1;
            gKeyY := 567;
            MyVKGlow.Position.SetPoint(gKeyX,gKeyY,0);
          end;
      3 : begin
            gKeyX := 292 + (gKeyNum * 34);
            if gKeyNum = 0 then
              gKeyX := gKeyX - 13
            else if gKeyNum > 3 then
              gKeyX := gKeyX - 2;
            gKeyY := 601;
            MyVKGlow.Position.SetPoint(gKeyX,gKeyY,0);
          end;
      4 : begin
            gKeyX := 341 + (gKeyNum * 34);
            if gKeyNum = 10 then
              gKeyX := gKeyX + 38;
            gKeyY := 634;
            MyVKGlow.Position.SetPoint(gKeyX,gKeyY,0);
          end;
      5 : begin
            gKeyX := 507;
            gKeyY := 669;
            MyVKGlow.Position.SetPoint(gKeyX,gKeyY,0);
          end;
    end;
  end;

  procedure GoTheGlowToKey(cKey: Word );
  var
    FoundGKey: string;
    FoundGKeyNum: Integer;
    FoundSpecialKey: string;
    FoundKey: boolean;
    FoundLine,i: Integer;

  begin
    FoundGKey:= '';
    FoundKey := False;
    FoundLine:= 0;
    FoundSpecialKey := '';
    MyVKGlow.SetSize(34,34);
    for i := 0 to 15 do
      if cKey = fSpecialKeys[i] then
        begin
          FoundSpecialKey := IntToStr(cKey);
          if FoundSpecialKey = '27' then
            begin
              FoundGkey := 'Esc';
              FoundGKeyNum := 0;
            end
          else if FoundSpecialKey = '192' then
            begin
              FoundGKey := '`';
              FoundGKeyNum := 1;
              MyTextSearch.Text := MyTextSearch.Text + FoundGKey;
            end
          else if FoundSpecialKey = '189' then
            begin
              FoundGKey := '-';
              FoundGKeyNum := 12;
              MyTextSearch.Text := MyTextSearch.Text + FoundGKey;
            end
          else if FoundSpecialKey = '8' then
            begin
              FoundGKey := 'BackSpace';
              FoundGKeyNum := 13;
              MyVKGlow.SetSize(85,34);
            end
          else if FoundSpecialKey = '219' then
            begin
              FoundGKey := '[';
              FoundGKeyNum := 10;
              MyTextSearch.Text := MyTextSearch.Text + FoundGKey;
            end
          else if FoundSpecialKey = '221' then
            begin
              FoundGKey := ']';
              FoundGKeyNum := 11;
              MyTextSearch.Text := MyTextSearch.Text + FoundGKey;
            end
          else if FoundSpecialKey = '220' then
            begin
              FoundGKey := '\';
              FoundGKeyNum := 12;
              MyTextSearch.Text := MyTextSearch.Text + FoundGKey;
              MyVKGlow.SetSize(67,34);
            end
          else if FoundSpecialKey = '20' then
            begin
              FoundGKey := 'Caps';
              FoundGKeyNum := 0;
              MyVKGlow.SetSize(58,34);
            end
          else if FoundSpecialKey = '186' then
            begin
              FoundGKey := ';';
              FoundGKeyNum := 10;
              MyTextSearch.Text := MyTextSearch.Text + FoundGKey;
            end
          else if FoundSpecialKey = '222' then
            begin
              FoundGKey := '''';
              FoundGKeyNum := 11;
              MyTextSearch.Text := MyTextSearch.Text + FoundGKey;
            end
          else if FoundSpecialKey = '13' then
            begin
              FoundGKey := 'ENTER';
              FoundGKeyNum := 12;
            end
          else if FoundSpecialKey = '188' then
            begin
              FoundGKey := ',';
              FoundGKeyNum := 7;
              MyTextSearch.Text :=MyTextSearch.Text + FoundGKey;
            end
          else if FoundSpecialKey = '190' then
            begin
              FoundGKey := '.';
              FoundGKeyNum := 8;
              MyTextSearch.Text :=MyTextSearch.Text + FoundGKey;
            end
          else if FoundSpecialKey = '191' then
            begin
              FoundGKey := '/';
              FoundGKeyNum := 9;
              MyTextSearch.Text :=MyTextSearch.Text + FoundGKey;
            end
          else if FoundSpecialKey = '16' then
            begin
              FoundGKey := 'Shift';
              FoundGKeyNum := 10;
              MyVKGlow.SetSize(110,34);
            end
          else if FoundSpecialKey = '32' then
            begin
              FoundGKey := 'Space';
              FoundGKeyNum := 1;
              MyVKGlow.SetSize(342,34);
            end;
        end;
    for i := 0 to 9 do
      if (LowerCase(chr(cKey)) = fKeysFirstLine[i]) or (FoundSpecialKey = '8') or (FoundSpecialKey = '27') or (FoundSpecialKey = '192') or (FoundSpecialKey = '189') then
        begin
          FoundKey := true;
          FoundLine := 1;
          if FoundGKey = '' then
            begin
              FoundGKey := chr(cKey);
              FoundGKeyNum := i + 2;
            end;
          Break;
        end;
    if FoundKey = false then
      for i := 0 to 9 do
        if (LowerCase(chr(cKey)) = fKeysSecondLine[i]) or (FoundSpecialKey = '219') or (FoundSpecialKey = '221') or (FoundSpecialKey = '220') then
          begin
            FoundKey := true;
            FoundLine := 2;
            if FoundGKey = '' then
              begin
                FoundGKey := chr(cKey);
                FoundGKeyNum := i;
              end;
            Break;
          end;
    if FoundKey = false then
      for i := 0 to 8 do
        if (LowerCase(chr(cKey)) = fKeysThirdLine[i]) or (FoundSpecialKey = '20' ) or (FoundSpecialKey = '186') or (FoundSpecialKey = '222') or (FoundSpecialKey = '13') then
          begin
            FoundKey := true;
            FoundLine := 3;
            if FoundGKey = '' then
              begin
                FoundGKey := chr(cKey);
                FoundGKeyNum := i + 1;
              end;
            Break;
          end;
    if FoundKey = false then
      for i := 0 to 6 do
        if (LowerCase(chr(cKey)) = fKeysFourthLine[i]) or (FoundSpecialKey = '188' ) or (FoundSpecialKey = '190' ) or (FoundSpecialKey = '191' ) or (FoundSpecialKey = '16' ) then
          begin
            FoundKey := true;
            FoundLine := 4;
            if FoundGKey = '' then
              begin
                FoundGKey := chr(cKey);
                FoundGKeyNum := i;
              end;
            Break;
          end;
    if (FoundKey = false) and (FoundSpecialKey = '32') then
      begin
        FoundKey := True;
        FoundLine := 5;
        FoundGKeyNum := 1;
      end;
    GlowKey(FoundGKey,FoundLine,FoundGKeyNum);
  end;

begin
  if MyTextNoResult.Text <> '' then
    MyTextNoResult.Text := '';
  if TheKey = 13 then
    begin
      DoSearchResult(MyTextSearch.Text);
    end
  else if TheKey = 8 then
    begin
      if MyTextSearch.Text <> '' then
        MyTextSearch.Text := Trim(Copy(MyTextSearch.Text,0,length(MyTextSearch.Text) - 1));
    end
  else
    MyTextSearch.Text := LowerCase(MyTextSearch.Text + chr(TheKey));
  GoTheGlowToKey(TheKey);
end;

procedure DoSearchResult(ToSearch: String);
var
  i,k,cChar: integer;
  mGameName: WideString;
  FoundResult: Boolean;
begin
  FoundResult := false;
  cChar := length(ToSearch);
  k := 0;
  for i := 0 to MameRomsEmulated - 1 do
    begin
      mGameName := Trim(copy(fListBox_Mame.GetItemByIndex(i).GameName,0,cChar));
      if UpperCase(ToSearch) = UpperCase(mGameName) then
        begin
          FoundResult := True;
          k := i;
          Break;
        end;
    end;
  if FoundResult = true then
    begin
      fListBox_Mame.fYPosition := 0 - ( 30 * (k - 6));
      sItem := k;
      ShowVKeyboard(false);
      IsImgShowed := false;
    end
  else
    MyTextNoResult.Text := 'Sorry I can not find Results';    
end;

end.
