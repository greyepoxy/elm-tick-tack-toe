module App.View (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events
import App.Actions exposing (..)
import App.Model exposing (..)
import Array exposing (Array)

boxStyle : Html.Attribute
boxStyle = style [
    ("border", "2px solid black"),
    ("width", "200px"),
    ("height", "200px"),
    ("float", "left"),
    ("font-size", "100px")
  ]


drawBox: Signal.Address Action -> Int -> Int -> Box -> Html
drawBox address rowNum colNum box = 
  let
    contents = case box of
      Empty -> ""
      X -> "X"
      O -> "O"
  in
    div
      [ boxStyle, Html.Events.onClick address (Select (rowNum, colNum))  ]
      [ text contents ]

view : Signal.Address Action -> AppModel -> Html
view address model =
  Array.indexedMap (drawRow address) model.board
    |> Array.toList
    |> div []

drawRow: Signal.Address Action -> Int -> Array Box -> Html
drawRow address rowNum array =
  Array.indexedMap (drawBox address rowNum) array
    |> Array.toList
    |> div [ style [ ("clear", "both" )]]
