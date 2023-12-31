-- * Contains Core Functions

module H2tml.Core where

import H2tml.Definitions

-- * Public Render Functions

render :: Document -> String
render document =
    case document of
        Document elements ->
            "<!DOCTYPE html>" <> (renderElements elements)

-- * Private Render Functions

renderElements :: [Element] -> String
renderElements = concat . (map renderElement)

renderElement :: Element -> String
renderElement currentElement =
    case kind currentElement of
        Html ->
            "<html>"
            <> (concat (map renderElement (children currentElement))) <>
            "</html>"

        Head ->
            "<head>"
            <> (concat (map renderElement (children currentElement))) <>
            "</head>"

        Title ->
            "<title>" <> text currentElement <>  "</title>"

        Body ->
            "<body>"
            <> (concat (map renderElement (children currentElement))) <>
            "</body>"

        Ul ->
            "<ul>"
            <> (
                concat
                (map (\child -> "<li>" <> (renderElement child) <> "</li>")
                (children currentElement))
            ) <>
            "</ul>"

        Div ->
            "<div>"
            <> (concat (map renderElement (children currentElement))) <>
            "</div>"

        Img ->
            "<img " <> renderAttributes (attributes currentElement) <> ">"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</img>"

        H1 ->
            "<h1>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</h1>"

        H2 ->
            "<h2>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</h2>"

        H3 ->
            "<h3>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</h3>"

        H4 ->
            "<h4>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</h4>"

        H5 ->
            "<h5>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</h5>"

        H6 ->
            "<h6>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</h6>"

        P ->
            "<p>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</p>"

        Small ->
            "<small>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</small>"

        B ->
            "<b>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</b>"

        I ->
            "<i>"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</i>"

        A ->
            "<a " <> renderAttributes (attributes currentElement) <> ">"
            <> text currentElement <>
            (concat (map renderElement (children currentElement))) <>
            "</a>"

renderAttributes :: [Attribute] -> String
renderAttributes = concat . map renderAttribute

renderAttribute :: Attribute -> String
renderAttribute =
    (
        \attribute ->
            renderAttributeKind (key attribute)
            <> "=" <>
            "'" <> value attribute <> "'"
    )

renderAttributeKind ::  AttributeKind -> String
renderAttributeKind attributeKind =
    case attributeKind of
        Href -> "href"
        Src -> "src"

-- * Public Helper Functions

children_ :: Element -> [Element] -> Element
children_ parent children =
    createElement (kind parent) (text parent) (attributes parent) (children)

-- * Private Helper Functions

createElement :: ElementKind -> String -> [Attribute] -> [Element] -> Element
createElement kind text attributes children =
    Element {
        kind = kind,
        text = text,
        attributes = attributes,
        children = children
    }

-- * Document Construction Functions

document_ :: [Element] -> Document
document_ = Document

-- * Element Construction Functions

html_ :: [Element] -> Element
html_ childrenElements = createElement Html "" [] childrenElements

head_ :: [Element] -> Element
head_ childrenElements = createElement Head "" [] childrenElements

title_ :: String -> Element
title_ textContent = createElement Title textContent [] []

body_ :: [Element] -> Element
body_ childrenElements = createElement Body "" [] childrenElements

ul_ :: [Element] -> Element
ul_ children = createElement Ul "" [] children

div_ :: [Element] -> Element
div_ children = createElement Div "" [] children

img_ :: [Attribute] -> Element
img_ attributes = createElement A "" attributes []

h1_ :: String -> Element
h1_ textContent = createElement H1 textContent [] []

h2_ :: String -> Element
h2_ textContent = createElement H2 textContent [] []

h3_ :: String -> Element
h3_ textContent = createElement H3 textContent [] []

h4_ :: String -> Element
h4_ textContent = createElement H4 textContent [] []

h5_:: String -> Element
h5_ textContent = createElement H5 textContent [] []

h6_ :: String -> Element
h6_ textContent = createElement H6 textContent [] []

p_ :: String -> Element
p_ textContent = createElement P textContent [] []

small_ :: String -> Element
small_ textContent = createElement Small textContent [] []

b_ :: String -> Element
b_ textContent = createElement B textContent [] []

i_ :: String -> Element
i_ textContent = createElement I textContent [] []

a_ :: String -> [Attribute] -> Element
a_ textContent attributes = createElement A textContent attributes []

-- * Attributes Construction Functions

href_ :: AttributeKind
href_ = Href

src_ :: AttributeKind
src_ = Src

-- * Attribute Construction Functions

attribute_ :: AttributeKind -> String -> Attribute
attribute_ = Attribute
