module Term (lFalse, lTrue, lAnd, lOr, lIf, lNot,
                       lPair, lFst, lLst, 
                       lInfinity,
                       lSucc, lSum, lZero, lOne, lTwo,
                       runTests) where

import Lambda ( Term(..), eval )

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
lLst = lFalse

lFst :: Term
lFst = lTrue

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
lTwo = App (App lSum lOne) lOne


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
                App ( App (Var 0) (Var 2) ) (Var 1)
            )
        )
    )

lInfinity :: Term
lInfinity = App (Abs (App (Var 0) (Var 0)))
                (Abs (App (Var 0) (Var 0)))
 

tests :: [(Term, Term)]
tests = [
    (App (App lSum lOne) lOne, lTwo),
    (App (App lSum lOne) lTwo, App (App lSum lTwo) lOne),
    (App lSucc lZero, lOne),
    (App lSucc lOne, lTwo),
    (App (App lOr lTrue) lFalse, lTrue),
    (App (App lOr lFalse) lTrue, lTrue),
    (App (App lOr lFalse) lFalse, lFalse),
    (App (App lOr lTrue) lTrue, lTrue)
    ]

runTests :: Bool
runTests = and $ app tests
    where
        app = map (\(x, y) -> eval x == eval y)