package Asterisk::RealTime::User;

use Moose;
use MooseX::Storage;

our $VERSION = '0.01';

with Storage( 'format' => 'JSON', 'io' => 'File' );

has user_id => ( isa => 'Str', is => 'rw' );
has user_name => ( isa => 'Str', is => 'rw' );
has internal_extension => ( isa => 'Str', is => 'rw' );
has password => ( isa => 'Str', is => 'rw' );
has pin => ( isa => 'Str', is => 'rw' );
has first_name => ( isa => 'Str', is => 'rw' );
has last_name => ( isa => 'Str', is => 'rw' );
has email => ( isa => 'Str', is => 'rw' );
has pager => ( isa => 'Str', is => 'rw' );
has timezone => ( isa => 'Str', is => 'rw' );
has charset => ( isa => 'Str', is => 'rw' );

1;
