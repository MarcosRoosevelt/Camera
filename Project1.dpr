program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitCamera in 'UnitCamera.pas' {FrmCamera},
  u99Permissions in '..\ZMarc�o\u99Permissions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCamera, FrmCamera);
  Application.Run;
end.
