{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Data.Monoid ((<>))
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Web.Scotty (scotty, get, text, json, param)

data Food = Food
  { foodName :: String
  , foodCategory :: String
  , foodAvailability :: [String]
  } deriving (Show, Generic)
instance ToJSON Food
instance FromJSON Food

banane :: Food
banane = Food {
  foodName = "Banane",
  foodCategory = "Fruit",
  foodAvailability = ["Mai", "Juin"]
}

allFoods :: [Food]
allFoods = [banane]

matchesName :: String -> Food -> Bool
matchesName name food = foodName food == name

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

