use strict;
use warnings;
use feature 'say';
use Data::Printer;

my $_DEBUG = 1;

sub bark {
	say shift if $_DEBUG;
}

bark "ULTIMATE COMPILER";

my %tokens = (
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

sub statement {
	my @args = @_;
	...
	# Makes a statement thing
}

sub parse_statement {
	my @tokens = @_;
	my @args;
	for $token (@tokens) {
		if($token != "RETURN_KEYWORD") {
			fail "Missing return in statement";
			return;
		}
		push @args, $token;
		next;
		if($token != "INT_KEYWORD") {
			fail "Missing INT for return";
			return;
		}
		push @args, $token;
		next;
		if($token != "SEMICOLON") {
			fail "Missing semi-colon closing return statement";
			return
		}
		push @args, $token;
		return statement(@args); 
	}
}

sub get_next_token {
	my $line = shift;
	my $token = 'unknown';

	foreach my $key (keys %tokens) {
		my $re = '^\s*' . $tokens{$key};
		if($line =~ /($re)/) {
			return ($1, $key);
		}
	}
	return ('^\S+\s', 'unknown');	
}

	#p %tokens;
sub tokenise_file {
	# Get file content
	my $file = shift;
	open(my $fh, '<', $file) or die "Could not open file $file: $!";
	my @content = <$fh>;
	chomp @content;
	close $fh;

	my @token_list;

	# match ^token, remove ^token, next
	foreach my $line (@content) {
		bark "Processing line: $line";
		while($line =~ /\S/) {
			my ($match, $token) = get_next_token $line;
			$line =~ s/\Q$match\E//;
			bark "$match, $token";
			push @token_list, $token;
		}
	}
	return @token_list;
}

my @token_list = tokenise_file './program.c';
p @token_list;
# TODO I bet @token_list has to be a hash
