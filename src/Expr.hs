module Expr(Expr (..), VarTable, evalExpr) where

import Converter
import Lambda.Lambda

import Data.List (find)

type VarName = String

data Expr = 
          Number Int
        | Sum Expr Expr
        | Sub Expr Expr
        | Mult Expr Expr
        | Pow Expr Expr
        | Def VarName
        | Let VarName Expr Expr
        deriving (Show, Eq)

type VarTable = [(VarName, Expr)]

exprToTerm :: Expr -> VarTable -> Maybe Term
exprToTerm (Number n) _  = return $ numToTerm n
exprToTerm (Sum a b)  vt = evalThenApply a b sumToTerm vt
exprToTerm (Sub a b)  vt = evalThenApply a b subToTerm vt 
exprToTerm (Mult a b) vt = evalThenApply a b multToTerm vt 
exprToTerm (Pow a b)  vt = evalThenApply a b powToTerm vt
exprToTerm (Def name) vt = (lookupVar name vt) >>= \e -> exprToTerm e vt
exprToTerm (Let name e1 e2) vt = do
  let nvt = (name, e1):vt
  exprToTerm e2 nvt 

lookupVar :: VarName -> VarTable -> Maybe Expr
lookupVar name vt = fmap snd $ find (\(n, _) -> n == name) vt

evalThenApply :: Expr -> Expr -> (Term -> Term -> Term) -> VarTable -> Maybe Term
evalThenApply a b f vt = do
    a' <- exprToTerm a vt
    b' <- exprToTerm b vt
    return $ f a' b'

evalExpr :: Expr -> VarTable -> Maybe Int
evalExpr expr vt = (exprToTerm expr vt) >>= (Just . evalTerm) >>= termToNum