unit SisApi.Interfaces.AcessoOllama;

interface

uses System.SysUtils,
     SisApi.Model.RetornoOllama;

type
  IAcessoOllama = Interface['{157595A7-8FB0-42BC-BA2D-5D220E0A4760}']
    function ParseOllamaResposta(const JSONStr: string): IAcessoOllama;
    function SetJsonBodyOllama(): IAcessoOllama;
    function EnviarPost : IAcessoOllama;
    function GetRetornoOllama : TOllamaRespostaCompleta;
  end;

implementation

end.
