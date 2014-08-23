/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar SampleGrammar;
r : statement | statement+ (CR|LF);

statement: (assignment | calculation);
assignment: var EQL number ';' ;
calculation: var EQL (var | number) CALCULATIVE_OPERAND (var | number) ';' ;
var: NAME_START_CHAR name_char* ;
number: DIGIT+;
name_char : NAME_START_CHAR | DIGIT;

CALCULATIVE_OPERAND : (ADD | SUB | MUL | DIV | MOD);



WHITE_SPACE : [ \r\t\n]+ -> skip ;

ADD : '+';
SUB : '-';
MUL : '*';
DIV : '/';
MOD : '%';
EQL : '=';
CR  : '\r';
LF  : '\n';
SP  : ' ';
QT  : '\"' ;
CLN : ':';
DIGIT: [0-9];
NON_ZERO_DIGIT: [1-9];
NAME_START_CHAR : [a-zA-Z_$];

