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

#SSHPID=`ps ax|grep -c "[s]sh-agent"`
#if (( $SSHPID == 0 ))
#then
#   plugins=(git ssh-agent)
#else
   plugins=(git)
#fi

source $ZSH/oh-my-zsh.sh

autoload zmv

source ~/dotfiles/zsh/ssh-agent2.sh

# Customize to your needs...
export GUROBI_HOME=/opt/gurobi550/linux64
export LD_LIBRARY_PATH=$GUROBI_HOME/lib

export ILOG_LICENSE_FILE=/opt/ibm_ilog_access_keys/access+ampl.ilm

export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/bin:$GUROBI_HOME/bin:/home/taccari/dev/julia

# Go: Combines cd and ls for directories, or opens files in EMACS.
go() {
    cd $1 2> /dev/null && ls || $EDITOR $1
}

export EDITOR=vi


# Set permissions for a web directory
webify_permissions() {
    for i in $(ls $1); do
        if [ -d $i ]; then
            chmod 755 $i
            echo "Setting directory $i to 755"
            webify_permissions $i
        else
            chmod 644 $i
            echo "Setting file $i to 644"
        fi
    done
}

function allf () {
  # Recursively find files with suffix matching comma-separated list in $1.
  # For example, "allf cpp,hpp" finds all "*.cpp" and "*.hpp".
  find . -type f | grep -E "\.(${1//,/|})$"
}

function src () {
  # Similar to "allf" (see above),
  # then search for a pattern among the results.
  find . -type f -print0 | grep -zE "\.(${1//,/|})$" | xargs -0 grep -lE $2
}

function lsrc () {
  # Similar to "src" (see above),
  # then search for a pattern among the results,
  # and pass matching files to "less".
  src $1 $2 | xargs less -p $2
}

function msrc () {
  # Similar to "allf" (see above),
  # then search for a pattern among the results,
  # and display the matching lines.
  find . -type f -print0 | grep -zE "\.(${1//,/|})$" | xargs -0 grep -E $2
}

function svns () {
  # Recursively find all files in an svn checkout.
  find . -path "*.svn" -prune -or -type f -print0 | xargs -0 $@
}
