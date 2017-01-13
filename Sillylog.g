grammar Sillylog;

s
	:	'N'  ID idL
		KNIGHTS ID idL
        	PROPS ID '(' e ')' eL
	;

idL
	: 	',' ID idL
    	|
	;

e
	: 	t x
    	;

x	
	:	'&&' e
	|
	;
t
    	: 	'!' u
    	|	u
    	;
    	
u
    	: 	ID
    	| 	'(' e ')'
    	;

eL
    	: 	ID '(' e ')' eL
    	|
    	;


KNAVES	: 'Knaves'
	;
	
KNIGHTS	: 'Knights'
	;
	
PROPS	: 'Propositions'
	;
	
ID  	:	('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    	;

WS  	:   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    	;

fragment
HEX_DIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC_SEQ
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    |   UNICODE_ESC
    |   OCTAL_ESC
    ;

fragment
OCTAL_ESC
    :   '\\' ('0'..'3') ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7') ('0'..'7')
    |   '\\' ('0'..'7')
    ;

fragment
UNICODE_ESC
    :   '\\' 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
    ;
