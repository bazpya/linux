myDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"
source $myDir/pkgMgr.sh
source $myDir/../source.sh