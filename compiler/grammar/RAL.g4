grammar RAL;
import CommonTokens;
@header{package com.rms.ral;}


structureDef        : STRUCTURE STRUCTURE_NAME AS LOSS PREMIUM EXPENSE ;
positionDef         : POSITION_NAME IS (POSITION_NAME|NUMBER) BINARY_OPERATOR (POSITION_NAME|NUMBER) ;

create_setting      : CREATE SETTINGS VARIABLE_NAME json ;
create_workflow     : CREATE WORKFLOW VARIABLE_NAME json ;
create_entity       : CREATE ENTITY VARIABLE_NAME (EXTENDS VARIABLE_NAME)? json ;
create_structure    : CREATE STRUCTURE VARIABLE_NAME AS LCURLY positionDef+ RCURLY ;

createExpr          : (create_entity | create_workflow | create_setting | create_structure) SEMI ;

use                 : USE VARIABLE_NAME ;
selectExpr          : SELECT FUNCTION_NAME+ FROM STRUCTURE_NAME+ ;
whereExpr           : WHERE json;
groupExpr           : GROUP BY STRUCTURE_NAME (HAVING json)? ;

analysis            : use selectExpr (whereExpr (groupExpr)? )? ;

/** JSON GRAMMAR **/

value               : STRING | NUMBER | json | TRUE | FALSE | NULL ;
elements            : value (COMMA elements)*? ;
array               : LBOX elements* RBOX ;
pair                : STRING COLON value ;
members             : pair (COMMA members)*? ;
object              : LCURLY members* RCURLY ;
json                : object | array ;