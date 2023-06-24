module Lambda.Interpreter(evalTerm, Term(..), evalTS, VarTable ) where

import Lambda.Lambda
import Lambda.BaseTypes
import Lambda.Converter

needTransform :: Term -> Bool
needTransform t = case t of
    (Number _)  -> True
    (Boolean _) -> True
    (Def _)     -> True
    (Op _ _ _)  -> True
    (UnOp _ _)  -> True
    _           -> False

evalRun :: Term -> VarTable -> Term
evalRun (App (Abs a) b) _ | not (needTransform b) = betaReduct b a
evalRun (App (Lam (x:xs) e1) e2) _ =
                                    let body = evalTerm e1 [(x, e2)]
                                    in case xs of
                                        [] -> body
                                        _  -> Lam xs body
evalRun (App a b)       vt = App (evalTerm a vt) (evalTerm b vt)
evalRun (Abs a)         vt = Abs (evalTerm a vt)
evalRun (Def s)         vt = defToTerm s vt
evalRun (Number n)      _  = numToTerm n
evalRun (Boolean b)     _  = boolToTerm b
evalRun (Op t1 op t2)   vt = opToTerm op (evalTerm t1 vt) (evalTerm t2 vt)
evalRun (UnOp op t1)    vt = unOpToTerm op (evalTerm t1 vt)
evalRun (If cond a b)   vt = evalTerm (App ( App (App lIf (evalTerm cond vt)) a) b) vt
evalRun (Let vt1 t)     vt = evalTerm t (vt1++vt)
evalRun t _ = t

evalTerm :: Term -> VarTable -> Term
evalTerm x vt
    | x == y = x
    | otherwise = evalTerm y vt
    where y = evalRun x vt

evalTS :: Term -> Term 
evalTS t = evalTerm t []