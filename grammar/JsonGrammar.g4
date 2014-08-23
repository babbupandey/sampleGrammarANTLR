/*
* JSON parser
* taken from: http://json.org/
*/

grammar JsonGrammar;
import SampleGrammar;

json: json_array | json_string;
json_array: '[' (json_string | json_array) (',' json_string)* (',' json_array)* ']' ;
json_string: '{' keyValues (',' json_string)* (',' json_array)* '}';
keyValues : keyValuePair (',' keyValues)* ;
keyValuePair: key CLN value;

value: str | number;
key: QT var QT ;
str: QT name_char* QT;

/* //taken from: http://json.org/
HEX_CHAR: [0-9a-f];
e : 'e' | 'e+' | 'e-' | 'E' | 'E+' | 'E-';
digits: DIGIT digits* ;
exp : e digits;
frac : '.' digits;
positive_int : DIGIT | NON_ZERO_DIGIT digits;
negative_int : '-' (DIGIT | NON_ZERO_DIGIT digits);
int: positive_int | negative_int;
number: int | int frac | int exp | int frac exp;
UNI_HEX : '\u'HEX_CHAR{4,4};
char: ~('\"' | '\\' |'\/' |'\b' |'\f' |'\n' |'\r' |'\t') ;
chars: (char | char chars);
string: QT chars* QT;

value: string | number | object | array | 'true' | 'false' | 'null';
elements: value (',' elements)* ;
array: '[' elements* ']';
pair: string ':' value;
members: pair (',' members)*;
object: '{' members* '}';
*/