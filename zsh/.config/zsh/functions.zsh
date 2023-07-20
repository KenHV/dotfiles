#!/bin/zsh

# fetch a remote repo and hard reset to specified branch
fetchreset() {
    git fetch $1 $2
    git reset --hard FETCH_HEAD
}

# amend author to latest commit
amendauthor() {
    git commit --amend --author="$@"
}

# search and replace string recursively on git repos
# this uses git so the changes can be reverted if its destructive
gitreplace() {
    echo -n "Are you sure you want to replace $1 with $2? (y/n)"
    read answer
    if echo "$answer" | grep -iq "^y" ;then
        git grep -lz "$1" | xargs -0 sed -i "s/$1/$2/g"
    else
        echo "Cancelled command" ; exit
fi
}

# get authorship info from url
# and automatically amend it
gauthor() {
    gitauthor "$@" | bash
}

gkang() {
    gitkang "$@" | bash
}

# send files to my TG through kensurbot
tgsendfile() {
    curl -F document=@"$PWD/$@" "https://api.telegram.org/bot$TG_BOT_TOKEN/sendDocument" \
        -F chat_id=$TG_CHAT_ID &> /dev/null && echo "Uploaded $@ to Telegram." || echo "Failed."
}

gendc() {
    DEVICE=$(basename $(dirname "$PWD"))
    make O=out $DEVICE-perf_defconfig --no-print-directory
}

savedc() {
    DEVICE=$(basename $(dirname "$PWD"))
    \cp out/.config arch/arm64/configs/$DEVICE-perf_defconfig
}

regendc() {
    gendc; savedc;
}

restore-kernel() {
    fastboot flash boot ~/Downloads/Android/boot.img
    fastboot flash dtbo ~/Downloads/Android/dtbo.img
    fastboot reboot
}

curlam() {
    for arg in "$@"; do
        curl -fsSL $(echo "$arg" | sed -e 's/#.*//' -e 's/\.patch$//' -e 's/$/.patch/') | git am -3
    done
}


ngd() {
    nvim $(git diff --name-only --line-prefix="$(git rev-parse --show-toplevel)/" | uniq)
}

# send kernel zip to phone
copyzip() {
    ZIP=$(echo $HOME/projects/liber/ak3/*.zip)
    if adb push "$ZIP" /sdcard/Kernel &> /dev/null; then
        echo "Copied ZIP to device."
    else
        echo "Device isn't connected."
    fi
}

gclean() {
    #git fetch -p &&
    git fsck --unreachable &&
    git reflog expire --expire=0 --all &&
    git repack -a -d -l &&
    git prune &&
    \rm .git/gc.log &&
    git gc
}

update-mirrors() {
    export TMPFILE="$(mktemp)";
    sudo true; \
    rate-mirrors --entry-country=India --save=$TMPFILE arch --max-delay=43200 \
        && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
        && sudo mv $TMPFILE /etc/pacman.d/mirrorlist
}

kcg() {
    QUERY=$(echo $1 | sed 's/CONFIG_//' | sed 's/config_//')
    rg -A 30 -i "config $QUERY" **/*Kconfig*
    unset QUERY
}

fanset() {
    sudo nbfc set -s "$1" -f 0
    sleep 1
    sudo nbfc set -s "$1" -f 1
}

fanauto() {
    sudo nbfc set -a -f 0
    sleep 1
    sudo nbfc set -a -f 1
}
