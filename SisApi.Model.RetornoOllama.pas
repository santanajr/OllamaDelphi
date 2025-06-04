unit SisApi.Model.RetornoOllama;

interface

type
  TOllamaRespostaCompleta = class
  private
    FModel: string;
    FCreatedAt: string;
    FResponse: string;
    FDone: Boolean;
    FDoneReason: string;
    FTotalDuration: Int64;
    FLoadDuration: Int64;
    FPromptEvalCount: Integer;
    FPromptEvalDuration: Int64;
    FEvalCount: Integer;
    FEvalDuration: Int64;
  published
    property model: string read FModel write FModel;
    property created_at: string read FCreatedAt write FCreatedAt;
    property response: string read FResponse write FResponse;
    property done: Boolean read FDone write FDone;
    property done_reason: string read FDoneReason write FDoneReason;
    property total_duration: Int64 read FTotalDuration write FTotalDuration;
    property load_duration: Int64 read FLoadDuration write FLoadDuration;
    property prompt_eval_count: Integer read FPromptEvalCount write FPromptEvalCount;
    property prompt_eval_duration: Int64 read FPromptEvalDuration write FPromptEvalDuration;
    property eval_count: Integer read FEvalCount write FEvalCount;
    property eval_duration: Int64 read FEvalDuration write FEvalDuration;
  end;

implementation

end.
