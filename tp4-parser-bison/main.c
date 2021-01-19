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

int main(){
    switch( yyparse() ) {
        case 0:
            printf("Compilación terminada con éxito\n");
            break;
        case 1:
            printf("Errores de compilación\n");
            break;
        case 2:
            printf("Memoria insuficiente\n");
            break;
    }
    printf("Errores sintácticos: %d - Errores léxicos: %d\n", yynerrs, yylexerrs);
    return EXIT_SUCCESS;
}
