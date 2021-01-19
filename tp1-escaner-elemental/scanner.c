#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "scanner.h"

#define CANT_ESTADOS_ACEPTORES 4
#define CANT_COLUMNAS 6
#define CANT_FILAS 5

const int ESTADO_INICIAL = E0;

const int ESTADOS_ACEPTORES[CANT_ESTADOS_ACEPTORES] = {E200, E201, E202, E203};

const int TT[CANT_FILAS][CANT_COLUMNAS] = {
/* T.T     L     D     #      Esp. Blanco  Otro   fdt*/
/* E0- */ {E1,   E2,   E201,  E0,          E3,    E200},
/* E1  */ {E1,   E1,   E202,  E202,        E202,  E202},
/* E2  */ {E203, E2,   E203,  E203,        E203,  E203},
/* E3  */ {E204, E204, E204,  E204,        E3,    E204}
};

int scanFlujo(void){
  int estado = ESTADO_INICIAL;
  char caracterLeido;

  while(estado <= E3){
    caracterLeido = getchar();
    int simbolo = categorizarCaracter(caracterLeido);
    estado = TT[estado][simbolo];
  }

  if(esAceptor(estado)){
    if(estado == E200){     /* no retornar último caracter al flujo */
      return tokenFDT;
    } else if(estado == E201){
      return tokenNumeral;
    }
    /* Se podría declarar un nuevo arreglo con los estados centinelas: los caracteres leidos que deben hacer el ungetc */
    ungetc(caracterLeido, stdin);
    switch(estado){         /* retornar último caracter al flujo */
    case E202:
      return tokenIdentificador;
    case E203:
      return tokenConstanteEntera;
    break;
    }
  }
  ungetc(caracterLeido, stdin);
  return tokenError;
}

int categorizarCaracter(int c){
  if(isalpha(c)){
    return COL0; // Columna de letras
  } else if(isdigit(c)){
    return COL1; // Columna de dígitos
  } else if(c == '#'){
    return COL2; // Columna de numeral
  } else if(isspace(c)){
    return COL3; // Columna espacio en blanco
  } else if(c == EOF){
    return COL5; // Columna fin de texto
  }
  return COL4; // Columna otros
}

int esAceptor(int estado){
  return esUnoDe(estado, CANT_ESTADOS_ACEPTORES, ESTADOS_ACEPTORES);
}

int esUnoDe(int estado, const int CANTIDAD, const int ESTADOS_QUE_CUMPLEN[]){
  for(int i = 0; i < CANTIDAD; i += 1){
    if(estado == ESTADOS_QUE_CUMPLEN[i]){
      return 1;
    }
  }
  return 0;
}
