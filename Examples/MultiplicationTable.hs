import Html

main :: IO ()
main = writeFile "multiplication-tables.html" (render page)

page :: Document
page =
    html
        "Multiplication Table"
        (body [
            h1 "Multiplication Table",
            h2 "Generated via Html Generator written in Haskell by Utsho de Bravestone",
            table 10
        ])

table :: Integer -> Element
table n = concatElements (map tableOf [1..n])

tableOf :: Integer -> Element
tableOf i =
    concatElements [
        (h3 ("Multiplication table of " ++ show i)),
        (ul (map p [show i ++ " times " ++ show x ++ " is " ++ show (x * i) | x <- [1..10]]))
    ]
