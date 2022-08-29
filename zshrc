# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
omz="~/.oh-my-zsh"
export ZSH="${omz/#\~/$HOME}"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="blinks"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  extract
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# make ctl-r returns immediately

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# Appends every command to the history file once it is executed
setopt inc_append_history


export BAT_THEME="gruvbox-dark"

export FZF_MARKS_JUMP=^h

export FZFZ_SUBDIR_LIMIT=0
export FZFZ_EXTRA_OPTS="--reverse"
#export FZF_CTRL_R_OPTS="--reverse"
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {} |sed -e \"s/^ *\([0-9]*\) *//\" -e \"s/.\\{\$COLUMNS\\}/&\\n/g\"' --preview-window down:3:hidden --bind ?:toggle-preview"

export LD_LIBRARY_PATH="/usr/local/lib/"

export TERM="xterm-256color"
#export TERM="screen-256color"

alias v="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias spaces="du -hsx * | sort -h"
alias space="du -hx * | sort -h"

alias rg1="rg --max-depth=1"

alias tm="tmux"
alias tma="tmux a"

alias rgf='rg --files | rg'
alias pdf='cd /Users/supasorn/pdf_signer; source ~/venv/bin/activate; python multisign.py'

fshere() {
  cmd="sshfs -o cache=no -o IdentityFile=/home/$USER/.ssh/id_rsa $USER@$@ $PWD"
  echo $cmd
  eval $cmd
  cd ..
  cd -
} 

source-git() {
  target=~/.zsh/$1:t:r
  plugin=$target/$1:t:r.plugin.zsh
  if [ ! -d "$target" ] ; then
    git clone $1 $target
    #echo "git clone $1 $target"
  fi
  if [ ! -f "$plugin" ]; then
    plugin=$target/$1:t:r
  fi
  source $plugin
  #echo "source $plugin"
}

source-git https://github.com/supasorn/fzf-z.git  # ctrl-g function
source-git https://github.com/changyuheng/zsh-interactive-cd.git 
source-git https://github.com/zsh-users/zsh-autosuggestions.git 
source-git https://github.com/hchbaw/zce.zsh.git  # easy motion
source-git https://github.com/urbainvaes/fzf-marks

bindkey '^[[Z' autosuggest-accept
bindkey '^f' zce

zstyle ':zce:*' bg 'fg=3'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

UNAME=$(uname | tr "[:upper:]" "[:lower:]")
if [[ "$UNAME" == "linux" ]]; then
  export NOCONDA_PATH="$PATH:/usr/local/cuda-10.2/bin"
  export PATH="$NOCONDA_PATH:/home2/$USER/anaconda3/bin"

  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-10.2/lib64:/usr/local/cuda/extras/CUPTI/lib64"
fi

unset TMUX  # allow nested tmux
hn="$(hostname)"

export CUDA_DEVICE_ORDER=PCI_BUS_ID

LFCD="$HOME/.config/lf/lfcd.sh"                               
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bindkey -s '^o' 'lfcd\n'  # zsh


if [[ $hn == "ROG504" ]]; then
  tf-term() {
    tmux new-session \; \
    send-keys "$@" C-m \; \
    send-keys "source ~/venv_tf2/bin/activate" C-m \; \
    split-window -v \; \
    send-keys "$@" C-m \; \
    send-keys "source ~/venv_tf2/bin/activate" C-m \; \
    send-keys "tensorboard --logdir=." C-m \; \
    split-window -v \; \
    send-keys "$@" C-m \; \
  }

  tl-term() {
    tmux new-session \; \
    send-keys "/home2/; python remote_timelapse.py" C-m \; \
    split-window -h \; \
    send-keys "/home2; python timelapse_day_maker_runner.py" C-m \; \
  }

  alias run="python /home2/research/orbiter/cluster_utils/tasklauncher_uni.py"
  alias ul="tmux a -t UL"
  alias rs="python /home2/research/orbiter/cluster_utils/rsync_folder.py"
  alias mountall="python /home2/research/orbiter/cluster_utils/mountall.py"

elif [[ $hn == "Supasorns-MacBook-Pro.local" ]]; then
  ###-tns-completion-start-###
  if [ -f /Users/supasorn/.tnsrc ]; then 
      source /Users/supasorn/.tnsrc 
  fi
  alias ut="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

  ###-tns-completion-end-###
  source /Users/supasorn/.config/broot/launcher/bash/br
else
  alias run="python3 ~/cluster_utils/tasklauncher_uni.py"
  alias ul="tmux a -t UL"
fi

source ~/.vim/export_lf_icons.sh 2> /dev/null 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home2/supasorn/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home2/supasorn/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home2/supasorn/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home2/supasorn/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<




export PATH="$HOME/.local/bin:$PATH"
