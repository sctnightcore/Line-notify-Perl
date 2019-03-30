use strict;
use warnings;
use FindBin qw( $RealBin );
use lib "$RealBin/src";
use Line::Notify qw/:all/;

main();
sub main {
	my $line = Line::Notify->new( Token => '');
	#$line->message();
	#$line->stickerPackageId();
	#$line->stickerId();
	#$line->imageThumbnail();
	#$line->imageFullsize();
	#$line->imageFile();
	#$line->sendNotify(); # 
}
=put
TODO 
$line->message(
	message => '',
	stickerPackageId => '',
	stickerId => '',
	imageThumbnail => '',
	imageFullsize => '',
	imageFile => '',
);
It better ? 

=cut