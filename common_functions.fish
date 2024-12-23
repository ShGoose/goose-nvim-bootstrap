function echo_warning
  echo (set_color yellow)$argv(set_color normal)
end

function echo_success
  echo (set_color green)$argv(set_color normal)
end

function echo_error
  echo (set_color red)$argv(set_color normal)
end

function echo_message
  echo (set_color cyan)$argv(set_color normal)
end

