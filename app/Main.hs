module Main where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Lib
import System.IO

main :: IO ()
main = do
  word <- getRandomWord
  TIO.putStrLn (T.pack "Guess a word that has been randomly selected in LA\n")
  play word

sGetLine :: IO T.Text
sGetLine = do
  x <- getChNoEcho
  if (x == '\n')
    then do
      putChar x
      return (T.pack "")
    else do
      putChar '-'
      xs <- sGetLine
      return (T.cons x xs)

getChNoEcho :: IO Char
getChNoEcho = do
  hSetEcho stdin False -- No echo, when typing.
  x <- getChar
  hSetEcho stdin True
  return x

play :: T.Text -> IO ()
play word = do
  TIO.putStrLn (T.pack "? ")
  guess <- sGetLine
  if guess == word
    then
      TIO.putStrLn (T.pack "You got it!!")
    else do
       TIO.putStrLn $ (T.pack "Your guess results in: ") <> (match guess word)
       play word
