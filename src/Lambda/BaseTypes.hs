module Lambda.BaseTypes (lFalse, lTrue, lAnd, lOr, lIf, lNot, lId,
                       lPair, lFst, lLst,
                       lIsZro, lEqual, lPred, lSucc,
                       lSum, lMult, lPow,  lSub, 
                       lZero, lOne, lTwo, lThree,
                       runTests, singleTest) where

import Lambda.Lambda ( Term(..), evalTerm )

lId ::Term
lId = Abs (Var 0)

lFalse :: Term
lFalse = Abs ( -- 1
            Abs -- 0 
            (Var 0))

lTrue :: Term
lTrue = Abs (
            Abs
            (Var 1)
        )

lLst :: Term
lLst = Abs (
        App (Var 0) lFalse
    )

lFst :: Term
lFst = Abs (
        App (Var 0) lTrue
    )

lIf :: Term
lIf = Abs ( -- 2
        Abs ( -- 1
            Abs -- 0
                (App (App (Var 2) (Var 1)) (Var 0))
        )
    )

lNot :: Term
lNot = Abs -- 0
            ( App (App (App lIf (Var 0) ) lFalse) lTrue )


lAnd :: Term
lAnd = Abs ( -- 1
            Abs ( -- 0
                App ( App ( App lIf (Var 0) ) (Var 1) ) lFalse
            )
        )

lOr :: Term
lOr = Abs (  -- 1
        Abs ( -- 0
            App (App ( App lIf (Var 0) ) lTrue) (Var 1)
        )
    )

lZero :: Term
lZero = lFalse

lOne :: Term
lOne = Abs ( -- f
        Abs ( -- z
            App (Var 1) (Var 0)
        )
    )

lTwo :: Term
lTwo = Abs (
        Abs (
            App (Var 1) (App (Var 1) (Var 0))
        )
    )

lThree :: Term
lThree = Abs (
        Abs (
            App (Var 1) ( App (Var 1) (App (Var 1) (Var 0)))
        )
    )

lSum :: Term
lSum = Abs ( --3 n2
        Abs ( --2 n1
            Abs ( --1 succ
                Abs ( --0 zero
                    App
                    (App (Var 3) (Var 1))
                    (App (App (Var 2) (Var 1)) (Var 0))
                )
            )
        )
    )

lSucc :: Term
lSucc = Abs ( -- 2 n
            Abs ( -- 1 s
                Abs ( -- 0 z
                    App (Var 1) (App (App (Var 2) (Var 1)) (Var 0))
                )
            ) 
    )

lPair :: Term
lPair = Abs (
        Abs (
            Abs (
                App (App (Var 0) (Var 2)) (Var 1) 
            )
        )
    )

lMult :: Term
lMult = Abs (
        Abs (
            Abs (
                App (Var 2) (App (Var 1) (Var 0))
            )
        )
    )

lPow :: Term
lPow = Abs ( -- f
        Abs ( -- z
            App (Var 1) (Var 0)
        )
    )

_zz :: Term 
_zz = App (App lPair lZero) lZero

_ss :: Term
_ss = Abs ( App 
                (App lPair (App lLst (Var 0)))
                (App lSucc (App lLst (Var 0) ))
        )

lPred :: Term
lPred = Abs (
            App lFst (App (App (Var 0) _ss) _zz) 
    )

lSub :: Term
lSub = Abs (
        Abs (
            App (App (Var 0) lPred) (Var 1) 
        )
    )

lIsZro :: Term
lIsZro = Abs (
        App (App (Var 0) (Abs lFalse)) lTrue
    )


lEqual :: Term
lEqual = Abs (
        Abs(
            App lIsZro (App (App lSub (Var 0)) (Var 1))
        )
    )

tests :: [(Term, Term)]
tests = [
    (App (App lMult lOne) lOne, lOne),
    (App (App lMult lOne) lTwo, lTwo),
    (App (App lMult lOne) lTwo, App (App lMult lTwo) lOne),
    (App (App lMult lZero) lOne, lZero),
    (App lIsZro lZero, lTrue),
    (App lIsZro lOne, lFalse),
    (App (App lEqual lZero) lZero, lTrue),
    (App (App lEqual lZero) lOne, lFalse)
    ]

runTests :: Bool
runTests = and $ app tests
    where
        app = map (\(x, y) -> evalTerm x == evalTerm y)


singleTest :: IO()
singleTest = print $ evalTerm lOne