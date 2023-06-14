
data Term = 
    Var Int
    | Abs Term
    | App Term Term

instance Show Term where
  show t = case t of
    Var x     -> show x
    Abs t1    -> "λ" ++ show t1
    App t1 t2 -> "(" ++ show t1 ++ " " ++ show t2 ++ ")"

lFalse = Abs (
            Abs 
            (Var 0)
        )

lTrue = Abs (
            Abs 
            (Var 1) 
        )

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

lSum = Abs (
        Abs (
            Abs(
                Abs(
                    App
                    (App (Var 3) (Var 1))
                    ( App (App (Var 2) (Var 1)) (Var 0))
                )
            )
        )
    )

--shift o termo em d
shift :: Int -> Term -> Term
shift d term = walk 0 term
    where walk c t = case t of
                Var x -> if x >= c
                        then Var ( x + d )
                        else Var x
                Abs t1 -> Abs (walk (c+1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)

-- subst o j termo em t por s
subst :: Int -> Term -> Term -> Term
subst j s t = walk 0 t
    where walk c t = case t of
                Var x -> if x == j
                         then shift j s 
                         else Var x
                Abs t1 -> Abs (walk (c+1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)

--substitui o termo s em t e deshifta de volta
substTop :: Term -> Term -> Term
substTop s t = shift (-1) (subst 0 (shift 1 s) t)

-- evalI :: Term -> Term
-- evalI term = case term of 
--     App (Abs t12) v2@(Abs _) -> evalI $ substTop v2 t12
--     App v1@(Abs _) t2 -> let t2' = evalI t2
--                          in evalI (App v1 t2')
--     App t1 t2 -> let t1' = evalI t1
--                  in evalI (App t1' t2)
--     Abs t1 -> Abs $ evalI t1 
--     _ -> term

evalI :: Term -> IO Term
evalI t@(Abs t1) = do
    print t
    print 1
    next <- evalI t1
    return (Abs next)
evalI t@(App (Abs t1) t2@(Abs _)) = do
    print t
    print 2
    evalI $ substTop t2 t1
evalI t@(App t1@(Abs _) t2) = do
    print t
    print 3
    t2' <- evalI t2
    evalI (App t1 t2')
evalI t@(App t1 t2) = do 
    print t
    print 4
    t1' <- evalI t1
    evalI (App t1' t2)
evalI t = do
    print t
    print 0
    return t

 

-- main :: IO ()
-- main = do
--     coiso <- evalI ( App (App lSum lOne) lOne )
--     print coiso



-- tmMap :: (Int -> Int -> IO Term) -> Int -> Term -> IO Term
-- tmMap f c t = walk c t
--     where
--         walk c t@(Var x) = do 
--                                 print t
--                                 f c x
--         walk c t@(Abs t1) = do
--                                 print t
--                                 aux <- walk (c+1) t 
--                                 return (Abs aux)
--         walk c t@(App t1 t2) = do
--                                     print t
--                                     aux1 <- walk c t1
--                                     aux2 <- walk c t2
--                                     return (App aux1 aux2)

-- shifti :: Int -> Int -> Term -> IO Term
-- shifti d c t = tmMap (\c x -> if x >= c then return (Var (x + d)) else return(Var x)) c t

-- shift :: Term -> Int -> IO Term
-- shift t d = shifti d 0 t

-- substi :: Term -> Int -> Term -> IO Term
-- substi s j t = tmMap (\j x -> if x == j then shift s j
--                                         else return (Var x)) j t

-- subst :: Term -> Term -> IO Term
-- subst s t = substi s 0 t

-- substnip :: Term -> Term -> IO Term
-- substnip s t = do 
--     aux <- shift s 1
--     aux2 <- subst aux t
--     shift aux2  (-1) 
