lexer grammar CommonTokens;
@header{package com.rms.ral;}

USE                 : U S E;
SELECT              : S E L E C T;
FROM                : F R O M;
WHERE               : W H E R E;
GROUP               : G R O U P ;
BY                  : B Y;
HAVING              : H A V I N G;
CREATE              : C R E A T E;
WORKFLOW            : W O R K F L O W;
SETTINGS            : S E T T I N G S;
EXTENDS             : E X T E N D S;
ENTITY              : E N T I T Y;
VALUES              : V A L U E S;
STRUCTURE           : S T R U C T U R E;
AS                  : A S;
IS                  : I S;
LOSS                : L O S S ;
PREMIUM             : P R E M I U M ;
EXPENSE             : E X P E N S E ;
SCHEDULE            : S C H E D U L E;
ALTER               : A L T E R;
NET                 : N E T;
GROSS               : G R O S S;
TRUE                : T R U E;
FALSE               : F A L S E;
NULL                : N U L L;
STRING              : '"' (ESCAPE | ~["\\])* '"' ;
NUMBER              : INT (FRAC | EXP | FRAC EXP)? ;
COMMA               : ',';
LCURLY              : '{';
RCURLY              : '}';
LPAREN              : '(';
RPAREN              : ')';
LBOX                : '[';
RBOX                : ']';
COLON               : ':';
SEMI                : ';';
BANG                : '!';
PLUS                : '+';
MINUS               : '-';
DIVIDE              : '/';
MULTIPLY            : '*';
MODULO              : '%';
EXPONENT            : '^';
BINARY_OPERATOR     : PLUS | MINUS | DIVIDE | MULTIPLY | MODULO | EXPONENT;

VARIABLE_NAME       : NAME_START NAME_CHAR*;

POSITION_TYPE       : NET | GROSS | NUMBER;
FUNCTION_NAME       : VARIABLE_NAME LPAREN POSITION_TYPE+ RPAREN ;
POSITION_NAME       : VARIABLE_NAME (BANG VARIABLE_NAME)? ;
STRUCTURE_NAME      : VARIABLE_NAME ;

WHITE_SPACE         : [ \t\r\n]+ -> skip;

fragment NAME_START
                : A | B | C | D | E | F | G | H | I | J | K | L | M
                 | N | O | P | Q | R | S | T | U | V | W | X | Y | Z
                 | '\u00C0'..'\u00D6'
                 | '\u00D8'..'\u00F6'
                 | '\u00F8'..'\u02FF'
                 | '\u0370'..'\u037D'
                 | '\u037F'..'\u1FFF'
                 | '\u200C'..'\u200D'
                 | '\u2070'..'\u218F'
                 | '\u2C00'..'\u2FEF'
                 | '\u3001'..'\uD7FF'
                 | '\uF900'..'\uFDCF'
                 | '\uFDF0'..'\uFFFD';

fragment NAME_CHAR
                : NAME_START
                 | DIGIT
                 | '_'
                 | '\u00B7'
                 | '\u0300'..'\u036F'
                 | '\u203F'..'\u2040';

fragment A      : ('a'|'A');
fragment B      : ('b'|'B');
fragment C      : ('c'|'C');
fragment D      : ('d'|'D');
fragment E      : ('e'|'E');
fragment F      : ('f'|'F');
fragment G      : ('g'|'G');
fragment H      : ('h'|'H');
fragment I      : ('i'|'I');
fragment J      : ('j'|'J');
fragment K      : ('k'|'K');
fragment L      : ('l'|'L');
fragment M      : ('m'|'M');
fragment N      : ('n'|'N');
fragment O      : ('o'|'O');
fragment P      : ('p'|'P');
fragment Q      : ('q'|'Q');
fragment R      : ('r'|'R');
fragment S      : ('s'|'S');
fragment T      : ('t'|'T');
fragment U      : ('u'|'U');
fragment V      : ('v'|'V');
fragment W      : ('w'|'W');
fragment X      : ('x'|'X');
fragment Y      : ('y'|'Y');
fragment Z      : ('z'|'Z');

fragment DIGITS     : DIGIT DIGITS*;
fragment DIGIT      : [0-9];
fragment EX          : ('e'|'E')('+'|'-')?;
fragment EXP        : EX DIGITS;
fragment FRAC       : '.' DIGITS;
fragment INT        : '-'? ('0' | [1-9][0-9]*);
fragment ESCAPE     : '\\' (["\\/bfnrt]|UNICODE );
fragment UNICODE    : 'u' HEX HEX HEX HEX;
fragment HEX        : [0-9a-fA-F];