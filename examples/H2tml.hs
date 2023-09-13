import H2tml.Utils
import H2tml.Core

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
                            [attribute_ "href" "https://lhbg-book.link/"]
                        )
                    ]
            ]
        )
    )
