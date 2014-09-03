parser grammar ral;
import json;
options {tokenVocab=ralScanner; superClass=json;}

create_setting          : CREATE SETTINGS VARIABLE_NAME json SEMI ;
create_workflow         : CREATE WORKFLOW VARIABLE_NAME json SEMI ;
create_entity           : CREATE ENTITY VARIABLE_NAME (EXTENDS VARIABLE_NAME)? json SEMI ;

position_name           : VARIABLE_NAME (BANG VARIABLE_NAME)? ;
position_definition     : position_name
positionExpression      : VARIABLE_NAME IS VARIABLE_NAME)? ;

use             : USE VARIABLE_NAME ;



analysis        :