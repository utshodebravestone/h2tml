# H2tml

HTML Embedded in Haskell.

## Examples

Here's what it looks like:

```haskell
import H2tml.Prelude

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
                            [attribute_ href_ "https://lhbg-book.link/"]
                        )
                    ]
            ]
        )
    )
```

More examples can be found [here](./Examples/).

## Why

To write type safe and declarative HTML.

## Inspiration

[Learn Haskell by building a blog generator](https://lhbg-book.link/).

## Run

[Setup Haskell](https://www.haskell.org/downloads/) if you don't already have it and then run: `runghc [ANY_EXAMPLE_FILE]` or `ghc [ANY_EXAMPLE_FILE]` to compile to native executable.
