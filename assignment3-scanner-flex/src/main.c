/* Grupo 01:
 * Integrantes:
 * - Matias Ferraro
 * - Nahuel Farias
 * - Joel Suh
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "scanner.h"

int main()
{

    TOKEN token;

    do {
        char resultado[50];
        token = yylex();
        switch (token)
        {
            case LEER:
                strcpy(resultado, "Token: Leer");
            break;
            case DECLARAR:
                strcpy(resultado, "Token: Declarar");
            break;
            case ESCRIBIR:
                strcpy(resultado, "Token: Escribir");
            break;
            case PROGRAMA:
                strcpy(resultado, "Token: Programa");
            break;
            case FINPROG:
                strcpy(resultado, "Token: Fin-Prog");
            break;
            case IDENTIFICADOR:
                strcpy(resultado, "Token: Identificador\tlexema: ");
                strcat(resultado, yytext);
            break;
            case CONSTANTE:
                strcpy(resultado, "Token: Constante\tlexema: ");
                strcat(resultado, yytext);
            break;
            case ASIGNACION:
                strcpy(resultado, "Token: Asignación");
            break;
            case '+':
                strcpy(resultado, "Token: \'+\'");
            break;
            case '-':
                strcpy(resultado, "Token: \'-\'");
            break;
            case '*':
                strcpy(resultado, "Token: \'*\'");
            break;
            case '/':
                strcpy(resultado, "Token: \'/\'");
            break;
            case '(':
                strcpy(resultado, "Token: \'(\'");
            break;
            case ')':
                strcpy(resultado, "Token: \')\'");
            break;
            case ',':
                strcpy(resultado, "Token: \',\'");
            break;
            case ';':
                strcpy(resultado, "Token: \';\'");
            break;
            case FDT:
                strcpy(resultado, "Token: Fin de Archivo");
            break;
        }
        
        puts(resultado);
        
    } while (token != FDT);

    return EXIT_SUCCESS;
}
