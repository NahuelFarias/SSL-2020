%code top {
#include <stdio.h>
#include "scanner.h"
#include "symbol.h"
#include "semantic.h"

struct simbolo *tabla_simbolos = NULL;
}
%code provides {
void yyerror(const char *mensajeError);
extern int yylexerrs;
extern int yysemerrs;
extern char buffer[120];
}
%defines "parser.h"
%output "parser.c"
%define api.value.type {char *} // Registro semántico de tipo: puntero a char
%define parse.error verbose
%start programa-mini

%token IDENTIFICADOR LEER DECLARAR ESCRIBIR PROGRAMA FINPROG CONSTANTE
%token ASIGNACION "<-"
%left '+' '-'
%left '*' '/'
%precedence NEG
%%
programa-mini            : { comenzar(); } PROGRAMA lista-sentencias FINPROG { terminar(); if (yynerrs || yylexerrs || yysemerrs) YYABORT; else YYACCEPT; }
                         ;
lista-sentencias         : %empty
                         | sentencia lista-sentencias
                         ;
sentencia                : identificador "<-" expresion ';' { asignar($1, $3); }
                         | DECLARAR IDENTIFICADOR ';' { if( declarar($2) ) YYERROR; } // Se activa YYERROR cuando hay redeclaración
                         | LEER '(' lista-identificadores ')' ';'
                         | ESCRIBIR '(' lista-expresion ')' ';'
                         | error ';'
                         ;
lista-expresion          : lista-expresion ',' expresion { escribir($3); }
                         | expresion { escribir($1); }
                         ;
lista-identificadores    : lista-identificadores ',' identificador { leer($3); }
                         | identificador { leer($1); }
                         ;
expresion                : expresion '+' expresion { $$ = generar_infijo($1,'+',$3); }
                         | expresion '-' expresion { $$ = generar_infijo($1,'-',$3); }
                         | expresion '*' expresion { $$ = generar_infijo($1,'*',$3); }
                         | expresion '/' expresion { $$ = generar_infijo($1,'/',$3); }
                         | '-' expresion %prec NEG { $$ = generar_unario($2); }
                         | '(' expresion ')' { $$ = $2; }
                         | identificador
                         | CONSTANTE
                         ;
identificador            : IDENTIFICADOR { if(procesar_id($1)) YYERROR; } // Checkea si ya está declarado
                         ;
%%
void yyerror(const char *mensajeError){ // si no hubiese estado definido, directamente el yyerror imprimiría: "syntax error" solamente
    printf("Línea #%d: %s\n", yylineno, mensajeError);
    return;
}
