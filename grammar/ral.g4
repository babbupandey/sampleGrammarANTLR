parser grammar ral;
import json;
options {tokenVocab=ralScanner; superClass=json;}

create_settings : CREATE SETTINGS VARIABLE_NAME json SEMI ;
create_workflow : CREATE WORKFLOW VARIABLE_NAME json SEMI ;
use_case        : USE VARIABLE_NAME json SEMI ;