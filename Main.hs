import Html

main :: IO()
main = putStrLn (render_ myHtml)

myHtml :: Html
myHtml =
    html_
        "Learning Haskell"
        (body_
            [
                h1_ "Learning Haskell",
                p_ "Learning Haskell by building an HTML Generator.",
                h1_ "Here's what I've learned so far:",
                ol_ [p_ "Function", p_ "Function Composition", p_ "Types", p_ "Modules"]
            ]
        )
