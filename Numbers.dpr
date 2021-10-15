program Numbers;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitMenu in 'UnitMenu.pas' {frmaNumbers},
  UnitPrincipal in 'UnitPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TfrmaNumbers, frmaNumbers);
  Application.Run;
end.
