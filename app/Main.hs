module Main (main) where

import Lambda.Lambda
import Lambda.Evaluator

test :: Term
test = Op (Number 2) Diff (App (Def "sum 2") (Number 1))

vart :: VarTable
vart = [("sum 2", Lam ["x"] (Op (Def "x") Add (Number 2)))]

main :: IO ()
main = (print test) >> print (evalTerm test vart)
