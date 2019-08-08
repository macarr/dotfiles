# Defined in /var/folders/6v/bfsnqth52qx_c6702wf6yrkc0000gn/T//fish.jDqYT2/fish_prompt.fish @ line 2
function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

    # User
    set_color $fish_color_user
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (prompt_hostname)
    set_color normal

    echo -n ':'

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    echo -n ' '

    #virtualfish
    if set -q VIRTUAL_ENV
      echo -n -s (set_color green ) "(☇:" (basename "$VIRTUAL_ENV") ")" (set_color normal)
    end

    __terlar_git_prompt
    __fish_hg_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '➤ '
    set_color normal
end
