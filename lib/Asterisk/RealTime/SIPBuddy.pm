package Asterisk::RealTime::SIPBuddy;

use Moose;
use MooseX::Storage;

our $VERSION = '0.01';

with Storage( 'format' => 'JSON', 'io' => 'File' );

has current_value => ( isa => 'Str', is => 'rw' );
has sip_buddy_id => ( isa => 'Str', is => 'rw' );
has name => ( isa => 'Str', is => 'rw' );
has host => ( isa => 'Str', is => 'rw' );
has relationship => ( isa => 'Str', is => 'rw' );
has nat => ( isa => 'Str', is => 'rw' );
has account_code => ( isa => 'Str', is => 'rw' );
has ama_flags => ( isa => 'Str', is => 'rw' );
has call_limit => ( isa => 'Str', is => 'rw' );
has call_group => ( isa => 'Str', is => 'rw' );
has caller_id => ( isa => 'Str', is => 'rw' );
has can_call_forward => ( isa => 'Str', is => 'rw' );
has can_reinvite => ( isa => 'Str', is => 'rw' );
has context => ( isa => 'Str', is => 'rw' );
has default_ip => ( isa => 'Str', is => 'rw' );
has dtmf_mode => ( isa => 'Str', is => 'rw' );
has from_user => ( isa => 'Str', is => 'rw' );
has from_domain => ( isa => 'Str', is => 'rw' );
has insecure => ( isa => 'Str', is => 'rw' );
has language => ( isa => 'Str', is => 'rw' );
has mail_box => ( isa => 'Str', is => 'rw' );
has md5_secret => ( isa => 'Str', is => 'rw' );
has deny => ( isa => 'Str', is => 'rw' );
has permit => ( isa => 'Str', is => 'rw' );
has mask => ( isa => 'Str', is => 'rw' );
has music_on_hold => ( isa => 'Str', is => 'rw' );
has pick_up_group => ( isa => 'Str', is => 'rw' );
has qualify => ( isa => 'Str', is => 'rw' );
has register_extension => ( isa => 'Str', is => 'rw' );
has rtp_timeout => ( isa => 'Str', is => 'rw' );
has rtp_hold_timeout => ( isa => 'Str', is => 'rw' );
has secret  => ( isa => 'Str', is => 'rw' );
has set_variable => ( isa => 'Str', is => 'rw' );
has disallow => ( isa => 'Str', is => 'rw' );
has allow => ( isa => 'Str', is => 'rw' );
has full_contact => ( isa => 'Str', is => 'rw' );
has ip_address => ( isa => 'Str', is => 'rw' );
has port => ( isa => 'Str', is => 'rw' );
has register_server => ( isa => 'Str', is => 'rw' );
has register_seconds => ( isa => 'Str', is => 'rw' );
has user_name => ( isa => 'Str', is => 'rw' );

1;
