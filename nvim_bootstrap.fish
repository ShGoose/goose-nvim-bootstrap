#!/usr/bin/fish
source common_functions.fish

function update
  if [ ! -f $CANNONICAL_SELF_DIR/.config/$argv[1] ] || [ ! -z "$( diff -q $CANNONICAL_SELF_DIR/.config/$argv[1] $argv[1] 2>/dev/null )" ]
    install -TD --mode 0600 $argv[1] $CANNONICAL_SELF_DIR/.config/$argv[1]
    echo_warning '==> изменен '$CANNONICAL_SELF_DIR/.config/$argv[1]
  end
end

function check_fish_lsp
  if [ -z "$( whereis fish-lsp | awk '{print $2}' | tr -d '\n' )" ]
   echo_warning "=> Требуется установить fish-lsp" 
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

check_fish_lsp

echo_success 'Готово!'
