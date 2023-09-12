module Html.Internal where

-- * Types

newtype Document = Document String

newtype Element = Element String

type Title = String


-- * Combinators

html :: Title -> Element -> Document
html title content =
    Document
        (el
            "html"
                (el "head" (el "title" (escape title))
                <> el "body" (getElementString content)
                )
        )

body :: [Element] -> Element
body = Element . concat . map (getElementString)

h1 :: String -> Element
h1 = Element . el "h1" . escape

h2 :: String -> Element
h2 = Element . el "h2" . escape

h3 :: String -> Element
h3 = Element . el "h2" . escape

p :: String -> Element
p = Element . el "p" . escape

code :: String -> Element
code = Element . el "pre"

ul :: [Element] -> Element
ul = Element . el "ul" . concat . map (el "li" . getElementString)

ol :: [Element] -> Element
ol = Element . el "ol" . concat . map (el "li" . getElementString)


-- * Utils

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

escape :: String -> String
escape =
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

concatElements :: [Element] -> Element
concatElements elements = Element (concat (map getElementString elements))

render :: Document -> String
render doc = case doc of Document str -> str

getElementString :: Element -> String
getElementString (Element str) = str
