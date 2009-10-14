package Callusion::Interface::AGI;
 
use Moose::Role;

has _asterisk_agi => (
                      isa => 'Asterisk::AGI',
                      is => 'ro',
                      handles => {
                                  setcallback          => 'setcallback',
                                  set_call_back        => 'setcallback',
                                  callback             => 'callback',              #TODO: doco
                                  call_back            => 'callback',              #TODO: doco
                                  execute              => 'execute',
                                  answer               => 'answer',
                                  channel_status       => 'channel_status',
                                  control_stream_file  => 'control_stream_file',
                                  database_del         => 'database_del',
                                  database_delete      => 'database_del',          
                                  database_deltree     => 'database_deltree',
                                  database_delete_tree => 'database_deltree',
                                  database_get         => 'database_get',
                                  database_put         => 'database_put',
                                  'exec'                 => 'exec',
                                  get_data             => 'get_data',
                                  get_full_variable    => 'get_full_variable',
                                  get_option           => 'get_option',
                                  get_variable         => 'get_variable',
                                  hangup               => 'hangup',
                                  hang_up              => 'hangup',
                                  noop                 => 'noop',
                                  receive_char         => 'receive_char',
                                  receive_text         => 'receive_text',
                                  record_file          => 'record_file',
                                  say_alpha            => 'say_alpha',
                                  say_datetime_all     => 'say_datetime_all',
                                  say_date             => 'say_date',
                                  say_time             => 'say_time',
                                  say_datetime         => 'say_datetime',
                                  say_digits           => 'say_digits',
                                  say_number           => 'say_number',
                                  say_phonetic         => 'say_phonetic',
                                  send_image           => 'send_image',
                                  send_text            => 'send_text',
                                  set_autohangup       => 'set_autohangup',
                                  set_auto_hang_up     => 'set_autohangup',
                                  set_callerid         => 'set_callerid',
                                  set_caller_id        => 'set_callerid',
                                  set_context          => 'set_context',
                                  set_extension        => 'set_extension',
                                  set_music            => 'set_music',
                                  set_priority         => 'set_priority',
                                  set_variable         => 'set_variable',
                                  stream_file          => 'stream_file',
                                  play_file            => 'stream_file',
                                  play                 => 'stream_file',
                                  tdd_mode             => 'tdd_mode',
                                  verbose              => 'verbose',
                                  wait_for_digit       => 'wait_for_digit'
                                 },
                      lazy_build => 1,
                      required => 1
                     );

sub _build__asterisk_agi {
    my ($self) = @_;

    my $agi = Asterisk::AGI->new();

    return $agi;
}

#TODO: immutable

1;

=head1 NAME

Callusion::Interface::AGI - Simple Asterisk Gateway Interface Class

=head1 SYNOPSIS

use Callusion::Interface::AGI;

my $interface = Callusion::Interface::AGI;

# say the number 1984

	$interface->say_number(1984);

=head1 DESCRIPTION

This module should make it easier to write scripts that interact with the asterisk open source pbx via AGI (Asterisk Gateway Interface)

=head1 USAGE

=over 4

=item * $interface->set_call_back($function_ref)
=item * $interface->setcallback($function_ref)

Set function to execute when call is hungup or function returns error.

Example: $interface->set_call_back(\&examplecallback);

=item * $interface->answer()

Executes AGI Command "ANSWER"

Answers channel if not already in answer state

Example: $interface->answer();

Returns: -1 on channel failure, or
0 if successful

=item * $interface->channel_status([$channel])

Executes AGI Command "CHANNEL STATUS $channel"

Returns the status of the specified channel.  If no channel name is given the
returns the status of the current channel.

Example: $interface->channel_status();

Returns: -1 Channel hungup or error
         0 Channel is down and available
         1 Channel is down, but reserved
         2 Channel is off hook
         3 Digits (or equivalent) have been dialed
         4 Line is ringing
         5 Remote end is ringing
         6 Line is up
         7 Line is busy

=item * $interface->control_stream_file($filename, $digits [, $skipms [, $ffchar [, $rewchar [, $pausechar]]]])

