module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events
import App.Message exposing (..)
import App.Model exposing (..)
import Array exposing (Array)

boxStyle : Html.Attribute msg
boxStyle = style [
    ("border", "2px solid black"),
    ("width", "200px"),
    ("height", "200px"),
    ("float", "left"),
    ("font-size", "100px")
  ]


drawBox: Int -> Int -> Box -> Html Message
drawBox rowNum colNum box = 
  let
    contents = case box of
      Empty -> ""
      X -> "X"
      O -> "O"
  in
    div
      [ boxStyle, Html.Events.onClick (Select (rowNum, colNum))  ]
      [ text contents ]

view : AppModel -> Html Message
view model =
  Array.indexedMap drawRow model.board
    |> Array.toList
    |> div []

drawRow: Int -> Array Box -> Html Message
drawRow rowNum array =
  Array.indexedMap (drawBox rowNum) array
    |> Array.toList
    |> div [ style [ ("clear", "both" )]]
