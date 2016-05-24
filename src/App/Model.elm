module App.Model exposing (..)

import Array exposing (Array)


type Box = Empty | X | O

type Player = PlayerX | PlayerO | None

-- Outer array is rows, inner array is columns
type alias TickTackToeBoard = Array (Array Box)

type alias AppModel = {
    board: TickTackToeBoard
    , player: Player
  }

initialModel : AppModel
initialModel = {
    board = Array.repeat 3 (Array.fromList [Empty, Empty, Empty])
    , player = PlayerX
  }
