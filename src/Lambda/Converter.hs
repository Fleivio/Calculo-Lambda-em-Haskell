module Lambda.Converter(numToTerm, boolToTerm, opToTerm, unOpToTerm, termToInt, termToBool) where 

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
    Xor  -> App (App a (UnOp Not b)) b
    Eq   -> appOpTerm lEqual a b
    Diff -> UnOp Not (appOpTerm lEqual a b) 

unOpToTerm :: UnOp -> Term -> Term
unOpToTerm op a = case op of
    Not    -> appUnOpTerm lNot a
    Succ   -> appUnOpTerm lSucc a
    Pred   -> appUnOpTerm lPred a
    IsZero -> appUnOpTerm lIsZro a


termToInt :: Term -> Maybe Int
termToInt (Number n) = return n
termToInt x 
    | x == lZero = Just 0
    | x == lOne || x == lId = Just 1 
termToInt (App (Var 1) (Var 0)) = Just 1
termToInt (App (Var 1) b)       = termToInt b >>= \x -> Just (x+1)
termToInt (Abs (Abs t))         = termToInt t
termToInt _ = Nothing

termToBool :: Term -> Maybe Bool
termToBool (Boolean b) = return b
termToBool x 
    | x == lTrue  = Just True
    | x == lFalse = Just False
termToBool _ = Nothing