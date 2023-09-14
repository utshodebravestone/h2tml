-- * All In One

module H2tml.Prelude (
    -- * Elements
    document_,
    html_,
    head_,
    title_,
    body_,
    ul_,
    div_,
    img_,
    h1_,
    h2_,
    h3_,
    h4_,
    h5_,
    h6_,
    p_,
    small_,
    b_,
    i_,
    a_,

    -- * Attributes
    href_,
    src_,

    -- * Helpers
    children_,
    attribute_,
    boilerplate_,

    -- * Renderer
    render,
) where

import H2tml.Core
import H2tml.Utils