Executes AGI Command "CONTROL STREAM FILE $filename $digits [$skipms [$ffchar [$rewchar [$pausechar]]]]"

Send the given file, allowing playback to be controled by the given digits, if
any. Use double quotes for the digits if you wish none to be permitted.
Remember, the file extension must not be included in the filename.

Note: ffchar and rewchar default to * and # respectively.

Example: $interface->control_stream_file('status', 'authorized');

Returns: -1 on error or hangup;
         0 if playback completes without a digit being pressed;
         the ASCII numerical value of the digit of one was pressed.

=item * $interface->database_delete($family, $key)
=item * $interface->database_del($family, $key)

Executes AGI Command "DATABASE DEL $family $key"

Removes database entry <family>/<key>

Example: $interface->database_delete('test', 'status');

Returns: 1 on success, 0 otherwise

=item * $interface->database_delete_tree($family, $key)
=item * $interface->database_deltree($family, $key)

Executes AGI Command "DATABASE DELTREE $family $key"

Deletes a family or specific keytree within a family in the Asterisk database

Example: $interface->database_delete_tree('test', 'status'); 
Example: $interface->database_delete_tree('test');

Returns: 1 on success, 0 otherwise

=item * $interface->database_get($family, $key)

Executes AGI Command "DATABASE GET $family $key"

Example: $var = $interface->database_get('test', 'status');

Returns: The value of the variable, or undef if variable does not exist

=item * $interface->database_put($family, $key, $value)

Executes AGI Command "DATABASE PUT $family $key $value"

Set/modifes database entry <family>/<key> to <value>

Example: $interface->database_put('test', 'status', 'authorized');

Returns: 1 on success, 0 otherwise

=item * $interface->exec($app, $options)

Executes AGI Command "EXEC $app "$options""

The most powerful AGI command.  Executes the given application passing the given options.

Example: $interface->exec('Dial', 'Zap/g2/8005551212');

Returns: -2 on failure to find application, or
whatever the given application returns

=item * $interface->get_data($filename, $timeout, $maxdigits)

Executes AGI Command "GET DATA $filename $timeout $maxdigits"

Streams $filename and returns when $maxdigits have been received or
when $timeout has been reached.  Timeout is specified in ms

Example: $interface->get_data('demo-welcome', 15000, 5);

=item * $interface->get_full_variable($variable [, $channel])

Executes AGI Command "GET FULL VARIABLE $variablename $channel"

Similar to get_variable, but additionally understands
complex variable names and builtin variables.  If $channel is not set, uses the
current channel.

Example: $interface->get_full_variable('status', 'SIP/4382');

Returns: The value of the variable, or undef if variable does not exist

=item * $interface->get_option($filename, $digits [, $timeout])

Executes AGI Command "GET OPTION $filename $digits $timeout"

Behaves similar to STREAM FILE but used with a timeout option.

Streams $filename and returns when $digits is pressed or when $timeout has been
reached.  Timeout is specified in ms.  If $timeout is not specified, the command
will only terminate on the $digits set.  $filename can be an array of files
or a single filename.

Example: $interface->get_option('demo-welcome', '#', 15000);
	 $interface->get_option(['demo-welcome', 'demo-echotest'], '#', 15000);

=item * $interface->get_variable($variable)

Executes AGI Command "GET VARIABLE $variablename"

Gets the channel variable <variablename>

Example: $interface->get_variable('status');

Returns: The value of the variable, or undef if variable does not exist

=item * $interface->hang_up($channel)
=item * $interface->hangup($channel)

Executes AGI Command "HANGUP $channel"

Hangs up the passed $channel, or the current channel if $channel is not passed.
It is left to the AGI script to exit properly, otherwise you could end up with zombies.

Example: $interface->hang_up();

Returns: Always returns 1

=item * $interface->noop()

Executes AGI Command "NOOP"

Does absolutely nothing except pop up a log message.  
 Useful for outputting debugging information to the Asterisk console.

Example: $interface->noop("Test Message");

Returns: -1 on hangup or error, 0 otherwise

=item * $interface->receive_char($timeout)

Executes AGI Command "RECEIVE CHAR $timeout"

