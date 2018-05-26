module Main where

import Lib (foods, foodName, home, login, monthName, post)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import Web.Scotty (middleware, scotty)

main :: IO ()
main = scotty 3000 $ do
  middleware logStdoutDev
  foods >> foodName >> home >> login >> monthName >> post
