#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol.h"
#include "parser.h"
#include "semantic.h"

struct simbolo *crear_nuevo_simbolo(const char* nombre_simbolo) {
    struct simbolo *nuevo_simbolo = malloc(sizeof(struct simbolo));
    strcpy(nuevo_simbolo->nombre, nombre_simbolo);
    nuevo_simbolo->sig = NULL;
    return nuevo_simbolo;
}

struct simbolo *insertar_al_principio(struct simbolo **head, struct simbolo *simbolo_a_insertar) {
    simbolo_a_insertar->sig = *head;
    *head = simbolo_a_insertar;
    return simbolo_a_insertar;
}

int contiene_simbolo(struct simbolo *head, const char* nombre_a_buscar) {
    struct simbolo *aux = head;
    while(aux != NULL) {
        if(strcmp(aux->nombre, nombre_a_buscar) == 0) {
            return 1;
        }
        aux = aux->sig;
    }
    return 0;
}
