#include <stdio.h>
#include <string.h>
#include "semantic.h"
#include "parser.h"
#include "symbol.h"

int contadorTemporales = 0;

void comenzar() {
    generar_pseudo("Load", "rtlib", "", "");
    return;
}

void terminar() {
    generar_pseudo("Exit", "", "", "");
    return;
}

void escribir(char *simbolo) {
    generar_pseudo("Write", simbolo, "Integer", "");
    return;
}

void asignar(char *valorL, char *valorR) {
    generar_pseudo("Store", valorR, valorL, "");
    return;
}

void leer(char *valorL) {
    generar_pseudo("Read", valorL, "Integer", "");
    return;
}

int declarar(char *simbolo) {
    if(!contiene_simbolo(tabla_simbolos, simbolo)) { // Se declara normalmente
        struct simbolo *nuevo_simbolo = crear_nuevo_simbolo(simbolo);
        insertar_al_principio(&tabla_simbolos, nuevo_simbolo);
        generar_pseudo("Reserve", simbolo, "4", "");
        return 0;
    }
    notificar_error_semantico(simbolo, "ya");
    return 1;
}

int procesar_id(char *simbolo) {
    if(!contiene_simbolo(tabla_simbolos, simbolo)) {
        notificar_error_semantico(simbolo, "NO");
        return 1;
    }
    return 0;
}

void notificar_error_semantico(char* simbolo, char* status) {
    yysemerrs++;
    sprintf(buffer, "Error semántico: identificador %s %s declarado", simbolo, status);
    yyerror(buffer);
    return;
}

void generar_pseudo(char *codigoPseudo, char *primerParametro, char *segundoParametro, char *tercerParametro) {
    printf("%s %s,%s,%s\n", codigoPseudo, primerParametro, segundoParametro, tercerParametro);
    return;
}

char *generar_infijo(char *operandoIzq, int operador, char *operandoDer) {
    char *temporal = declarar_nuevo_temporal();
    switch(operador) {
        case '+':
            generar_pseudo("ADD", operandoIzq, operandoDer, buffer);
        break;
        case '-':
            generar_pseudo("SUB", operandoIzq, operandoDer, buffer);
        break;
        case '*':
            generar_pseudo("MUL", operandoIzq, operandoDer, buffer);
        break;
        case '/':
            generar_pseudo("DIV", operandoIzq, operandoDer, buffer);
        break;
    }
    return temporal;
}

char *generar_unario(char *operando) {
    char *temporal = declarar_nuevo_temporal();
    generar_pseudo("NEG", operando, "", buffer);
    return temporal;
}

char *declarar_nuevo_temporal() {
    sprintf(buffer, "Temp#%d", ++contadorTemporales);
    char *temporal = strdup(buffer);
    declarar(temporal);
    return temporal;
}
