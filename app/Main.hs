module Main (main) where

import Lexer.Lexer
import Lambda.Interpreter
import Lambda.Lambda
import Parser

vt = [("sum", Lam ["x"] (Op (Number 1) Add (Def "x")))]

main :: IO ()
main = do
    let tokens = lxRun  "sum1 2" 
    if tokens == Nothing then putStrLn "Error" 
    else print $ tokens >>= Just . parse >>= (\x -> Just $ evalTerm x vt)
