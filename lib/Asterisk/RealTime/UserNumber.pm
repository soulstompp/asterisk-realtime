package Asterisk::RealTime::UserNumber;

use Moose;
use MooseX::Storage;

our $VERSION = '0.01';

with Storage( 'format' => 'JSON', 'io' => 'File' );

user_number_id => ( isa => 'Str', is => 'rw' );
user_id => ( isa => 'Str', is => 'rw' );
number_type => ( isa => 'Str', is => 'rw' );
number => ( isa => 'Str', is => 'rw' );
availability => ( isa => 'Str', is => 'rw' );

1;
