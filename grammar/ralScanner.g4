lexer grammar ralScanner;
import BasicTokens;

options {superClass=BasicTokens;}

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
ENTITY              : E N T I T Y;