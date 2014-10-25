#!perl -T

use Test::More tests => 4;

BEGIN {
	use_ok( 'Lingua::KO::DateTime' );
}

diag( "Testing Lingua::KO::DateTime $Lingua::KO::DateTime::VERSION, Perl $], $^X" );

# Test 2
my $kdt = Lingua::KO::DateTime->new( charset => 'euc-kr' );
my $string = $kdt->convert( asctime => 'Thu Oct 13 04:54:34 1994', output => 'datetime' );
is ( $string, '1994�� 10�� 13�� 04�� 54�� 34��', 'coversion is correct' );

# Test 3
$kdt = Lingua::KO::DateTime->new( charset => 'euc-kr' );
$string = $kdt->convert( asctime => 'Thu Oct 13 04:54:34 1994', output => 'date' );
is ( $string, '1994�� 10�� 13��', 'coversion is correct' );

# Test 4
$kdt = Lingua::KO::DateTime->new( charset => 'euc-kr' );
$string = $kdt->convert( asctime => 'Thu Oct 13 04:54:34 1994', output => 'time' );
is ( $string, '04�� 54�� 34��', 'coversion is correct' );
