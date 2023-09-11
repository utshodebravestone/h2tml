import Html

main :: IO()
main = putStrLn (render_ myHtml)

myHtml :: Html
myHtml =
    html_
        "Learning Haskell"
        (
            append_
                (h1_ "Trying hard to learn Haskell")
                (append_ (p_ "This is hard.") (p_ "But, I'll get through this."))
        )

