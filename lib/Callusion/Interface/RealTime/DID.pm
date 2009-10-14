package Callusion::Interface::Realtime::DID;

use Moose::Role;

our $VERSION = '0.01';

has vendor_id => ( isa => 'Int', is => 'rw' );
has number => ( isa => 'Str', is => 'rw' );
has status => ( isa => 'Str', is => 'rw' );
has minute_rate => ( isa => 'Int', is => 'rw' );
has monthly_rate => ( isa => 'Int', is => 'rw' );

1;
