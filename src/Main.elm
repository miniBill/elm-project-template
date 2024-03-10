module Main exposing (Flags, Model, Msg, main)

import Browser
import Element.WithContext as Element exposing (fill, height, text, width)
import Theme exposing (Context, Element)


type alias Flags =
    ()


type alias Model =
    { context : Context
    }


type Msg
    = NoOp


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view =
            \model ->
                Element.layout model.context
                    [ Theme.fontSizes.normal
                    , width fill
                    , height fill
                    ]
                    (view model)
        , update = update
        , subscriptions = subscriptions
        }


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( { context = {}
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Element Msg
view _ =
    Theme.column [ Theme.padding ]
        [ text "Hello world"
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
