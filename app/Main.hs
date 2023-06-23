module Main (main) where

import Lambda.Lambda
import Lambda.Evaluator
import Lambda.BaseTypes

test :: Term
test = Op (Number 2) Eq (Number 1)

vart :: VarTable
vart = [("if", Lam ["cond", "x", "y"] (App ( App ( App lIf (Def "cond") ) (Def "x") ) (Def "y"))),
        ("test", Lam ["x"] (If (Op (Number 2) Eq (Number 2)) (Def "x") (Number 0)) )]

main :: IO ()
main = (print test) >> print (evalTerm test vart)
