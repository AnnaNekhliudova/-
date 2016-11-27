unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  x1, x2, x3, x4, x5, x6, y1, y2, y3, y4, StepXTank,
  x1gun, x2gun, y1gun, y2gun, y1gunInit, y2gunInit, StepYgun: Integr;
Const
  x1init = 0;
  x2init = 50;
  x3init = 20;
  x4init = 40;
  x5init = 40;
  x6init = 55;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Image3.Visible := Fals;
  Label3.Visible := False;
  y1gunInit := Form1.Image1.Hight-7;
  y2gunInit := Form1.Image1.Hight;
  Timer1.Interval := StrToInt(Edit1.Text);
  StepXtank := StrToInt(Edit2.Text);
  StepYgun := 0;
  x1 := x1init;
  x2 := x2init;
  x3 := x3init;
  x4 := x4init;
  x5 := x5init;
  x6 := x6init;
  y1gun := y1gunInit + StepYgun;
  y2gun := y2gunInit + StepYgun;
  Timer1.Enabled := True;
  Edit4.Text := '0';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Edit4.Text := '8';
  Button2.Tag := 1;
  y1gunInit := Form1.Image1.Height-7;
  y2gunInit := Form1.Image1.Height;
  Timer1.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  x1 := x1 + StepXtank;
  x2 := x2 + StepXtank;
  x3 := x3 + StepXtank;
  x4 := x4 + StepXtank;
  x5 := x5 + StepXtank;
  x6 := x6 + StepXtank;

  With Image1.Canvas do
  begin
    Pen.Width:=2;
    Brush.Color := clRed;
    Rectangle(0, 0, Image1.Width, Image1.Height);
    Brush.Color := clBlue;
    RoundRect(x1,40, x2,50, 10,10);
    RoundRect(x3,30, x4,40, 10,10);
    Rectangle(x5,34, x6,36);

    StepYgun := StrToInt(Edit4.Text);
    y1gun := y1gun - StepYgun;
    y2gun := y2gun - StepYgun;
    Brush.Color := clBlue;
    Rectangle(713, y1gun, 717, y2gun);
  end;

  if x6 >= (Image1.Width-10) then
  begin
    Timer1.Enabled := False;
    Image3.Visible := False;
  end;
  With Image2.Canvas do
  begin
    Pen.Width:=2;
    Brush.Color := clOliv;
    Rectangle(0, 0, Image2.Width, Image2.Height);
    Brush.Color := clGray;
    Rectangle(700, 10, 730, 65);
    Ellipse(705,20, 725, 45);
    Rectangle(713,0,717,20);
  end;
  if (abs(y1gun-35) < 10) and (abs(x1-700) < 20) then
    begin
      Timer1.Enabled := False;
      Image1.Canvas.brush.color := clRed;
      Image1.Canvas.Ellipse(x3-20, y1gun-20, x2+10, y2gun +20);
      Image3.Visible := True;
      Label3.Visible := True;
    end;
end;

end.

