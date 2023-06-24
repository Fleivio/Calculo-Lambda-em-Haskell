module Runner(run, runVt, runPrint) where

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

runPrint :: String -> IO (Evaluation String)
runPrint x = do
    let tokens = lxRun x
    print tokens
    let term = tokens >>= pure . parse 
    print term
    let evaluated = term >>= return . evalTS
    print evaluated
    return $ Ok . show $ evaluated

runVt :: String -> VarTable -> Evaluation String
runVt x vt = do
    tokens <- lxRun x
    let term = parse tokens
        evaluated = evalTerm term vt
    Ok . show $ evaluated