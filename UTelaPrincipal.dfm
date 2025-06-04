object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'OllamaDelphi'
  ClientHeight = 477
  ClientWidth = 1386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 423
    Width = 48
    Height = 15
    Caption = 'Pergunta'
  end
  object Label2: TLabel
    Left = 664
    Top = 8
    Width = 48
    Height = 15
    Caption = 'Contexto'
  end
  object BtEnviar: TButton
    Left = 471
    Top = 442
    Width = 170
    Height = 23
    Caption = 'Enviar Mensagem'
    TabOrder = 0
    OnClick = BtEnviarClick
  end
  object EdPergunta: TEdit
    Left = 8
    Top = 442
    Width = 457
    Height = 23
    TabOrder = 1
  end
  object MemoMensagem: TMemo
    Left = 8
    Top = 29
    Width = 633
    Height = 388
    Lines.Strings = (
      'MemoMensagem')
    TabOrder = 2
  end
  object MemoContexto: TMemo
    AlignWithMargins = True
    Left = 664
    Top = 29
    Width = 721
    Height = 436
    CharCase = ecUpperCase
    Lines.Strings = (
      
        'EXPLAIN IN A SIMPLE AND OBJECTIVE WAY, RESPONDING ONLY TO THE DA' +
        'TA CONTAINED IN THIS INFORMATION.'
      
        'I AM A RECEPTION ASSISTANT - XYZ AND I INTEND TO HELP CLARIFY DO' +
        'UBTS ABOUT OUR GUESTHOUSE XPTO-BA. THE '
      'GUESTHOUSE HAS'
      '3 FLOORS, 5 ROOMS, 1 RESTAURANT.'
      
        'THE FIRST FLOOR IS THE RECEPTION, WHERE THERE IS A MACHINE TO BU' +
        'Y COOKIES AND DRINKS ON THE LEFT SIDE AND ON THE '
      'RIGHT SIDE'
      
        'THE STAIRS THAT GIVE ACCESS TO THE ROOMS. NEXT TO THE RECEPTION ' +
        'THERE IS A HALLWAY, WHERE THERE ARE TWO DOORS. '
      'THE FIRST DOOR ON '
      
        'THE LEFT SIDE IS A SMALL GAMES ROOM WITH A PING-PONG TABLE AND A' +
        ' POOL TABLE. THE SECOND DOOR ON THE LEFT SIDE IS '
      'THE '
      'RESTAURANT. NEXT THE GAME ROOM.'
      
        'ON THE SECOND FLOOR, WE HAVE 3 ROOMS: 201, 202 AND 203. THE THRE' +
        'E ROOMS ARE SUITES OF THE SAME SIZE AND HAVE'
      'TV, DOUBLE BED, CLOSET, NIGHTSTAND AND MINIBAR.'
      
        'ON THE THIRD FLOOR, WE HAVE 2 ROOMS (301 AND 302), WHICH ARE PRE' +
        'SIDENTIAL SUITES WITH KING SIZE BEDS, WHIRLPOOL TUB, '
      'TV, '
      'BALCONY AND MINIBAR.'
      
        'THE RECEPTION IS OPEN 24 HOURS A DAY, IF THERE IS NO ONE THERE, ' +
        'JUST RING THE BELL AT OUR COUNTER.'
      
        'BREAKFAST INCLUDES BREAD, COLD CUTS, YOGURT, BUTTER, COFFEE, ORA' +
        'NGE, LEMON AND WATERMELON JUICE. WE HAVE FRUITS: '
      'STRAWBERRIES, '
      'PINEAPPLE AND MELON. WE HAVE BUTTER COOKIES (HOMEMADE).'
      
        'BREAKFAST IS SERVED FROM 7AM TO 10AM, IN THE RESTAURANT ON THE F' +
        'IRST FLOOR.'
      
        'LUNCH IS SERVED FROM 1PM TO 4PM, IN THE RESTAURANT LOCATED ON TH' +
        'E FIRST FLOOR NEXT TO RECEPTION.'
      'THE GAME ROOM IS OPEN FROM 9AM TO MIDNIGHT.'
      'THE LUNCH MENU MUST BE VIEWED AT THE RESTAURANT.'
      
        'REGARDING PAYMENT METHODS: DAILY RATES MUST BE PAID AT CHECK-IN,' +
        ' AND CONSUMPTION IN THE RESTAURANT WILL BE '
      'CHARGED AT '
      'CHECK-OUT, IF APPLICABLE.')
    ReadOnly = True
    TabOrder = 3
  end
end
