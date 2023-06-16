data Term =
    Var Int
    | Abs Term
    | App Term Term

instance Eq Term where
    (==) :: Term -> Term -> Bool
    (==) (App a b) (App a' b') = a' == a && b' == b
    (==) (Var a) (Var b) = a == b
    (==) (Abs a) (Abs b) = a == b
    (==) _ _ = False

-- instance (Semigroup a) => Semigroup (Maybe a) where
--     (<>) (Just a) (Just b) = Just (a <> b)
--     (<>) Nothing (Just a) = Just a
--     (<>) (Just a) Nothing = Just a

instance Show Term where
  show t = case t of
    Var x     -> show x
    Abs t1    -> case () of
                _ | t1 == lFalse -> "False"
                  | t1 == lTrue -> "True"
                  | otherwise -> "/" ++ show t1
    App t1 t2 -> "(" ++ show t1 ++ " " ++ show t2 ++ ")"

lFalse = Abs ( -- 1
            Abs -- 0 
            (Var 0))

lTrue = Abs (
            Abs
            (Var 1)
        )

lLst = lFalse

lFst = lTrue

lIf = Abs ( -- 2
        Abs ( -- 1
            Abs -- 0
                (App (App (Var 2) (Var 1)) (Var 0))
        )
    )

lNot = Abs -- 0
            ( App (App (App lIf (Var 0) ) lFalse) lTrue )


lAnd = Abs ( -- 1
            Abs ( -- 0
                App ( App ( App lIf (Var 0) ) (Var 1) ) lFalse
            )
        )

lOr = Abs (  -- 1
        Abs ( -- 0
            App (App ( App lIf (Var 0) ) lTrue) (Var 1)
        )
    )

lZero = lNot

lOne = Abs ( -- f
        Abs ( -- z
            App (Var 1) (Var 0)
        )
    )

lTwo = App (App lSum lOne) lOne


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

lPair = Abs (
        Abs (
            Abs (
                App ( App (Var 0) (Var 2) ) (Var 1)
            )
        )
    )

lInfinity = App (Abs (App (Var 0) (Var 0)))
                (Abs (App (Var 0) (Var 0)))


--shift o termo em d
shift :: Int -> Term -> Term
shift d term = walk 0 term
    where walk c t = case t of
                Var x -> if x >= c
                        then Var ( x + d )
                        else Var x
                Abs t1 -> Abs (walk (c+1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)

-- subst o j termo de t por s
subst :: Int -> Term -> Term -> Term
subst j s t = walk 0 t
    where walk c t = case t of
                Var x -> if x == j + c
                         then shift (c + 1) s
                         else Var x
                Abs t1 -> Abs (walk (c + 1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)

--substitui o termo s em t e deshifta de volta
betaReduct :: Term -> Term -> Term
betaReduct s t = shift (-1) (subst 0 (shift 0 s) t)


isVal :: Term -> Bool
isVal (Abs _) = True
isVal (Var _) = True
isVal _ = True

hasApp :: Term -> Bool
hasApp (App _ _) = True
hasApp (Var _) = False
hasApp (Abs t) = hasApp t

evalRunPrint :: Term -> IO Term
evalRunPrint t@(App (Abs a) b) = do
    print t
    print "Beta Reduction"
    return $ betaReduct b a
evalRunPrint t@(App a b) = do
    print t
    print "Intenal Eval"
    a' <- evalRunPrint a
    b' <- evalRunPrint b
    return $ App a' b'
evalRunPrint t@(Abs a) = do
    print t
    print "Internal Eval"
    a' <- evalRunPrint a
    return $ Abs a'
evalRunPrint t@(Var a) = do
    print t
    return $ Var a

evalPrint :: Term -> IO Term
evalPrint t = run t
    where run n = do
            n' <- evalRunPrint n
            if n == n' then return n
            else run n'

evalRun :: Term -> Term
evalRun (App (Abs a) b) = betaReduct b a
evalRun (App a b) = App (evalRun a) (evalRun b)
evalRun (Abs a) = Abs (evalRun a)
evalRun (Var a) = Var a

eval :: Term -> Term
eval x
    | x == y = x
    | otherwise = eval y
    where y = evalRun x

tests = [
    (App (App lSum lOne) lOne, lTwo),
    (App (App lSum lOne) lTwo, App (App lSum lTwo) lOne),
    (App (App lOr lTrue) lFalse, lTrue),
    (App (App lOr lFalse) lTrue, lTrue),
    (App (App lOr lFalse) lFalse, lFalse),
    (App (App lOr lTrue) lTrue, lTrue),
    (App (App lOr lTrue) lTrue, lTrue)
    ]

runTests :: [(Term, Term)] -> Bool
runTests tests = and $ app tests
    where
        app = map (\(x, y) -> eval x == eval y)

main :: IO ()
main = print $ runTests tests