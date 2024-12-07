#!/bin/bash

######################################################
#  ____ ____ ____                                    #
#    ╭━━━┳━━━╮  StrinGhost                           #
#    ┃╭━╮┃╭━╮┃                                       #
#    ┃╰━━┫┃╱╰╯  https://www.github.com/StrinGhost    #
#    ╰━━╮┃┃╭━╮  https://www.reddit.com/u/StrinGhost  #
#    ┃╰━╯┃╰┻━┃  https://x.com/StrinGhost             #
#    ╰━━━┻━━━╯                                       #
######################################################

# Current Theme
dir="~/.config/rofi/power/"
theme='config'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"

# Options
hibernate=''
shutdown='󰐥'
reboot=''
lock=''
logout=''
yes=''
no='󰯆'

# Rofi CMD

rofi_cmd() {
    rofi -dmenu \
        -p "Goodbye ${USER}" \
        -mesg "Uptime: $uptime" \
        -theme ${dir}/${theme}.rasi
    }

# Confirmation CMD
confirm_cmd() {
    rofi -dmenu \
        -p 'Confirmation' \
        -mesg 'Are you Sure?' \
        -theme ${dir}/confirm.rasi
    }

# Ask for confirmation
confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi()  {
   echo -e "$reboot\n$lock\n$hibernate\n$logout\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
    selected="$(confirm_exit)"
    if [[ "$selected" == "$yes" ]]; then
        if [[ $1 == '--shutdown' ]]; then
            mpc -q pause
            systemctl poweroff
        elif [[ $1 == '--reboot' ]]; then
            mpc -q pause
            systemctl reboot
        elif [[ $1 == '--suspend' ]]; then
            mpc -q pause
            # amixer set Master mute
            systemctl suspend
        elif [[ $1 == '--hibernate' ]]; then
            mpc -q pause
            systemctl hibernate
        elif [[ $1 == '--logout' ]]; then
            if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
                openbox --exit
            elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
                bspc quit
            elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
                i3-msg exit
            elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
                qdbus org.kde.ksmserver /KSMServer logout 0 0 0
            fi
        fi
    else
        exit 0
    fi
}

# Actions
chosen="$(run_rofi)"

if [[ -z "$chosen" ]]; then

    exit 0  # Exit if nothing was selected (canceled)

fi
case ${chosen} in
    $shutdown)
        run_cmd --shutdown
        ;;
    $reboot)
        run_cmd --reboot
        ;;
    $lock)
        if [[ -x '/usr/bin/betterlockscreen' ]]; then
            betterlockscreen -l dim
        elif [[ -x '/usr/bin/i3lock' ]]; then
            i3lock
        fi
        ;;
    $suspend)
        run_cmd --suspend
        ;;
    $hibernate)
        run_cmd --hibernate
        ;;
    $logout)
        run_cmd --logout
        ;;
    *)  # Handle cancellation or invalid selection
        exit 0
        ;;
esac
