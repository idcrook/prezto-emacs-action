# -*- mode: sh; eval: (sh-set-shell "zsh") -*-
#
# Sets emacs aliases.
#
# Via <https://fosstodon.org/@chmouel/113760902087055976>
#
# Authors:
#   David Crook <idcrook@users.noreply.github.com>
#

# Return if requirements are not found.
if (( ! ${+commands[emacsclient]} )); then
  return 1
fi

# Load dependencies.
#pmodload 'helper'

function _emacs_action() {
  emacsclient -u --eval "($1)"
  (( $+commands[osascript] )) && osascript -e "tell application \"Emacs\" to activate"
  (( $+commands[swaymsg] )) && swaymsg '[app_id="emacs"] focus'
}


#
# Aliases
#

alias magit="_emacs_action magit"
alias dired="_emacs_action dired-jump"
