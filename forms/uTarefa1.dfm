inherited frmTarefa01: TfrmTarefa01
  Caption = 'frmTarefa01'
  ClientWidth = 852
  ExplicitWidth = 868
  TextHeight = 15
  object lblTabelas: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 15
    Caption = 'Tabelas'
  end
  object lblColunas: TLabel
    Left = 215
    Top = 8
    Width = 43
    Height = 15
    Caption = 'Colunas'
  end
  object lblCondicoes: TLabel
    Left = 422
    Top = 8
    Width = 56
    Height = 15
    Caption = 'Condi'#231#245'es'
  end
  object lblSqlGerado: TLabel
    Left = 8
    Top = 285
    Width = 57
    Height = 15
    Caption = 'Sql Gerado'
  end
  object mmoTabelas: TMemo
    Left = 8
    Top = 24
    Width = 201
    Height = 255
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object mmoColunas: TMemo
    Left = 215
    Top = 24
    Width = 201
    Height = 255
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object mmoCondicoes: TMemo
    Left = 422
    Top = 24
    Width = 201
    Height = 255
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object mmoSqlGerado: TMemo
    Left = 8
    Top = 303
    Width = 615
    Height = 117
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object btnGeraSql: TButton
    Left = 629
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Gerar sql'
    TabOrder = 4
    OnClick = btnGeraSqlClick
  end
  object spqry1: TspQuery
    Left = 672
    Top = 256
  end
end
