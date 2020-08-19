#!/bin/bash


seconds=$(($2*60))
echo $seconds
increment=$(echo "scale=2;40/$seconds"|bc)
echo $increment

seconds_sleep=$(($1*60))
sleep $seconds_sleep

pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 40%
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play


for ((i=0; i<$seconds; i++))
do
  val=$(echo $(echo "scale=2;40-($i*$increment)+1"|bc)|cut -f1 -d".")
  echo $val
  pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo $val%
  sleep 1.0
done


pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 0%
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
