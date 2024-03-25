unit uConexao;

interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.DApt;

type TConexao = class
  private
    FConn: TFDConnection;

    procedure ConfigCon;

  public
    function CriarQuery: TFDQuery;
    function GetConn: TFDConnection;

    constructor Create;
    destructor Destroy;  override;
end;

  const Banco: string = 'C:\Git\Nova pasta\desafio-delphi-backend\MINHA_BASE.FDB';

implementation

{ TConexao }

procedure TConexao.ConfigCon;
begin
  with FConn do
  begin
    Params.DriverID := 'FB';
    Params.Database := Banco;
    Params.UserName := 'SYSDBA';
    Params.Password := 'masterkey';
    LoginPrompt     := true;
  end;
end;

constructor TConexao.Create;
begin
  FConn := TFDConnection.Create(nil);

  Self.ConfigCon;
end;

function TConexao.CriarQuery: TFDQuery;
var
  VQuery: TFDQuery;
begin
  VQuery := TFDQuery.Create(nil);
  VQuery.Connection := FConn;

  Result := VQuery;
end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FConn);

  inherited;
end;

function TConexao.GetConn: TFDConnection;
begin
  Result := FConn;
end;

end.
