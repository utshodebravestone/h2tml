import H2tml.Prelude

main :: IO ()
main =
    writeFile "all.html" (
        render (
            boilerplate_
            "Main"
            [
                div_ [i_ "Hello there, this is an i."],
                img_ [attribute_ src_ "/home/utsho/Downloads/fox.png"],
                ul_ [
                    h1_ "Hello there, this is an h1.",
                    h2_ "Hello there, this is an h2.",
                    h3_ "Hello there, this is an h3.",
                    h4_ "Hello there, this is an h4.",
                    h5_ "Hello there, this is an h5.",
                    h6_ "Hello there, this is an h6."
                ],
                p_ "Hello there, this is a p.",
                small_ "Hello there, this is a small.",
                b_ "Hello there, this is a b.",
                a_ "Hello there, this is an a" [attribute_ href_ "/404"],
                children_ (p_ "created by ") [i_ "utsho de bravestone"]
            ]
        )
    )
