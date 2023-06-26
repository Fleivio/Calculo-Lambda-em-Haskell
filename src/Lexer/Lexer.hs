module Lexer.Lexer(lxRun) where

import Lexer.Token
import qualified Data.Char as DT (isDigit, isAlpha)
import Error.Evaluation

ignore :: Char -> Bool
ignore ' '  = True
ignore '\n' = True
ignore '\t' = True
ignore _    = False

dropComment :: String -> String
dropComment [] = []
dropComment xs = dropWhile (/= '\n') xs 

lxRun :: String -> Evaluation [Token]
lxRun [] = Ok []
lxRun (x:xs) | ignore x = lxRun xs

-- Names and numbers
lxRun (x:xs) | DT.isDigit x = lexNumber (x:xs)
lxRun (x:xs) | DT.isAlpha x = lexDef (x:xs)

lxRun ('-':'>':xs) = (TArrow:) <$> lxRun xs

-- Arithmetic
lxRun ('*':'*':xs) = (TPow:)  <$> lxRun xs
lxRun ('+':'+':xs) = (TSucc:) <$> lxRun xs
lxRun ('-':'-':xs) = (TPred:) <$> lxRun xs
lxRun ('+':xs)     = (TAdd:)  <$> lxRun xs
lxRun ('-':xs)     = (TSub:)  <$> lxRun xs
lxRun ('*':xs)     = (TMul:)  <$> lxRun xs

-- Boolean
lxRun ('=':'=':xs) = (TEqual:) <$> lxRun xs
lxRun ('!':'=':xs) = (TDiff:)  <$> lxRun xs
lxRun ('!':xs)     = (TNot:) <$> lxRun xs
lxRun ('&':xs)     = (TAnd:) <$> lxRun xs
lxRun ('|':'|':xs) = (TOr:)  <$> lxRun xs
lxRun ('^':xs)     = (TXor:) <$> lxRun xs
lxRun ('=':xs)     = (TAssign:) <$> lxRun xs

-- Parenthesis
lxRun ('(':xs)     = (TLParen:) <$> lxRun xs
lxRun (')':xs)     = (TRParen:) <$> lxRun xs

lxRun ('/':xs)     = (TLamb:) <$> lxRun xs
lxRun (',':xs)     = (TComma:) <$> lxRun xs
lxRun (';':xs)     = (TIn:) <$> lxRun xs

lxRun c            = Err $ "Unknown token " ++ c


lexDef :: String -> Evaluation [Token]
lexDef [] = Err "Empty string on var name"
lexDef xs = case span DT.isAlpha xs of
    ("true", r)  -> (TTrue:)      <$> lxRun r
    ("false", r) -> (TFalse:)     <$> lxRun r
    ("if", r)    -> (TIf:)        <$> lxRun r
    ("then", r)  -> (TThen:)      <$> lxRun r
    ("else", r)  -> (TElse:)      <$> lxRun r
    ("let", r)   -> (TLet:)       <$> lxRun r
    ("fn", r)    -> (TLet:)       <$> lxRun r
    ("in", r)    -> (TIn:)        <$> lxRun r
    ("btw", r)   -> lxRun $ dropComment r

    (var, r)     -> ((TDef var):) <$> lxRun r

lexNumber :: String -> Evaluation [Token]
lexNumber [] = Err "Empty string on number"
lexNumber xs = let (digits, r) = span DT.isDigit xs
               in ((TNumber (read digits)):) <$> lxRun r
