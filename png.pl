#!/usr/bin/env perl

use strict;
use warnings;

use Image::Imlib2;

open my $input, "<", $ARGV[0] or die "Could not open $ARGV[0]";
read $input, my $data, my $length = -s $input;

while ($length++ % 4) { }

my $width = int(sqrt($length / 4));
my $height = int($length / 4 / $width + 1);
$length = $width * $height * 4;
while (length $data < $length) {
    $data .= "\x00\x00\x00\x00";
}

my $img = Image::Imlib2->new_using_data($width, $height, $data);
$img->set_quality(101);
$img->save((split /\./, $ARGV[0])[0] . ".png");

