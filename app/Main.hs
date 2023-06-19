module Main (main) where

import Expr

test :: Expr
test = Op Mult (Op Sum (Number 3) (Def "func")) (Number 10)

vart :: VarTable
vart = [("func", Let "x" (Number 3) (Op Pow (Number 2) (Def "x")))]

main :: IO ()
main = print $ evalExpr test vart
