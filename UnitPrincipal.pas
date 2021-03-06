unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation,

  {$IFDEF ANDROID}
  Execute.FMXBasedDragDrop,
  {$ENDIF}

  FMX.StdCtrls, FMX.Ani;

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
    AnimationGame: TFloatAnimation;
    procedure rectVoltarClick(Sender: TObject);
    procedure lblQudrado1DragDrop(Sender: TObject; const Data: TDragObject;
      const Point: TPointF);
    procedure lblQudrado1DragOver(Sender: TObject; const Data: TDragObject;
      const Point: TPointF; var Operation: TDragOperation);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AnimationGameFinish(Sender: TObject);
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
 var
    lbl:Tlabel;
    rect : TRectangle;
    i : integer;
begin
     lblPlacar.Text := '0';
     lblLevel.Text := '1';

     //  childrencount conta todos itens dentro do gridlayout
     for i := 0 to GridLayout.ChildrenCount -1 do
      if GridLayout.Children[i] is TRectangle then
      begin
        rect := TRectangle(GridLayout.Children[i]);

        lbl :=TLabel(rect.Children[0]);
        lbl.Text := '';
        lbl.Tag := 0;

      end;

        AnimationGame.Start;

end;

procedure TfrmPrincipal.Somarpontos(pontos : integer);
begin
     lblPlacar.Text := IntToStr(lblPlacar.Text.ToInteger + pontos);
end;

procedure TfrmPrincipal.AnimationGameFinish(Sender: TObject);
var
    i, cont : integer;
    lbl: TLabel;
    arrayNum:  array of Integer;
begin
      cont := 0;
          // i pega o objeto quadrado vazio
    for i := 0 to GridLayout.ChildrenCount -1 do
      begin
        lbl := TLabel(TRectangle(GridLayout.Children[i]).Children[0]);

        if lbl.Tag = 0 then
        begin
             Inc(cont);
             SetLength(arrayNum, cont);

             arrayNum[cont -1] := i;
        end;
      end;
       // se possuir quadrados vazios
      if cont > 0 then
      begin
        i := Random(Length(arrayNum));
        lbl := TLabel(TRectangle(GridLayout.Children[arrayNum[i]]).Children[0]);
        lbl.Text := '2';
        lbl.Tag := 2;
        AnimationGame.Start;
      end
      else
        ShowMessage('Game Over');

end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
      // redimensionar o grid
     GridLayout.ItemWidth := Trunc(GridLayout.Width / 4) - 1;
     GridLayout.ItemHeight := Trunc(GridLayout.Height /5) - 1;
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
    lbldestino := TLabel(Sender);   // objeto de destino que vai somar com o outro
    lblorigem := TLabel(Data.Source);//objeto de origem que arrastei

    if(lblorigem.Tag > 0)and (lbldestino.Tag > 0)then
    begin
       SomarPontos(lbldestino.Tag);

       lbldestino.Tag := lbldestino.Tag + lblorigem.Tag;
       lbldestino.Text := lbldestino.Tag.ToString;

       lblorigem.Tag := 0;
       lblorigem.Text := '';


    end;

end;

procedure TfrmPrincipal.lblQudrado1DragOver(Sender: TObject;
  const Data: TDragObject; const Point: TPointF; var Operation: TDragOperation);
begin
      operation := TDragOperation.None;

     if (Sender is TLabel) and        // onde eu movi(destino)
         (Data.Source is TLabel) and // quem eu estou arrastando (origem)
         (Data.Source <> Sender) then  // origem <> destino
         begin
            if (TLabel(Data.Source).Tag = TLabel(Sender).Tag)and
                (TLabel(Sender).Tag > 0) then
                Operation := TDragOperation.Move;

         end;
end;

procedure TfrmPrincipal.rectVoltarClick(Sender: TObject);
begin
      Close;
end;

end.
