program PAcessandoIA;

uses
  Vcl.Forms,
  UTelaPrincipal in 'UTelaPrincipal.pas' {Form1},
  SisApi.Acesso.Http in 'SisApi.Acesso.Http.pas',
  SisApi.Model.RetornoOllama in 'SisApi.Model.RetornoOllama.pas',
  SisApi.Interfaces.AcessoOllama in 'SisApi.Interfaces.AcessoOllama.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
