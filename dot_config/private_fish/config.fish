if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -p $HOME/.local/bin /opt/bin $HOME/go/bin

# https://direnv.net/docs/hook.html
direnv hook fish | source
