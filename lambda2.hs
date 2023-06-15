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


instance Show Term where
  show t = case t of
    Var x     -> show x
    Abs t1    -> case () of
                _ | t1 == lFalse -> "False"
                  | t1 == lTrue -> "True"
                  | otherwise -> "/" ++ show t1
    App t1 t2 -> "(" ++ show t1 ++ " " ++ show t2 ++ ")"

lFalse = Abs (
            Abs
            (Var 0)
        )

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

lOne = Abs (
        Abs (
            App (Var 1) (Var 0)
        )
    )

lTwo = App (App lSum lOne) lOne

lSucc = Abs ( --n 2
            Abs ( --s 1
                Abs ( --z 0
                    App (Var 1) (App (App (Var 2) (Var 1)) (Var 0))
                )
            )
        )


lSum = Abs (
        Abs (
            App (Var 0) ( App lSucc (Var 1) )
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
isVal _ = False

hasApp :: Term -> Bool
hasApp (App _ _) = True
hasApp (Var _) = False
hasApp (Abs t) = hasApp t

evalRunPrint :: Term -> IO (Maybe Term)
evalRunPrint t@(App (Abs a) b) | isVal b = do
    print t
    print "Reducao beta"
    let y = betaReduct b a
    return $ Just y

evalRunPrint t@(App a b) | isVal a = do
    print t
    b' <- evalRunPrint b
    return $ b' >>= (\x -> Just (App a x))

evalRunPrint t@(App a b) = do
    print t
    a' <- evalRunPrint a
    return $ a' >>= (\x -> Just (App x b))

evalRunPrint t@(Abs a) | hasApp a = do
    print t
    a' <- evalRunPrint a
    return $ a' >>= Just . Abs

evalRunPrint t = do
    print t
    print "Fim"
    return Nothing

evalRunNoPrint :: Term -> Maybe Term
evalRunNoPrint t@(App (Abs a) b) | isVal b = Just $ betaReduct b a
evalRunNoPrint t@(App a b) | isVal a = evalRunNoPrint b >>= (Just . App a)
evalRunNoPrint t@(App a b) = evalRunNoPrint a >>= (\x -> Just (App x b))
evalRunNoPrint t@(Abs a) | hasApp a = evalRunNoPrint a >>= Just . Abs
evalRunNoPrint t = Nothing

evalPrint :: Term -> IO Term
evalPrint t = do
    res <- evalRunPrint t
    case res of
            Just t' -> evalPrint t'
            Nothing -> return t

eval :: Term -> Term
eval t = let res = evalRunNoPrint t
         in maybe t eval res


main :: IO ()
