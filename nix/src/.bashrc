

# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs



if [[ ! -v BASH_COMPLETION_VERSINFO ]]; then
  . "/nix/store/n63hbmsya468lwry886k6b5yz678m2hg-bash-completion-2.13.0/etc/profile.d/bash_completion.sh"
fi

#════════════════════════════  Defs  ════════════════════════════

myDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"

mkcd ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

#════════════════════════════  Apply  ════════════════════════════

e='\[\033[' # Escape sequence
export PS1="${e}95m\]\u${e}91m\]@${e}96m\]\h:${e}94m\]\w${e}93m\]$ ${e}0m\]"

#════════════════════════════  Aliases  ════════════════════════════

alias l='ls -lah'
alias sd='shutdown now'
alias sr='shutdown -r now'
alias ss='lxqt-leave --suspend'
alias his='history'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'

alias g='git status && gitWindowTab'
alias giff='git diff'
alias gadd='git add'
alias getch='git fetch && g'
alias gull='git pull'
alias gush='git push'
alias geckout='git checkout'
alias gistash='git stash'
alias granch='git branch'
alias gommit='git commit'
alias gamend='gommit --amend --no-edit'
alias glog='echo && git log --pretty=oneline'
alias glean='git clean'
alias geset='git reset'
alias glear='geset && geckout . && glean -fd'
alias gebase='geckout main && getch && gull && geckout - && git rebase main'
alias gitFilenamesPipe='git diff HEAD --name-only | xargs '
alias gitChmod='gitFilenamesPipe chmod -x && gitFilenamesPipe ll'
alias gitBranchNamesPipe='git for-each-ref refs/heads --format="%(refname:short)" | xargs '
alias gitWindowTab='echo -ne "\033]0;$(basename `git rev-parse --show-toplevel`)\a"'

alias daze='date +"year: %Y, month: %m, day: %d, hours: %H, minutes: %M" | tee /dev/tty | tr -d "\n" | clip.exe'

alias d="docker container ls -a --format 'table{{.Names}}\t{{.ID}}\t{{.Status}}\t{{.Ports}}'"
alias dockeru="docker-compose up -d"
alias dockerd="docker-compose down"
alias dockers="docker stop"

alias hmswitch="home-manager switch --flake ."
alias nixswitch="sudo nixos-rebuild switch --flake ."

#════════════════════════════  Navigate  ════════════════════════════

export proj=$HOME/proj
# cd $proj  # Terminal instances inside VSCode will also navigate which breaks your debugging
