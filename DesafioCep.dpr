program DesafioCep;

uses
  Vcl.Forms,
  uCepModel in 'model\uCepModel.pas',
  uCepController in 'controller\uCepController.pas',
  uConexao in 'dao\uConexao.pas',
  uPrincipalView in 'view\uPrincipalView.pas' {frmPrincipalView},
  uCepDao in 'dao\uCepDao.pas',
  uVisualizarCepView in 'view\uVisualizarCepView.pas' {frmVisualizar},
  uValidarModel in 'model\uValidarModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalView, frmPrincipalView);
  Application.CreateForm(TfrmVisualizar, frmVisualizar);
  Application.Run;
end.
