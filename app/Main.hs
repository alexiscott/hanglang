module Main where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Lib
import System.IO

main :: IO ()
main = do
  TIO.putStrLn (T.pack "Think of a word:")
  word <- sGetLine
  TIO.putStrLn word
--  play word

sGetLine :: IO T.Text
sGetLine = do
  x <- getChNoEcho
  if (x == 'n')
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

-- match word guess = (T.pack "_____")
-- match word guess =
--   charCheck guess word' `shouldBe` '_'

-- play :: T.Text -> IO ()
-- play word = do
--   TIO.putStrLn (T.pack "? ")
--   guess <- sGetLine
--   if guess == (T.pack word)
--     then
--       TIO.putStrLn (T.pack "You got it!!")
--      else do
--        --let matchedWord (T.pack "matched_word")
--        TIO.putStrLn (T.pack "__match")
--        play word
