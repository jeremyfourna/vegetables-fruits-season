module Main where

import Lib (foods, home, login, monthName, post, searchFoodName)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import Web.Scotty (middleware, scotty)

main :: IO ()
main = scotty 3000 $ do
  middleware logStdoutDev
  searchFoodName >> foods >> home >> login >> monthName >> post
