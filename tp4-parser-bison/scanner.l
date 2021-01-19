%{
#include <stdio.h>
#include <strings.h>
#include "parser.h"
char msg[120];
%}
%option outfile="scanner.c"
%option header-file="scanner.h"
%option noinput
%option nounput
%option yylineno

Digito              [[:digit:]]
Letra               [[:alpha:]]
Espacio             [[:space:]]
Otros               [[:^alnum:]]{-}[[:space:]]{-}[-+*/();,<]
Identificador       {Letra}({Letra}|{Digito})*
ConstanteEntera     {Digito}+

%%
declarar                                                        {yylval = strdup(yytext); return DECLARAR;}
leer                                                            {yylval = strdup(yytext); return LEER;}
escribir                                                        {yylval = strdup(yytext); return ESCRIBIR;}
programa                                                        {yylval = strdup(yytext); return PROGRAMA;}
fin-prog                                                        {yylval = strdup(yytext); return FINPROG;}
{Identificador}                                                 {yylval = strdup(yytext); return IDENTIFICADOR;}
{ConstanteEntera}                                               {yylval = strdup(yytext); return CONSTANTE;}
"+"                                                             return '+';
"-"                                                             return '-';
"*"                                                             return '*';
"/"                                                             return '/';
"<-"                                                            {yylval = strdup(yytext); return ASIGNACION;}
"("                                                             return '(';
")"                                                             return ')';
","                                                             return ',';
";"                                                             return ';';
{Identificador}{Otros}({Letra}|{Digito}|{Otros})*               {yylexerrs++; sprintf(msg, "Error léxico: identificador inválido: %s", yytext); yyerror(msg);}
{ConstanteEntera}({Letra}|{Digito})*                            {yylexerrs++; sprintf(msg, "Error léxico: constante inválida: %s", yytext); yyerror(msg);}
{Espacio}+                                                      ;
##.*                                                            ;
{Otros}+                                                        |
.                                                               {yylexerrs++; sprintf(msg, "Error léxico: cadena desconocida: %s", yytext); yyerror(msg);}
