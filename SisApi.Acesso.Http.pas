unit SisApi.Acesso.Http;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.NetEncoding,
  System.JSON,
  System.Rtti,
  System.JSON.Serializers,
  SisApi.Model.RetornoOllama,
  SisApi.Interfaces.AcessoOllama;

type
  TOllamaModelo = (TMistral, Tphi);

  TAcessoOllama = class(TInterfacedObject, IAcessoOllama)
  private
    FModelo          : TOllamaModelo;
    FHttpClient      : TNetHTTPClient;
    FResponse        : IHTTPResponse;
    FURL             : string;
    FPergunta        : string;
    FJSONBody        : string;
    FStringContent   : TStringStream;

    FRetornoEnvio    : Boolean;
    FRetornoStatus   : Integer;
    FRetornoResposta : string;
    FRetornoErro     : string;

    FOllamaRetorno   : TOllamaRespostaCompleta;

    function ParseOllamaResposta(const JSONStr: string): IAcessoOllama;
    function SetJsonBodyOllama(): IAcessoOllama;
  public
    constructor create(AOllamaModelo :TOllamaModelo; APergunta : string);
    destructor  Destroy; override;

    function EnviarPost : IAcessoOllama;

    class function EnviarPergunta(AModelo : TOllamaModelo; APergunta : string) : TOllamaRespostaCompleta;
    function GetRetornoOllama : TOllamaRespostaCompleta;
  end;

  const URLOLLAMA = 'http://localhost:11434/api/generate';
  const CONTENTTTYPEJSON = 'application/json';

implementation

{ TAcessoOllama }

constructor TAcessoOllama.create(AOllamaModelo :TOllamaModelo; APergunta : string);
begin
  FModelo := AOllamaModelo;
  FOllamaRetorno := TOllamaRespostaCompleta.Create;
  FPergunta := APergunta;
  SetJsonBodyOllama;
  FHttpClient := TNetHTTPClient.Create(nil);
  FStringContent := TStringStream.Create(FJSONBody, TEncoding.UTF8);
  FHttpClient.ContentType := CONTENTTTYPEJSON;
end;

destructor TAcessoOllama.Destroy;
begin
  inherited;
  FHttpClient.Free;
  FStringContent.Free;
end;

class function TAcessoOllama.EnviarPergunta(AModelo: TOllamaModelo; APergunta : string): TOllamaRespostaCompleta;
var
  LOllama : TAcessoOllama;
begin
  LOllama := TAcessoOllama.create(AModelo, APergunta);
  try
    LOllama.EnviarPost;
    result := LOllama.GetRetornoOllama;
  finally
  end;
end;

function TAcessoOllama.EnviarPost : IAcessoOllama;
begin
  FRetornoEnvio    := False;
  FRetornoStatus := 400;
  try
    try
      FResponse   := FHttpClient.Post(URLOLLAMA, FStringContent);
      FRetornoEnvio := True;
    Except on E: Exception do
      begin
        FRetornoEnvio := False;
        FRetornoErro  := E.message + ' - ' + FResponse.ContentAsString;
      end;
    end;
  finally
    if FRetornoEnvio then
    begin
      FRetornoStatus := FResponse.StatusCode;
      FRetornoResposta  := FResponse.ContentAsString;
      ParseOllamaResposta(FRetornoResposta);
    end
    else
      FRetornoErro := FResponse.ContentAsString;
  end;
end;

function TAcessoOllama.GetRetornoOllama: TOllamaRespostaCompleta;
begin
  result := FOllamaRetorno;
end;

function TAcessoOllama.ParseOllamaResposta(const JSONStr: string): IAcessoOllama;
var
  JSON: TJSONObject;
begin
  result := Self;
  JSON := TJSONObject.ParseJSONValue(JSONStr) as TJSONObject;
  try
    FOllamaRetorno.model                := JSON.GetValue<string>('model');
    FOllamaRetorno.created_at           := JSON.GetValue<string>('created_at');
    FOllamaRetorno.response             := JSON.GetValue<string>('response');
    FOllamaRetorno.done                 := JSON.GetValue<Boolean>('done');
    FOllamaRetorno.done_reason          := JSON.GetValue<string>('done_reason');
    FOllamaRetorno.total_duration       := JSON.GetValue<Int64>('total_duration');
    FOllamaRetorno.load_duration        := JSON.GetValue<Int64>('load_duration');
    FOllamaRetorno.prompt_eval_count    := JSON.GetValue<Integer>('prompt_eval_count');
    FOllamaRetorno.prompt_eval_duration := JSON.GetValue<Int64>('prompt_eval_duration');
    FOllamaRetorno.eval_count           := JSON.GetValue<Integer>('eval_count');
    FOllamaRetorno.eval_duration        := JSON.GetValue<Int64>('eval_duration');
  finally
    JSON.Free;
  end;
end;

function TAcessoOllama.SetJsonBodyOllama : IAcessoOllama;
begin
  Result := Self;
  case FModelo of
    Tphi     : begin
                 FJSONBody := '{                             '+
                              ' "model": "phi",              '+
                              ' "prompt": "' + FPergunta +'",'+
                              ' "stream": false,             '+
                              ' "temperature": 0.1,          '+
                              ' "top_k": 20,                 '+
                              ' "top_p": 0.9,                '+
                              ' "repeat_penalty": 1.1,       '+
                              ' "num_predict": 40,           '+
                              ' "stop": ["\nUser:", "\n###"] '+
                              '}';
               End;

    TMistral : begin
                 FJSONBody := '{                             '+
                              ' "model": "Mistral",          '+
                              ' "prompt": "' + FPergunta +'",'+
                              ' "stream": false,             '+
                              ' "temperature": 0.1,          '+
                              ' "top_k": 40,                 '+
                              ' "top_p": 0.9,                '+
                              ' "repeat_penalty": 1.1,       '+
                              ' "num_predict": 60,           '+
                              ' "stop": ["\nUser:", "\n###"] '+
                              '}';;
               end;
  end;
end;

end.
