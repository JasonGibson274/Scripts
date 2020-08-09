#!/bin/bash

pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 0%
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play

echo $1

seconds=$(($1*60))
echo $seconds
increment=$(echo "scale=2;60/$seconds"|bc)
echo $increment

for ((i=0; i<$seconds; i++))
do
  val=$(echo $(echo "scale=2;$i*$increment"|bc)|cut -f1 -d".")
  echo $val
  pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo $val%
  sleep 1
done


pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 60%
