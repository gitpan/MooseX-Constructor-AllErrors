use strict;
use warnings;
use Test::More tests => 30;

{
  package Foo;
  
  use Moose;
  use MooseX::Constructor::AllErrors;

  has bar => (
    is => 'ro',
    required => 1,
  );

  has baz => (
    is => 'ro',
    isa => 'Int',
  );

  has quux => (
    is => 'ro',
    trigger => sub { my ($x, $y) = (1, 0); $x / $y; },
  );

  no Moose;
  no MooseX::Constructor::AllErrors;
}

sub tests {
  my $foo = eval { Foo->new(bar => 1) };
  is($@, '');
  isa_ok($foo, 'Foo');

  eval { Foo->new(baz => "hello") };
  my $e = $@;
  my $t;
  isa_ok($e, 'MooseX::Constructor::AllErrors::Error::Constructor');
  isa_ok($t = $e->errors->[0], 'MooseX::Constructor::AllErrors::Error::Required');
  is($t->attribute, Foo->meta->get_attribute('bar'));
  is($t->message, 'Attribute (bar) is required');
  isa_ok($t = $e->errors->[1], 'MooseX::Constructor::AllErrors::Error::TypeConstraint');
  is($t->attribute, Foo->meta->get_attribute('baz'));
  is($t->data, 'hello');
  is($t->message,
    q{Attribute (baz) does not pass the type constraint because: Validation failed for 'Int' with value hello}
  );

  is(
    $e->message,
    $e->errors->[0]->message,
    "message is first error's message",
  );

  is_deeply(
    [ map { $_->attribute->name } $e->missing ],
    [ 'bar' ],
    'correct missing',
  );

  is_deeply(
    [ map { $_->attribute->name } $e->invalid ],
    [ 'baz' ],
    'correct invalid',
  );

  is("$e", "Attribute (bar) is required at " . __FILE__ . " line 35");

  eval { Foo->new(bar => 1, quux => 1) };
  like $@, qr/Illegal division by zero/, "unrecognized error rethrown";
};

tests();
Foo->meta->make_immutable;
tests();

