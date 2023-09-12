-- * Contains some utility functions

module Html.Utils (
    boilerplate_
) where

import Html.Core
import Html.Definitions

type Title = String
type Body = [Element]

boilerplate_ :: Title -> Body -> Document
boilerplate_ title body =
    document_ [
        html_ [
            head_ [
                title_ title
            ],
            body_ body
        ]
    ]
