# Inspired by theme 'dieter'
typeset -A host_repr

# Translate hostnames into shortened, colorcoded strings
host_repr=('orlab-lawler' "lawler" 'ubuntu' "home" 'lagrange' "lagrange")

PROMPT='%{$fg[yellow]%}[$host_repr[$(hostname)]]%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

# elaborate exitcode on the right when >0 or ==0
return_code_enabled="${time}%(?.%{$fg[green]%} ✓%{$reset_color%}.%{$fg[red]%} ↵%{$reset_color%})"
#return_code_enabled="${time}%(?.%{$fg[green]%}✓%{$reset_color%}.%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code}'

function accept-line-or-clear-warning () {
if [[ -z $BUFFER ]]; then
      time=$time_disabled
      return_code=$return_code_disabled
   else
      time=$time_enabled
      return_code=$return_code_enabled
   fi
   zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
