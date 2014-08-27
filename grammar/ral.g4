grammar ral;
import BasicTokens;

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

WHITE_SPACE         : [ \t\r\n]+ -> skip;