Receives a character of text on a channel. Specify timeout to be the maximum
time to wait for input in milliseconds, or 0 for infinite. Most channels do not
support the reception of text. 

Example: $interface->receive_char(3000);

Returns: Returns the decimal value of the character if one
is received, or 0 if the channel does not support text reception.  Returns -1
only on error/hangup.

=item * $interface->receive_text($timeout)

Executes AGI Command "RECEIVE TEXT $timeout"

Receives a string of text on a channel. Specify timeout to be the maximum time
to wait for input in milliseconds, or 0 for infinite. Most channels do not
support the reception of text. 

Example: $interface->receive_text(3000);

Returns: Returns the string of text if received, or -1 for failure, error or hangup.

=item * $interface->record_file($filename, $format, $digits, $timeout, $beep, $offset, $beep, $silence)

Executes AGI Command "RECORD FILE $filename $format $digits $timeout [$offset [$beep [s=$silence]]]"

Record to a file until $digits are received as dtmf.
The $format will specify what kind of file will be recorded.
The $timeout is the maximum record time in milliseconds, or -1 for no timeout.

$offset samples is optional, and if provided will seek to the offset without
exceeding the end of the file.

$silence is the number of seconds of silence allowed before the function
returns despite the lack of dtmf digits or reaching timeout.

Example: $interface->record_file('foo', 'wav', '#', '5000', '0', 1, '2');

Returns: 1 on success, -1 on hangup or error.

=item * $interface->say_alpha($string, $digits)

Executes AGI Command "SAY ALPHA $string $digits"

Say a given character string, returning early if any of the given DTMF $digits
are received on the channel. 

Returns 
Example: $interface->say_alpha('Joe Smith', '#');

Returns: 0 if playback completes without a digit being pressed; 
         the ASCII numerical value of the digit if one was pressed;
         -1 on error/hangup.

=item * $interface->say_date($time [, $digits])

=item * $interface->say_time($time [, $digits])

=item * $interface->say_datetime($time [, $digits [, $format [, $timezone]]])

Executes AGI Command "SAY DATE $number $digits"
Executes AGI Command "SAY TIME $number $digits"
Executes AGI Command "SAY DATETIME $number $digits $format $timezone"

Say a given date or time, returning early if any of the optional DTMF $digits are
received on the channel.  $time is number of seconds elapsed since 00:00:00 on
January 1, 1970, Coordinated Universal Time (UTC), commonly known as
"unixtime." 

For say_datetime, $format is the format the time should be said in; see
voicemail.conf (defaults to "ABdY 'digits/at' IMp").  Acceptable values for
$timezone can be found in /usr/share/zoneinfo.  Defaults to machine default.

Example: $interface->say_date('100000000');
         $interface->say_time('100000000', '#'); 
         $interface->say_datetime('100000000', '#', 'ABdY IMp', 'EDT');

Returns: -1 on error or hangup;
         0 if playback completes without a digit being pressed;
         the ASCII numerical value of the digit of one was pressed.

=item * $interface->say_digits($number, $digits)

Executes AGI Command "SAY DIGITS $number $digits"

Says the given digit string $number, returning early if any of the $digits are received.

Example: $interface->say_digits('8675309');

Returns: -1 on error or hangup,
0 if playback completes without a digit being pressed, 
or the ASCII numerical value of the digit of one was pressed.

=item * $interface->say_number($number, $digits, $gender)

Executes AGI Command "SAY NUMBER $number $digits [$gender]"

Says the given $number, returning early if any of the $digits are received.

Example: $interface->say_number('98765');

Returns: -1 on error or hangup,
0 if playback completes without a digit being pressed, 
or the ASCII numerical value of the digit of one was pressed.

=item * $interface->say_phonetic($string, $digits)

Executes AGI Command "SAY PHONETIC $string $digits"

Say a given character string with phonetics, returning early if any of the
given DTMF digits are received on the channel.

Example: $interface->say_phonetic('Joe Smith', '#');

Returns: 0 if playback completes without a digit being pressed; 
         the ASCII numerical value of the digit if one was pressed;
         -1 on error/hangup.

=item * $interface->send_image($image)

