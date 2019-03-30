use strict;
use warnings;
use FindBin qw( $RealBin );
use lib "$RealBin/src";
use Line::Notify qw/:all/;

main();
sub main {
	my $line = Line::Notify->new( Token => '');
	$line->sendNotify( message => 'sctnightcoreiscuteboy' ); # 
}
=put
$line->sendNotify(
	message => '',
	stickerPackageId => '',
	stickerId => '',
	imageThumbnail => '',
	imageFullsize => '',
	imageFile => '',
);
=cut