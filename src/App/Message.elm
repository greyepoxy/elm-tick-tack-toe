module App.Message exposing (..)

type Message
  = NoOp
    | Select (Int, Int)
