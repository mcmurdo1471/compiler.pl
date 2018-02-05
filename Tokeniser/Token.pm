package Tokeniser::Token;

use strict;
use warnings;
use Carp qw(carp croak);

our $VERSION="1.00";

sub new {
	my($class, %args) = @_;

	my $self = bless({}, $class);

	$self->{type} = $args{type};
	$self->{value} = $args{value};
}

sub Type {
	my $self = shift;
	return $self->{type};
}

sub Value {
	my $self = shift;
	return $self->{value};
}

1;
