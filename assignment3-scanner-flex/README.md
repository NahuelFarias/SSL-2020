# Implementing a scanner with Flex
## Objectives
We will be implementing the scanner made on assignment 1 (from scratch), but this time with Flex. We need to keep in mind that all returned tokens are not strictly as the documented ones. These can be modularized for a better implementation, e.g. a token for each keyword, punctuator and operator.
## Remarks
- There must be an `enum` which groups the tokens in `tokens.h`.
- Flex's definition must not contain user's code section. Additional code must be added in `main.c`.
- The scanner implemented with Flex shall:
  - Return the token in case of finding a grammatical element.
    - It will show the corresponding lexeme in case of finding an identifier or integer.
    - It will show the corresponding character in case of finding a single character.
  - Ignore commentaries.
  - Show messages for expected errors with the corresponding lexeme:
    - Invalid string
    - Invalid integer
    - Invalid identifier
- Must use `header-file` and `oufile` directives.
## Suggestions
- Use `noinput` and `nounput` to supress unnecessary warnings.
- The first member of `enum tokens` must be `FDT` (end-of-file).
- Use `yytext` to show lexemes in `main.c`.
## Compile
```
flex scanner.l
gcc -o scanner *.c -lfl
```
## Run
```
./scanner <input.txt
```
---
[< Previous assignment](https://github.com/jlsuh/TP-SSL-K2004/tree/master/assignment2-mini-language-bnf) - [Next assignment >](https://github.com/jlsuh/TP-SSL-K2004/tree/master/assignment4-parser-bison)