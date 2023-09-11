# HTML Generator (EDSL)

Learning Haskell by building an HTML Generator.

Following the book [Learn Haskell by building a blog generator](https://lhbg-book.link/).

## Deviations

**Features that differs from original implementation:**

- Added function/combinator (`concatElement`) for concating element.
- Added `body` function/combinator so you don't need nest `appendElement` call.

## Run

If you don't have Haskell, [Setup Haskell](https://www.haskell.org/downloads/) first  and then run the command: `runghc [ANY_EXAMPLE_FILE]`

## Examples

Here's a bit test of the it:

```Table that generate multiplication table of one's to tenth's.
import Html

main :: IO ()
main = putStrLn page

page :: String
page =
    render
        (html
            "Multiplication Table"
            (body [
                h1 "Multiplication Table",
                h2 "Generated via Html Generator written in Haskell by Utsho de Bravestone",
                tableOf 10
            ])
        )

tableOf :: Integer -> Element
tableOf n = concatElements (map table [1..n])

table :: Integer -> Element
table i = addElements (h3 ("Multiplication table of " ++ show i)) (ul (map p [show i ++ " times " ++ show x ++ " is " ++ show (x * i) | x <- [1..10]]))
```

More examples be found [here](./Examples/).
