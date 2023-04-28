fish_add_path -p "$HOME/.local/bin" "/opt/bin"

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_color_branch green
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_color_untrackedfiles red
set __fish_git_prompt_color_stagedstate yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_untrackedfiles '?'
set __fish_git_prompt_char_stateseparator ''

set fish_color_cwd blue
set fish_color_cwd_root blue
set fish_color_user green
set fish_color_user_remote red
set fish_color_host green
set fish_color_host_remote red

set fish_greeting ''

fish_add_path /opt/homebrew/bin
