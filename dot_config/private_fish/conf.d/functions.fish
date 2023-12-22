function ff -d "find files with fzf and open with nvim"
    if count $argv > /dev/null
        set file $(rg --files | fzf --query $argv)
    else
        set file $(rg --files | fzf)
    end

    if test $status -ne 0
        set -e file
    end

    if set -q file
        nvim -- $file
    end
end
