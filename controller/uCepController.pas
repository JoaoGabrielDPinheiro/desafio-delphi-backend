unit uCepController;

interface

uses  uConexao, SysUtils, uCepModel, FireDAC.Comp.Client, FireDAC.DApt,
  uValidarModel;
  type TCepController = class
  private
    FConexao: TConexao;
    FCep: TCepModel;
    FValidar: TValidarModel;

    class var FInstance: TCepController;
  public
    constructor Create;
    destructor Destroy; override;

    class function GetInstance: TCepController;

    function PesquisarCep(Cep: string): TFDQuery;
    procedure PesquisarCepAPI(cep: string);
    function TratarErros(cep: string): boolean;

    property Conexao: TConexao read FConexao write FConexao;
    property Cep: TCepModel read FCep write FCep;
    property Validar: TValidarModel read FValidar write FValidar;
end;

implementation

{ TCepController }

constructor TCepController.Create;
begin
  FConexao  := TConexao.Create;
  FCep      := TCepModel.Create;
  FValidar  := TValidarModel.Create;
end;

destructor TCepController.Destroy;
begin
  FreeAndNil(FConexao);
  FreeAndNil(FCep);
  FreeAndNil(FValidar);

  inherited;
end;

class function TCepController.GetInstance: TCepController;
begin
  if not Assigned(Self.FInstance) then
    Self.FInstance := TCepController.Create;

  Result := Self.FInstance;
end;

function TCepController.PesquisarCep(Cep: string): TFDQuery;
begin
  result := FCep.Pesquisar(Cep);
end;

procedure TCepController.PesquisarCepAPI(cep: string);
begin
  FCep.PesquisarCepAPI(cep);
end;

function TCepController.TratarErros(cep: string): boolean;
begin
  result := FCep.TratarErros(cep);
end;

end.
