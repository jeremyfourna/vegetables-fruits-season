{-# LANGUAGE OverloadedStrings #-}

module Web.Home (homePage) where

--import Client.CSS (layoutCss)
import Data.Monoid (mempty)
import Data.Text.Lazy (toStrict)
import Prelude hiding (div, head, id, span)
import Text.Blaze.Html5 (Html, a, body, button, dataAttribute, div, docTypeHtml, form, h1, h2, head, input, li, link, meta, nav, p, script, span, style, title, ul, (!))
import Text.Blaze.Html5.Attributes (charset, class_, content, href, httpEquiv, id, lang, media, name, placeholder, rel, src, type_)
import Text.Blaze.Internal (Attribute, AttributeValue, MarkupM( Leaf ), attribute)
import Web.Components (navBar)
import Web.Layout (layout)
import Web.Utils (blaze, pet)
import Web.Scotty (ActionM)

homePage :: ActionM ()
homePage = blaze $ layout "Starter kit with Scotty and Bootstrap v4" $ do
    div ! class_ "container" $ do
      div ! class_ "jumbotron" $ do
        h1 "Scotty Starter"
        p "Welcome to the Scotty Starter template, equipped with Twitter Bootstrap 3.3.7 and HTML5 boilerplate"
        p $ do
          a ! class_ "btn btn-lg btn-primary" ! id "fb" ! href "#navbar" $ "Facebook"
          a ! class_ "btn btn-lg btn-danger" ! id "gmail" ! href "#navbar" $ "Gmail"