{
module Parser.Parser(parse) where
import Lexer.Token
import Lambda.Lambda
import Lambda.BaseTypes
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

    let          { TLet }
    in           { TIn }
    
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
    '='          { TAssign }

    '('          { TLParen }
    ')'          { TRParen }
    ','          { TComma }
    '->'          { TArrow }

    '/'          { TLamb }

%left '||' '&&' '^' '!=' '==' '+' '-' '*' '**' '++' '--' '!' '='
%right app
%%

Expr : var                         {Def $1}
     | int                         {Number $1}
     | true                        {Boolean True}
     | false                       {Boolean False}
     | Expr '++'                   {UnOp Succ $1}
     | Expr '--'                   {UnOp Pred $1}
     | Expr '+'  Expr              {Op $1 Add $3}
     | Expr '-'  Expr              {Op $1 Sub $3}
     | Expr '*'  Expr              {Op $1 Mul $3}
     | Expr '**' Expr              {Op $1 Pow $3}
     | Expr '==' Expr              {Op $1 Eq $3}
     | Expr '!=' Expr              {Op $1 Diff $3}
     | Expr '&&' Expr              {Op $1 And $3}
     | Expr '||' Expr              {Op $1 Or $3}
     | Expr '^' Expr               {Op $1 Xor $3}
     | if Expr then Expr else Expr {App (App (App lIf $2) $4) $6}
     | app                         { $1 }
     | let var '=' Expr in Expr    {Let [($2, $4)] $6}
     | Expr '!'                    {UnOp Not $1}
     | '(' Expr ')'                { $2 }
     | '/' args '->' Expr                    {Lam $2 $4}
     | let var '(' args ')' '->' Expr in Expr {Let [($2, Lam $4 $7)] $9}

app : Expr Expr { App $1 $2 }
    | app Expr  {App $1 $2}

args : var          { [$1] }
     | '(' args ')' { $2 }
     | var ',' args { $1 : $3 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"
}