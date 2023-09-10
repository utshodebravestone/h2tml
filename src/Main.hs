main = putStrLn (makeHtml "Learning Haskell" "Hello, Haskell!")

makeHtml title content = html_ (head_ (title_ title) <> body_ content)

html_ content = "<html>" <> content <> "</html>"

head_ content = "<head>" <> content <> "</head>"

title_ title = "<title>" <> title <> "</title>"

body_ content = "<body>" <> content <> "</body>"
