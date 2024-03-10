module Main exposing (Flags, Model, Msg, main)

import Browser
import Element.WithContext as Element exposing (fill, height, width)
import Theme exposing (Context, Element, text)
import Translations


type alias Flags =
    { language : String
    }


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
init flags =
    ( { context =
            { i18n =
                flags.language
                    |> Translations.languageFromString
                    |> Maybe.withDefault Translations.En
                    |> Translations.init
            }
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
        [ Theme.button []
            { onPress = Just NoOp
            , label = text Translations.helloWorld
            }
        ]


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
