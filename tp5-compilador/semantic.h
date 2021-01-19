#ifndef SEMANTIC_H_INCLUDED
#define SEMANTIC_H_INCLUDED

extern struct simbolo *tabla_simbolos;

void comenzar();
void terminar ();
void escribir(char *nombre_simbolo);
void asignar(char *valor_l, char *valor_r);
void leer(char *valor_l);
int procesar_id(char* nombre_simbolo);
int declarar(char *nombre_simbolo);
char *generar_infijo(char* operando_izq, int operador, char* operando_der);
char *generar_unario(char* operando);

#endif // SEMANTIC_H_INCLUDED
