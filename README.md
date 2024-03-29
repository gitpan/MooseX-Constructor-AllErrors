# NAME

MooseX::Constructor::AllErrors - Capture all constructor errors

# VERSION

version 0.024

# SYNOPSIS

    package MyClass;
    use MooseX::Constructor::AllErrors;

    has foo => (is => 'ro', required => 1);
    has bar => (is => 'ro', isa => 'Int');

    ...

    eval { MyClass->new(bar => "hello") };
    # $@->errors has two errors, not just the missing required attribute

# DESCRIPTION

MooseX::Constructor::AllErrors tries to capture every error generated during
the construction of your objects, rather than halting after the first.

If there are errors, `$@` will contain a
[MooseX::Constructor::AllErrors::Error::Constructor](https://metacpan.org/pod/MooseX::Constructor::AllErrors::Error::Constructor) object.  See its
documentation for possible error types.

# SEE ALSO

[Moose](https://metacpan.org/pod/Moose)

# AUTHOR

Hans Dieter Pearcey <hdp@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Hans Dieter Pearcey.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

# CONTRIBUTORS

- Hans Dieter Pearcey <hdp@weftsoar.net>
- Jesse Luehrs <doy@tozt.net>
- Karen Etheridge <ether@cpan.org>
- Shawn Sorichetti <ssoriche@gmail.com>
