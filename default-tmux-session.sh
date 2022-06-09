# Script to set up a tmux session for code experiments!

# Make sure you have a session name variable defined
if [[ -z "$1" ]]; then
    echo "No session name provided; aborting"
else

    # Make the session
    tmux -2 new-session -d -s "$1"

    # Set up a window for code
    tmux rename-window -t "$1":1 code
    tmux send-keys "cd $2" C-m

    # Set up a window for processes
    tmux new-window -t "$1":2 -n "proc"
    tmux send-keys "nvidia-smi; free -h" C-m

    # Set up a few other windows for logs/testing/running
    for name in data log jup "test" run; do
        tmux new-window -t "$1" -n "$name"
        tmux send-keys "cd $2" C-m
    done
fi
