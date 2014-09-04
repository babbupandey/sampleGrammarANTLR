parser grammar JSON;
options {tokenVocab=BasicTokens;}

value               : STRING | NUMBER | json | TRUE | FALSE | NULL;
elements            : value (COMMA elements)*?;
array               : LBOX elements* RBOX;
pair                : STRING COLON value;
members             : pair (COMMA members)*?;
object              : LPAREN members* RPAREN;
json                : object | array;