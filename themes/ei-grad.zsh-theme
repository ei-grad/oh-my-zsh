# ZSH Theme - Preview: http://ei-grad.ru/zshtheme.png

local user_host='%{$terminfo[bold]$fg[blue]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[gray]%} %~%{$reset_color%}'

ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[yellow]%}py:"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%} "
local venv='$(virtualenv_prompt_info)'

local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}rb:$(rvm-prompt i v g)%{$reset_color%} '
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}rb:$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%} '
  fi
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
local git='$(git_prompt_info)'

PROMPT="%B[%b ${user_host}${current_dir} ${venv}${rvm_ruby}${git}%B]%b
%B→%b "

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
RPS1="${return_code}"
