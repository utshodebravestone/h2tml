import Html.Utils
import Html.Core

main :: IO()
main = writeFile "html-generator.html" (
    render( boilerplate_
        "HTML Generator (EDSL in Haskell)"
        [
            h1_ "HTML Generator (EDSL in Haskell)",
            p_ "Embedded Html Language in Haskell inspired from book: ",
            a_ "Learn Haskell by building a blog generator" [attribute_ "href" "https://lhbg-book.link/"]
        ]
        )
    )
