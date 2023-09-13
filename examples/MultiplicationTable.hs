import H2tml.Definitions
import H2tml.Core
import H2tml.Utils

main :: IO ()
main = writeFile "multiplication-tables.html" (
    render (
            boilerplate_
            "Multiplication Table"
            [
                 h1_ "Multiplication Table",
                h2_ "Generated via H2tml ",
                table 10,
                (children_
                (p_ "See the source code ")
                [(a_ "here" [attribute_ href_ "https://github.com/utshodebravestone/h2tml"])])
            ]
        )
    )

table :: Integer -> Element
table n = div_ (map tableOf [1..n])

tableOf :: Integer -> Element
tableOf i =
    div_ [
        (h3_ ("Multiplication table of " ++ show i)),
        (ul_ (map p_ [show i ++ " times " ++ show x ++ " is " ++ show (x * i) | x <- [1..10]]))
    ]
