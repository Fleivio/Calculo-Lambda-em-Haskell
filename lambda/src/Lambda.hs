module Lambda(Term (..), eval, runTests, evalPrint ) where

import Term

--shift o termo em d
shift :: Int -> Term -> Term
shift d = walk 0
    where walk c t = case t of
                Var x -> if x >= c
                        then Var ( x + d )
                        else Var x
                Abs t1 -> Abs (walk (c+1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)

-- subst o j termo de t por s
subst :: Int -> Term -> Term -> Term
subst j s = walk 0
    where walk c t = case t of
                Var x -> if x == j + c
                         then shift (c + 1) s
                         else Var x
                Abs t1 -> Abs (walk (c + 1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)

--substitui o termo s em t e deshifta de volta
betaReduct :: Term -> Term -> Term
betaReduct s t = shift (-1) (subst 0 (shift 0 s) t)

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
evalPrint = run
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