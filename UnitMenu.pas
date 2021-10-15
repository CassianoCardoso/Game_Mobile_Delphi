unit UnitMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TfrmaNumbers = class(TForm)
    Image1: TImage;
    ractPlay: TRectangle;
    rectRanking: TRectangle;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image3: TImage;
    procedure ractPlayClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmaNumbers: TfrmaNumbers;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TfrmaNumbers.ractPlayClick(Sender: TObject);
begin
     if not Assigned(frmPrincipal) then
     Application.CreateForm(TfrmPrincipal, frmPrincipal) ;

     frmPrincipal.Show;

end;

end.
