package Callusion::Application::Role::Collector::DateTime;

use Moose::Role;

#TODO: get the timezone from config or maybe the caller id?
use DateTime;
use DateTime::Format::Strptime;

has date => (
             isa => 'DateTime',
             is => 'rw',
             default => sub { return DateTime->now(); },
             handles => { 
                         'current_month' => 'month', 
                         'current_day' => 'day', 
                         'current_year' => 'year', 
                         'current_hour' => 'hour', 
                         'current_seconds' => 'seconds' 
                        },
            );

has _interface => (
                  isa => 'Callusion::Interface::CommandBased',
                  is => 'ro',
                  default => sub { return Callusion::Interface::AGI->new(); },
                 );

sub get_time {
    my ($self) = @_;

    my $now = DateTime->now();

    #TODO: timezone awareness badly needed
    my $time_parser = DateTime::Format::Strptime->new( pattern => '%H%m' );

    my $time_digits = $self->_prompt_for_date();

    #TODO: error check the date
    my $given_date_time = $time_parser->parse_datetime($time_digits);

    $given_date_time->set(
                          month => $self->current_month(),
                          days => $self->current_day(),
                          year => $self->current_year(),
                         );

    if ($given_date_time->hour() < $self->current_hour()) { # Means it is tomorrow
        $given_date_time->add(days => 1);
    }

    return $given_date_time;;    
}

sub get_date {
    my ($self) = @_;

    my $now = DateTime->now();

    #TODO: timezone awareness badly needed
    #TODO: internationalization
    my $date_parser = DateTime::Format::Strptime->new( pattern => '%H%M' );

    my $date_digits = $self->_prompt_for_date();

    #TODO: error check the date
    my $given_date_time = $date_parser->parse_datetime($date_digits);

    $given_date_time->set(
                          month => $self->current_month(),
                          days => $self->current_day(),
                          year => $self->current_year(),
                         );

    if ($given_date_time->hour() < $self->current_hour()) { # Means it is tomorrow
        $given_date_time->add(days => 1);
    }

    return $given_date_time;;    
}

sub get_date_time {
    my ($self) = @_;

    #TODO: internationalization
    my $date_time_parser = DateTime::Format::Strptime->new( pattern => '%M%D%Y%H%m' );

    my $date_digits = $self->_prompt_for_date();
    my $time_digits = $self->_prompt_for_time();

    my $given_date_time = $date_time_parser->parse_datetime($date_digits . $time_digits);

    return $given_date_time; 
}

sub _prompt_for_date {
    my ($self) = @_;

    #TODO: use today
    #TODO: error check the date collection
    #TODO: internationalization
    my $digits = $self->interface()->get_data("enter-a-date", 4);

    return $digits; 
}

sub _prompt_for_time {
    my ($self) = @_;

    #TODO: error check the time collection
    #TODO: internationalization
    my $digits = $self->interface()->get_data("enter-a-time", 4);

    return $digits; 
}

#TODO: immutability

1;
