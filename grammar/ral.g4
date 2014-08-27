grammar ral;

create_settings : CREATE SETTINGS VARIABLE_NAME json ';' ;
create_workflow : CREATE WORKFLOW VARIABLE_NAME json ';' ;
use_case        : USE VARIABLE_NAME json ';' ;

json: json_array | json_string;
json_array: '[' (json_string | json_array) (',' json_string)* (',' json_array)* ']' ;
json_string: '{' keyValues (',' json_string)* (',' json_array)* '}';
keyValues : keyValuePair (',' keyValues)* ;
keyValuePair: key ':' value;

value: (str | NUMBER);
key: '\"' VARIABLE_NAME '\"' ;
str: '\"' STRING '\"';



USE                 : U S E;
SELECT              : S E L E C T;
FROM                : F R O M;
WHERE               : W H E R E;
GROUPBY             : G R O U P WHITE_SPACE B Y;
HAVING              : H A V I N G;
CREATE              : C R E A T E;
WORKFLOW            : W O R K F L O W;
SETTINGS            : S E T T I N G S;
EXTENDS             : E X T E N D S;
NUMBER              : (DIGIT+ | '-' DIGIT+ | '+' DIGIT+);
VARIABLE_NAME       : NAME_START NAME_CHAR*;
STRING              : NAME_CHAR+;
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

fragment DIGIT  : '0'..'9';

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
