unit ce_logsession;

interface
uses
  SysUtils,Classes,ExtCtrls,Graphics,
  JvRichEdit;


procedure Log_WelcomeMessage(Log_Started: Boolean);
procedure Log_FooterMessage(Log_Started: Boolean);
procedure Log_NewText(text: string);  
procedure Log_NewTextEnter(text: String);
procedure Log_NewTextStartingTheme(theme: string);
procedure Log_BigCutLine;
procedure Log_NewLine;
procedure Log_WarningMessage(WMessage: String);
procedure Log_Bullets(on_off: Boolean);
procedure Log_ChangeFontSize(size: integer);
procedure Log_ChangeFontColor(color: TColor);


  
// Menu actions  
procedure ce_logsession_ShowDynamicComps;
procedure ce_logsession_FreeDynamicComps;
procedure Show_confEditor_logsessionpanel;

implementation
uses
  main,mainconf,onflycomponents,FunctionX,menu,
  ce_wizard,ce_themes,ce_config;

procedure Log_WelcomeMessage(Log_Started : Boolean);  
begin
  Log_BigCutLine;
  Log_NewLine;Log_NewLine;  
  Log_ChangeFontSize(10);  
  Log_ChangeFontColor(clBlue);
  if Log_Started = true then
    begin
      Conf.RE_Log.SelText := '"LOG SESSION (';
      Log_ChangeFontColor(clGreen); 
      Conf.RE_Log.SelText := 'Starting Program';
      Log_ChangeFontColor(clBlue); 
      Conf.RE_Log.SelText := ')"';
      Log_ChangeFontSize(8);
      Conf.RE_Log.SelText := '    Date: ' + DateToStr(now);
      Conf.RE_Log.SelText := '    Time: ' + TimeToStr(now);
      Log_ChangeFontColor(clBlack);
      Log_NewLine;Log_NewLine;
      Log_NewText('Project Page : ');
      Log_NewTextEnter('http://code.google.com/p/extrafe/');
      Log_NewText('Blog Page : ');
      Log_NewText('http://arcazrael.wordpress.com/');
      Log_NewText(' ');
      Log_NewTextEnter('(Too Lazy to update BUT sometime...)');
    end
  else
    begin
      Conf.RE_Log.SelText := '"LOG SESSION (';    
      Log_ChangeFontColor(clGreen); 
      Conf.RE_Log.SelText := 'Main Clicked Program';
      Log_ChangeFontColor(clBlue); 
      Conf.RE_Log.SelText := ')"';
      Log_ChangeFontSize(8);
      Conf.RE_Log.SelText := '    Date: ' + DateToStr(now);
      Conf.RE_Log.SelText := '    Time: ' + TimeToStr(now);
      Log_ChangeFontColor(clBlack);
      Log_NewLine;
    end;  
  Log_NewLine;
  Log_BigCutLine;
  Log_NewLine;Log_NewLine;  
end;

procedure Log_FooterMessage(Log_Started: Boolean);
begin
  Log_BigCutLine;
  Log_NewLine;
  Log_ChangeFontSize(10);  
  if Log_Started = True then
    begin
      Log_ChangeFontColor(clGreen); 
      Log_NewTextEnter('confEditor starting proccess successfully');      
    end
  else
    begin
    
    end;
  Log_ChangeFontSize(8);    
  Log_ChangeFontColor(clBlack);
  Log_BigCutLine;
  Log_NewLine;Log_NewLine;  
end;

procedure Log_NewText(text: string);  
begin
  Conf.RE_Log.SelText := text;
end;

procedure Log_NewTextEnter(text: String);
begin
  Log_NewText(text);
  Log_NewLine;
end;

procedure Log_NewTextStartingTheme(theme: string);
begin
  Log_ChangeFontColor(clBlue);
  Log_NewTextEnter(theme);
  Log_ChangeFontColor(clBlack);
end;

procedure Log_BigCutLine;
var
  i: integer;
begin
  for i := 0 to 109 do 
    Conf.RE_Log.SelText := '-';
end;

procedure Log_WarningMessage(WMessage: String);
begin
  Log_ChangeFontColor(clRed);
  Log_NewText('Warning!!! ');
  Log_ChangeFontColor(clBlack);
  Log_NewTextEnter(WMessage);
end;
  
procedure Log_NewLine;
begin
  Conf.RE_Log.SelText := #13#10;
end;

procedure Log_ChangeFontSize(size: integer);
begin
  Conf.RE_Log.SelAttributes.Size := size;
end;

procedure Log_ChangeFontColor(color: TColor);
begin
  Conf.RE_Log.SelAttributes.Color := color;
end;

procedure Log_Bullets(on_off: Boolean);
begin
  if on_off = true then
    Conf.RE_Log.Paragraph.Numbering := nsBullet
  else
    Conf.RE_Log.Paragraph.Numbering := nsNone;
end;

//////////////////////////////////////////////////////////////

procedure ce_logsession_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pce_logsession,'media\confeditor\images\confeditor\confeditor.png',
              3,571,155,85,i,'',True,False);
        2 : Image_Comp(Conf.Pce_logsession,'media\confeditor\images\confeditor\confeditor_image.png',
              600,381,126,280,i,'',True,False);
        3 : Image_Comp(Conf.Pce_logsession,'media\confeditor\images\confeditor\logsession.png',
              530,2,230,71,i,'',True,False);
      end;
    end;
end;

procedure ce_logsession_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
end;

procedure Show_confEditor_logsessionpanel;
begin
  if Cmenustate = 'startwizard' then
    ce_wizard_FreeDynamicComps
  else if Cmenustate = 'ce_themes' then
    ce_themes_FreeDynamicComps
  else if Cmenustate = 'ce_configuration' then
    ce_config_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn9.Caption,False,True);
  Cmenustate := 'ce_logsession';
  ce_logsession_ShowDynamicComps;
  ShowButtonDown(9,'CONFEDITOR_LOG');
  ShowHidePanel(CurrentPanel,'Pce_logsession');
end;

end.
