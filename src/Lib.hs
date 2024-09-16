module Lib where

import qualified Data.Text as T

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


