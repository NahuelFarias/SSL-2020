# Implementing a parser with Bison
## Objectives
Based on the syntactical grammatic made in assignment 2 and the implementation of the lexical grammatic made in assignment 3, we will be constructing a program capable of recognizing a Mini source file.
## Remarks
- Flex and Bison should implement directives which avoid the obligatory usage of additional options on the shell.
- `main.c` must invoke `yyparse()` and will inform if the compilation was successfull or not. It must show the number of lexical and syntactical errors.
- `yyerror()` should have a more detailed error message (not just 'syntax error'). Redefinition of `yyerror()` must be done in `parser.y` epilogue.
- The analysis shouldn't be aborted on the first error. It must go through all the existing source file.
- For a better followage, we will be adding semantic actions. This fact helps us comprehending what's going on in Bison.
  - At the end of `declaracion`: `declarar xxx` (where `xxx` is the corresponding lexeme).
  - At the end of `leer`: `leer`
  - At the end of `escribir`: `escribir`
  - At the end of `asignacion`: `asignación`
  - At the end of `*`: `multiplicación`
  - At the end of `/`: `división`
  - At the end of `+`: `suma`
  - At the end of binary `-`: `resta`
  - At the end of unary `-`: `inversión`
  - Closing parenthesis: `paréntesis`
- We must flatten out the grammatic and use the corresponding directives to establish precedence and associativity.
## Suggestions
- Use `noinput` and `nounput` directives to suppress unnecessary warnings.
---
## Comipile
```
flex scanner.l
parser bison.y
gcc -o recognizer *.c -lfl
```
## Run
```
./recognizer <okinput.txt
```
---
[< Previous assignment](https://github.com/jlsuh/TP-SSL-K2004/tree/master/assignment3-scanner-flex) - [Next assignment >](https://github.com/jlsuh/TP-SSL-K2004/tree/master/assignment5-compiler-frontend)