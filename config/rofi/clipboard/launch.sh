#!/bin/bash
rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}' -theme "~/.config/rofi/clipboard/clipboard.rasi"
