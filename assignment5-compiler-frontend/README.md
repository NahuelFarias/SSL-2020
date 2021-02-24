# Compiler's Frontend
## Objectives
Based on what has been done in the 4th assignment, we will add the semantic routines to have the complete compiler (in actually a front end if we consider that our pseudo assembler is intermediate code).
## Remarks
- We will group the routines that handle the dictionary in `symbol.c`. It is not required the most efficient routine, we just need one that is clear and correct.
- We will group the semantic routines in `sematic.c`, there are several micro compiler functions that can be reused, eventually with appropriate adjustments. We may also need new functions.
- At the end of the program we need to control the 3 types of errors and report the amount of each one of them.
- For temporary variables we will use `Temp#i`, where i is the temporary number.
- When semantic errors are detected, we will use YYERROR to stop parsing the statement or definition where the error occurred.
- We won't use yyerrorok.
## Pseudo assembler instructions
- When declaring a variable, we will reserve 4 bytes of memory with `Reserve` and 2 parameters, the variable name and the number of bytes to reserve.
- Load, to load the library at runtime, it should be: Load rtlib ,,
- ADD, for the sum
- SUB, for subtraction
- MUL, for multiplication
- DIV, for division
- NEG, for the unary minus. We will generate something as: NEG Var ,, VarNeg (the second operand we leave it blank)
- Store, for allocation
- Read, to read an identifier
- Write, for writing an expression
- Exit, to stop the program
## Compile
```
flex scanner.l
parser bison.y
gcc -o compiler *.c -lfl
```
## Run
```
./compiler <okinput.txt
```
---
[< Previous assignment](https://github.com/jlsuh/TP-SSL-K2004/tree/master/assignment4-parser-bison) - [Back to index >](https://github.com/jlsuh/TP-SSL-K2004)