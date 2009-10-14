package Callusion::Interface::RealTime::IAXBuddy;

use Moose;
use MooseX::Storage;

our $VERSION = '0.01';

with Storage( 'format' => 'JSON', 'io' => 'File' );

has current_value => ( isa => 'Str', is => 'rw' );
has iax_buddy_id => ( isa => 'Str', is => 'rw' );
has name => ( isa => 'Str', is => 'rw' );
has user_name => ( isa => 'Str', is => 'rw' );
has relationship => ( isa => 'Str', is => 'rw' );
has secret => ( isa => 'Str', is => 'rw' );
has md5_secret => ( isa => 'Str', is => 'rw' );
has db_secret => ( isa => 'Str', is => 'rw' );
has no_transfer => ( isa => 'Str', is => 'rw' );
has in_keys => ( isa => 'Str', is => 'rw' );
has out_key => ( isa => 'Str', is => 'rw' );
has auth => ( isa => 'Str', is => 'rw' );
has account_code => ( isa => 'Str', is => 'rw' );
has ama_flags => ( isa => 'Str', is => 'rw' );
has caller_id  => ( isa => 'Str', is => 'rw' );
has context => ( isa => 'Str', is => 'rw' );
has default_ip => ( isa => 'Str', is => 'rw' );
has host => ( isa => 'Str', is => 'rw' );
has language => ( isa => 'Str', is => 'rw' );
has mail_box => ( isa => 'Str', is => 'rw' );
has deny => ( isa => 'Str', is => 'rw' );
has permit => ( isa => 'Str', is => 'rw' );

1;
