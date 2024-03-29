use 5.006;
use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.039

use Test::More 0.94 tests => 7 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'MooseX/Constructor/AllErrors.pm',
    'MooseX/Constructor/AllErrors/Error.pm',
    'MooseX/Constructor/AllErrors/Error/Constructor.pm',
    'MooseX/Constructor/AllErrors/Error/Misc.pm',
    'MooseX/Constructor/AllErrors/Error/Required.pm',
    'MooseX/Constructor/AllErrors/Error/TypeConstraint.pm',
    'MooseX/Constructor/AllErrors/Role/Object.pm'
);



# no fake home requested

my $inc_switch = -d 'blib' ? '-Mblib' : '-Ilib';

use File::Spec;
use IPC::Open3;
use IO::Handle;

open my $stdin, '<', File::Spec->devnull or die "can't open devnull: $!";

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, $^X, $inc_switch, '-e', "require q[$lib]");
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';
    my @_warnings = <$stderr>;
    waitpid($pid, 0);
    is($?, 0, "$lib loaded ok");

    if (@_warnings)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};

BAIL_OUT("Compilation problems") if !Test::More->builder->is_passing;
