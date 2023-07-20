zmodload zsh/zprof

# export NODE_PATH=`which node`
# export PATH="$PATH:/usr/local/share/npm/bin"
# export PATH="$PATH:/.nvm/version/node/v18.16.1/bin/node"
# export PATH="$(yarn global bin):$PATH"

export PATH="$PATH/.cargo/bin:$PATH}"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
plugins=(
  zsh-nvm
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# pnpm
# export PNPM_HOME="/home/bojan/.local/share/pnpm"
# export PATH="$PNPM_HOME:$PATH"
# pnpm end

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

# # bun completions
# [ -s "/home/bwilytsch/.bun/_bun" ] && source "/home/bwilytsch/.bun/_bun"

# # Bun
# export BUN_INSTALL="/home/bwilytsch/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Custom Aliases
# For Linux
alias lg="lazygit"
alias lzd="lazydocker"
# alias lazygit="LazyGit"

alias mailhog="${HOME}/go/bin/MailHog"

# neofetch

alias luamake=/home/bwilytsch/lua-language-server/3rd/luamake/luamake

alias chrome="${HOME}/usr/bin/google-chrome-stable"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bwilytsch/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bwilytsch/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bwilytsch/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bwilytsch/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

##THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# export PATH="/usr/local/bin:$PATH"
