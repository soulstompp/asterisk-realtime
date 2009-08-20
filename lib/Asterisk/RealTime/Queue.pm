package Asterisk::RealTime::Queue;

use Moose;
use MooseX::Storage;

our $VERSION = '0.01';

with Storage( 'format' => 'JSON', 'io' => 'File' );

has current_value => ( isa => 'Str', is => 'rw' );
has queue_id => ( isa => 'Str', is => 'rw' );
has application => ( isa => 'Str', is => 'rw' );
has name => ( isa => 'Str', is => 'rw' );
has music_on_hold => ( isa => 'Str', is => 'rw' );
has announce => ( isa => 'Str', is => 'rw' );
has context => ( isa => 'Str', is => 'rw' );
has timeout => ( isa => 'Str', is => 'rw' );
has monitor_join => ( isa => 'Str', is => 'rw' );
has monitor_format => ( isa => 'Str', is => 'rw' );
has queue_you_are_next => ( isa => 'Str', is => 'rw' );
has queue_there_are => ( isa => 'Str', is => 'rw' );
has queue_calls_waiting => ( isa => 'Str', is => 'rw' );
has queue_hold_time => ( isa => 'Str', is => 'rw' );
has queue_minutes => ( isa => 'Str', is => 'rw' );
has queue_seconds => ( isa => 'Str', is => 'rw' );
has queue_less_than => ( isa => 'Str', is => 'rw' );
has queue_thank_you => ( isa => 'Str', is => 'rw' );
has queue_report_hold => ( isa => 'Str', is => 'rw' );
has announce_frequency => ( isa => 'Str', is => 'rw' );
has announce_round_seconds => ( isa => 'Str', is => 'rw' );
has announce_hold_time => ( isa => 'Str', is => 'rw' );
has retry => ( isa => 'Str', is => 'rw' );
has wrap_up_time => ( isa => 'Str', is => 'rw' );
has max_length => ( isa => 'Str', is => 'rw' );
has service_level => ( isa => 'Str', is => 'rw' );
has strategy => ( isa => 'Str', is => 'rw' );
has join_empty => ( isa => 'Str', is => 'rw' );
has leave_when_empty => ( isa => 'Str', is => 'rw' );
has event_member_status => ( isa => 'Str', is => 'rw' );
has event_when_called => ( isa => 'Str', is => 'rw' );
has report_hold_time => ( isa => 'Str', is => 'rw' );
has member_delay => ( isa => 'Str', is => 'rw' );
has weight => ( isa => 'Str', is => 'rw' );
has timeout_restart => ( isa => 'Str', is => 'rw' );
has periodic_announce => ( isa => 'Str', is => 'rw' );
has periodic_announce_frequency => ( isa => 'Str', is => 'rw' );
has ring_in_use => ( isa => 'Str', is => 'rw' );

1;
