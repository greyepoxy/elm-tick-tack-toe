module App.Actions (..) where


type Action
  = NoOp
    | Select (Int, Int)
