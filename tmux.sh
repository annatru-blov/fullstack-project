#!/bin/bash

function run() {
  tmux send-keys -t $1 "$2" C-m
}

if [[ $TMUX ]]; then
  tmux new-window -n 'Grid'

  tmux split-window -v -t 'Grid'
  tmux split-window -h -t 'Grid.0'

  run 'Grid.1' "cd be-api && nest start"
  run 'Grid.2' "cd fe-web && npm run dev"


  tmux select-layout tiled
else
  tmux new-session $0
fi