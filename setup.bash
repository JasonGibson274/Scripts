#!/bin/bash
# go to first workspace


# init 0
#bash move.bash 0&

# init 1
bash move.bash 1&
sleep 0.1
emacs -mm&
disown
sleep 1

# init 5
bash move.bash 5&
sleep 0.1
firefox&
disown
sleep 1

# init
bash move.bash 4&
sleep 0.1
slack&
disown
sleep 0.1
evolution
disown
sleep 0.1
