module Lambda.Evaluator(evalTerm, Term(..), termToInt) where

import Lambda.Lambda
import Lambda.BaseTypes


numToTerm :: Int -> Term
numToTerm 0 = lZero
numToTerm n = App lSucc (numToTerm (n-1))

boolToTerm :: Bool -> Term
boolToTerm True  = lTrue
boolToTerm False = lFalse

opToTerm :: Op -> Term -> Term -> Term 
opToTerm op a b = case op of
    Add  -> appOpTerm lSum a b
    Sub  -> appOpTerm lSub a b
    Mul  -> appOpTerm lMult a b
    Pow  -> appOpTerm lPow a b
    Or   -> appOpTerm lOr a b
    And  -> appOpTerm lAnd a b
    Eq   -> appOpTerm lEqual a b
    Diff -> UnOp Not (appOpTerm lEqual a b) 

unOpToTerm :: UnOp -> Term -> Term
unOpToTerm op a = case op of
    Not    -> appUnOpTerm lNot a
    Succ   -> appUnOpTerm lSucc a
    Pred   -> appUnOpTerm lPred a
    IsZero -> appUnOpTerm lIsZro a

needTransform :: Term -> Bool
needTransform t = case t of
    (Number _)  -> True
    (Boolean _) -> True
    (Def _)     -> True
    (Op _ _ _)  -> True
    (UnOp _ _)  -> True
    _           -> False

termToInt :: Term -> Maybe Int
termToInt (Number n) = return n
termToInt x 
    | x == lZero = Just 0
    | x == lOne || x == lId = Just 1 
termToInt (App (Var 1) (Var 0)) = Just 1
termToInt (App (Var 1) b)       = termToInt b >>= \x -> Just (x+1)
termToInt (Abs (Abs t))         = termToInt t
termToInt _ = Nothing

evalRun :: Term -> VarTable -> Term
evalRun (App (Abs a) b) _ | not (needTransform b) = betaReduct b a
evalRun (App (Lam (x:xs) e1) e2) _ =
                                    let body = evalRun e1 [(x, e2)]
                                    in case xs of
                                        [] -> body
                                        _  -> Lam xs body
evalRun (App a b)       vt = App (evalRun a vt) (evalRun b vt)
evalRun (Abs a)         vt = Abs (evalRun a vt)
evalRun (Lam xs t)      vt = Lam xs (evalRun t vt)
evalRun (Def s)         vt = defToTerm s vt
evalRun (Number n)      _  = numToTerm n
evalRun (Boolean b)     _  = boolToTerm b
evalRun (Op t1 op t2)   vt = opToTerm op (evalRun t1 vt) (evalRun t2 vt)
evalRun (UnOp op t1)    vt = unOpToTerm op (evalRun t1 vt)
evalRun t _ = t

evalTerm :: Term -> VarTable -> Term
evalTerm x vt
    | x == y = x
    | otherwise = evalTerm y vt
    where y = evalRun x vt