module App.Update exposing (..)

import App.Model exposing (..)
import App.Message exposing (..)
import Platform.Cmd  exposing (Cmd)

import Array exposing (Array)


update : Message -> AppModel -> ( AppModel, Cmd Message )
update message model =
  case message of
    NoOp -> ( model, Cmd.none )
    Select loc -> ( updateModelForSelect loc model, Cmd.none )


updateModelForSelect : (Int,Int) -> AppModel -> AppModel
updateModelForSelect loc model =
  case (updateBoard loc (getPiece model.player) model.board) of
    Just newBoard -> { model | 
        board = newBoard
        , player = getNextPlayer model.player
      }
    Nothing -> model

updateBoard : (Int,Int) -> Box -> TickTackToeBoard -> Maybe TickTackToeBoard
updateBoard (rowNum, colNum) box board =
  if (isUnoccupied (rowNum, colNum) board) then
    (let
      newRow = Array.set colNum box ((Array.get rowNum board) |> Maybe.withDefault (Array.repeat 3 Empty))
    in
      Just (Array.set rowNum newRow board))
  else
    Nothing

isUnoccupied : (Int,Int) -> TickTackToeBoard -> Bool
isUnoccupied  (rowNum, colNum) board =
  (Array.get rowNum board) `Maybe.andThen` (Array.get colNum)
    |> Maybe.map (\box -> box == Empty)
    |> Maybe.withDefault False


getPiece: Player -> Box
getPiece player = 
  case player of
    PlayerX -> X
    PlayerO -> O
    None -> Empty

getNextPlayer: Player -> Player
getNextPlayer player =
  case player of
    PlayerX -> PlayerO
    PlayerO -> PlayerX
    None -> None

{--
checkEndGameState: TickTackToeBoard -> (Bool, Player)
checkEndGameState board =
--}

{--
checkRowOnBoardForPlayerWin: Int -> TickTackToeBoard -> Maybe Player
checkRowOnBoardForPlayerWin rowNum board =
  (Array.get rowNum board)
    |> Maybe.withDefault (Array.fromList [Empty, Empty, Empty])
    |> Array.foldl winningPlayerBasedOnNextBox (Just None)

winningPlayerBasedOnNextBox: Box -> Maybe Player -> Maybe Player
winningPlayerBasedOnNextBox box currentWinner =
  if currentWinner == Nothing then
    Nothing
  else if box == X && (currentWinner == Just PlayerX || currentWinner == Just None) then
    Just PlayerX
  else if box == O && (currentWinner == Just PlayerO || currentWinner == Just None) then
    Just PlayerO
  else if box == X && currentWinner == Just PlayerO then
    Nothing
  else if box == O && currentWinner == Just PlayerX then
    Nothing
  else if box == Empty then
    Nothing
  else
    Just None
--}