grammar RAL;
import SampleGrammar;
import JsonGrammar;

ral : (create | imprt);

create : CREATE_KEYWORD EXPOSURE_TYPE json ';' ;
imprt : IMPORT_KEYWORD EXPOSURE_TYPE file_name ';' ;
file_name : var '.txt';

CREATE_KEYWORD : 'create' ;
IMPORT_KEYWORD : 'import' ;
EXPOSURE_TYPE : (CONTRACT | RISK_ITEM | PORTFOLIO) ;

CONTRACT : 'contract';
RISK_ITEM : 'risk_item';
PORTFOLIO : 'portfolio';