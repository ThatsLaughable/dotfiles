set -xg PATH /opt/local/bin /opt/local/sbin $PATH
set -xg PATH $PATH /Users/yury/dev/sys-venvs/fish/bin

set -xg WORKON_HOME $HOME/dev/venvs

set -xg MANPATH /opt/local/share/man $MANPATH

set -xg EDITOR /usr/bin/vim

set -xg LSCOLORS gxfxcxdxbxegedabagacad
set -xg CLICOLOR 1

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind resh enad

function fish_prompt
  set last_status $status

  if test -n "$VIRTUAL_ENV"
    set -l ve_tag (basename "$VIRTUAL_ENV")
    echo -n (set_color B69)"{$ve_tag} "(set_color normal)
  end

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s » ' (__fish_git_prompt)

  set_color normal
end

function fish_user_key_bindings
  # clear command line on ^C
  bind \cc 'commandline ""'
end

function p
  ps aux | grep -i $argv
end

source ~/.config/fish/theme.fish
