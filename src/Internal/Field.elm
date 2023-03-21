module Internal.Field exposing (..)

{-| -}

import Json.Encode as Encode


type Field error parsed input initial kind constraints
    = Field (FieldInfo error parsed input initial) kind


{-| -}
type alias FieldInfo error parsed input initial =
    { initialValue : Maybe (input -> String)
    , decode : Maybe String -> ( Maybe parsed, List error )
    , properties : List ( String, Encode.Value )
    , initialToString : initial -> String
    , compare : String -> initial -> Order
    }
