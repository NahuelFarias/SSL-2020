# Mini's BNF
## Objectives
We will be designing the BNF (basic BNF, with recursion if needed. It's important to not be mistaken with EBNF) of the 'Mini' language's grammatic, both lexical and syntactic.
## Remarks
- The designed BNF must inherit the same format as the C language's BNF.
- This grammatic is the official documentation of 'mini' language, which will be subsequently used for implementation purposes, but not strictly as documented. It's required to specify which are the tokens of the language.
---
# Mini Language
We will informally define, through examples, a language called 'Mini' (due to 'Minimal language').

For the purpose of illustrating this language, we can start by defining 'what is known as a correct program in Mini':

```mini
programa
  declarar var1;
  declarar var2;
  leer (var1, var2);
  declarar total; ## comentario
  total <- var1 + 3 * -var2;
  var2 <- 2 * (5 + 4);
  escribir (total/2);
fin-prog
```
A correct program in Mini starts with the keyword `programa` and finishes with the keyword `fin-prog`. There must be a list of statements in between them. It can eventually be an empty list of statements.

To simplify, let's consider that all types of declaration are a type of statement. Variable declarations can take place anywhere in the program, but must be declared before using it in any type of statement.

All statements and declarations finish with `;`.

Blank spaces (space, horizontal tab, new line) are ignored.

Commentaries can be added. These start with `##` and end with a new line.

All variables are considered as Integers. Declaration of variables starts with the keyword `declarar` followed by the identifier and ends with `;`.

Variables' identifiers must start with a letter (uppercased or not) and could be followed with alphanumeric digits. All keywords are lowercased (as shown in this document).

Keywords in Mini are:
- `leer`
- `escribir`
- `asignacion` (the symbol for it is `<-`)

Expressions in Mini have operators such as:
- Multiplication: `*`
- Division: `/`
- Addition: `+`
- Subtraction: `-`

In all cases, associativity is from left to right. The precedence of `*` and `/` are the same, but superior to `+` and `-` (these last two have the same precedence).

The `-` symbol can operate as an unary operator for inverting the sign of the operand located at his right. This operator has greater precedence than `*` and `/`.

The following expressions are valid in Mini:

```mini
-x * y; ## inverts sign of x first and it gets multiplied by y afterwards
x + -y; ## inverts sign of y and then the addition occurs
x--y; ## inverts sign of y and then the subtraction occurs
```
We can also alter the precedence by using parenthesis. Operands can be integers and variables. Integers are formed with decimal digits, hence they can only represent positive numbers and get the sign inversion through the unary subtraction.
## Semantic aspects
Variables must be declared before its usage and it's not considered right to duplicate a declaration. Therefore we can only have two kinds of semantic errors:
- Declaring more than once the same variable (redeclaration).
- Using an undeclared variable in a statement (no declaration).
## Error handling
It's not part of the language, but we could consider 3 kinds of lexical errors we want to identify:
- Common error: formed by a sequence of one or more invalid characters (we treated as the 'others' column on assignment 1, i.e.: @ or !. e.g.: !::&)
- Identifier error: formed by an identifier that starts with at least an invalid character, followed by more invalid characters and/or characters that can be part of a correct identifier. e.g.: total$, total2@a!1
- Integer error: formed by a digit and followed by alphanumeric characters. e.g.: 123ab , 56A7
---
[< Previous assignment](https://github.com/jlsuh/TP-SSL-K2004/tree/master/assignment1-elementary-scanner) - [Next assignment >](https://github.com/jlsuh/TP-SSL-K2004/tree/master/assignment3-scanner-flex)