module Expr(Expr (..), VarTable, evalExpr, MathOp (..)) where

import Converter
import Lambda.Lambda

import Data.List (find)

type VarName = String

data MathOp = Sum | Sub | Mult | Pow deriving (Show, Eq)

data Expr =
          Term Term 
        | Number Int
        | Op MathOp Expr Expr
        | Def VarName
        | Let VarName Expr Expr
        | Lamb [VarName] Expr
        | Apply Expr Expr
        deriving (Show, Eq)

type VarTable = [(VarName, Expr)]

data Evaluated a = Valid a | Error String deriving (Show, Eq)

instance Functor Evaluated where
  fmap f (Valid e) = Valid $ f e
  fmap _ (Error s) = Error s

instance Applicative Evaluated where
  pure = Valid
  (Valid f) <*> (Valid e) = Valid $ f e
  (Error s) <*> (Error t) = Error (s ++ " && " ++ t)
  (Error s) <*> _ = Error s
  _ <*> (Error s) = Error s  

instance Monad Evaluated where
  return = pure
  (Valid e) >>= f = f e
  (Error s) >>= _ = Error s

instance MonadFail Evaluated where
  fail = Error 

evalExpr :: Expr -> VarTable -> Evaluated Expr
evalExpr (Term t)                        _  = return $ Term (evalTerm t)
evalExpr (Number n)                      _  = return $ Term (evalTerm ( numToTerm n ))
evalExpr (Op op a b)                     vt = evalMathOp op a b vt
evalExpr (Def name)                      vt = (lookupVar name vt) >>= \e -> evalExpr e vt
evalExpr (Let name e1 e2)                vt = evalExpr e2 $ (name, e1):vt
evalExpr (Apply (Def name) e2)           vt = do
                                                e1 <- (lookupVar name vt)
                                                evalExpr (Apply e1 e2) vt
evalExpr (Apply (Lamb (a : args) e1) e2) vt = do
                                                body <- (lambApply e1 a e2 vt)
                                                case args of
                                                  [] -> return body
                                                  _  -> return $ Lamb args body
evalExpr (Apply f1 e2)                   vt = evalExpr f1 vt >>= \f -> evalExpr (Apply f e2) vt
evalExpr a _ = Error $ "Invalid Expression: " ++ show a

lambApply :: Expr -> VarName -> Expr -> VarTable -> Evaluated Expr
lambApply e1 name e2 vt = do
  e2' <- evalExpr e2 vt
  e1' <- evalExpr e1 ((name, e2'):vt)
  return e1'

evalMathOp :: MathOp -> Expr -> Expr -> VarTable -> Evaluated Expr
evalMathOp op a b vt = case op of
                Sum  -> evalThenApply a b sumToTerm vt
                Sub  -> evalThenApply a b subToTerm vt
                Mult -> evalThenApply a b multToTerm vt
                Pow  -> evalThenApply a b powToTerm vt

lookupVar :: VarName -> VarTable -> Evaluated Expr
lookupVar name vt = case value of
    Nothing -> Error $ "Var Not Found " ++ name
    Just e  -> return e
  where value = fmap snd $ find (\(n, _) -> n == name) vt

evalThenApply :: Expr -> Expr -> (Term -> Term -> Term) -> VarTable -> Evaluated Expr
evalThenApply a b f vt = do
    (Term a') <- evalExpr a vt
    (Term b') <- evalExpr b vt
    return . Term $ evalTerm $ f a' b'
