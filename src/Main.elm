module Main exposing (main)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (a,Html)
import Html.Attributes exposing (attribute, style)


white : Color
white =
    rgb 1 1 1


linkColor : Color
linkColor =
    rgb255 0x3B 0x3B 0x98


sides : { top : number, left : number, right : number, bottom : number }
sides =
    { top = 0, left = 0, right = 0, bottom = 0 }


linkStyle =
    [ Font.underline, Font.color linkColor ]


listItem child =
    paragraph [] [ el [ Font.family [ Font.typeface "Hack", Font.monospace ] ] <| text "-> ", child ]


listLink url label =
    listItem (link [] { url = url, label = el linkStyle <| text label })


annotatedLink url label description =
    paragraph [] [ listLink url label, text " — ", description ]


each =
    { top = 0, right = 0, left = 0, bottom = 0 }


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
                    [ paragraph [ Font.size 50 ] [ el [ Font.bold ] <| text "3nt3.de 🏳️\u{200D}🌈🏳️\u{200D}⚧️", text " — a duck's personal  website" ]
                    , el [] <| text "Nia, 17/o, she/they"
                    , el [] <| text "I like to code and hack stuff"
                    , el [ paddingEach { sides | top = 20 }, Font.bold, Font.size 40 ] <| text "My accounts"
                    , column [ paddingEach { sides | left = 20 }, spacing 10 ]
                        [ listLink "https://twitter.com/3nt3__" "twitter: 3nt3__"
                        , listLink "https://github.com/3nt3" "github: 3nt3"
                        , listLink "https://chaos.social/@3nt3" "mastodon: @3nt3@chaos.social"
                        , listItem (text "matrix: @3nt3:3nt3.de")
                        , listItem (text "mail: nia@ente.gay (don't spam pls)")
                        ]
                    , el [ paddingEach { sides | top = 20 }, Font.bold, Font.size 40 ] <| text "My stuff"
                    , column [ paddingEach { sides | left = 20 }, spacing 10 ]
                        [ annotatedLink "https://schule.3nt3.de" "schule.3nt3.de" (text "all my school documents for copying homework or learning idk")
                        , annotatedLink "https://quotes.3nt3.de" "quotes.3nt3.de" (text "(very ugly) hacked together voting platform for quotes from my friend-group's discord server to rank them")
                        , annotatedLink "https://nachhilfe.gymhaan.de" "nachhilfe.gymhaan.de" (text "I wrote most of it but it isn't hosted by me")
                        ]
                    , el [ paddingEach { sides | top = 20 }, Font.bold, Font.size 40 ] <| text "Stuff I self-host"
                    , column [ paddingEach { sides | left = 20 }, spacing 10 ]
                        [ annotatedLink "mumble://3nt3.de:64738" "3nt3.de" (text "a mumble server")
                        , listItem (paragraph [] [ text "3nt3.de  —  a matrix homeserver" ])
                        , annotatedLink "https://mumble.3nt3.de" "mumble.3nt3.de" (text "web control player for botamusique")
                        ]
                    , el [ centerX, Font.color <| rgb 0.2 0.2 0.2 ] <| paragraph [] [ text "Made by me with elm. ", link [] { url = "https://github.com/3nt3/3nt3.de", label = el [ Font.color <| rgb 0.3 0.3 0.3 ] <| text "source code" } ]
                    , html <| a [(attribute "rel") "me", Html.Attributes.href "https://chaos.social/@3nt3", style "display" "none"] [Html.text "Mastodon"] 
                    ]
                )
            )
