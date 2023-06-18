module Lambda.Lambda(Term (..), evalTerm ) where

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
    Abs t1    -> "/" ++ show t1
    App t1 t2 -> "(" ++ show t1 ++ " " ++ show t2 ++ ")"


shift :: Int -> Term -> Term
shift d = walk 0
    where walk c t = case t of
                Var x -> if x >= c
                        then Var ( x + d )
                        else Var x
                Abs t1 -> Abs (walk (c+1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)

subst :: Int -> Term -> Term -> Term
subst j s = walk 0
    where walk c t = case t of
                Var x -> if x == j + c
                         then shift (c + 1) s
                         else Var x
                Abs t1 -> Abs (walk (c + 1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)

betaReduct :: Term -> Term -> Term
betaReduct s t = shift (-1) (subst 0 (shift 0 s) t)

-- evalRunPrint :: Term -> IO Term
-- evalRunPrint t@(App (Abs a) b) = do
--     print t
--     print "Beta Reduction"
--     return $ betaReduct b a
-- evalRunPrint t@(App a b) = do
--     print t
--     print "Intenal Eval"
--     a' <- evalRunPrint a
--     b' <- evalRunPrint b
--     return $ App a' b'
-- evalRunPrint t@(Abs a) = do
--     print t
--     print "Internal Eval"
--     a' <- evalRunPrint a
--     return $ Abs a'
-- evalRunPrint t@(Var a) = do
--     print t
--     return $ Var a

-- evalPrint :: Term -> IO Term
-- evalPrint = run
--     where run n = do
--             n' <- evalRunPrint n
--             if n == n' then return n
--             else run n'

evalRun :: Term -> Term
evalRun (App (Abs a) b) = betaReduct b a
evalRun (App a b) = App (evalRun a) (evalRun b)
evalRun (Abs a) = Abs (evalRun a)
evalRun t = t

evalTerm :: Term -> Term
evalTerm x
    | x == y = x
    | otherwise = evalTerm y
    where y = evalRun x
    