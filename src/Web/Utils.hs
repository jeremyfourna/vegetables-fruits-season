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