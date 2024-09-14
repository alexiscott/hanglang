import qualified Data.Text as T

import Test.Hspec
import Test.Tasty
import Test.Tasty.Hspec

import Lib

main :: IO ()
main = do
  tree <- testSpec "hspec tests" hspecSuite
  defaultMain tree

-- TODO rename guess test variable to not conflict with function name.
-- TODO make utf8 tests more basic.

hspecSuite :: Spec
hspecSuite = do
  describe "Matches words" $ do
    let guess = charCheck (T.pack "ball")
    it "Is either a char or an underscore" $ do
      charCheck  (T.pack "ball" ) 'z' `shouldBe` '_'
      charCheck  (T.pack "ball" ) 'a' `shouldBe` 'a'

    it "Preloads a word first." $ do
      guess 'a' `shouldBe` 'a'
      guess 'z' `shouldBe` '_'

    it "Constructs a complete text element" $ do
      T.map guess (T.pack "fall") `shouldBe` (T.pack "_all")
      T.map guess (T.pack "zzzz") `shouldBe` (T.pack "____")
      T.map guess (T.pack "ball") `shouldBe` (T.pack "ball")

    it "Works with UTF8" $ do
     T.map (charCheck ((T.pack "αλεχ"))) (T.pack "αλεχ") `shouldBe` (T.pack "αλεχ")

  describe "Solves guesses" $ do
    let guess = charCheck (T.pack "ball")
    it "Compares a guess and a solution" $ do
      solve (T.pack "guess") (T.pack "guess") `shouldBe` True
      solve (T.map guess (T.pack "ball")) (T.pack "ball") `shouldBe` True
      solve (T.map guess (T.pack "bal")) (T.pack "guess") `shouldBe` False
