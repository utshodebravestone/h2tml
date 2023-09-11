import Html

main :: IO()
main = putStrLn (render myHtml)

myHtml :: Document
myHtml =
    html
        "HTML Generator (EDSL in Haskell)"
        (body
            [
                h1 "HTML Generator (EDSL in Haskell)",
                p "Learning Haskell by building an HTML Generator.",
                p "Following the book [Learn Haskell by building a blog generator](https://lhbg-book.link/).",

                h2 "Run",
                p "If you don't have Haskell, [Setup Haskell](https://www.haskell.org/downloads/) first  and then run the command: ",
                code "runghc ./Main.hs"
            ]
        )
