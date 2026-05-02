# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Only start D-Bus session if not already running
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# Then run your session (e.g., Hyprland)
# Start niri only on tty1
if [[ -z "$WAYLAND_DISPLAY" \
   && -z "$DISPLAY" \
   && -n "$XDG_VTNR" \
   && "$XDG_VTNR" -eq 1 \
   && -t 0 ]]; then
    exec niri --session
fi
