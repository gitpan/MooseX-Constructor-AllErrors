# vim: ts=4 sts=4 sw=4
package MooseX::Constructor::AllErrors::Error;
BEGIN {
  $MooseX::Constructor::AllErrors::Error::AUTHORITY = 'cpan:HDP';
}
# ABSTRACT: base class for individual constructor errors
$MooseX::Constructor::AllErrors::Error::VERSION = '0.024';
use Moose;
use namespace::autoclean;

1;

__END__

=pod

=encoding UTF-8

=for :stopwords Hans Dieter Pearcey

=head1 NAME

MooseX::Constructor::AllErrors::Error - base class for individual constructor errors

=head1 VERSION

version 0.024

=head1 DESCRIPTION

This is the base class for errors held by a
L<MooseX::Constructor::AllErrors::Error::Constructor> object. All error types
support at least this minimal interface.

=head1 METHODS

=head2 message

Returns a human-readable error message for this error.

=head1 SEE ALSO

L<Moose>

=head1 AUTHOR

Hans Dieter Pearcey <hdp@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Hans Dieter Pearcey.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
