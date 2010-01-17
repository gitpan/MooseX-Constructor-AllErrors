
use strict;
use warnings;



use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'MooseX-Constructor-AllErrors',
  NAME      => 'MooseX::Constructor::AllErrors',
  AUTHOR    => "Hans\ Dieter\ Pearcey\ \<hdp\@cpan\.org\>",
  ABSTRACT  => "capture\ all\ constructor\ errors",
  VERSION   => '0.010',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::More" => '0',
    "Test::Exception" => '0',
    "Moose" => '0.90',
  },
  test => {TESTS => 't/*.t'}
);

