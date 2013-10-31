use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.05

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/MooseX/Constructor/AllErrors.pm',
    'lib/MooseX/Constructor/AllErrors/Error.pm',
    'lib/MooseX/Constructor/AllErrors/Error/Constructor.pm',
    'lib/MooseX/Constructor/AllErrors/Error/Misc.pm',
    'lib/MooseX/Constructor/AllErrors/Error/Required.pm',
    'lib/MooseX/Constructor/AllErrors/Error/TypeConstraint.pm',
    'lib/MooseX/Constructor/AllErrors/Role/Object.pm'
);

notabs_ok($_) foreach @files;
done_testing;
