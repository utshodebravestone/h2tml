# HTML Generator (HTML EDSL)

Learning Haskell by building an HTML Generator.

Following the book [Learn Haskell by building a blog generator](https://lhbg-book.link/).

## Deviations

**Features that differs from original implementation:**

- Added `body_` function/combinator so you don't need nest `append_` call.

    You had to do this according to the original implementation:

    ```
    html_
        "Learning Haskell"
        (
            append_
                (h1_ "Trying hard to learn Haskell")
                (append_
                    (p_ "Haskell is very elegant!")
                    (append_
                       (append_
                            (h1_ "Example:")
                                (append_
                                    (p_ "Hello world:")
                                    (code_ "main = putStrLn \"Hello World\"")
                                )
                        )
                        (append_
                            (h1_ "Learned so far:")
                            (ol_ [p_ "Function", p_ "Function Composition", p_ "Types"])
                        )
                    )
                )
        )
    ```

    But, from now on, you can write this:

    ```
    html_
        "Learning Haskell"
        (body_
            [
                h1_ "Trying hard to learn Haskell",
                p_ "Haskell is very elegant!",
                h1_ "Learned so far:",
                ol_ [p_ "Function", p_ "Function Composition", p_ "Types"],
                h1_ "Example:",
                p_ "Hello world:",
                code_ "main = putStrLn \"Hello World\""
            ]
        )
    ```

## Run

If you don't have Haskell, [Setup Haskell](https://www.haskell.org/downloads/) first  and then run the command: `runghc ./Main.hs`
