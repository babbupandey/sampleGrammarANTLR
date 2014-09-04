parser grammar ral;
options {tokenVocab=RALScanner; superClass=JSON;}



entity              : ENTITY VARIABLE_NAME (EXTENDS VARIABLE_NAME)? json;
class               : VARIABLE_NAME (VARIABLE_NAME| VALUES) array;


structureDef        : STRUCTURE STRUCTURE_NAME AS LOSS PREMIUM EXPENSE;
positionDef         : POSITION_NAME IS (POSITION_NAME|NUMBER) BINARY_OPERATOR (POSITION_NAME|NUMBER) ;

create_setting      : CREATE SETTINGS VARIABLE_NAME json ;
create_workflow     : CREATE WORKFLOW VARIABLE_NAME json ;
create_entity       : CREATE ENTITY VARIABLE_NAME (EXTENDS VARIABLE_NAME)? json ;
create_structure    : CREATE STRUCTURE VARIABLE_NAME AS LCURLY positionDef+ RCURLY ;

createExpr          : (create_entity | create_workflow | create_setting | create_structure) SEMI;

use                 : USE VARIABLE_NAME ;
selectExpr          : SELECT FUNCTION_NAME+ FROM STRUCTURE_NAME+ ;
whereExpr           : WHERE json;
groupExpr           : GROUP BY STRUCTURE_NAME (HAVING json)? ;

analysis            : use selectExpr (whereExpr (groupExpr)? )? ;



