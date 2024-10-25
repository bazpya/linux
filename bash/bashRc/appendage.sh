#════════════════════════════  Defs  ════════════════════════════

myDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"

source $myDir/funcs.sh
source $myDir/devFuncs.sh

#════════════════════════════  Apply  ════════════════════════════

setPromptStyle

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

alias daze='date +"year: %Y, month: %m, day: %d, hours: %H, minutes: %M" | tee /dev/tty | tr -d "\n" | clip.exe'

#══════════════ git ══════════════

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

#══════════════ docker ══════════════

alias d="docker container ls -a --format 'table{{.Names}}\t{{.ID}}\t{{.Status}}\t{{.Ports}}'"
alias drm="docker rm -v -f \$(docker ps -qa)" # clean out all containers

#════════════════════════════  Navigate  ════════════════════════════

export proj=$HOME/proj
# cd $proj  # Terminal instances inside VSCode will also navigate which breaks your debugging
