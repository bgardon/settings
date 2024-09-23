#!/bin/bash

set -x

tmx2 kill-session -t 'work2'
tmx2 kill-session -t 'work'

tmx2 new-session -d -s 'work'

tmx2 rename-window -t 0 'kvm-v'
tmx2 new-window -n 'kvm'
tmx2 new-window -n '9xx-v'
tmx2 new-window -n '9xx'
tmx2 new-window -n '11xx-v'
tmx2 new-window -n '11xx'
tmx2 new-window -n 'ICB-v'
tmx2 new-window -n 'ICB'
tmx2 new-window -n 'G3'
tmx2 new-window -n 'G3-2'
tmx2 new-window -n 'scratch'

tmx2 split-window -v -t 'kvm'
tmx2 split-window -v -t '9xx'
tmx2 split-window -v -t '11xx'
tmx2 split-window -v -t 'ICB'

tmx2 send-keys -t 'kvm-v' 'cd ~/kvm' C-m
tmx2 send-keys -t 'kvm.0' 'cd ~/kvm' C-m
tmx2 send-keys -t 'kvm.1' 'cd ~/kvm' C-m

tmx2 send-keys -t '9xx-v' 'cd ~/9xx' C-m
tmx2 send-keys -t '9xx.0' 'cd ~/9xx' C-m
tmx2 send-keys -t '9xx.1' 'cd ~/9xx' C-m

tmx2 send-keys -t '11xx-v' 'cd ~/11xx' C-m
tmx2 send-keys -t '11xx.0' 'cd ~/11xx' C-m
tmx2 send-keys -t '11xx.1' 'cd ~/11xx' C-m

tmx2 send-keys -t 'ICB-v' 'cd ~/icebreaker' C-m
tmx2 send-keys -t 'ICB.0' 'cd ~/icebreaker' C-m
tmx2 send-keys -t 'ICB.1' 'cd ~/icebreaker' C-m

tmx2 send-keys -t 'G3' 'g4d clean' C-m

tmx2 new-session -d -s 'work2' -t 'work'
tmx2 new-session -d -s 'work3' -t 'work'
tmx2 new-session -d -s 'work4' -t 'work'

tmx2 a -t 'work'

set +x
