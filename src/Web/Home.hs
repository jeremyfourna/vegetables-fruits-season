{-# LANGUAGE OverloadedStrings #-}

module Web.Home (homePage) where

--import Client.CSS (layoutCss)
import Data.List (map)
import Data.Monoid (mempty)
import Data.Text.Lazy (toStrict)
import Prelude hiding (div, head, id, span)
import Text.Blaze.Html (toHtml)
import Text.Blaze.Html5 (Html, a, body, button, dataAttribute, div, docTypeHtml, form, h5, h6, head, input, li, link, meta, nav, p, script, span, style, title, ul, (!))
import Text.Blaze.Html5.Attributes (charset, class_, content, href, httpEquiv, id, lang, media, name, placeholder, rel, src, type_)
import Text.Blaze.Internal (Attribute, AttributeValue, MarkupM( Leaf ), attribute)
import Web.Components (navBar, foodElement)
import Web.Data.Foods (allFoods)
import Web.Layout (layout)
import Web.Utils (blaze, currentDate)
import Web.Scotty (ActionM)

homePage :: ActionM ()
homePage = blaze $ layout "Seasonal vegetables and fruits" $ do
  div ! class_ "container" $ do
    div ! class_ "row" $ do
      toHtml (map foodElement allFoods)