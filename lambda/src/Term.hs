module Term (Term(..), lFalse, lTrue, lAnd, lOr, lIf, lNot,
                       lPair, lFst, lLst, 
                       lInfinity,
                       lSucc, lSum, lZero, lOne, lTwo) where


data Term =
    Var Int
    | Abs Term
    | App Term Term

instance Eq Term where
    (==) (App a b) (App a' b') = a' == a && b' == b
    (==) (Var a) (Var b) = a == b
    (==) (Abs a) (Abs b) = a == b
    (==) _ _ = False

instance Show Term where
  show t = case t of
    Var x     -> show x
    Abs t1    -> case () of
                _ | t1 == lFalse -> "False"
                  | t1 == lTrue -> "True"
                  | otherwise -> "/" ++ show t1
    App t1 t2 -> "(" ++ show t1 ++ " " ++ show t2 ++ ")"

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

