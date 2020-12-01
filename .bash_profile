[[ -s ~/.bashrc ]] && source ~/.bashrc

######################################
# Commands that should only run once
# in an interactive login shell
#
# PATH, etc
######################################

# PATH
#
# Simply add to paths array

# array of paths to be added to PATH
#
# Note much of PATH has already been set by certain systems (with
# /etc/environment, for example).
#
# TODO confirm that PATH on linux systems includes paths similarly to macOS.
paths=(
    # personal bin. place before others so personal commands can override
    # others like /usr/local/bin comes before /usr/bin
    "~/bin"

    # for homebrew
    "/usr/local/sbin"

    # android dev
    "~/Library/Android/sdk/platform-tools"
    "~/Library/Android/sdk/tools"

    # symfony's bin
    "~/.symfony/bin"

    # TODO still needed?
    #"/usr/local/opt/coreutils/libexec/gnubin"

    # composer bin
    "~/.composer/vendor/bin"

    # php bin
    # TODO still needed?
    #"$(brew --prefix php@7.1)/bin"
);

for i in ${paths[@]}; do
    PATH=$PATH:$i;
done

export PATH;
