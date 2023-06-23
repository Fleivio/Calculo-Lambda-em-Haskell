module Lexer.Token (Token (..)) where


data Token = 
      TNumber Int
    | TDef String

    | TIf
    | TThen
    | TElse

    | TLet 
    | TAssign
    | TIn

    | TLamb
    | TComma
    | TDot

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
