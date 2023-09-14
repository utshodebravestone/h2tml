-- * Contains Utility Functions

module H2tml.Utils where

import H2tml.Core
import H2tml.Definitions

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
