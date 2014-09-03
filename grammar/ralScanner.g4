lexer grammar ralScanner;
import BasicTokens;

options {superClass=BasicTokens;}

USE                 : U S E;
SELECT              : S E L E C T;
FROM                : F R O M;
WHERE               : W H E R E;
GROUP               : G R O U P ;
BY                  : B Y;
HAVING              : H A V I N G;
CREATE              : C R E A T E;
WORKFLOW            : W O R K F L O W;
SETTINGS            : S E T T I N G S;
EXTENDS             : E X T E N D S;
ENTITY              : E N T I T Y;
SCHEDULE            : S C H E D U L E;
ALTER               : A L T E R;
AS                  : A S;
STRUCTURE           : S T R U C T U R E;
IS                  : I S;
NET                 : N E T;
GROSS               : G R O S S;

POSITION_TYPE            : NET | GROSS | NUMBER;
FUNCTION_NAME            : VARIABLE_NAME LPAREN POSITION_TYPE+ RPAREN ;


