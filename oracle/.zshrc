
# Brandon's cool .zshrc file!
# See latest here: https://gist.github.com/dudemcbacon/9958107
#
# Place at ~/.zshrc for magic
#

autoload -U compinit promptinit colors
compinit
promptinit
colors

export TERM=rxvt
export PATH=/usr/jdk/latest/bin:/usr/local/bin:/usr/sfw/bin:/opt/sfw/bin:$PATH:/usr/ucb
export TMOUT=

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# only fools wouldn't do this ;-)
export EDITOR="vim"

if [ `whoami` = 'oracle' ]; then
  export PS1="%(?..$fg[magenta][%?] )%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
else
  export PS1="%(?..$fg[magenta][%?] )%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
fi

i# Faster! (?)
zstyle ':completion::complete:*' use-cache 1

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete
zstyle ':completion:*' completer _expand _force_rehash _complete _approximate _ignored

# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'

# Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Don't prompt for a huge list, menu it!
zstyle ':completion:*:default' menu 'select=0'

# Have the newer files last so I see them first
zstyle ':completion:*' file-sort modification reverse

# color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

unsetopt LIST_AMBIGUOUS
setopt  COMPLETE_IN_WORD

# Separate man page sections.  Neat.
zstyle ':completion:*:manuals' separate-sections true

# Egomaniac!
zstyle ':completion:*' list-separator 'fREW'

# complete with a menu for xwindow ids
zstyle ':completion:*:windows' menu on=0
zstyle ':completion:*:expand:*' tag-order all-expansions

# more errors allowed for large words and fewer for small words
zstyle ':completion:*:approximate:*' max-errors 'reply=(  $((  ($#PREFIX+$#SUFFIX)/3  ))  )'

# Errors format
zstyle ':completion:*:corrections' format '%B%d (errors %e)%b'

# Don't complete stuff already on the line
zstyle ':completion::*:(rm|vi):*' ignore-line true

# Don't complete directory we are already in (../here)
zstyle ':completion:*' ignore-parents parent pwd
