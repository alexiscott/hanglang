module Lib where

import qualified Data.Text as T


charCheck :: T.Text -> Char -> Char
charCheck text c
  | T.elem c text = c
  | otherwise = '_'

solve :: T.Text -> T.Text -> Bool
solve guess solution
  | guess == solution = True
  | otherwise = False


