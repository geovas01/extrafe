{------------------------------------------------------------------------------}
{                                                                              }
{  TAnalogClock                                                                }
{  by Kambiz R. Khojasteh                                                      }
{                                                                              }
{  kambiz@delphiarea.com                                                       }
{  http://www.delphiarea.com                                                   }
{                                                                              }
{------------------------------------------------------------------------------}

unit AnalogClock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, GDIPAPI, GDIPOBJ;

type

  TAnalogClockStyle = (acSystem, acModern, acSquare, acTrad, acDiner,
    acCronometer, acFlower, acNovelty);

  TAnalogClock = class(TCustomControl)
  private
    FActive: Boolean;
    FStyle: TAnalogClockStyle;
    FShowSeconds: Boolean;
    FTime: TTime;
    FTimeOffset: TTime;
    FText: WideString;
    FFontName: TFontName;
    FShrinkOnly: Boolean;
    FOnClock: TNotifyEvent;
    TimerID: Cardinal;
    Face, Glass: TGPImage;
    HandHour, HandShadowHour: TGPBitmap;
    HandMin, HandShadowMin: TGPBitmap;
    HandSec, HandShadowSec: TGPBitmap;
    Pin, PinShadow: TGPBitmap;
    PartBounds, PartShadowBounds: TGPRect;
    FaceCenter: TGPPointF;
    OriginalBounds, EffectiveBounds: TGPRect;
    EffectiveRect: TRect;
    Clock: TGPBitmap;
    CS: TRTLCriticalSection;
    OffScreen: TBitmap;
    Background: TBitmap;
    InBouncePosition: Boolean;
    Prepared: Boolean;
    procedure SetActive(Value: Boolean);
    procedure SetStyle(Value: TAnalogClockStyle);
    procedure SetShowSeconds(Value: Boolean);
    procedure SetTime(const Value: TTime);
    procedure SetTimeOffset(const Value: TTime);
    procedure SetText(const Value: WideString);
    procedure SetFontName(const Value: TFontName);
    procedure SetShrinkOnly(Value: Boolean);
    function IsTimeStored: Boolean;
    function IsFontNameStored: Boolean;
    procedure UpdateOffScreen;
    procedure UpdateText(ReloadFace: Boolean);
    procedure UpdateClock(H, M, S: Word; Bounce: Single); overload;
    procedure UpdateClock; overload;
    procedure AdvanceClock;
    procedure StartTimer(Timeout: Cardinal);
    procedure StopTimer;
    procedure Prepare;
    procedure Unprepare;
    procedure CalcEffectiveBounds;
    procedure WMEraseBkgnd(var message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMWindowPosChanged(var message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMDestroy(var message: TWMDestroy); message WM_DESTROY;
  protected
    procedure AdjustSize; override;
    procedure Loaded; override;
    procedure Resize; override;
    procedure Paint; override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure InvalidateEx(ClockOnly: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetSampleImage(Style: TAnalogClockStyle): TGPImage;
  published
    property Active: Boolean read FActive write SetActive default True;
    property Style: TAnalogClockStyle read FStyle write SetStyle default acSystem;
    property ShowSeconds: Boolean read FShowSeconds write SetShowSeconds default True;
    property Time: TTime read FTime write SetTime stored IsTimeStored;
    property TimeOffset: TTime read FTimeOffset write SetTimeOffset;
    property FontName: TFontName read FFontName write SetFontName stored IsFontNameStored;
    property Text: WideString read FText write SetText;
    property ShrinkOnly: Boolean read FShrinkOnly write SetShrinkOnly default False;
    property Align;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Constraints;
    property ParentBiDiMode;
    property ParentShowHint;
    property ShowHint;
    property Visible;
    property OnClock: TNotifyEvent read FOnClock write FOnClock;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

function ImageFromResource(const ResName: String): TGPBitmap;
function CreateShadowImage(Image: TGPImage; Intensity: Single): TGPBitmap;
procedure DrawParentBackground(DC: HDC; Control: TControl);

procedure Register;

implementation

{$R *.res}

uses
  mmSystem, Types, ActiveX, ComObj;

const
  TimerResolution   = 10;
  TimerStartTimeout = 100;

const
  DefaultFontName = 'Tahoma';

type
  TClockInfo = record
    ResName: String;
    PartPos: TPoint;
    PartSize: TSize;
    TextOffset: Integer;
    TextMaxSize: TSize;
    TextColor: Cardinal;
    MaxFontSize: Single;
  end;

const
  ClockInfo: array[TAnalogClockStyle] of TClockInfo = (
    (ResName: 'SYSTEM';     PartPos: (X: 57; Y: 0);  PartSize: (cx: 13; cy: 129); TextOffset: 4;  TextMaxSize: (cx: 70; cy: 36); TextColor: $FF666666; MaxFontSize: 10),
    (ResName: 'MODERN';     PartPos: (X: 57; Y: -1); PartSize: (cx: 13; cy: 129); TextOffset: 4;  TextMaxSize: (cx: 74; cy: 36); TextColor: $FFFFFFFF; MaxFontSize: 10),
    (ResName: 'SQUARE';     PartPos: (X: 57; Y: -1); PartSize: (cx: 13; cy: 129); TextOffset: 4;  TextMaxSize: (cx: 66; cy: 36); TextColor: $FF000000; MaxFontSize: 10),
    (ResName: 'TRAD';       PartPos: (X: 56; Y: -1); PartSize: (cx: 13; cy: 129); TextOffset: 8;  TextMaxSize: (cx: 60; cy: 18); TextColor: $FF2F2E2E; MaxFontSize: 10),
    (ResName: 'DINER';      PartPos: (X: 57; Y: -1); PartSize: (cx: 13; cy: 129); TextOffset: 8;  TextMaxSize: (cx: 56; cy: 18); TextColor: $FFD3D9E3; MaxFontSize: 9),
    (ResName: 'CRONOMETER'; PartPos: (X: 56; Y: -1); PartSize: (cx: 13; cy: 129); TextOffset: 6;  TextMaxSize: (cx: 56; cy: 36); TextColor: $FFFF0000; MaxFontSize: 10),
    (ResName: 'FLOWER';     PartPos: (X: 58; Y: 0);  PartSize: (cx: 13; cy: 129); TextOffset: 16; TextMaxSize: (cx: 66; cy: 18); TextColor: $FFFE8E08; MaxFontSize: 9),
    (ResName: 'NOVELTY';    PartPos: (X: 52; Y: 46); PartSize: (cx: 7;  cy: 81);  TextOffset: 6;  TextMaxSize: (cx: 48; cy: 18); TextColor: $FF6DADFF; MaxFontSize: 8));

procedure Register;
begin
  RegisterComponents('Delphi Area', [TAnalogClock]);
end;

{ Helper Functions }

function ImageFromResource(const ResName: String): TGPBitmap;
var
  ResourceStream: TResourceStream;
  Stream: IStream;
  hMem: HGLOBAL;
  Ptr: Pointer;
  Img: TGPImage;
  G: TGPGraphics;
begin
  Result := nil;
  ResourceStream := TResourceStream.Create(HInstance, ResName, RT_RCDATA);
  try
    hMem := GlobalAlloc(GMEM_MOVEABLE, ResourceStream.Size);
    try
      Ptr := GlobalLock(hMem);
      try
        Move(ResourceStream.Memory^, Ptr^, ResourceStream.Size);
      finally
        GlobalUnlock(hMem);
      end;
      Stream := nil;
      if CreateStreamOnHGlobal(hMem, False, Stream) = S_OK then
      begin
        Img := TGPImage.Create(Stream, True);
        try
          Result := TGPBitmap.Create(Img.GetWidth, Img.GetHeight, PixelFormat32bppARGB);
          G := TGPGraphics.Create(Result);
          try
            G.SetInterpolationMode(InterpolationModeHighQuality);
            G.Clear(0);
            G.DrawImage(Img, 0, 0, Img.GetWidth, Img.GetHeight);
          finally
            G.Free;
          end;
        finally
          Img.Free;
        end;
      end
      else
        RaiseLastOSError;
    finally
      GlobalFree(hMem);
    end;
  finally
    ResourceStream.Free;
  end;
end;

function ImageFromResource_SometimesFailes(const ResName: String): TGPBitmap;
begin
  Result := TGPBitmap.Create(TStreamAdapter.Create(TResourceStream.Create(HInstance,
    ResName, RT_RCDATA), soOwned), True);
end;

function CreateShadowImage(Image: TGPImage; Intensity: Single): TGPBitmap;
const
  BaseShadowMatrix: TColorMatrix = (
    (0, 0, 0, 0, 0),
    (0, 0, 0, 0, 0),
    (0, 0, 0, 0, 0),
    (0, 0, 0, 0, 0),
    (0, 0, 0, 0, 1));
var
  ShadowMatrix: TColorMatrix;
  G: TGPGraphics;
  IA: TGPImageAttributes;
begin
  ShadowMatrix := BaseShadowMatrix;
  ShadowMatrix[3, 3] := Intensity;
  Result := TGPBitmap.Create(Image.GetWidth, Image.GetHeight, PixelFormat32bppARGB);
  G := TGPGraphics.Create(Result);
  try
    G.SetInterpolationMode(InterpolationModeHighQualityBicubic);
    G.Clear(0);
    IA := TGPImageAttributes.Create;
    try
      IA.SetColorMatrix(ShadowMatrix);
      G.DrawImage(Image, MakeRect(-1, -1, Result.GetWidth + 2, Result.GetHeight + 2),
        0, 0, Image.GetWidth, Image.GetHeight, UnitPixel, IA);
    finally
      IA.Free;
    end;
  finally
    G.Free;
  end;
end;

type TParentControl = class(TWinControl);

procedure DrawParentBackground(DC: HDC; Control: TControl);
var
  I, Count, X, Y, SaveIndex: Integer;
  R, SelfR, CtlR: TRect;
begin
  if (Control = nil) or (Control.Parent = nil) then Exit;
  Count := Control.Parent.ControlCount;
  with Control.Parent do ControlState := ControlState + [csPaintCopy];
  try
    with Control do
    begin
      SelfR := Bounds(Left, Top, Width, Height);
      X := -Left; Y := -Top;
    end;
    { Copy parent control image }
    SaveIndex := SaveDC(DC);
    try
      SetViewportOrgEx(DC, X, Y, nil);
      IntersectClipRect(DC, 0, 0, Control.Parent.ClientWidth,
        Control.Parent.ClientHeight);
      with TParentControl(Control.Parent) do
      begin
        Perform(WM_ERASEBKGND, DC, DC);
        PaintWindow(DC);
      end;
    finally
      RestoreDC(DC, SaveIndex);
    end;
    { Copy images of graphic controls }
    for I := 0 to Count - 1 do begin
      if Control.Parent.Controls[I] = Control then
        Break
      else if (Control.Parent.Controls[I] <> nil) and
        (Control.Parent.Controls[I] is TGraphicControl) then
      begin
        with TGraphicControl(Control.Parent.Controls[I]) do
        begin
          CtlR := Bounds(Left, Top, Width, Height);
          if Bool(IntersectRect(R, SelfR, CtlR)) and Visible then
          begin
            ControlState := ControlState + [csPaintCopy];
            SaveIndex := SaveDC(DC);
            try
              SetViewportOrgEx(DC, Left + X, Top + Y, nil);
              IntersectClipRect(DC, 0, 0, Width, Height);
              Perform(WM_PAINT, DC, 0);
            finally
              RestoreDC(DC, SaveIndex);
              ControlState := ControlState - [csPaintCopy];
            end;
          end;
        end;
      end;
    end;
  finally
    with Control.Parent do ControlState := ControlState - [csPaintCopy];
  end;
end;

{ Timer Callback Function }

procedure TimerProc(uTimerID, uMessage, dwUser, dw1, dw2: DWORD); stdcall;
begin
  TAnalogClock(dwUser).TimerID := 0;
  TAnalogClock(dwUser).AdvanceClock;
end;

{ TAnalogClock }

constructor TAnalogClock.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csClickEvents, csDoubleClicks];
  InitializeCriticalSection(CS);
  Background := TBitmap.Create;
  OffScreen := TBitmap.Create;
  FFontName := DefaultFontName;
  FTime := SysUtils.Time;
  FStyle := acSystem;
  FShowSeconds := True;
  FActive := True;
  SetBounds(Left, Top, 130, 130);
end;

destructor TAnalogClock.Destroy;
begin
  if HandleAllocated then
    DestroyWnd;
  Unprepare;
  Background.Free;
  OffScreen.Free;
  DeleteCriticalSection(CS);
  inherited Destroy;
end;

class function TAnalogClock.GetSampleImage(Style: TAnalogClockStyle): TGPImage;
begin
  Result := ImageFromResource(ClockInfo[Style].ResName + '_CLOCK');
end;

procedure TAnalogClock.SetTime(const Value: TTime);
begin
  if (Time <> Value) and not Active then
  begin
    EnterCriticalSection(CS);
    try
      FTime := Value;
      UpdateClock;
    finally
      LeaveCriticalSection(CS);
    end;
  end;
end;

function TAnalogClock.IsTimeStored: Boolean;
begin
  Result := not Active;
end;

procedure TAnalogClock.SetTimeOffset(const Value: TTime);
begin
  if TimeOffset <> Value then
  begin
    StopTimer;
    EnterCriticalSection(CS);
    try
      FTimeOffset := Value;
      UpdateClock;
    finally
      LeaveCriticalSection(CS);
    end;
    StartTimer(TimerStartTimeout);
  end;
end;

procedure TAnalogClock.SetStyle(Value: TAnalogClockStyle);
begin
  if Style <> Value then
  begin
    StopTimer;
    EnterCriticalSection(CS);
    try
      Unprepare;
      FStyle := Value;
      Prepare;
    finally
      LeaveCriticalSection(CS);
    end;
    StartTimer(TimerStartTimeout);
  end;
end;

procedure TAnalogClock.SetShowSeconds(Value: Boolean);
begin
  if ShowSeconds <> Value then
  begin
    StopTimer;
    EnterCriticalSection(CS);
    try
      FShowSeconds := Value;
      UpdateClock;
    finally
      LeaveCriticalSection(CS);
    end;
    StartTimer(TimerStartTimeout);
  end;
end;

procedure TAnalogClock.SetActive(Value: Boolean);
begin
  if Active <> Value then
  begin
    FActive := Value;
    if Prepared then
    begin
      if Active then
        StartTimer(TimerStartTimeout)
      else
      begin
        StopTimer;
        if InBouncePosition then
          InvalidateEx(True);
      end;
    end;
  end;
end;

procedure TAnalogClock.SetText(const Value: WideString);
var
  HasAlreadyText: Boolean;
begin
  if Text <> Value then
  begin
    HasAlreadyText := (FText <> '');
    FText := Trim(Value);
    if Prepared then
    begin
      StopTimer;
      EnterCriticalSection(CS);
      try
        UpdateText(HasAlreadyText);
        UpdateClock;
      finally
        LeaveCriticalSection(CS);
      end;
      StartTimer(TimerStartTimeout);
    end;
  end;
end;

procedure TAnalogClock.SetFontName(const Value: TFontName);
begin
  if not SameText(FontName, Value) then
  begin
    FFontName := Value;
    if (Text <> '') and Prepared then
    begin
      StopTimer;
      EnterCriticalSection(CS);
      try
        UpdateText(True);
        UpdateClock;
      finally
        LeaveCriticalSection(CS);
      end;
      StartTimer(TimerStartTimeout);
    end;
  end;
end;

function TAnalogClock.IsFontNameStored: Boolean;
begin
  Result := not SameText(FontName, DefaultFontName);
end;

procedure TAnalogClock.SetShrinkOnly(Value: Boolean);
begin
  if ShrinkOnly <> Value then
  begin
    StopTimer;
    EnterCriticalSection(CS);
    try
      FShrinkOnly := Value;
      CalcEffectiveBounds;
      InvalidateEx(False);
    finally
      LeaveCriticalSection(CS);
    end;
    StartTimer(TimerStartTimeout);
  end;
end;

procedure TAnalogClock.Prepare;
begin
  if not Prepared and not (csLoading in ComponentState) and HandleAllocated then
  begin
    EnterCriticalSection(CS);
    try
      with ClockInfo[Style] do
      begin
        Face := ImageFromResource(ResName + '_CLOCK_FACE');
        HandHour := ImageFromResource(ResName + '_CLOCK_H');
        HandShadowHour := CreateShadowImage(HandHour, 0.25);
        HandMin := ImageFromResource(ResName + '_CLOCK_M');
        HandShadowMin := CreateShadowImage(HandMin, 0.25);
        HandSec := ImageFromResource(ResName + '_CLOCK_S');
        HandShadowSec := CreateShadowImage(HandSec, 0.20);
        Pin := ImageFromResource(ResName + '_CLOCK_DOT');
        PinShadow := CreateShadowImage(Pin, 0.20);
        try
          Glass := ImageFromResource(ResName + '_CLOCK_GLASS');
        except
          on EResNotFound do
            Glass := nil
          else
            raise;
        end;
        PartBounds := MakeRect(PartPos.X, PartPos.Y, PartSize.cx, PartSize.cy);
        PartShadowBounds := MakeRect(PartPos.X, PartPos.Y, PartSize.cx + 2, PartSize.cy + 2);
        FaceCenter := MakePoint(PartPos.X + PartSize.cx / 2, PartPos.Y + PartSize.cy / 2);
      end;
      Clock := TGPBitmap.Create(Face.GetWidth, Face.GetHeight, PixelFormat32bppARGB);
      OriginalBounds := MakeRect(0, 0, Integer(Face.GetWidth), Integer(Face.GetHeight));
      Prepared := True;
      CalcEffectiveBounds;
      if Text <> '' then
        UpdateText(False);
      UpdateClock;
      InvalidateEx(False);
    finally
      LeaveCriticalSection(CS);
    end;
  end;
end;

procedure TAnalogClock.Unprepare;
begin
  StopTimer;
  EnterCriticalSection(CS);
  try
    Prepared := False;
    if Assigned(Clock) then FreeAndNil(Clock);
    if Assigned(Face) then FreeAndNil(Face);
    if Assigned(Glass) then FreeAndNil(Glass);
    if Assigned(HandHour) then FreeAndNil(HandHour);
    if Assigned(HandShadowHour) then FreeAndNil(HandShadowHour);
    if Assigned(HandMin) then FreeAndNil(HandMin);
    if Assigned(HandShadowMin) then FreeAndNil(HandShadowMin);
    if Assigned(HandSec) then FreeAndNil(HandSec);
    if Assigned(HandShadowSec) then FreeAndNil(HandShadowSec);
    if Assigned(Pin) then FreeAndNil(Pin);
    if Assigned(PinShadow) then FreeAndNil(PinShadow);
  finally
    LeaveCriticalSection(CS);
  end;
end;

procedure TAnalogClock.CalcEffectiveBounds;
begin
  if Prepared then
  begin
    if ShrinkOnly and (Clock.GetWidth <= Cardinal(Width)) and (Clock.GetHeight <= Cardinal(Height)) then
    begin
      EffectiveBounds.Width := Clock.GetWidth;
      EffectiveBounds.Height := Clock.GetHeight;
    end
    else if (Cardinal(Width) / Clock.GetWidth) < (Cardinal(Height) / Clock.GetHeight) then
    begin
      EffectiveBounds.Height := MulDiv(Clock.GetHeight, Width, Clock.GetWidth);
      EffectiveBounds.Width := Width;
    end
    else
    begin
      EffectiveBounds.Width := MulDiv(Clock.GetWidth, Height, Clock.GetHeight);
      EffectiveBounds.Height := Height;
    end;
    EffectiveBounds.X := (Width - EffectiveBounds.Width) div 2;
    EffectiveBounds.Y := (Height - EffectiveBounds.Height) div 2;
    SetRect(EffectiveRect, EffectiveBounds.X, EffectiveBounds.Y,
      EffectiveBounds.X + EffectiveBounds.Width,
      EffectiveBounds.Y + EffectiveBounds.Height);
  end;
end;

procedure TAnalogClock.StartTimer(Timeout: Cardinal);
begin
  if Active and Prepared and (TimerID = 0) then
  begin
    if Timeout < TimerResolution then Timeout := TimerResolution;
    TimerID := timeSetEvent(Timeout, TimerResolution, @TimerProc, DWORD(Self), TIME_ONESHOT);
  end;
end;

procedure TAnalogClock.StopTimer;
begin
  if TimerID <> 0 then
  begin
    EnterCriticalSection(CS);
    try
      timeKillEvent(TimerID);
      TimerID := 0;
    finally
      LeaveCriticalSection(CS);
    end;
  end;
end;

procedure TAnalogClock.UpdateText(ReloadFace: Boolean);
var
  G: TGPGraphics;
  FontFamily: TGPFontFamily;
  Font: TGPFont;
  Brush: TGPBrush;
  InRect, OutRect: TGPRectF;
  Format: TGPStringFormat;
  FontSize: Single;
  NewFace: TGPBitmap;
begin
  if Prepared then
  begin
    with ClockInfo[Style] do
    begin
      if ReloadFace then
      begin
        NewFace := ImageFromResource(ResName + '_CLOCK_FACE');
        Face.Free;
        Face := NewFace;
      end;
      if Text <> '' then
      begin
        InRect.X := FaceCenter.X - TextMaxSize.cx / 2;
        InRect.Y := FaceCenter.Y + TextOffset;
        InRect.Width := TextMaxSize.cx;
        InRect.Height := TextMaxSize.cy;
        G := TGPGraphics.Create(Face);
        try
          G.SetTextRenderingHint(TextRenderingHintAntiAlias);
          Format := TGPStringFormat.Create;
          try
            Format.SetFormatFlags(StringFormatFlagsNoFitBlackBox or
              StringFormatFlagsNoClip or StringFormatFlagsNoWrap);
            if UseRightToLeftReading then
              Format.SetFormatFlags(Format.GetFormatFlags or StringFormatFlagsDirectionRightToLeft);
            Format.SetAlignment(StringAlignmentCenter);
            Format.SetLineAlignment(StringAlignmentCenter);
            Format.SetTrimming(StringTrimmingNone);
            Format.SetHotkeyPrefix(HotkeyPrefixNone);
            Format.SetDigitSubstitution(LANG_NEUTRAL, StringDigitSubstituteUser);
            FontFamily := TGPFontFamily.Create(FontName);
            try
              FontSize := MaxFontSize;
              Font := TGPFont.Create(FontFamily, FontSize);
              try
                G.MeasureString(Text, Length(Text), Font, InRect, Format, OutRect);
                if OutRect.Width > InRect.Width then
                begin
                  FontSize := FontSize * InRect.Width / OutRect.Width;
                  FreeAndNil(Font);
                  Font := TGPFont.Create(FontFamily, FontSize);
                end;
                Format.SetTrimming(StringTrimmingEllipsisCharacter);
                Brush := TGPSolidBrush.Create(TextColor);
                try
                  G.DrawString(Text, Length(Text), Font, InRect, Format, Brush);
                finally
                  Brush.Free;
                end;
              finally
                Font.Free;
              end;
            finally
              FontFamily.Free;
            end;
          finally
            Format.Free;
          end;
        finally
          G.Free;
        end;
      end;
    end;
  end;
end;

procedure TAnalogClock.UpdateClock(H, M, S: Word; Bounce: Single);
var
  G: TGPGraphics;

  procedure DrawPart(Part, PartShadow: TGPImage; Rotation: Single;
    ShadowOffset: Single);
  var
    Matrix: TGPMatrix;
    FaceShadowCenter: TGPPointF;
  begin
    FaceShadowCenter.X := FaceCenter.X + ShadowOffset;
    FaceShadowCenter.Y := FaceCenter.Y + ShadowOffset;
    Matrix := TGPMatrix.Create;
    try
      Matrix.Reset;
      Matrix.RotateAt(Rotation, FaceShadowCenter, MatrixOrderAppend);
      G.SetTransform(Matrix);
      G.DrawImage(PartShadow, PartShadowBounds);
      Matrix.Reset;
      Matrix.RotateAt(Rotation, FaceCenter, MatrixOrderAppend);
      G.SetTransform(Matrix);
      G.DrawImage(Part, PartBounds);
      Matrix.Reset;
      G.SetTransform(Matrix);
    finally
      Matrix.Free;
    end;
  end;

begin
  if H > 12 then Dec(H, 12);
  if not ShowSeconds then S := 0;
  G := TGPGraphics.Create(Clock);
  try
    G.SetInterpolationMode(InterpolationModeHighQuality);
    G.Clear(0);
    G.DrawImage(Face, OriginalBounds);
    DrawPart(HandHour, HandShadowHour, H * 30 + M / 2, 1.0);
    DrawPart(HandMin, HandShadowMin, M * 6 + S / 10, 1.0);
    if ShowSeconds then
      DrawPart(HandSec, HandShadowSec, S * 6 + Bounce, 1.5)
    else
      DrawPart(Pin, PinShadow, S * 6, 1.5);
    if Glass <> nil then
      G.DrawImage(Glass, OriginalBounds);
  finally
    G.Free;
  end;
end;

procedure TAnalogClock.UpdateOffScreen;
var
  G: TGPGraphics;
begin
  OffScreen.Assign(Background);
  OffScreen.Canvas.Lock;
  try
    G := TGPGraphics.Create(OffScreen.Canvas.Handle);
    try
      G.SetInterpolationMode(InterpolationModeHighQuality);
      G.DrawImage(Clock, EffectiveBounds);
    finally
      G.Free;
    end;
  finally
    OffScreen.Canvas.Unlock;
  end;
end;

procedure TAnalogClock.UpdateClock;
var
  H, M, S, MS: Word;
begin
  if Prepared then
  begin
    EnterCriticalSection(CS);
    try
      DecodeTime(Time + TimeOffset, H, M, S, MS);
      UpdateClock(H, M, S, 0);
      UpdateOffScreen;
      InBouncePosition := False;
    finally
      LeaveCriticalSection(CS);
    end;
    InvalidateEx(True);
  end;
end;

procedure TAnalogClock.AdvanceClock;
var
  H, M, S, MS: Word;
  Timeout: Cardinal;
  DC: HDC;
begin
  EnterCriticalSection(CS);
  try
    if Prepared then
    begin
      FTime := SysUtils.Time;
      DecodeTime(Time + TimeOffset, H, M, S, MS);
      if not (Prepared and ShowSeconds and Active) or InBouncePosition then
      begin
        UpdateClock(H, M, S, 0);
        InBouncePosition := False;
      end
      else
      begin
        UpdateClock(H, M, S, 3);
        InBouncePosition := True;
      end;
      UpdateOffScreen;
      DC := GetDC(WindowHandle);
      try
        OffScreen.Canvas.Lock;
        try
          with EffectiveBounds do
            BitBlt(DC, X, Y, Width, Height, OffScreen.Canvas.Handle, X, Y, SRCCOPY);
        finally
          OffScreen.Canvas.Unlock;
        end;
      finally
        ReleaseDC(WindowHandle, DC);
      end;
    end;
  finally
    LeaveCriticalSection(CS);
  end;
  if InBouncePosition then
    Timeout := 50
  else
  begin
    if Assigned(OnClock) then
      OnClock(Self);
    DecodeTime(SysUtils.Time + TimeOffset, H, M, S, MS);
    Timeout := MSecsPerSec - MS;
    if not ShowSeconds then
      Inc(Timeout, (SecsPerMin - S) * MSecsPerSec);
  end;
  StartTimer(Timeout);
end;

procedure TAnalogClock.Paint;
begin
  EnterCriticalSection(CS);
  try
    if Prepared then
      Canvas.Draw(0, 0, OffScreen)
    else
      Canvas.Draw(0, 0, Background);
  finally
    LeaveCriticalSection(CS);
  end;
end;

procedure TAnalogClock.Loaded;
begin
  inherited Loaded;
  Prepare;
  StartTimer(TimerStartTimeout);
end;

procedure TAnalogClock.Resize;
begin
  EnterCriticalSection(CS);
  try
    inherited Resize;
    Background.Width := Width;
    Background.Height := Height;
    CalcEffectiveBounds;
    InvalidateEx(False);
  finally
    LeaveCriticalSection(CS);
  end;
end;

procedure TAnalogClock.CreateWnd;
begin
  inherited CreateWnd;
  timeBeginPeriod(TimerResolution);
  Prepare;
  StartTimer(TimerStartTimeout);
end;

procedure TAnalogClock.DestroyWnd;
begin
  Unprepare;
  timeEndPeriod(TimerResolution);
  inherited DestroyWnd;
end;

procedure TAnalogClock.AdjustSize;
begin
  if AutoSize and Prepared then
    SetBounds(Left, Top, Clock.GetWidth, Clock.GetHeight);
end;

procedure TAnalogClock.WMEraseBkgnd(var message: TWMEraseBkgnd);
begin
  EnterCriticalSection(CS);
  try
    Background.Canvas.Lock;
    try
      DrawParentBackground(Background.Canvas.Handle, Self)
    finally
      Background.Canvas.Unlock;
    end;
    if Prepared then
      UpdateOffScreen;
  finally
    LeaveCriticalSection(CS);
  end;
  Message.Result := 1;
end;

procedure TAnalogClock.WMWindowPosChanged(var message: TWMWindowPosChanged);
begin
  EnterCriticalSection(CS);
  try
    inherited;
    InvalidateEx(False);
  finally
    LeaveCriticalSection(CS);
  end;
end;

procedure TAnalogClock.WMDestroy(var message: TWMDestroy);
begin
  Unprepare;
  inherited;
end;

procedure TAnalogClock.InvalidateEx(ClockOnly: Boolean);
begin
  if Prepared and ClockOnly then
    InvalidateRect(WindowHandle, @EffectiveRect, False)
  else
    Invalidate;
end;

end.
