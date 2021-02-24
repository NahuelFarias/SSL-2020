#ifndef SEMANTIC_H_INCLUDED
#define SEMANTIC_H_INCLUDED

extern struct simbolo *tabla_simbolos;

void comenzar();
void terminar();
void escribir(char *simbolo);
void asignar(char *valorL, char *valorR);
void leer(char *valorL);
int declarar(char *simbolo);
int procesar_id(char *simbolo);
void notificar_error_semantico(char* simbolo, char* status);
void generar_pseudo(char *codigoPseudo, char *primerParametro, char *segundoParametro, char *tercerParametro);
char *generar_infijo(char *operandoIzq, int operador, char *operandoDer);
char *generar_unario(char *operando);
char *declarar_nuevo_temporal();

#endif // SEMANTIC_H_INCLUDED
