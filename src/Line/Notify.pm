package Line::Notify;
use strict;
use warnings;
use LWP::UserAgent;
use DATA::Dumper;
use constant { true => 0, false => 1 };
require Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw(new message stickerPackageId imageThumbnail imageFullsize imageFile sendNotify) ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

sub new {
    my ($class, %args) = @_;
    my $self = {};
    $self->{ua} = LWP::UserAgent->new;
    $self->{token} = $args{Token}; 
	return bless $self, $class;
}
sub message {
	my ($self, $msg) = @_;
	return $self->{msg} = $msg if (defined $msg);
}

sub stickerPackageId {
	my ($self, $id) = @_;
	return $self->{stickerPackageId} = $id if (defined $id);
}

sub stickerId {
	my ($self, $id) = @_;
	return $self->{stickerId} = $id if (defined $id);
}

sub imageThumbnail {
	my ($self, $img) = @_;
	return $self->{imageThumbnail} = $img if (defined $img);
}

sub imageFullsize {
	my ($self, $img) = @_;
	return $self->{imageFullsize} = $img if (defined $img);	
}

sub imageFile {
	my ($self, $img) = @_;
	return $self->{imageFile} = $img if (defined $img);	
}

sub sendNotify {
	my ( $self ) = @_;
	my @body = {
		message => $self->{msg},
		stickerPackageId => $self->{stickerPackageId},
		stickerId => $self->{stickerId},
		imageThumbnail => $self->{imageThumbnail},
		imageFullsize => $self->{imageFullsize},
		imageFile => $self->{imageFile}
	};
	my $response = $self->{ua}->post('https://notify-api.line.me/api/notify', \@body, Authorization => "Bearer $self->{token}");
	if ($response->{success}) {
		return true;
	} else {
		return false;
	}
}

1;