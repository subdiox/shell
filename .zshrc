if [ ! -e "${HOME}/.zgen" ]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  echo "Creating a zgen save"

  # prezto options
  zgen prezto editor key-bindings 'vi'
  zgen prezto prompt theme 'pure'
  zgen prezto '*:*' color 'yes'

  # prezto and modules
  zgen prezto
  zgen prezto git
  zgen prezto history-substring-search
  zgen prezto syntax-highlighting
  zgen prezto autosuggestions

  # generate the init script from plugins above
  zgen save
fi

unsetopt promptcr
