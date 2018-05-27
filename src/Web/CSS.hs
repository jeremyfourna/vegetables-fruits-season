{-# LANGUAGE OverloadedStrings #-}

module Web.CSS
    ( layoutCss
    ) where

import Clay
import Data.Text.Lazy (Text)

layoutCss :: Text
layoutCss = render $ do
  element ".badge" ? do
    marginLeft $ px 1
    marginRight $ px 1
  element "#app" ? do
    marginTop $ px 10
