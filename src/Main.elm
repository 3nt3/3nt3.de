module Main exposing (main)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)


white : Color
white =
    rgb 1 1 1


linkColor : Color
linkColor =
    rgb255 0x3B 0x3B 0x98


sides : { top : number, left : number, right : number, bottom : number }
sides =
    { top = 0, left = 0, right = 0, bottom = 0 }


annotatedLink url label description =
    paragraph [] [ el [ Font.family [ Font.typeface "Hack", Font.monospace ] ] <| text "-> ", link [] { url = url, label = el [ Font.underline, Font.color linkColor ] <| text label }, text " — ", description ]


main : Html msg
main =
    layout [] <|
        el
            [ Background.image "/imgs/bg.jpg"
            , width fill
            , height fill
            , padding 200
            ]
            (el
                [ Background.color white
                , Border.rounded 10
                , padding 40
                , centerY
                , centerX
                ]
                (column
                    [ Font.family [ Font.typeface "Inter", Font.sansSerif ]
                    , spacing 20
                    ]
                    [ paragraph [ Font.size 50 ] [ el [ Font.bold ] <| text "3nt3.de", text " - a duck's personal homepage" ]
                    , el [] <| text "Here I host some services some of which you - as a stranger - can actually use too!"
                    , el [ paddingEach { sides | top = 40 }, Font.bold, Font.size 40 ] <| text "My stuff"
                    , column [ paddingEach { sides | left = 20 }, spacing 10 ]
                        [ annotatedLink "https://hausis.3nt3.de" "hausis.3nt3.de" (text "a homework organizer I wrote in 2020/21 with moodle integration")
                        , annotatedLink "https://schule.3nt3.de" "schule.3nt3.de" (text "all my school documents for copying homework or learning idk")
                        ]
                    , el [ paddingEach { sides | top = 40 }, Font.bold, Font.size 40 ] <| text "Stuff I self-host"
                    , column [ paddingEach { sides | left = 20 }, spacing 10 ]
                        [ annotatedLink "https://git.teich.3nt3.de" "git.teich.3nt3.de" (text "a gitea instance")
                        , annotatedLink "https://le.teich.3nt3.de" "le.teich.3nt3.de" (text "le teich")
                        , annotatedLink "https://phpmyadmin.teich.3nt3.de" "phpmyadmin.teich.3nt3.de" (text "phpmyadmin (playground for testing stuff)")
                        , annotatedLink "teich.3nt3.de:25565" "teich.3nt3.de" (text "a survival mineraft server")
                        , annotatedLink "mumble://3nt3.de:64738" "3nt3.de:64738" (text "a mumble server")
                        , annotatedLink "3nt3.de" "3nt3.de" (text "a matrix homeserver")
                        , annotatedLink "https://mumble.3nt3.de" "mumble.3nt3.de" (text "web control player for botamusique")
                        , annotatedLink "https://tex.3nt3.de" "tex.3nt3.de" (text "an overleaf instance")
                        ]
                    ]
                )
            )
