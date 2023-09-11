main :: IO()
main = putStrLn myHtml

myHtml :: String
myHtml = makeHtml "Learning Haskell" (h1_ "Hello, Haskell!" <> p_ "I'm trying to learn you.")

makeHtml :: String -> String -> String
makeHtml title content = html_ (head_ (title_ title) <> body_ content)

html_ :: String -> String
html_ = el "html"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

body_ :: String -> String
body_ = el "body"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"
