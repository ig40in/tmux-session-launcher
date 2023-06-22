# Tmux Session Launcher


# Repo for working on tmux session launcher

This script should start a new tmux session with **HARDCODED** values of panes ant their sizes. 
This is a **personal** preference! 
Despite this this script can be used as a reference for the futher customization.

Names of the session and initial script, which should be executed in each new pane,
should be passed as parameters.

## Usage:

$ tsl session-name scrpt-name

If both parameters are missing, default values will be used:  

  - for session-name: test
  - for script-name: ''
 
##  Layout:

```
  +-----+-----+-----+
  |           |     |
  |           |     |
  |           |     |
  +-----+-----+-----+
  |     |     |     |
  |     |     |     |
  |     |     |     |
  +-----+-----+-----+
```

