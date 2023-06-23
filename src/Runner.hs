module Runner(run, runVt) where

import Lexer.Lexer
import Parser.Parser
import Lambda.Interpreter
import Error.Evaluation

run :: String -> Evaluation String
run x = do
    tokens <- lxRun x
    let term = parse tokens
        evaluated = evalTS term
    Ok . show $ evaluated

runVt :: String -> VarTable -> Evaluation String
runVt x vt = do
    tokens <- lxRun x
    let term = parse tokens
        evaluated = evalTerm term vt
    Ok . show $ evaluated