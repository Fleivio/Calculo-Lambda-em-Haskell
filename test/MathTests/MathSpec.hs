module MathTests.MathSpec (spec) where

import Test.Hspec

import Lambda.Evaluator
import Lambda.Lambda
import Lambda.BaseTypes

type MathTest = (Term, VarTable, Term)

mathTest :: MathTest
mathTest = ( (Op (Number 2) Add (Number 3) ), [], Number 5)

runMathTest :: MathTest -> IO ()
runMathTest (x, vt, y) = let x' = evalTerm x vt
                             y' = evalTerm y vt
                         in x' `shouldBe` y'

myTests :: [MathTest]
myTests = [( Op (Number 3) Eq (Number 2) , [], lFalse),
        ( Op (Boolean False) Xor (Boolean True), [], Boolean True)]

runMultipleTests :: [MathTest] -> IO ()
runMultipleTests [] = return ()
runMultipleTests (x:xs) = do
    runMathTest x
    runMultipleTests xs

spec :: Spec
spec = do
    describe "Math tests" $ do
        it "should evaluate math expressions" $ do
            runMultipleTests myTests
