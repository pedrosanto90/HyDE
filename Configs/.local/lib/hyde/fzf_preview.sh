#! /bin/env bash
scrDir=$(dirname "$(realpath "$0")")
source "$scrDir/globalcontrol.sh"
PREVIEW=$1
MESSAGE=$2
img_preview() {
    if [[ $(tput colors) -lt "256" ]]; then return; fi
    local image_url="$1"
    [ -z "$image_url" ] && return 1
    if command -v wezterm >/dev/null 2>&1; then
        wezterm imgcat --width 100 --height 200 "$image_url" 2>/dev/null || wezterm imgcat "$image_url" 2>/dev/null
    elif command -v jp2a &> /dev/null; then
        find "$image_url" -name "*" -exec jp2a --colors --color-depth=24 --chars=' .:-=+*#%@' --fill --term-fit --background=dark {} \; 2> /dev/null
    else
        cat << EOF
          ░▒▒▒░░░░░▓▓          ___________
        ░░▒▒▒░░░░░▓▓        //___________/
       ░░▒▒▒░░░░░▓▓     _   _ _    _ _____
       ░░▒▒░░░░░▓▓▓▓▓▓ | | | | |  | |  __/
        ░▒▒░░░░▓▓   ▓▓ | |_| | |_/ /| |___
         ░▒▒░░▓▓   ▓▓   \__  |____/ |____/
           ░▒▓▓   ▓▓  //____/

EOF
        print_log -y "Install 'jp2a' to preview in ASCII format"
    fi
}
eval "$(declare -F | sed -e 's/-f /-fx /')"
if [ -n "$MESSAGE" ]; then
    printf "%b\n" "$MESSAGE"
fi
if [ -e "$PREVIEW" ]; then
    img_preview "$PREVIEW"
elif [ ! -e "$PREVIEW" ]; then
    img_preview "$XDG_CACHE_HOME/hyde/gallery-database/preview.png"
fi
