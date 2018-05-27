{-# LANGUAGE OverloadedStrings #-}

module Web.Layout (layout) where

import Data.Monoid (mempty)
import Data.Text.Lazy (toStrict)
import Prelude hiding (div, head, id, span)
import Text.Blaze.Html5 (Html, a, body, button, dataAttribute, div, docTypeHtml, form, h1, h2, head, input, li, link, meta, nav, p, script, span, style, title, ul, (!))
import Text.Blaze.Html5.Attributes (charset, class_, content, href, httpEquiv, id, lang, media, name, placeholder, rel, src, type_)
import Text.Blaze.Internal (Attribute, AttributeValue, MarkupM( Leaf ), attribute)
import Web.Components (navBar)
import Web.CSS (layoutCss)
import Web.Utils (blaze, pet)
import Web.Scotty (ActionM)


layout :: Html -> Html -> Html
layout t b = docTypeHtml ! lang "en" $ do
    head $ do
      title t
      meta ! charset "utf-8"
      meta
        ! name "viewport"
        ! content "width=device-width, initial-scale=1, shrink-to-fit=no"
      link
        ! href "//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.min.css"
        ! rel  "stylesheet"
        ! media "screen"
      style $ pet $ toStrict layoutCss
    body $ do
      navBar
      div ! id "app" $ "" >> b
      script ! src "//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" $ mempty
      script ! src "//cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.min.js" $ mempty
      script ! src "//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js" $ mempty