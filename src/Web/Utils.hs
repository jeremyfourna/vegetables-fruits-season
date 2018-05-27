module Web.Utils
  ( blaze
  , currentDate
  , pet
  ) where

import Data.Time.Clock (getCurrentTime, utctDay)
import Data.Time.Calendar (toGregorian)
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 (Html)
import Text.Blaze.Internal (preEscapedText)
import Web.Scotty (ActionM, html)

pet = preEscapedText

blaze :: Html -> ActionM ()
blaze = html . renderHtml

currentDate :: IO (Integer, Int, Int) -- :: (year,month,day)
currentDate = getCurrentTime >>= return . toGregorian . utctDay

getSnd :: (a, b, c) -> b
getSnd (year, month, day) = month

getFst :: (a, b, c) -> a
getFst (year, month, day) = year

getTrd :: (a, b, c) -> c
getTrd (year, month, day) = day

getMonth = do
  date <- currentDate
  getSnd date