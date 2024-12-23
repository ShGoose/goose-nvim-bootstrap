#!/usr/bin/fish
source common_functions.fish

function setup_fish_lsp_client
  if [ ! -d $CANNONICAL_SELF_DIR/.config/nvim-fish-lsp-language-client ]
    echo_message "Производится установка fish_lsp_client"
    git clone https://github.com/ndonfris/fish-lsp-language-clients.git $CANNONICAL_SELF_DIR/.config/nvim-fish-lsp-language-client
  end
  echo_success "=> fish_lsp_client установлен"


  if [ ! -f $CANNONICAL_SELF_DIR/.config/nvim-fish-lsp-language-client/coc-settings.json ]
    echo_message "Переключаю клиент на coc-example"
    cd $CANNONICAL_SELF_DIR/.config/nvim-fish-lsp-language-client 
    git checkout coc_example && cd -
  end
  echo_success "=> Выбран клиент coc-example"
end

setup_fish_lsp_client
