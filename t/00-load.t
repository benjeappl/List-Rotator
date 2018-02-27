#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'List::Rotator' ) || print "Bail out!\n";
}

diag( "Testing List::Rotator $List::Rotator::VERSION, Perl $], $^X" );
