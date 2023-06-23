module Lexer.Token (Token (..)) where


data Token = 
      TNumber Int
    | TDef String

    | TIf
    | TThen
    | TElse

    | TTrue
    | TFalse
    | TNot
    | TAnd
    | TOr
    | TXor

    | TAdd
    | TSub
    | TMul
    | TPow
    | TPred
    | TSucc

    | TEqual
    | TDiff

    | TLParen
    | TRParen
    deriving (Show, Eq)
