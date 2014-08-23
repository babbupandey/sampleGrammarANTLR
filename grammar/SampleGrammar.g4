/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar SampleGrammar;
r : statement | statement+ (CR|LF);

statement: (assignment | calculation);
assignment: VAR EQL NUMBER ';' ;
calculation: VAR EQL (VAR | NUMBER) CALCULATIVE_OPERAND (VAR | NUMBER) ';' ;

CALCULATIVE_OPERAND : (ADD | SUB | MUL | DIV | MOD);
NUMBER: [0123456789]+;
VAR: NameStartChar NameChar*;

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



fragment
NameChar
   : NameStartChar
   | '0'..'9'
   | '_'
   | '\u00B7'
   | '\u0300'..'\u036F'
   | '\u203F'..'\u2040';

fragment
NameStartChar
   : 'A'..'Z' | 'a'..'z'
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
