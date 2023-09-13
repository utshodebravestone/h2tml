import H2tml.Prelude

main :: IO ()
main = writeFile "multiplication-tables.html" (
    render (
            boilerplate_
            "Multiplication Table"
            [
                 h1_ "Multiplication Table",
                h2_ "Generated via H2tml ",
                -- table 10,
                (children_
                (p_ "See the source code ")
                [(a_ "here" [attribute_ href_ "https://github.com/utshodebravestone/h2tml"])])
            ]
        )
    )

-- table :: Integer -> Element
-- table n = concatElements (map tableOf [1..n])

-- tableOf :: Integer -> Element
-- tableOf i =
--     concatElements [
--         (h3 ("Multiplication table of " ++ show i)),
--         (ul (map p [show i ++ " times " ++ show x ++ " is " ++ show (x * i) | x <- [1..10]]))
--     ]
