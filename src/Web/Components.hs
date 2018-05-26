{-# LANGUAGE OverloadedStrings #-}

module Web.Components (navBar) where

import Prelude hiding (div, id, span)
import Text.Blaze.Html5 (Html, a, body, button, dataAttribute, div, docTypeHtml, form, h1, h2, input, li, link, meta, nav, p, script, span, style, title, ul, (!))
import Text.Blaze.Html5.Attributes (charset, class_, content, href, httpEquiv, id, lang, media, name, placeholder, rel, src, type_)
import Text.Blaze.Internal (Attribute, AttributeValue, MarkupM( Leaf ), attribute)

ariaControls :: AttributeValue -> Attribute
ariaControls = attribute "aria-controls" " aria-controls=\""

ariaExpanded :: AttributeValue -> Attribute
ariaExpanded = attribute "aria-expanded" " aria-expanded=\""

ariaHasPopup :: AttributeValue -> Attribute
ariaHasPopup = attribute "aria-haspopup" " aria-haspopup=\""

ariaLabel :: AttributeValue -> Attribute
ariaLabel = attribute "aria-label" " aria-label=\""

ariaLabelledBy :: AttributeValue -> Attribute
ariaLabelledBy = attribute "aria-labelledby" " aria-labelledby=\""

role :: AttributeValue -> Attribute
role = attribute "role" " role=\""

spanL :: Html
spanL = Leaf "span" "<span" ">" ()

navBar :: Html
navBar =
  nav ! class_ "navbar navbar-expand-lg navbar-light bg-light" $ do
    a
      ! class_ "navbar-brand"
      ! href "#" $ "Navbar"
    button
      ! ariaControls "navbarSupportedContent"
      ! ariaExpanded "false"
      ! ariaLabel "Toggle navigation"
      ! class_ "navbar-toggler"
      ! dataAttribute "toggle" "collapse"
      ! dataAttribute "target" "#navbarSupportedContent"
      ! type_ "button" $ do
        spanL ! class_ "navbar-toggler-icon"
    div
      ! class_ "collapse navbar-collapse"
      ! id "navbarSupportedContent" $ do
        ul ! class_ "navbar-nav mr-auto" $ do
          li ! class_ "nav-item active" $
            a
              ! class_ "nav-link"
              ! href "/" $ "Home"
          li ! class_ "nav-item" $
            a
              ! class_ "nav-link"
              ! href "/foods" $ "All foods"
          li ! class_ "nav-item dropdown" $ do
            a
              ! class_ "nav-link dropdown-toggle"
              ! href "#"
              ! id "navbarDropdown"
              ! dataAttribute "toggle" "dropdown"
              ! ariaExpanded "false"
              ! ariaHasPopup "true" $ "Dropdown"
            div
              ! class_ "dropdown-menu"
              ! ariaLabelledBy "navbarDropdown" $ do
                a
                  ! class_ "dropdown-item"
                  ! href "#" $ "Action"
                a
                  ! class_ "dropdown-item"
                  ! href "#" $ "Another action"
                div ! class_ "dropdown-divider" $ ""
                a
                  ! class_ "dropdown-item"
                  ! href "#" $ "Something else here"
          li ! class_ "nav-item" $ do
            a
              ! class_ "nav-link disabled"
              ! href "#" $ "Disabled"
        form ! class_ "form-inline my-2 my-lg-0" $ do
          input
            ! class_ "form-control mr-sm-2"
            ! type_ "search"
            ! placeholder "Search"
            ! ariaLabel "Search"
          button
            ! class_ "btn btn-outline-success my-2 my-sm-0"
            ! type_ "submit" $ "Search"