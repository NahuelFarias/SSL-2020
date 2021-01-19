/* Grupo 01:
 * Integrantes:
 * - Matias Ferraro
 * - Nahuel Farias
 * - Joel Suh
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.h"

int yylexerrs = 0;
extern int yynerrs;
int yysemerrs = 0;

int main(){
    switch( yyparse() ) {
        case 0: // YYACCEPT
            printf("Compilación terminada con éxito\n");
            break;
        case 1: // YYABORT
            printf("Errores de compilación\n");
            break;
        case 2:
            printf("Memoria insuficiente\n");
            break;
    }
    printf("Errores sintácticos: %d - Errores léxicos: %d - Errores semánticos: %d\n", yynerrs, yylexerrs, yysemerrs);
    return EXIT_SUCCESS;
}
