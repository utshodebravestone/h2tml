-- * Contains Type Definitions

module H2tml.Definitions where

newtype Document = Document [Element]

data Element =
    Element {
        kind :: ElementKind,
        text :: String,
        attributes :: [Attribute],
        children :: [Element]
    }

data ElementKind =
    Html |
    Head |
    Title |
    Body |
    Ul |
    Div |
    Img |
    H1 |
    H2 |
    H3 |
    H4 |
    H5 |
    H6 |
    P |
    Small |
    B |
    I |
    A

data Attribute =
    Attribute {
        key :: AttributeKind,
        value :: String
    }

data AttributeKind =
    Href |
    Src
