{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Data.Monoid ((<>))
import Data.Aeson (FromJSON, ToJSON)
import Data.Text (Text)
import GHC.Generics
import Web.Scotty (scotty, get, text, json, param)
import Web.Cuid (newCuid)

data User = User
  { userId :: Text
  , userName :: String
  } deriving (Show, Generic)
instance ToJSON User
instance FromJSON User

bob :: User
bob = User {
  userId = newCuid,
  userName = "bob"
}

jenny :: User
jenny = User {
  userId = newCuid,
  userName = "jenny"
}

allUsers :: [User]
allUsers = [bob, jenny]

matchesId :: Text -> User -> Bool
matchesId id user = userId user == id

main = do
  putStrLn "Starting Server..."
  scotty 3000 $ do
    get "/hello/:name" $ do
        name <- param "name"
        text ("hello " <> name <> "!")

    get "/users" $ do
      json allUsers

    get "/users/:id" $ do
      id <- param "id"
      json (filter (matchesId id) allUsers)

