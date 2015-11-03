#!/bin/bash
echo "Using $1 as wav out file and "$2" as text"
SCRIPT="$(mktemp /tmp/tts-script.XXXXX.txt)"
TMPMP3="$(mktemp /tmp/tmp-mp3.XXXXX.mp3)"
echo "Writing script..."
echo $2 > $SCRIPT
echo "Generating speech recording..."
perl "$(dirname "$0")/simple-google-tts/speak.pl" en $SCRIPT $TMPMP3 > /dev/null
echo "Converting sound file..."
mpg123 -w $1 $TMPMP3 > /dev/null 2>&1
