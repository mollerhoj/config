########################################################
# Custom Shell Config
########################################################

# Set nvim as default editor
export EDITOR=nvim

# Add bun javascript runtime to PATH
fish_add_path ~/.bun/bin


########################################################
# Do not greet on startup
########################################################
set -U fish_greeting

########################################################
# Let rbenv take over ruby installations
########################################################

status --is-interactive; and rbenv init - fish | source

########################################################
# My custom prompt with colors for git
########################################################
function fish_prompt
  set_color black -b blue
  echo -n "$(prompt_pwd --dir-length=0) "

  if test -d .git
    git_prompt
  else
    set_color blue -b normal
    echo -n " "
  end
  set_color blue -b normal
end

########################################################
# Set name of shell tabs
########################################################
function fish_title
  set -q argv[1]
  if [ $argv ]
    # Show name of running process
    echo $argv
  else
    # Show name of folder if no processes are running
    echo [(basename $PWD)]
  end
end
