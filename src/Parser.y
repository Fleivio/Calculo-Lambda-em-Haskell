{
module Parser(parse) where
import Lexer.Token
import Lambda.Lambda
}

%name parse
%tokentype { Token }
%error { parseError }

%token 
    int          { TNumber $$ }
    var          { TDef $$ }

    if           { TIf }
    then         { TThen }
    else         { TElse }

    true         { TTrue }
    false        { TFalse }
    
    '!'          { TNot }
    '&&'         { TAnd }
    '||'         { TOr }
    '^'         { TXor }

    '++'         { TSucc }
    '--'         { TPred }
    '+'          { TAdd }
    '-'          { TSub }
    '*'          { TMul }
    '**'         { TPow }

    '=='         { TEqual }
    '!='         { TDiff }

    '('          { TLParen }
    ')'          { TRParen }
%%

Expr : var      {Def $1}
     | int      {Number $1}
     | true      {Boolean True}
     | false     {Boolean False}
     | Expr '++' {UnOp Succ $1}
     | Expr '--' {UnOp Pred $1}
     | Expr '+' Expr {Op $1 Add $3}
     | Expr '-' Expr {Op $1 Sub $3}
     | Expr '*' Expr {Op $1 Mul $3}
     | Expr '**' Expr {Op $1 Pow $3}
     | Expr '==' Expr {Op $1 Eq $3}
     | Expr '!=' Expr {Op $1 Diff $3}
     | Expr '&&' Expr {Op $1 And $3}
     | Expr '||' Expr {Op $1 Or $3}
     | Expr '^' Expr  {Op $1 Xor $3}
     | if Expr then Expr else Expr {If $2 $4 $6}
     | Expr Expr      {App $1 $2}
     | '!' Expr {UnOp Not $2}
     | '(' Expr ')' { $2 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"
}