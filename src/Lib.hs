module Lib where

import qualified Data.Text as T
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

getWords :: String -> [T.Text]
getWords lang 
  | lang == "EN" = enWords
  | lang == "GR" = grWords
  | otherwise = enWords

getRandomWord :: String -> IO T.Text
getRandomWord lang = do
  let dict = getWords lang
  pos <- randomRIO (1, (length dict))
  let word = dict !! (pos - 1)
  return word
