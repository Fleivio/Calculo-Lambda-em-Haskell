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

-- data EvaluatedExpr = Expr Expr | Error String deriving (Show, Eq)

-- instance Functor EvaluatedExpr where
--   fmap f (Expr e) = Expr $ f e
--   fmap _ (Error s) = Error s

-- instance Applicative EvaluatedExpr where
--   pure = Expr
--   (Expr f) <*> (Expr e) = Expr $ f e
--   (Error s) <*> (Error t) = Error (s ++ " && " ++ t)
--   (Error s) <*> _ = Error s
--   _ <*> (Error s) = Error s  

-- instance Monad EvaluatedExpr where
--   return = pure
--   (Expr e) >>= f = f e
--   (Error s) >>= _ = Error s

exprToTerm :: Expr -> VarTable -> Maybe Expr
exprToTerm (Term t)         _  = return $ Term (evalTerm t)
exprToTerm (Number n)       _  = return $ Term (evalTerm ( numToTerm n ))
exprToTerm (Op op a b)      vt = evalMathOp op a b vt
exprToTerm (Def name)       vt = (lookupVar name vt) >>= \e -> exprToTerm e vt
exprToTerm (Let name e1 e2) vt = exprToTerm e2 $ (name, e1):vt

evalMathOp :: MathOp -> Expr -> Expr -> VarTable -> Maybe Expr
evalMathOp op a b vt = res >>= (return . Term)
  where res = case op of 
                Sum  -> evalThenApply a b sumToTerm vt
                Sub  -> evalThenApply a b subToTerm vt
                Mult -> evalThenApply a b multToTerm vt
                Pow  -> evalThenApply a b powToTerm vt

lookupVar :: VarName -> VarTable -> Maybe Expr
lookupVar name vt = fmap snd $ find (\(n, _) -> n == name) vt

-- substVarExpr :: Expr -> VarName -> Expr -> Expr 
-- substVarExpr (Def name) _ n e =
--   | n == name = e
--   | otherwise = Def name
-- substVarExpr (Op f a b) = Op f (substVarExpr a) (substVarExpr b)
-- substVarExpr (Let name e1 e2) = Let name (substVarExpr e1) (substVarExpr e2)
-- substVarExpr (Lamb args e) = Lamb args (substVarExpr e)
-- substVarExpr total _ _ = total


evalThenApply :: Expr -> Expr -> (Term -> Term -> Term) -> VarTable -> Maybe Term
evalThenApply a b f vt = do
    (Term a') <- exprToTerm a vt
    (Term b') <- exprToTerm b vt
    return $ evalTerm $ f a' b'

evalExpr :: Expr -> VarTable -> Maybe Expr
evalExpr expr vt =  evaltd >>= \e -> case e of
                                      Term t -> case termToNum t of
                                                  Just n -> return $ Number n
                                                  Nothing -> return e
                                      _ -> return e
  where
    evaltd = exprToTerm expr vt