Executes AGI Command "SEND IMAGE $image

Sends the given image on a channel.  Most channels do not support the transmission of images.

Example: $interface->send_image('image.png');

Returns: -1 on error or hangup,
0 if the image was sent or if the channel does not support image transmission.

=item * $interface->send_text($text)

Executes AGI Command "SEND TEXT "$text"

Sends the given text on a channel.  Most channels do not support the transmission of text.

Example: $interface->send_text('You've got mail!');

Returns: -1 on error or hangup,
0 if the text was sent or if the channel does not support text transmission.

=item * $interface->set_auto_hang_up($time)
=item * $interface->set_autohangup($time)

Executes AGI Command "SET AUTOHANGUP $time"

Cause the channel to automatically hangup at <time> seconds in the future.
Of course it can be hungup before then as well.
Setting to 0 will cause the autohangup feature to be disabled on this channel.

Example: $interface->set_auto_hang_up(60);

Returns: Always returns 1

=item * $interface->set_callerid($number)
=item * $interface->set_caller_id($number)

Executes AGI Command "SET CALLERID $number"

Changes the callerid of the current channel to <number>

Example: $interface->set_caller_id('9995551212');

Returns: Always returns 1

=item * $interface->set_context($context)

Executes AGI Command "SET CONTEXT $context"

Changes the context for continuation upon exiting the agi application

Example: $interface->set_context('dialout');

Returns: Always returns 0

=item * $interface->set_extension($extension)

Executes AGI Command "SET EXTENSION $extension"

Changes the extension for continuation upon exiting the agi application

Example: $interface->set_extension('7');

Returns: Always returns 0

=item * $interface->set_music($mode [, $class])

Executes AGI Command "SET MUSIC $mode $class"

Enables/Disables the music on hold generator.  If $class is not specified, then
the default music on hold class will be used.  $mode must be "on" or "off".

Example: $interface->set_music("on", "happy");
         $interface->set_music("off");

Returns: -1 on hangup or error, 0 otherwise.

=item * $interface->set_priority($priority)

Executes AGI Command "SET PRIORITY $priority"

Changes the priority for continuation upon exiting the agi application

Example: $interface->set_priority(1);

Returns: Always returns 0

=item * $interface->set_variable($variable, $value)

Executes AGI Command "SET VARIABLE $variable $value"

Sets the channel variable <variablename> to <value>

Example: $interface->set_variable('status', 'authorized');

Returns: Always returns 1

=item * $interface->play($file_name, $digits, $offset)
=item * $interface->play_file($file_name, $digits, $offset)
=item * $interface->stream_file($file_name, $digits, $offset)

Executes AGI Command "STREAM FILE $file_name $digits [$offset]"

This command instructs Asterisk to play the given sound file and listen for the given dtmf digits. The
fileextension must not be used in the filename because Asterisk will find the most appropriate file
type.  $filename can be an array of files or a single filename.

Example: $interface->play('demo-echotest', '0123');
	 $interface->stream_file(['demo-echotest', 'demo-welcome'], '0123');

Returns: -1 on error or hangup,
0 if playback completes without a digit being pressed,
or the ASCII numerical value of the digit if a digit was pressed

=item * $interface->tdd_mode($mode)

Executes AGI Command "TDD MODE <on|off>"

Enable/Disable TDD transmission/reception on a channel. 

Example: $interface->tdd_mode('on');

Returns: Returns 1 if successful, or 0 if channel is not TDD-capable.

=item * $interface->verbose($message, $level)

Executes AGI Command "VERBOSE $message $level"

Logs $message with verboselevel $level

Example: $interface->verbose("System Crashed\n", 1);

Returns: Always returns 1

=item * $interface->wait_for_digit($timeout)

Executes AGI Command "WAIT FOR DIGIT $timeout"

Waits up to 'timeout' milliseconds for channel to receive a DTMF digit.

Use -1 for the timeout value if you desire the call to block indefinitely.

Example: $interface->wait_for_digit($timeout);

Returns: Returns -1 on channel failure, 0 if no digit is received in the timeout, or
 the numerical value of the ascii of the digit if one is received.

=back 

=cut

1;
