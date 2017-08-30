# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="leo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias lsb='ls --color=tty -B'
alias git='nocorrect git'
alias cp='nocorrect cp'
alias rm='rm -i'
alias gopen='xdg-open'
alias less='less -S'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
SSHPID=`ps ax|grep -c "[s]sh-agent"`
if (( $SSHPID == 0 ))
then
   plugins=(git ssh-agent)
else
   plugins=(git)
fi

source $ZSH/oh-my-zsh.sh

autoload zmv

# Customize to your needs...
#export GUROBI_HOME=/opt/gurobi810/linux64
#export LD_LIBRARY_PATH=$GUROBI_HOME/lib
#export CPLEX_HOME=/opt/ibm/ILOG/CPLEX_Studio126
#export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/bin:$GUROBI_HOME/bin:/home/taccari/dev/julia
#export LD_LIBRARY_PATH=$GUROBI_HOME/lib:/usr/local/lib
#export PATH=/opt/ampl:$CPLEX_HOME/cplex/bin/x86-64_linux:$PATH
#export LD_LIBRARY_PATH="/opt/ibm/ILOG/CPLEX_Studio126/cplex/bin/x86-64_linux":$LD_LIBRARY_PATH
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#export SCALA_HOME=/home/leonardo/scala/scala-2.11.8
#export PATH=$SCALA_HOME/bin:$PATH

export EDITOR=vi

function prettyjson () {
  # Pretty-print a tab separated table
  if [ ! -f "$1" ]
  then
     echo "Specify existing file"
     return
  fi
  python -m json.tool $1 | pygmentize -l javascript
}


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/leonardo/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/leonardo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/leonardo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/leonardo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate ludovico

