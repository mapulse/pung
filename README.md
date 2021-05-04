# pung

fuck around with audio and pngs. pung is a script that embeds a wav file (or any file, really) into a png file. then, you can apply
various image effects to the png, extract the audio (or whatever), and listen to / view it.

## setup

install `sox` and `perl`, as well as the perl modules `Image::Imlib2` and `Image::Magick`. then `chmod +x png.pl` and `chmkd +x depng.pl`.

## usage

```
./png.pl file.wav > file.png
# edit the png here - gimp, imagemagick, whatever
./depng.pl file.png > file2.wav
sox --ignore-length file2.wav file3.wav # IMPORTANT! do not skip this step if you're using audio files, otherwise
                                        # your audio will be corrupted and unusable.
```

be sure not to touch the first, say, 10 rows of the png - that's where the wav header is and touching it will mess things
up.


also any audio you create will prob be very loud and annoying - use at your own risk.
