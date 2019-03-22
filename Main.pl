use strict;
use warnings;
use FindBin qw( $RealBin );
use lib "$RealBin/src";
use Line::Notify qw/:all/;

main();
sub main {
	my $token = '';
	my $line = Line::Notify->new($token);
	#$line->message();
	#$line->stickerPackageId();
	#$line->stickerId();
	#$line->imageThumbnail();
	#$line->imageFullsize();
	#$line->imageFile();
	$line->sendNotify(); # 
}