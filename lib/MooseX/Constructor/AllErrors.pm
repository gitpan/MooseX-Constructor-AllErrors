package MooseX::Constructor::AllErrors;
our $VERSION = '0.007';


use strict;
use warnings;

use Moose ();
use Moose::Exporter;
use Moose::Util::MetaRole;
use MooseX::Constructor::AllErrors::Role::Object;
use MooseX::Constructor::AllErrors::Role::Meta::Method::Constructor;

Moose::Exporter->setup_import_methods;

sub init_meta {
  shift;
  my %options = @_;

  Moose->init_meta(%options);

  Moose::Util::MetaRole::apply_base_class_roles(
    for_class => $options{for_class},
    roles => [ 'MooseX::Constructor::AllErrors::Role::Object' ],
  );

  Moose::Util::MetaRole::apply_metaclass_roles(
    for_class => $options{for_class},
    constructor_class_roles => [
      'MooseX::Constructor::AllErrors::Role::Meta::Method::Constructor',
    ],
  );
}

1;

__END__

=head1 NAME

MooseX::Constructor::AllErrors - capture all constructor errors

=head1 VERSION

version 0.007

=head1 SYNOPSIS

  package MyClass;
  use MooseX::Constructor::AllErrors;

  has foo => (is => 'ro', required => 1);
  has bar => (is => 'ro', isa => 'Int');

  ...

  eval { MyClass->new(bar => "hello") };
  # $@->errors has two errors, not just the missing required attribute

=head1 DESCRIPTION

MooseX::Constructor::AllErrors tries to capture every error generated during
the construction of your objects, rather than halting after the first.

If there are errors, C<$@> will contain a
L<MooseX::Constructor::AllErrors::Error::Constructor> object.  See its
documentation for possible error types.

=begin Pod::Coverage

init_meta

=end Pod::Coverage

=head1 SEE ALSO

L<Moose>

=head1 AUTHOR

  Hans Dieter Pearcey <hdp@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Hans Dieter Pearcey. This is free
software; you can redistribute it and/or modify it under the same terms as perl
itself. 

=cut