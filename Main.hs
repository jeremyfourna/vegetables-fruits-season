{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Data.Monoid ((<>))
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Web.Scotty (scotty, get, text, json, param)
import Foods (vegetables, matchesName, matchesMonth, Food, Month)

instance ToJSON Food
instance FromJSON Food
instance ToJSON Month
instance FromJSON Month

allFoods :: [Food]
allFoods = vegetables

main = do
  putStrLn "Starting Server..."
  scotty 3000 $ do
    get "/hello/:name" $ do
        name <- param "name"
        text ("hello " <> name <> "!")

    get "/foods" $ do
      json allFoods

    get "/foods/:name" $ do
      name <- param "name"
      json (filter (matchesName name) allFoods)

    get "/month/:name" $ do
      name <- param "name"
      json (filter (matchesMonth name) allFoods)

