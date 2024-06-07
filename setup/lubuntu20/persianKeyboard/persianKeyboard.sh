source ../../source.sh

apply() {
    if (isBackedUp $targetLayoutFile); then
        if (askUser "You've already been modded. Update?"); then
            echo "Updating $packageName"
        else
            echo "Aborted"
            return
        fi
    else
        backUp $targetLayoutFile
    fi

    copy $myLayoutFile $targetLayoutFile

    # mkdir -p $autostartDir
    # copy $shortcutFile $autostartDir
    # copy $shortcutFile $desktop

    echo "$packageName Applied!"
}

packageName="persian keyboard layout fix"
myLayoutFile=./ir
targetLayoutFile=/usr/share/X11/xkb/symbols/ir

shortcutFile=./persianKeys.desktop
autostartDir="$HOME/.config/autostart"
desktop="$HOME/Desktop"

if [[ $1 == "restore" ]]; then
    if (askUserClear "Undo $packageName?"); then
        restoreFile $targetLayoutFile
    else
        echo "Aborted"
    fi
else
    if (askUserClear "Apply $packageName?"); then
        apply
    else
        echo "Aborted"
    fi
fi
