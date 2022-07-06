inherited frmTarefa03: TfrmTarefa03
  Caption = 'frmTarefa03'
  OnActivate = FormActivate
  TextHeight = 15
  object dbgrdTarefa03: TDBGrid
    Left = 0
    Top = 0
    Width = 624
    Height = 297
    Align = alTop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnTotal: TButton
    Left = 392
    Top = 303
    Width = 97
    Height = 25
    Caption = 'Obter total'
    TabOrder = 1
    OnClick = btnTotalClick
  end
  object edtTotal: TEdit
    Left = 495
    Top = 303
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object btnDivisoes: TButton
    Left = 392
    Top = 334
    Width = 97
    Height = 25
    Caption = 'Obter total div.'
    TabOrder = 3
    OnClick = btnDivisoesClick
  end
  object edtTotalDivisoes: TEdit
    Left = 495
    Top = 334
    Width = 121
    Height = 23
    TabOrder = 4
  end
end
