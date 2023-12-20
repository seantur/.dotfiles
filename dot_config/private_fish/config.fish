if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -p $HOME/.local/bin /opt/bin $HOME/go/bin

starship init fish | source
source /opt/asdf-vm/asdf.fish
direnv hook fish | source # https://direnv.net/docs/hook.html
