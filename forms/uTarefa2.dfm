inherited frmTarefa02: TfrmTarefa02
  Caption = 'frmTarefa02'
  ClientHeight = 371
  ClientWidth = 553
  ExplicitWidth = 569
  ExplicitHeight = 410
  TextHeight = 15
  object grpTempoMillis: TGroupBox
    Left = 8
    Top = 8
    Width = 297
    Height = 89
    Caption = 'Tempo em milissegundos das threads'
    TabOrder = 0
    object lblThread01: TLabel
      Left = 16
      Top = 24
      Width = 51
      Height = 15
      Caption = 'Thread 01'
    end
    object lblThread02: TLabel
      Left = 16
      Top = 54
      Width = 51
      Height = 15
      Caption = 'Thread 02'
    end
    object seThread01: TSpinEdit
      Left = 73
      Top = 21
      Width = 121
      Height = 24
      MaxValue = 5000
      MinValue = 95
      TabOrder = 0
      Value = 95
      OnExit = seThread01Exit
    end
    object seThread02: TSpinEdit
      Left = 73
      Top = 51
      Width = 121
      Height = 24
      MaxValue = 5000
      MinValue = 95
      TabOrder = 1
      Value = 95
      OnExit = seThread02Exit
    end
    object btnRodarThreads: TButton
      Left = 200
      Top = 20
      Width = 89
      Height = 25
      Caption = 'Rodar Threads'
      TabOrder = 2
      OnClick = btnRodarThreadsClick
    end
  end
end
