#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol.h"
#include "parser.h"
#include "semantic.h"

struct simbolo *crear_nuevo_simbolo(char *nuevoNombre) {
    struct simbolo *nuevoSimbolo = malloc(sizeof(struct simbolo));
    strcpy(nuevoSimbolo->nombre, nuevoNombre);
    nuevoSimbolo->sig = NULL;
    return nuevoSimbolo;
}

struct simbolo *insertar_al_principio(struct simbolo **head, struct simbolo *simboloAInsertar) {
    simboloAInsertar->sig = *head;
    *head = simboloAInsertar;
    return simboloAInsertar;
}

int contiene_simbolo(struct simbolo *head, const char* nombreABuscar) {
    struct simbolo *auxHead = head;
    while(auxHead != NULL) {
        if(strcmp(auxHead->nombre, nombreABuscar) == 0) {
            return 1;
        }
        auxHead = auxHead->sig;
    }
    return 0;
}
