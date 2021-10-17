unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation,

  {$IFDEF ANDROID}
  Execute.FMXBasedDragDrop,
  {$ENDIF}

  FMX.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    lytToolbar: TLayout;
    rectplacar: TRectangle;
    Label3: TLabel;
    lblPlacar: TLabel;
    rectVoltar: TRectangle;
    Image1: TImage;
    Layout1: TLayout;
    Label1: TLabel;
    lblLevel: TLabel;
    GridLayout: TGridLayout;
    Rectangle1: TRectangle;
    lblQudrado1: TLabel;
    Rectangle2: TRectangle;
    lblQuadrado2: TLabel;
    Rectangle3: TRectangle;
    lblQuadrado3: TLabel;
    Rectangle4: TRectangle;
    Label6: TLabel;
    Rectangle5: TRectangle;
    Label7: TLabel;
    Rectangle6: TRectangle;
    Label8: TLabel;
    Rectangle7: TRectangle;
    Label9: TLabel;
    Rectangle8: TRectangle;
    Label10: TLabel;
    Rectangle9: TRectangle;
    Label11: TLabel;
    Rectangle10: TRectangle;
    Label12: TLabel;
    Rectangle11: TRectangle;
    Label13: TLabel;
    Rectangle12: TRectangle;
    Label14: TLabel;
    Rectangle13: TRectangle;
    Label15: TLabel;
    Rectangle14: TRectangle;
    Label16: TLabel;
    Rectangle15: TRectangle;
    Label17: TLabel;
    Rectangle16: TRectangle;
    Label18: TLabel;
    Rectangle17: TRectangle;
    Label19: TLabel;
    Rectangle18: TRectangle;
    Label20: TLabel;
    Rectangle19: TRectangle;
    Label21: TLabel;
    Rectangle20: TRectangle;
    Label22: TLabel;
    procedure rectVoltarClick(Sender: TObject);
    procedure lblQudrado1DragDrop(Sender: TObject; const Data: TDragObject;
      const Point: TPointF);
    procedure lblQudrado1DragOver(Sender: TObject; const Data: TDragObject;
      const Point: TPointF; var Operation: TDragOperation);
    procedure FormShow(Sender: TObject);
  private
    procedure Somarpontos(pontos: integer);
    procedure Reset;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.Reset;
begin
     lblPlacar.Text := '0';
     lblLevel.Text := '1';
end;

procedure TfrmPrincipal.Somarpontos(pontos : integer);
begin
     lblPlacar.Text := IntToStr(lblPlacar.Text.ToInteger + pontos);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
     Reset ;
end;

procedure TfrmPrincipal.lblQudrado1DragDrop(Sender: TObject;
  const Data: TDragObject; const Point: TPointF);
  var
     lblorigem, lbldestino : TLabel;
begin
        //   Move o objeto pra o outro objeto
    lbldestino := TLabel(Sender);
    lblorigem := TLabel(Data.Source);

    if(lbldestino.Text <> '')and (lbldestino.Text <> '')then
    begin
       lbldestino.Text := IntToStr(lbldestino.Text.ToInteger + lblorigem.Text.ToInteger);
       lblorigem.Text := '';

         SomarPontos(lbldestino.Text.ToInteger);
    end;

end;

procedure TfrmPrincipal.lblQudrado1DragOver(Sender: TObject;
  const Data: TDragObject; const Point: TPointF; var Operation: TDragOperation);
begin
         //

     Operation := TDragOperation.Move;
end;

procedure TfrmPrincipal.rectVoltarClick(Sender: TObject);
begin
      Close;
end;

end.
