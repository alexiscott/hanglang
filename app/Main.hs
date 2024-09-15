module Main where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Lib
import System.IO

main :: IO ()
main = do
  TIO.putStrLn (T.pack "Think of a word:")
  word <- TIO.getLine
  TIO.putStrLn word


sGetLine :: IO String
sGetLine = do
  x <- getChNoEcho
  if (x == 'n')
    then do
      putChar x
      return []
    else do
      putChar '-'
      xs <- sGetLine
      return (x : xs)

getChNoEcho :: IO Char
getChNoEcho = do
  hSetEcho stdin False -- No echo, when typing.
  x <- getChar
  hSetEcho stdin True
  return x
