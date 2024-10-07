setPromptStyle() {
    local e='\[\033[' # Escape sequence
    export PS1="${e}95m\]\u${e}91m\]@${e}96m\]\h:${e}94m\]\w${e}93m\]$ ${e}0m\]"
}

mkcd ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}
