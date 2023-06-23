module Error.Evaluation(Evaluation(..)) where

data Evaluation a = Ok a | Err String deriving Show

instance Functor Evaluation where
    fmap f (Ok a)  = Ok (f a)
    fmap _ (Err s) = Err s

instance Applicative Evaluation where
    pure = Ok
    (Ok f)  <*> (Ok a)  = Ok (f a)
    (Err s) <*> _       = Err s
    _       <*> (Err s) = Err s

instance Monad Evaluation where
    return = pure
    (Ok a)  >>= f = f a
    (Err s) >>= _ = Err s

instance MonadFail Evaluation where
    fail = Err

