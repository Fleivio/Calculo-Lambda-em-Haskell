
data Term = 
    Var Int
    | Abs Term
    | App Term Term
        deriving Show

-- instance Show Term where
--   show t = case t of
--     Var x     -> show x
--     Abs t1    -> "/" ++ show t1
--     App t1 t2 -> "(" ++ show t1 ++ " " ++ show t2 ++ ")"

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

lTwo = Abs (
        Abs(
            App (Var 1) (App (Var 1) (Var 0)) 
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
substTop :: Term -> Term -> Term
substTop s t = shift (-1) (subst 0 (shift 1 s) t)


isVal :: Term -> Bool
isVal (Abs _) = False
isVal _ = True

evalPrint :: Term -> IO Term
evalPrint t@(App (Abs a) b) | isVal b = do
    print t
    print "App isval b"
    let y = substTop b a
    print $ "substutindo b em a = " ++ show y
    evalPrint y
evalPrint t@(App a b) | isVal a = do
    print t
    print "App isval a"
    b' <- evalPrint b
    evalPrint $ App a b'
evalPrint t@(App a b) = do 
    print t 
    print "App generico"
    a' <- evalPrint a
    return $ App a' b
evalPrint t = do
    print t
    print "Fim"
    return t 

-- main :: IO()
-- main = print $ subst 0 lNot (Abs (App (Var 0) lTrue))

main :: IO Term 
main = evalPrint $ App (Abs (Abs (App (Var 0) (Var 1)))) (Var 90)
