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
            tableOf 10
        ])

tableOf :: Integer -> Element
tableOf n = concatElements (map table [1..n])

table :: Integer -> Element
table i = addElements (h3 ("Multiplication table of " ++ show i)) (ul (map p [show i ++ " times " ++ show x ++ " is " ++ show (x * i) | x <- [1..10]]))
