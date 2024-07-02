#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
run lxsession
run picom 
run nm-applet 
run volctl   
run xfce4-clipman 
run flameshot 
run blueman-applet
run /usr/lib/xfce4/notifyd/xfce4-notifyd 
run notify-log $HOME/.log/notify.log 
run batsignal
$HOME/.local/bin/launch-polybar &
feh --bg-fill $HOME/.local/share/wallpapers/006.jpg &
# run conky -c $HOME/.config/conky/mocha.conkyrc
