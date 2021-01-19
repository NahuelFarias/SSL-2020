#ifndef SCANNER_H_INCLUDED
#define SCANNER_H_INCLUDED

enum TOKENS {tokenIdentificador, tokenConstanteEntera, tokenNumeral, tokenError, tokenFDT};
enum ESTADOS {E0, E1, E2, E3, E200 = 200, E201, E202, E203, E204};
enum COLUMNAS {COL0, COL1, COL2, COL3, COL4, COL5};

int esUnoDe(int estado, const int CANTIDAD, const int ESTADOS_QUE_CUMPLEN[]);
int scanFlujo(void);
int categorizarCaracter(int c);
int esAceptor(int estado);

#endif // SCANNER_H_INCLUDED
