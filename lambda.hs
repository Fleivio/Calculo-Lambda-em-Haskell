data Term = 
      TmTrue
    | TmFalse
    | TmIf Term Term Term
    | TmZero
    | TmSucc Term
    | TmPred Term
    | TmIsZero Term
    deriving Show

eval1 :: Term -> Term

eval1 (TmIf TmTrue t2 t3) = eval1 t2
eval1 (TmIf TmFalse t2 t3) = eval1 t3
eval1 (TmIf t1 t2 t3) = eval1 $ TmIf (eval1 t1) t2 t3

eval1 (TmSucc t1) = eval1 $ TmSucc $ eval1 t1

eval1 (TmPred TmZero) = TmZero
eval1 (TmPred (TmSucc t1)) = eval1 t1
eval1 (TmPred t1) = eval1 $ TmPred $ eval1 t1

eval1 (TmIsZero TmZero) = TmTrue
eval1 (TmIsZero (TmSucc _)) = TmFalse
eval1 (TmIsZero t1) = eval1 $ TmIsZero $ eval1 t1

eval1 TmTrue = TmTrue
eval1 TmFalse = TmFalse

-- main = do putStrLn "a"