package Line::Notify;
use strict;
use warnings;
use LWP::UserAgent;
use DATA::Dumper;
use constant { true => 0, false => 1 };
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
		message => defined($args{message}) ? $args{message} : '',
		stickerPackageId => defined($args{stickerPackageId}) ? $args{stickerPackageId} : '',
		stickerId => defined($args{stickerId}) ? $args{stickerId} : '',
		imageThumbnail => defined($args{imageThumbnail}) ? $args{imageThumbnail} : '',
		imageFullsize => defined($args{imageFullsize}) ? $args{imageFullsize} : '',
		imageFile => defined($args{imageFile}) ? $args{imageFile} : ''
	};
	my $response = $self->{ua}->post('https://notify-api.line.me/api/notify', \@body, Authorization => "Bearer $self->{token}");
	if ($response->{success}) {
		#TODO RETURN DATA
		return true;
	} else {
		return false;
	}
}

1;
