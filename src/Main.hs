main :: IO()
main = putStrLn (render myHtml)

myHtml :: Html
myHtml = html_ "Learning Haskell" (append_ (h1_ "Trying hard to learn Haskell") (append_ (p_ "This is hard.") (p_ "But, I'll get through this.")))

newtype Html = Html String

newtype Structure = Structure String

type Title = String

html_ :: Title -> Structure -> Html
html_ title content = Html (el "html" (el "head" (el "title" title) <> el "body" (getStructureString content)))

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"


append_ :: Structure -> Structure -> Structure
append_ (Structure a) (Structure b) = Structure (a <> b)

getStructureString :: Structure -> String
getStructureString (Structure str) = str

render :: Html -> String
render html = case html of Html str -> str
