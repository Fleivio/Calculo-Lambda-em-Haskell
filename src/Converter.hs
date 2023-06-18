module Converter (termToNum, sumToTerm, subToTerm, multToTerm, powToTerm, numToTerm) where

import Lambda.Lambda
import Lambda.BaseTypes

numToTerm :: Int -> Term
numToTerm 0 = lZero
numToTerm n = App lSucc (numToTerm (n-1))

opToTerm :: Term -> Term -> Term -> Term
opToTerm t a b = App (App t a) b

sumToTerm :: Term -> Term -> Term
sumToTerm = opToTerm lSum

subToTerm :: Term -> Term -> Term
subToTerm = opToTerm lSum

multToTerm :: Term -> Term -> Term
multToTerm = opToTerm lMult

powToTerm :: Term -> Term -> Term
powToTerm = opToTerm lPow

appToTerm :: Term -> Term -> Term 
appToTerm = App

termToNum :: Term -> Maybe Int
termToNum x 
    | x == lZero = Just 0
    | x == lOne || x == lId = Just 1
termToNum (App (Var 1) (Var 0)) = Just 1
termToNum (App a b) = termToNum b >>= (\x -> Just (x+1))
termToNum (Abs (Abs (App a b))) = termToNum b >>= (\x -> Just (x+1)) 
termToNum _ = Nothing