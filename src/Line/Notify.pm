package Line::Notify;
use strict;
use warnings;
use LWP::UserAgent;
use DATA::Dumper;
require Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw(new AddMsg sendNotify) ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

sub new {
	my $class = shift;
	my ($token) = @_;
	my $self = {
		token => shift
	};
	bless $self, $class;
	return $self;
}

sub message {
	my ($self, $msg) = @_;
	return $self->{msg} = $msg;
}

sub stickerPackageId {
	my ($self, $id) = @_;
	return $self->{stickerPackageId} = $id;
}

sub stickerId {
	my ($self, $id) = @_;
	return $self->{stickerId} = $id;
}

sub imageThumbnail {
	my ($self, $img) = @_;
	return $self->{imageThumbnail} = $img;
}

sub imageFullsize {
	my ($self, $img) = @_;
	return $self->{imageFullsize} = $img;	
}

sub imageFile {
	my ($self, $img) = @_;
	return $self->{imageFile} = $img;	
}

sub sendNotify {
	my ( $self ) = @_;
	my $ua = LWP::UserAgent->new;
	my $response = $ua->post('https://notify-api.line.me/api/notify', {	
			message => $self->{msg},
			stickerPackageId => $self->{stickerPackageId},
			stickerId => $self->{stickerId},
			imageThumbnail => $self->{imageThumbnail},
			imageFullsize => $self->{imageFullsize},
			imageFile => $self->{imageFile}
		},
			Authorization => "Bearer $self->{token}",
	);
	if ($response->{success}) {
		return 0;
	} else {
		return 1;
	}
}


1;