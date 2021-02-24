#include "lexema.h"
#include "scanner.h"

void contarLexema(int resultado, int lexemasEncontrados[]){
  switch(resultado){
    case tokenIdentificador:
      lexemasEncontrados[tokenIdentificador]++;
      break;
    case tokenConstanteEntera:
      lexemasEncontrados[tokenConstanteEntera]++;
      break;
    case tokenNumeral:
      lexemasEncontrados[tokenNumeral]++;
      break;
    case tokenError:
      lexemasEncontrados[tokenError]++;
      break;
  }
}
