import Html.Utils
import Html.Core

main :: IO ()
main =
    writeFile "all.html" (
        render (
            boilerplate_
            "Main"
            [
                h1_ "Hello there, this is an h1.",
                h2_ "Hello there, this is an h2.",
                h3_ "Hello there, this is an h3.",
                h4_ "Hello there, this is an h4.",
                h5_ "Hello there, this is an h5.",
                h6_ "Hello there, this is an h6.",
                p_ "Hello there, this is a p.",
                small_ "Hello there, this is a small.",
                b_ "Hello there, this is a b.",
                i_ "Hello there, this is an i.",
                a_ "Hello there, this is an a" [attribute_ "href" "where?"]
            ]
        )
    )
