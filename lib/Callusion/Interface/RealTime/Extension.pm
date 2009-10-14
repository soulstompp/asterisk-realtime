package Callusion::RealTime::Interface::Extension;

use Moose;
use MooseX::Storage;

our $VERSION = '0.01';

with Storage( 'format' => 'JSON', 'io' => 'File' );

has extension_id => ( isa => 'Str', is => 'rw' );
has context => ( isa => 'Str', is => 'rw' );
has extension => ( isa => 'Str', is => 'rw' );



1;
