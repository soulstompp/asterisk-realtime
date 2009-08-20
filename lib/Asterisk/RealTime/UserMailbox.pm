package Asterisk::RealTime::UserMailbox;

use Moose;
use MooseX::Storage;

our $VERSION = '0.01';

with Storage( 'format' => 'JSON', 'io' => 'File' );

has user_id => ( isa => 'Str', is => 'rw' );
has users_context => ( isa => 'Str', is => 'rw' );
has read_envelope => ( isa => 'Str', is => 'rw' );
has max_message_time => ( isa => 'Str', is => 'rw' );
has messages_limit => ( isa => 'Str', is => 'rw' );
has min_message_length => ( isa => 'Str', is => 'rw' );
has max_greeting_time => ( isa => 'Str', is => 'rw' );
has skip_milliseconds => ( isa => 'Str', is => 'rw' );
has max_login_attempts => ( isa => 'Str', is => 'rw' );
has message_review => ( isa => 'Str', is => 'rw' );
has operator_available => ( isa => 'Str', is => 'rw' );
has say_caller_id => ( isa => 'Str', is => 'rw' );
has send_voicemail => ( isa => 'Str', is => 'rw' );
has dial_out_context => ( isa => 'Str', is => 'rw' );
has call_back_context => ( isa => 'Str', is => 'rw' );
has exit_context => ( isa => 'Str', is => 'rw' );
has next_after_cmd => ( isa => 'Str', is => 'rw' );
has use_directory => ( isa => 'Str', is => 'rw' );
has force_name => ( isa => 'Str', is => 'rw' );
has hide_from_dir => ( isa => 'Str', is => 'rw' );
has temporary_greeting_warn => ( isa => 'Str', is => 'rw' );
has attach_file => ( isa => 'Str', is => 'rw' );
has delete_after_send => ( isa => 'Str', is => 'rw' );
has external_notification => ( isa => 'Str', is => 'rw' );
has external_password => ( isa => 'Str', is => 'rw' );
has external_password_notify => ( isa => 'Str', is => 'rw' );
has sms_body => ( isa => 'Str', is => 'rw' );
has email_body => ( isa => 'Str', is => 'rw' );
has volume_gain => ( isa => 'Str', is => 'rw' );
has smdi_enable => ( isa => 'Str', is => 'rw' );
has smdi_port => ( isa => 'Str', is => 'rw' );

1;
