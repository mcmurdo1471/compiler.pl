use Tokeniser::Tokeniser;
use strict;
use warnings;
use feature 'say';
#use Data::Printer;


sub statement {
	my @args = @_;
#	...
	# Makes a statement thing
	return @args;
}

sub fail {
	say "FAIL: " . shift;
}

sub parse_statement {
	my @tokens = @_;
	my @args;
	for my $token (@tokens) {
		if($token ne "RETURN_KEYWORD") {
			fail "Missing return in statement";
			return;
		}
		push @args, $token;
		next;
		if($token ne "INT_KEYWORD") {
			fail "Missing INT for return";
			return;
		}
		push @args, $token;
		next;
		if($token ne "SEMICOLON") {
			fail "Missing semi-colon closing return statement";
			return;
		}
		push @args, $token;
		return statement(@args); 
	}
}

my $file_tokeniser = Tokeniser::Tokeniser->new ( filename => '../write_a_c_compiler/stage_1/valid/return_2.c');

say 'working...';
say $file_tokeniser->next_token;
say $file_tokeniser->next_token;
say $file_tokeniser->next_token;
say $file_tokeniser->next_token;
say 'finished.';
