%{
#include <stdio.h>
#include <strings.h>
#include "parser.h"
char buffer[120];
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
{Identificador}{Otros}({Letra}|{Digito}|{Otros})*               {yylexerrs++; sprintf(buffer, "Error léxico: identificador inválido: %s", yytext); yyerror(buffer);}
{ConstanteEntera}({Letra}|{Digito})*                            {yylexerrs++; sprintf(buffer, "Error léxico: constante inválida: %s", yytext); yyerror(buffer);}
{Espacio}+                                                      ;
##.*                                                            ;
{Otros}+                                                        |
.                                                               {yylexerrs++; sprintf(buffer, "Error léxico: cadena desconocida: %s", yytext); yyerror(buffer);}