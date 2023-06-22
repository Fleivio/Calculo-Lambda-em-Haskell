module Main (main) where

import Lambda.Lambda
import Lambda.Evaluator

test :: Term
test = Op (Number 1) Eq (Number 2)

vart :: VarTable
vart = [("soma", Lam ["x", "y"] (Op (Def "x") Add (Def "y")))]

main :: IO ()
main = print $ evalTerm test vart
