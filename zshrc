# Load Antigen
source /usr/share/zsh/scripts/antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/

# Themes
# Set the active theme
antigen theme sorin

# Plugins
# oh-my-zsh plugins, Don't need full git path
antigen bundle colored-man
antigen bundle autojump

# not oh-my-zsh plugins so need full git path
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle unixorn/autoupdate-antigen.zshplugin

# not oh-my-zsh plugins
#Tell Antigen we are done
antigen apply
