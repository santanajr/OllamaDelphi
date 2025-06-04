unit UTelaPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  SisApi.Model.RetornoOllama;

type
  TForm1 = class(TForm)
    BtEnviar: TButton;
    EdPergunta: TEdit;
    Label1: TLabel;
    MemoMensagem: TMemo;
    Label2: TLabel;
    MemoContexto: TMemo;
    procedure BtEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FContexto : string;
    { Private declarations }
    procedure MontarContexto;
    procedure LimparMemosTela;
  public
    { Public declarations }
  end;

  const STRQUESTION  = '- QUESTION :';
  const STRUSER      = 'User :';
  const STRASSISTANT = 'Xyz  :';
  const STRPENSANDO  = 'Pensando...';
var
  Form1: TForm1;

implementation

{$R *.dfm}

uses SisApi.Acesso.Http;

procedure TForm1.BtEnviarClick(Sender: TObject);
var
  LContexto : string;
  LOllamaResposta : TOllamaRespostaCompleta;
  GuardarTextoBotao : string;
begin
 try
   GuardarTextoBotao := BtEnviar.Caption;
   BtEnviar.Caption  := STRPENSANDO;
   Application.ProcessMessages;

   MontarContexto;
   LContexto := FContexto + STRQUESTION + EdPergunta.Text;
   LOllamaResposta := TAcessoOllama.EnviarPergunta(Tphi, LContexto);
   MemoMensagem.Lines.Add(STRUSER + EdPergunta.Text);
   if LOllamaResposta <> nil then
     MemoMensagem.Lines.Add(STRASSISTANT + LOllamaResposta.response);

 finally
   FreeAndNil(LOllamaResposta);
   BtEnviar.Caption := GuardarTextoBotao;
   Application.ProcessMessages;
 end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  MemoMensagem.Clear;
end;

procedure TForm1.LimparMemosTela;
begin
  MemoMensagem.Clear;
  MemoContexto.Clear;
end;

procedure TForm1.MontarContexto;
var
  i : Integer;
begin
  FContexto := EmptyStr;
  for i := 0 to MemoContexto.Lines.Count -1 do
    FContexto := FContexto + MemoContexto.Lines[i];
end;

end.
