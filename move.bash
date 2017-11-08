#!/bin/bash

# The informations about the desktop
INFO=$(wmctrl -d)
# The width of the desktop
DW=$(echo "${INFO}"| awk '{sub(/x[0-9]+/, "", $4); print $4}')
# The width of the workarea
WW=$(echo "${INFO}"| awk '{sub(/x[0-9]+/, "", $9); print $9}')
# The width of the desktop
DH=$(echo "${INFO}"| awk '{sub(/[0-9]+x/, "", $4); print $4}')
# The width of the workarea
WH=$(echo "${INFO}"| awk '{sub(/[0-9]+x/, "", $9); print $9}')

# The number of X windows
XW=$(($DW/$WW))
# The number of Y windows
YW=$(($DH/$WH))
# The X coordinate of the viewport
CVPX=$(echo "${INFO}" |awk '{sub(/,[0-9]+/, "", $6); print $6}')
# Current number of the face in all faces (begins with 0)
CVPN=$(( ${CVPX} / ${WW} ))

function rotate() {
  TVPX=$(( (${1} % ${XW}) * (${WW} + 200)))
  TVPY=$(( (${1} / ${XW}) * (${WH} + 200)))

  wmctrl -o ${TVPX},${TVPY}
}

rotate ${1}
