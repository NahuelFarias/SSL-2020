# Elementary scanner
## Objectives
We will be programming a deterministic finite automaton which will be able to recognize 3 different types of sublanguages:

1. Integers: these strings are formed by decimal digits only.
2. Identifiers: these strings start with a letter (it doesn't matter if it's in uppercase or not) and followed by a sequence of alphanumeric characters.
3. Hash: this sublanguage is formed by just a single hash (#) character.

The incoming textfile, which the program will be analyzing, could contain different lexemes from these sublanguages. Whitespaces are ignored, their only purpose is to provide legibility by spacing out each lexemes. By saying 'white spaces' we mean: blank spaces, horizontal tabs & new lines.

The textfile would contain characters that weren't taken into account, e.g.: asterisks, arithmetic operators, etc.
In case of identifying any string formed by these, it must be considered as an error. The automaton must inform the error after going through the lexeme and be ready for the next scan. We can conclude then, an error is regarded as another sublanguage to recognize.

The program must analyze the input (we'll be redirecting the textfile through stdin) and inform what has come across. It must then inform the total number of lexemes that were found by each lexical category.

### Example
Given the input:
```
total 123 Mesa34 @?¡<>@89640 SILLA56 *+%
,#	bien 571##$%
```
The output should be:
```
identifier
integer
identifier
error
integer
identifier
error
error
hash
identifier
integer
hash
hash
error
----
Total:
identifiers 4
integers 3
hashes 3
errors 4
```
## Note
Just to clarify, identified lexemes are:
```
Identifiers: total, Mesa34, SILLA56, bien
Integers: 123, 89640, 571
Errors: @?¡<>@ *+% , $%
```
## Remark
The program should be at least divided by 3 files: `main.c`, `scanner.c` & `scanner.h`

`main.c` must invoke the scanner, inform the tokens found & accumulate the amounts of lexemes by their lexical categories which should be informed at the end.

`scanner.c` implements the automaton, returning the token (lexical category) found.

Other files can be added as desired. Transition table must be documented (textfile or spreadsheet). The program must compile correctly by the C11/C17 standard and must be strictly attached to it. This means, the program shouldn't contain operative system dependent code.

---
## Compile
```
gcc -o scanner *.c
```
## Run
```
./scanner <input.txt
```
---
[< Back to index](https://github.com/jlsuh/TP-SSL-K2004) - [Next assignment >](https://github.com/jlsuh/TP-SSL-K2004/tree/master/assignment2-mini-language-bnf)