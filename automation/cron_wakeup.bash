#!/bin/bash

pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 0%
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play

seconds=$(($(( $RANDOM % 10 + 10))*60))
echo $seconds
increment=$(echo "scale=2;50/$seconds"|bc)
echo $increment

for ((i=0; i<$seconds; i++))
do
  #echo "scale=6;($i*$increment)"|bc
  #echo $(echo $(echo "scale=6;($i*$increment)+1"|bc) | cut -f1 -d ".")
  val=$(echo $(echo "scale=6;($i*$increment)+1"|bc) | cut -f1 -d ".")
  echo $val
  pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo $val%
  sleep 1.0
done


pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 50%
