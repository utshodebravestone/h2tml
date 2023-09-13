import H2tml.Prelude

main :: IO()
main = writeFile "h2tml.html" (
    render( boilerplate_
            "H2TML"
            [
                h1_ "H2tml",
                children_
                    (p_ "Embedded HTML Language in Haskell inspired from book: ")
                    [
                        (a_
                            "Learn Haskell by building a blog generator"
                            [attribute_ href_ "https://lhbg-book.link/"]
                        )
                    ]
            ]
        )
    )
