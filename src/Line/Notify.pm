package Line::Notify;
use strict;
use warnings;
use LWP::UserAgent;
use DATA::Dumper;
use constant { true => 0, false => 1 };
require Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw(new sendNotify) ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

sub new {
	my ($class, %args) = @_;
	my $self = {};
	$self->{ua} = LWP::UserAgent->new;
	$self->{token} = $args{Token}; 
	return bless $self, $class;
}

sub sendNotify {
	my ( $self, %args) = @_;
	my @body = {
		message => $args{message},
		stickerPackageId => $args{stickerPackageId},
		stickerId => $args{stickerId},
		imageThumbnail => $args{imageThumbnail},
		imageFullsize => $args{imageFullsize},
		imageFile => $args{imageFile}
	};
	my $response = $self->{ua}->post('https://notify-api.line.me/api/notify', \@body, Authorization => "Bearer $self->{token}");
	if ($response->{success}) {
		return true;
	} else {
		return false;
	}
}

1;
