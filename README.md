# HTML Generator (EDSL)

Embedded Html Language in Haskell inspired from book [Learn Haskell by building a blog generator](https://lhbg-book.link/).

## Run

If you don't have Haskell, [Setup Haskell](https://www.haskell.org/downloads/) first  and then run the command: `runghc [ANY_EXAMPLE_FILE]`

## Examples

Here's what it looks like:

```Table that generates multiplication table of one's to tenth's.
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
```

More examples can be found [here](./Examples/).
