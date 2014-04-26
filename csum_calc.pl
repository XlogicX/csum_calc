#!/usr/bin/perl
use warnings;
use strict;

my @barcode = split('', $ARGV[0]);
my $variable = 0;
my @end = (2,6,0,0);
my $sum;

sub csum {
	$sum = ((($barcode[0] + $barcode[2] + $barcode[4] + $variable + $end[0] + $end[2]) * 3) + $barcode[1] + $barcode[3] + $barcode[5] + $end[1]) % 10;
	$sum = 10 - $sum if ($sum ne 0);
}

csum();
while ($sum ne 0) {
	$variable++;
	csum();
}

print join('',@barcode) . $variable . "0" . join('',@end) . "\n";
