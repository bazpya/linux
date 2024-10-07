repeatSpace() {
    # synopsis: repeatSpace <NumberOfRepetitions>
    local output=""
    for ((i = 1; i <= $1; i++)); do
        output+=" "
    done
    echo "$output"
}

printGreeting() {
    local lineLen=41
    local greeting="Hi $(whoami) !"
    local greetingLen=${#greeting}
    if [ $(($greetingLen % 2)) -eq 0 ]; then
        greeting+=" "
    fi

    local paddingLen=$(((lineLen - greetingLen - 2) / 2))
    padding=$(repeatSpace paddingLen)

    local greetingLine="║$padding$greeting$padding║"

    cat <<anArbitraryName
╔═══════════════════════════════════════╗
$greetingLine
╚═══════════════════════════════════════╝
anArbitraryName
}

readCsvFile() {
    local filepath=$1
    local csv=$(<$filepath)
    IFS=',' read -ra values <<< "$csv"
}
