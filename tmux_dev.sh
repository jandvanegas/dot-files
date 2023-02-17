# First argument session_name 
# Second argument folder
FOLDER_NAME="${PWD##*/}" 
NAME=$1
SESSION_NAME="${NAME:-$FOLDER_NAME}"
echo $SESSION_NAME
DIR=${PWD}
tmux has-session -t $SESSION_NAME
if [ $? != 0 ]
then	
# create editor with one lower terminal
	tmux new-session -s $SESSION_NAME -n editor -d -c $DIR
	# tmux split-window -h -t $SESSION_NAME -c $DIR
	# tmux resize-pane -L 50
	tmux select-window -t $SESSION_NAME:0
	# tmux split-window -v -p 10 -t $SESSION_NAME
  tmux send-keys -t $SESSION_NAME:0.0 'source .venv/bin/activate || source venv/bin/activate' C-m
  tmux send-keys -t $SESSION_NAME:0.0 'nvim' C-m

# create console window
#	tmux new-window -n console -t $SESSION_NAME -c $DIR
#	tmux select-window -t $SESSION_NAME:1
#	tmux split-window -h -p 97 -t $SESSION_NAME -c $DIR
#	tmux split-window -h -p 3 -t $SESSION_NAME -c $DIR

# create compare window
#	tmux new-window -n compare -t $SESSION_NAME -c $DIR
#	tmux select-window -t $SESSION_NAME:2
#	tmux split-window -h -p 50 -t $SESSION_NAME
fi
tmux attach -t $SESSION_NAME
