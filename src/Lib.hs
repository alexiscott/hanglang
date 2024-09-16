module Lib where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import System.Random (randomRIO)

charCheck :: T.Text -> Char -> Char
charCheck txt c
  | T.elem c txt = c
  | otherwise = '_'

match :: T.Text -> T.Text -> T.Text
match guess solution = T.map (charCheck guess) solution 

solve :: T.Text -> T.Text -> Bool
solve guess solution
  | guess == solution = True
  | otherwise = False

enWords :: [T.Text]
enWords = [(T.pack "apple"), (T.pack "orange"), (T.pack "lime")]

grWords :: [T.Text]
grWords = [(T.pack "μηλο"), (T.pack "πορτοκαλι"), (T.pack "λαιμ")]

getRandomWord ::IO T.Text
getRandomWord = do
  pos <- randomRIO (1, (length enWords))
  let word = grWords !! (pos - 1)
  return word
