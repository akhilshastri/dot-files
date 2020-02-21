# alias

alias fc 'code ~/.config/fish/aliases.fish'

alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias github 'cd ~/project/github'
alias gh 'cd ~/project/github'
alias rnd 'cd ~/project/rnd'

alias md 'mkdir -p'




#functions
function git-search
    git log -S"$argv" --pretty=format:%H | map git show
end

function cleandsstores
    find . -name '.DS_Store' -exec rm -f '{}' ';'
end

function mk
    set -l dir $argv[1]
    mkdir -p $dir; and cd $dir; and pwd
end

function mkt
    set -l dir (dirname $argv)
    mkdir -p $dir; and touch $argv; and echo $argv
end

function gclone
    cd ~/project/github; and git clone $argv
end

function lsd -d 'List only directories (in the current dir)'
    ls -d */ | sed -Ee 's,/+$,,'
end

function cdff --description "cd's into the current front-most open Finder window's directory"
    cd (ff $argv)
end


function ff
    echo '
    tell application "Finder"
        if (1 <= (count Finder windows)) then
            get POSIX path of (target of window 1 as alias)
        else
            get POSIX path of (desktop as alias)
        end if
    end tell
    ' | osascript -
end