package Asterisk::RealTime::QueueMember;

use Moose;
use MooseX::Storage;

our $VERSION = '0.01';

with Storage( 'format' => 'JSON', 'io' => 'File' );

has queue_id => ( isa => 'Str', is => 'rw' );
has member_name => ( isa => 'Str', is => 'rw' );
has application => ( isa => 'Str', is => 'rw' );
has interface => ( isa => 'Str', is => 'rw' );
has penalty => ( isa => 'Str', is => 'rw' );
has paused => ( isa => 'Str', is => 'rw' );

1;
