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

function update
  if [ ! -f $CANNONICAL_SELF_DIR/.config/$argv[1] ] || [ ! -z "$( diff -q $CANNONICAL_SELF_DIR/.config/$argv[1] $argv[1] 2>/dev/null )" ]
    install -TD --mode 0600 $argv[1] $CANNONICAL_SELF_DIR/.config/$argv[1]
    echo_warning '==> изменен '$CANNONICAL_SELF_DIR/.config/$argv[1]
  end
end

if [ ! -d $CANNONICAL_SELF_DIR/.local/share/nvim/lazy/lazy.nvim ]
  echo_warning '=> lazy.nvim не найден. Выполняется установка...'
  git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
end

if [ ! -d $CANNONICAL_SELF_DIR/.config/nvim ]
  echo_warning '=> Конфигурация '$CANNONICAL_SELF_DIR/.config/nvim' не найдена. Выполняется настройка...' 

  if [ ! -f ./nvim/init.lua ]
    echo_error '==> ./templates/init.lua отсутствует продолжение невозможно.'
    exit 1
  end

  echo_warning '==> Выполняется установка '$CANNONICAL_SELF_DIR/.config/nvim/init.lua
  install -TD --mode 0644 nvim/init.lua $CANNONICAL_SELF_DIR/.config/nvim/init.lua
  echo_success '==> '$CANNONICAL_SELF_DIR/.config/nvim/init.lua' установлен.'
end

# update 
for file in $( find nvim/ -type f )
  update $file
end

echo_success 'Готово!'
