grammar Chess;

game	:	s sL
	;
	
s	:	R '.' m r
	;
	
r	: 	m
	| 	
	;

sL	:	s sL
	|	
	;
	
m	:	P w 
	|	F x
	;

w	:	F R c
	|	'x' F R c
	;	
	
x	:	R c
	| 	'x' F R c
	;
	
c 	:	'+' 
	|	'#' 
	|
	;

// Rank
R	: 	('0'..'9')+
	;
	
// File
F	: 	'a'..'h'
	;

// Pieces
P	:	'K' 
	|	'Q'
	|	'N'
	|	'R'
	|	'B'
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
