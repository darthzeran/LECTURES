grammar SimpleEnglish;

sentence
	:	nounPhrase verbPhrase
	;

nounPhrase
	:	ARTICLE ADJECTIVE NOUN
	|	ARTICLE NOUN
	;

verbPhrase
	:	VERB ADVERB
	|	VERB
	;
	
ARTICLE	: 	'a' 
	| 	'the'
	;
	
ADJECTIVE
	: 	'large' | 'hungry'
	;

NOUN	:	'rabbit' | 'mathematician'
	;

VERB	:	'eats' | 'hops'
	;
	
ADVERB	:	'quickly' | 'wildly'	
	;
	
WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;