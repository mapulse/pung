#!/usr/bin/env perl

use strict;
use warnings;
use Image::Magick;

my $image = Image::Magick->new;
$image->read($ARGV[0]);

my ($cols, $rows) = ($image->Get('columns'), $image->Get('rows'));
my @pixels = $image->GetPixels(x => 0, y => 0, width => $cols, height => $rows, map => 'RGBA');

my @buf = ();

binmode STDOUT;
foreach (@pixels) {
    if (scalar @buf == 4) {
        print "$buf[2]$buf[1]$buf[0]$buf[3]";
        @buf = ();
    }
    push @buf, (pack 'C', $_ & 0xff);
}
