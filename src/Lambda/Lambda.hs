module Lambda.Lambda(Term (..), VarTable, Op (..), UnOp(..), defToTerm, betaReduct,
                    appOpTerm, appUnOpTerm) where

type VarName = String

data Term =
      Var Int
    | Abs Term
    | App Term Term
    | Def VarName
    | Lam [VarName] Term
    | Number Int
    | Boolean Bool
    | Op Term Op Term
    | UnOp UnOp Term
    | Let VarTable Term
    deriving (Eq)

data Op = Add | Sub | Mul | Pow |
          And | Or | Xor |
          Eq | Diff
    deriving Eq

data UnOp = Not | Succ | Pred | IsZero
    deriving Eq 

type VarTable = [(VarName, Term)]

instance Show Term where
  show t = case t of
    Var x       -> "v" ++ show x
    Abs t1      -> "/" ++ show t1
    App t1 t2   -> "(" ++ show t1 ++ " " ++ show t2 ++ ")"
    Lam xs t1   -> "(\\" ++ show xs ++ " -> " ++ show t1 ++ ")"
    Def s       -> s
    Number n    -> show n
    Boolean b   -> show b
    Op t1 op t2 -> "(" ++ show t1 ++ " " ++ show op ++ " " ++ show t2 ++ ")"
    UnOp op t1  -> "(" ++ show op ++ " " ++ show t1 ++ ")"
    Let vt t1   -> "(let " ++ show vt ++ " in " ++ show t1 ++ ")"

instance Show Op where 
    show op = case op of
        Add -> "+"
        Sub -> "-"
        Mul -> "*"
        Pow -> "^"
        And -> "&&"
        Or  -> "||"
        Xor -> "^^"
        Eq  -> "=="
        Diff-> "!="

instance Show UnOp where
    show op = case op of
        Not    -> "!"
        Succ   -> "++"
        Pred   -> "--"
        IsZero -> "0 =="

lookupVar :: VarName -> VarTable -> Maybe Term
lookupVar s vt = case vt of
    [] -> Nothing
    (x:xs) -> if fst x == s
              then Just (snd x)
              else lookupVar s xs

defToTerm :: VarName -> VarTable -> Term
defToTerm s vt = maybe (Def s) (id) (lookupVar s vt)

shift :: Int -> Term -> Term
shift d = walk 0
    where walk c t = case t of
                Var x -> if x >= c
                        then Var ( x + d )
                        else Var x
                Abs t1 -> Abs (walk (c+1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)
                t1 -> t1

subst :: Int -> Term -> Term -> Term
subst j s = walk 0
    where walk c t = case t of
                Var x -> if x == j + c
                         then shift (c + 1) s
                         else Var x
                Abs t1 -> Abs (walk (c + 1) t1)
                App t1 t2 -> App (walk c t1) (walk c t2)
                t1 -> t1

betaReduct :: Term -> Term -> Term
betaReduct s t = shift (-1) (subst 0 (shift 0 s) t)

appOpTerm :: Term -> Term -> Term -> Term 
appOpTerm op t1 t2 = App (App op t1) t2

appUnOpTerm :: Term -> Term -> Term
appUnOpTerm op t = App op t