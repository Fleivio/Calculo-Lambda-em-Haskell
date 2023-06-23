module Lexer.Lexer(lxRun) where

import Lexer.Token
import qualified Data.Char as DT (isDigit, isAlpha)


lxRun :: String -> Maybe [Token]
lxRun [] = Just []
lxRun (' ':xs) = lxRun xs

-- Names and numbers
lxRun (x:xs) | DT.isDigit x = lexNumber (x:xs)
lxRun (x:xs) | DT.isAlpha x = lexDef (x:xs)

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

-- Parenthesis
lxRun ('(':xs)     = (TLParen:) <$> lxRun xs
lxRun (')':xs)     = (TRParen:) <$> lxRun xs
lxRun _            = Nothing


lexDef :: String -> Maybe [Token]
lexDef [] = Nothing
lexDef xs = case span DT.isAlpha xs of
    ("true", r)  -> (TTrue:)      <$> lxRun r
    ("false", r) -> (TFalse:)     <$> lxRun r
    ("if", r)    -> (TIf:)        <$> lxRun r
    ("then", r)  -> (TThen:)      <$> lxRun r
    ("else", r)  -> (TElse:)      <$> lxRun r
    (var, r)     -> ((TDef var):) <$> lxRun r

lexNumber :: String -> Maybe [Token]
lexNumber [] = Nothing
lexNumber xs = let (digits, r) = span DT.isDigit xs
               in ((TNumber (read digits)):) <$> lxRun r
