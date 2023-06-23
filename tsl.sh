#!/bin/sh
#
# Check geomety
# this is very important because it's a RPIVATE layout,
# i.e. tailored personaly

#####################
# for the moment: harcoded private values
# c - columns
# r - rows
# r - rows
c=300
r=140

rws=$(tput lines)
cls=$(tput cols)

if [ $rws -ne $r -o $cls -ne $c ] ; then
  echo "Wrong terminal geomety: columns = $cls\trows = $rws"
  echo "Expected: $c x $r!"
  exit
fi

# Process arguments
# or the initial test values are hardcoded

session="$1"
script="$2"

if [ ! $session ] ; then
  session="test"
fi

if [ ! $script ] ; then
  script="clear"
fi

window="$session:0"
#
# TODO Check for existing session:
# if [ $( tmux has -t $session ) -eq 0 ] ; then
#   echo "Session $session already exists..."
#   exit
# fi
#
tmux new-session -s $session -x $c -y $r -d



#
# Create layout
# split window by panes and run a start script
# in each new pane.
#
# Layout:
#
#  +-----+-----+-----+
#  |           |     |
#  |           |     |
#  |           |     |
#  +-----+-----+-----+
#  |     |     |     |
#  |     |     |     |
#  |     |     |     |
#  +-----+-----+-----+
#
# tmux select-window -t $window
tmux split-window -t $window -v -l 50%

tmux select-pane -t 0
tmux split-pane -h -l 199 -b
tmux swap-pane -s 0 -t 1

tmux select-pane -t 2
tmux split-pane -h -l 99 -b

tmux select-pane -t 3
tmux split-pane -h -l 99 -b

for i in {0..4}
do
  tmux select-pane -t $i
  tmux send-keys $script C-m
  tmux send-keys "cls" C-m
done

tmux select-pane -t 1

tmux attach-session -t $session
