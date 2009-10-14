package Callusion::Interface::RealTime::ExtensionPriority;

use Moose;
use MooseX::Storage;

our $VERSION = '0.01';

with Storage( 'format' => 'JSON', 'io' => 'File' );

has extension_id => ( isa => 'Str', is => 'rw' );
has priority => ( isa => 'Str', is => 'rw' );
has app => ( isa => 'Str', is => 'rw' );
has app_data => ( isa => 'Str', is => 'rw' );

1;
