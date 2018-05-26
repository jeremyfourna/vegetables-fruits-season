{-# LANGUAGE OverloadedStrings #-}

module Web.CSS
    ( layoutCss
    ) where

import Clay
import Data.Text.Lazy (Text)

layoutCss :: Text
layoutCss = render $ do
  body ? paddingTop (px 70)
  element ".jumbotron" ? (textAlign $ alignSide sideCenter)
  element "#gmail" ? (marginLeft $ px 10)
