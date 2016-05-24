module Main exposing (..)

import Html.App
import Platform.Cmd exposing (Cmd)
import App.Message exposing (..)
import App.Model exposing (..)
import App.Update exposing (..)
import App.View exposing (..)


init : ( AppModel, Cmd Message )
init =
  ( initialModel, Cmd.none )

main: Platform.Program Never
main =
  Html.App.program { init = init, update = update, view = view, subscriptions = \_ -> Sub.none }
