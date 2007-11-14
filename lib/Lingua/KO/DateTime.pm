package Lingua::KO::DateTime;

use strict;
use warnings;

our $VERSION='0.02';

my $charset;

my $dt_string = {
                'euc-kr' =>     {
                        'year'   => '년',
                        'month'  => '월',
                        'day'    => '일',
                        'hour'   => '시',
                        'minute' => '분',
                        'second' => '초',
                },
}; 
my $lc_string = {
                'month'=>       {
                    'jan'       =>      '1',    'feb'   =>      '2',    'mar'   =>      '3',
                    'apr'       =>      '4',    'may'   =>      '5',    'jun'   =>      '6',
                    'Jul'       =>      '7',    'aug'   =>      '8',    'sep'   =>      '9',
                    'sept'      =>      '9',    'oct'   =>      '10',   'nov'   =>      '11',
                    'dec'       =>      '12'
                },
                'day' => {
                    '1'         =>      '1',    '2'     =>      '2',    '3'     =>      '3',
                    '4'         =>      '4',    '5'     =>      '5',    '6'     =>      '6',
                    '7'         =>      '7',    '8'     =>      '8',    '9'     =>      '9',
                    '10'        =>      '10',   '11'    =>      '11',   '12'    =>      '12',
                    '13'        =>      '13',   '14'    =>      '14',   '15'    =>      '15',
                    '16'        =>      '16',   '17'    =>      '17',   '18'    =>      '18',
                    '19'        =>      '19',   '20'    =>      '20',   '21'    =>      '21',
                    '22'        =>      '22',   '23'    =>      '23',   '24'    =>      '24',
                    '25'        =>      '25',   '26'    =>      '26',   '27'    =>      '27',
                    '28'        =>      '28',   '29'    =>      '29',   '30'    =>      '30',
                    '31'        =>      '31'            
                },
                'hour' => {
                    '1'         =>      '1',    '2'     =>      '2',    '3'     =>      '3',
                    '4'         =>      '4',    '5'     =>      '5',    '6'     =>      '6',
                    '7'         =>      '7',    '8'     =>      '8',    '9'     =>      '9',
                    '10'        =>      '10',   '11'    =>      '11',   '12'    =>      '12',
                    '13'        =>      '13',   '14'    =>      '14',   '15'    =>      '15',
                    '16'        =>      '16',   '17'    =>      '17',   '18'    =>      '18',
                    '19'        =>      '19',   '20'    =>      '20',   '21'    =>      '21',
                    '22'        =>      '22',   '23'    =>      '23',   '24'    =>      '24'    
                }, 
};


sub new {
    my ($class,%args) = @_;
    my $self = {};
    $charset = $args{'charset'} if ($args{'charset'});

    bless $self, $class;
    return $self;
}




sub set_env {
    my ( $self, %args ) = @_;
    $charset = $args{'charset'} if ($args{'charset'}) ;

    return(1);
}

sub convert {
    my ( $self, %args ) = @_;
    my ($week,$year,$mon,$day,$hour,$min,$sec,$date,$time);

    if (!$args{'asctime'}) {
        $args{'asctime'} = localtime();
    }

    ($week,$mon,$day,$time,$year) = split(/\s+/,$args{'asctime'});
    ($hour,$min,$sec) = split(/:/,$time);
    $mon = lc($mon);

    $args{'output'} = "datetime" if(!$args{'output'});
    $charset = "euc-kr" if(!$charset);


    $date = $year . $dt_string->{$charset}{"year"} . " " .
            $lc_string->{'month'}{$mon} . $dt_string->{$charset}{"month"} . " " .
            $lc_string->{'day'}{$day} . $dt_string->{$charset}{"day"};

    $time = $hour . $dt_string->{$charset}{"hour"} . " " .
            $min . $dt_string->{$charset}{"minute"} . " " .
            $sec . $dt_string->{$charset}{"second"};


    return $date if($args{'output'} eq 'date');
    return $time if($args{'output'} eq 'time');
    return "$date $time" if($args{'output'} eq 'datetime');
}


=head1 NAME

Lingua::KO::DateTime - convert time to korean format.

=head1 SYNOPSIS

=head1 DESCRIPTION

This module can convert asctime to korean format.
you can select euc-kr charset.
asctime is ASC C standard format will from C<localtime> like this:

        $asctime = localtime();

=head1 METHOD

=head2 new

        my $kdt = new Lingua::KO::DateTime(charset=>'euc-kr');

Instantiates a new object.

=head2 set_env

        my $kdt->set_env(charset=>'euc-kr');

set charset encode.

=over 2

=item * charset -> euc-kr only now.

=back

=head2 convert

        $kdt->convert(asctime=>'Thu Oct 13 04:54:34 1994',output=>'date');

=over 2

=item * asctime -> input asctime data.

=item * output -> output in 3 types: date,time,datetime.

=back

=head1 AUTHORS

Lingua::KO::DateTime by C.H. Kang

=head1 COPYRIGHT

The Lingua::KO::DateTime module is Copyright (c) 2007 C.H. Kang  All rights reserved.

You may distribute under the terms of either the GNU General Public
License or the Artistic License, as specified in the Perl README file.

=head1 WARRANTY

The Lingua::KO::DateTime is free Open Source software.

IT COMES WITHOUT WARRANTY OF ANY KIND.

=cut

1;
