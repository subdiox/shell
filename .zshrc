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

  # prezto and modules (zgen's default set, minus utility)
  ZGEN_PREZTO_LOAD_DEFAULT=0
  zgen prezto
  zgen prezto environment
  zgen prezto terminal
  zgen prezto editor
  zgen prezto history
  zgen prezto directory
  zgen prezto spectrum
  zgen prezto completion
  zgen prezto prompt
  zgen prezto history-substring-search
  zgen prezto syntax-highlighting
  zgen prezto autosuggestions

  # generate the init script from plugins above
  zgen save
fi

unsetopt promptcr

unalias gws 2>/dev/null

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
