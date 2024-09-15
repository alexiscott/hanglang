module Main where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Lib

main :: IO ()
main = do
  TIO.putStrLn (T.pack "Αλεχ")
