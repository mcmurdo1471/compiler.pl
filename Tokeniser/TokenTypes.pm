package Tokeniser::TokenTypes;

use strict;
use warnings;
use Carp qw(croak carp);

our %token_type = (
	'OPEN_BRACE' => '{',
	'CLOSE_BRACE' => '}',
	'OPEN_PARENS' => '\(',
	'CLOSE_PARENS' => '\)',
	'SEMICOLON' => ';',
	'INT_KEYWORD' => 'int',
	'RETURN_KEYWORD' => 'return',
	'IDENTIFIER' => '[a-zA-Z]\w*',
	'INTEGER_LITERAL' => '[0-9]+'
	);

1;
