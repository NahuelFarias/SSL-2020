#include <stdio.h>
#include <string.h>
#include "semantic.h"
#include "parser.h"
#include "symbol.h"

int contador_temporales = 0;

void generar_pseudo(char* comando, char* primero, char* segundo, char* tercero) {
    printf("%s %s,%s,%s\n", comando, primero, segundo, tercero);
}

void comenzar() {
    generar_pseudo("Load", "rtlib", "", "");
    return;
}

void terminar() {
    generar_pseudo("Exit", "", "", "");
    return;
}

void escribir(char *nombre_simbolo) {
    generar_pseudo("Write", nombre_simbolo, "Integer", "");
    return;
}

void asignar(char *valor_l, char *valor_r) {
    generar_pseudo("Store", valor_r, valor_l, "");
    return;
}

void leer(char *valor_l) {
    generar_pseudo("Read", valor_l, "Integer", "");
    return;
}

int procesar_id(char* nombre_simbolo) {
    if(!contiene_simbolo(tabla_simbolos, nombre_simbolo)) {
        yysemerrs++;
        sprintf(buffer, "Error semántico: identificador %s NO declarado", nombre_simbolo);
        yyerror(buffer);
        return 1;
    }
    return 0;
}

int declarar(char *nombre_simbolo) {
    if(!contiene_simbolo(tabla_simbolos, nombre_simbolo)) { // Se declara normalmente
        struct simbolo *nuevo_simbolo = crear_nuevo_simbolo(nombre_simbolo);
        insertar_al_principio(&tabla_simbolos, nuevo_simbolo);
        generar_pseudo("Reserve", nombre_simbolo, "4", "");
        return 0;
    } else { // Hay una redeclaración
        yysemerrs++;
        sprintf(buffer, "Error semántico: identificador %s ya declarado", nombre_simbolo);
        yyerror(buffer);
        return 1;
    }
}

char *generar_infijo(char* operando_izq, int operador, char* operando_der) {
    char *aux;
    sprintf(buffer, "Temp#%d", ++contador_temporales);
    aux = strdup(buffer);

    declarar(aux);

    switch(operador){
        case '+':
            generar_pseudo("ADD", operando_izq, operando_der, buffer);
        break;
        case '-':
            generar_pseudo("SUB", operando_izq, operando_der, buffer);
        break;
        case '*':
            generar_pseudo("MUL", operando_izq, operando_der, buffer);
        break;
        case '/':
            generar_pseudo("DIV", operando_izq, operando_der, buffer);
        break;
    }
    return aux;
}

char *generar_unario(char* operando) {
    char *aux;
    sprintf(buffer, "Temp#%d", ++contador_temporales);
    aux = strdup(buffer);

    declarar(aux);

    generar_pseudo("NEG", operando, "", buffer);
    
    return aux;
}
