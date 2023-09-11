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
                (append_
                    (p_ "Haskell is very elegant!")
                    (append_
                       (append_
                            (h1_ "Example:")
                                (append_
                                    (p_ "Hello world:")
                                    (code_ "main = putStrLn \"Hello World\"")
                                )
                        )
                        (append_
                            (h1_ "Learned so far:")
                            (ol_ [p_ "Function", p_ "Function Composition", p_ "Types"])
                        )
                    )
                )
        )

