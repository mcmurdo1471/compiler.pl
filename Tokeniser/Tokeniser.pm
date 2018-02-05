package Tokeniser::Tokeniser;

use strict;
use warnings;
use Carp qw(carp croak);

use Tokeniser::Token;
use Tokeniser::TokenTypes;

our $VERSION = 1.00;

my $file_content;
my @token_list;
my $index = 0;

sub new {
	my($class, %args) = @_;

	my $self = bless({}, $class);

	open my $fh, '<', $args{filename} or croak "Could not open '$args{filename}' $!\n";
	

	my @content = <$fh>;
	chomp @content;
	close $fh;

	# match ^token, remove ^token, next
	foreach my $line (@content) {
		while($line =~ /\S/) {
			my ($match, $token) = get_next_token ( line => $line );
			$line =~ s/\Q$match\E//;
			push @token_list, $token;
		}
	}
}

sub get_next_token {
	my $self = shift;
# TODO can't use string as hash ref while strict...
	my $line = $self->{line};
	my $token = 'unknown';
	my %types = %Tokeniser::TokenTypes::token_type;

# TODO "return" matched by RETURN_KEYWORD _and_ IDENTIFIER...
	foreach my $key (keys %types) {
		my $re = '^\s*' . $types{$key};
		if($line =~ /($re)/) {
			return ($1, $key);
		}
	}
	return ('^\S+\s', 'unknown');	
}

sub next_token {
	my $self = shift;
	return $token_list[$index++];
}	

1;
