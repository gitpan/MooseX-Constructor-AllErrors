# vim: ts=4 sts=4 sw=4
package MooseX::Constructor::AllErrors::Meta::Class;
our $VERSION = '0.003';


use Moose::Role;

use MooseX::Constructor::AllErrors::Error;
#use MooseX::Constructor::AllErrors::Error::Construct;

# XXX pretty much copied from Moose::Meta::Class
override construct_instance => sub {
    my $class = shift;
    my $params = @_ == 1 ? $_[0] : {@_};
    my $meta_instance = $class->get_meta_instance;

    my $instance = $params->{'__INSTANCE__'} || $meta_instance->create_instance();
    my $error = MooseX::Constructor::AllErrors::Error::Constructor->new(
        # XXX stupid magic number
        caller => [ caller(4) ],
    );
    foreach my $attr ($class->compute_all_applicable_attributes()) {
        eval { 
            $attr->initialize_instance_slot($meta_instance, $instance, $params);
        };
        if (my $e = $@) {
            if (blessed $e and 
                $e->isa('MooseX::Constructor::AllErrors::Error')) {
                $error->add_error($@); 
            } else {
                die $e;
            }
        }
    }
    if ($error->has_errors) {
        $class->throw_error($error, params => $params);
    }
    return $instance;
};

1;
