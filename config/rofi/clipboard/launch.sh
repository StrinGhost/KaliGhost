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
rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}' -theme "~/.config/rofi/clipboard/clipboard.rasi"
