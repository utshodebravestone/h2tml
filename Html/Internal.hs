module Html.Internal where

-- Types

newtype Html = Html String

newtype Structure = Structure String

type Title = String


-- EDSL HTML

html_ :: Title -> Structure -> Html
html_ title content =
    Html
        (el_
            "html"
                (el_ "head" (el_ "title" (escape_ title))
                <> el_ "body" (getStructureString content)
                )
        )

h1_ :: String -> Structure
h1_ = Structure . el_ "h1" . escape_

p_ :: String -> Structure
p_ = Structure . el_ "p" . escape_

code_ :: String -> Structure
code_ = Structure . el_ "pre"

ul_ :: [Structure] -> Structure
ul_ = Structure . el_ "ul" . concat . map (el_ "li" . getStructureString)

ol_ :: [Structure] -> Structure
ol_ = Structure . el_ "ol" . concat . map (el_ "li" . getStructureString)


-- Utils

el_ :: String -> String -> String
el_ tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

escape_ :: String -> String
escape_ =
    let
        escapeChar c =
            case c of
                '<' -> "&lt;"
                '>' -> "&gt;"
                '&' -> "&amp;"
                '"' -> "&qout;"
                '\'' -> "&#39;"
                _ -> [c]
    in
        concat . map escapeChar

append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

render_ :: Html -> String
render_ html = case html of Html str -> str

getStructureString :: Structure -> String
getStructureString (Structure str) = str
