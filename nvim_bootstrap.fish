#!/usr/bin/fish
function echo_warning
  echo (set_color yellow)$argv(set_color normal)
end

function echo_success
  echo (set_color green)$argv(set_color normal)
end

function echo_error
  echo (set_color red)$argv(set_color normal)
end

if [ ! -d $CANNONICAL_SELF_DIR/.local/share/nvim/lazy/lazy.nvim ]
  echo_warning '=> lazy.nvim не найден. Выполняется установка...'
  git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
else
  echo_success '=> lazy.nvim установлен'
end

if [ ! -f $CANNONICAL_SELF_DIR/.config/nvim/complete.flag ]
  echo_warning '=> Конфигурация '$CANNONICAL_SELF_DIR/.config/nvim' не найдена. Выполняется настройка...' 

  if [ ! -f ./templates/init.lua ]
    echo_error '==> ./templates/init.lua отсутствует продолжение невозможно.'
    exit 1
  end

  echo_warning '==> Выполняется установка '$CANNONICAL_SELF_DIR/.config/nvim/init.lua
  install -TD --mode 0600 templates/init.lua $CANNONICAL_SELF_DIR/.config/nvim/init.lua
  echo_success '==> '$CANNONICAL_SELF_DIR/.config/nvim/init.lua' установлен.'

  /usr/bin/cp -rf templates/lua $CANNONICAL_SELF_DIR/.config/nvim/
  echo_success '==> '$CANNONICAL_SELF_DIR/.config/nvim/lua' установлены.'

else
  echo_success '=> Конфигурация '$CANNONICAL_SELF_DIR/.config/nvim' найдена'
end

