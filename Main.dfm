object MainForm: TMainForm
  Left = 194
  Top = 111
  Caption = 'MDI Application'
  ClientHeight = 263
  ClientWidth = 360
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  Position = poDefault
  WindowState = wsMaximized
  OnActivate = FormActivate
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 244
    Width = 360
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    AutoHint = True
    Panels = <>
    SimplePanel = True
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 200
    object Tarefas: TMenuItem
      Caption = 'Tarefas'
      Hint = 'File related commands'
      object arefa031: TMenuItem
        Action = actTarefas03
      end
    end
  end
  object ActionList1: TActionList
    Left = 72
    Top = 200
    object actTarefas03: TAction
      Caption = 'Tarefa 03'
      OnExecute = actTarefas03Execute
    end
  end
end
