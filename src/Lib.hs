{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Lib
  ( foods
  , foodName
  , home
  , login
  , monthName
  , post
  ) where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Web.Home (homePage)
import Web.Data.Foods (vegetables, matchesName, matchesMonth, Food, Month)
import Web.Scotty (ScottyM, get, html, json, param)

instance ToJSON Food
instance FromJSON Food
instance ToJSON Month
instance FromJSON Month

allFoods :: [Food]
allFoods = vegetables

home :: ScottyM ()
home = get "/" homePage

login :: ScottyM ()
login = get "/login" $ html "login"

{-
  Example data structure to demonstrate JSON serialization
-}
data Post = Post
  { postId    :: Int
  , postTitle :: String
  } deriving Generic

instance ToJSON Post

post :: ScottyM()
post = get "/post" $ json $ Post 1 "Yello world"


foods :: ScottyM()
foods = get "/foods" $ json allFoods

foodName :: ScottyM()
foodName = get "/foods/:name" $ do
  name <- param "name"
  json (filter (matchesName name) allFoods)

monthName :: ScottyM()
monthName = get "/month/:name" $ do
  name <- param "name"
  json (filter (matchesMonth name) allFoods)