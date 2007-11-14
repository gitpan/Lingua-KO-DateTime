use strict;
use warnings;
use 5.006;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Lingua::KO::DateTime',
    AUTHOR              => 'C.H. Kang <chahkang@gmail.com>',
    VERSION_FROM        => 'lib/Lingua/KO/DateTime.pm',
    ABSTRACT_FROM       => 'lib/Lingua/KO/DateTime.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Lingua-KO-DateTime-*' },
);
