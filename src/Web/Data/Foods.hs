{-# LANGUAGE DeriveGeneric #-}

module Web.Data.Foods where

import GHC.Generics

data Food = Food
  { foodName :: String
  , foodCategory :: String
  , foodAvailability :: [Month]
  } deriving (Show, Generic)

matchesName :: String -> Food -> Bool
matchesName name food = foodName food == name

data Month = Month
  { monthName :: String
  , monthIndex :: Int
  } deriving (Show, Generic)

matchesMonth :: String -> Food -> Bool
matchesMonth name food = any (\x -> monthName x == name) (foodAvailability food)

january :: Month
january = Month {
  monthName = "Janvier",
  monthIndex = 1
}

february :: Month
february = Month {
  monthName = "Février",
  monthIndex = 2
}

march :: Month
march = Month {
  monthName = "Mars",
  monthIndex = 3
}

april :: Month
april = Month {
  monthName = "Avril",
  monthIndex = 4
}

may :: Month
may = Month {
  monthName = "Mai",
  monthIndex = 5
}

vegetables :: [Food]
vegetables =
  [ Food { foodName = "Ail",                  foodCategory = "Vegetables", foodAvailability = [january] }
  , Food { foodName = "Artichaut",            foodCategory = "Vegetables", foodAvailability = [march, april, may] }
  , Food { foodName = "Asperge blanche",      foodCategory = "Vegetables", foodAvailability = [april, may] }
  , Food { foodName = "Asperge verte",        foodCategory = "Vegetables", foodAvailability = [may] }
  , Food { foodName = "Aubergine",            foodCategory = "Vegetables", foodAvailability = [may] }
  , Food { foodName = "Avocat",               foodCategory = "Vegetables", foodAvailability = [january, february, march] }
  , Food { foodName = "Batavia",              foodCategory = "Vegetables", foodAvailability = [april, may] }
  , Food { foodName = "Betterave rouge",      foodCategory = "Vegetables", foodAvailability = [may] }
  , Food { foodName = "Blette",               foodCategory = "Vegetables", foodAvailability = [april, may] }
  , Food { foodName = "Brocoli",              foodCategory = "Vegetables", foodAvailability = [january, february, march] }
  , Food { foodName = "Carotte",              foodCategory = "Vegetables", foodAvailability = [january, february, march, april, may] }
  , Food { foodName = "Céleri",               foodCategory = "Vegetables", foodAvailability = [january, february, march, april, may] }
  , Food { foodName = "Champignon de Paris",  foodCategory = "Vegetables", foodAvailability = [january, february, march, april, may] }
  , Food { foodName = "Chicorée frisée",      foodCategory = "Vegetables", foodAvailability = [january, february, march] }
  , Food { foodName = "Chou blanc",           foodCategory = "Vegetables", foodAvailability = [january, february, march, april, may] }
  , Food { foodName = "Chou de Bruxelles",    foodCategory = "Vegetables", foodAvailability = [january] }
  , Food { foodName = "Chou-fleur",           foodCategory = "Vegetables", foodAvailability = [january, february, may] }
  , Food { foodName = "Chou rouge",           foodCategory = "Vegetables", foodAvailability = [january, february, march, april, may] }
  , Food { foodName = "Chou vert",            foodCategory = "Vegetables", foodAvailability = [january, february] }
  , Food { foodName = "Concombre",            foodCategory = "Vegetables", foodAvailability = [may] }
  , Food { foodName = "Cresson",              foodCategory = "Vegetables", foodAvailability = [january, february, march, april, may] }
  , Food { foodName = "Crosne",               foodCategory = "Vegetables", foodAvailability = [january, february, march] }
  , Food { foodName = "Endive",               foodCategory = "Vegetables", foodAvailability = [january, february, march] }
  , Food { foodName = "Epinards",             foodCategory = "Vegetables", foodAvailability = [april, may] }
  , Food { foodName = "Fenouil",              foodCategory = "Vegetables", foodAvailability = [may] }
  , Food { foodName = "Fève",                 foodCategory = "Vegetables", foodAvailability = [april, may] }
  , Food { foodName = "Kale",                 foodCategory = "Vegetables", foodAvailability = [january, february, march, april] }
  , Food { foodName = "Laitue",               foodCategory = "Vegetables", foodAvailability = [april, may] }
  , Food { foodName = "Mâche",                foodCategory = "Vegetables", foodAvailability = [january, february] }
  , Food { foodName = "Oignon",               foodCategory = "Vegetables", foodAvailability = [january] }
  , Food { foodName = "Oseille",              foodCategory = "Vegetables", foodAvailability = [may] }
  , Food { foodName = "Pak choï",             foodCategory = "Vegetables", foodAvailability = [january] }
  , Food { foodName = "Patate douce",         foodCategory = "Vegetables", foodAvailability = [january, february, march, april, may] }
  , Food { foodName = "Poireau",              foodCategory = "Vegetables", foodAvailability = [january, february, march] }
  , Food { foodName = "Pomme de terre",       foodCategory = "Vegetables", foodAvailability = [january, february, march, april, may] }
  , Food { foodName = "Potiron",              foodCategory = "Vegetables", foodAvailability = [january, february] }
  , Food { foodName = "Radis",                foodCategory = "Vegetables", foodAvailability = [april, may] }
  , Food { foodName = "Radis noir",           foodCategory = "Vegetables", foodAvailability = [january, february] }
  , Food { foodName = "Radis rose",           foodCategory = "Vegetables", foodAvailability = [march] }
  , Food { foodName = "Rutabaga",             foodCategory = "Vegetables", foodAvailability = [january] }
  , Food { foodName = "Salsifis",             foodCategory = "Vegetables", foodAvailability = [january, february, march] }
  , Food { foodName = "Topinambour",          foodCategory = "Vegetables", foodAvailability = [january, february] }
  ]