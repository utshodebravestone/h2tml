module Html
    (
        Html,
        Structure,
        Title,
        html_,
        h1_,
        p_,
        append_,
        render_,
    )
    where


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

p_ :: String -> Structure
p_ = Structure . el_ "p". escape_

h1_ :: String -> Structure
h1_ = Structure . el_ "h1" . escape_


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
