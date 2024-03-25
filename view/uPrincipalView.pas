unit uPrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, uCepController,
  uVisualizarCepView, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;

type
  TfrmPrincipalView = class(TForm)
    edtCEP: TMaskEdit;
    lblCEP: TLabel;
    btnPesquisar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtCEPKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalView: TfrmPrincipalView;

implementation

{$R *.dfm}

procedure TfrmPrincipalView.btnPesquisarClick(Sender: TObject);
var
 VCep: string;
 frmVisualizar : TfrmVisualizar;
begin
  frmVisualizar := TfrmVisualizar.Create(nil);
  try
    VCep := TCepController.GetInstance.Validar.removeMask(edtCEP);

  if TCepController.GetInstance.TratarErros(Vcep) then
  begin
    frmVisualizar.Cep := VCep;
    frmVisualizar.ShowModal;
  end;
  finally
  end;
end;

procedure TfrmPrincipalView.edtCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0;
end;

procedure TfrmPrincipalView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TCepController.GetInstance().Destroy;

  frmPrincipalView := nil;
  Action := caFree;
end;

procedure TfrmPrincipalView.FormCreate(Sender: TObject);
begin
   TCepController.GetInstance();
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
