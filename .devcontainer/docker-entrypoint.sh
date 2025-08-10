#!/bin/bash
set -e

# Start systemd in background
export container=docker
export XDG_RUNTIME_DIR=/run/user/1000

mkdir -p /run/user/1000
chown 1000:1000 /run/user/1000

# Start dbus and systemd
systemctl daemon-reexec || true
systemctl start dbus

# Start X virtual framebuffer (Xvfb) on display :99
Xvfb :99 -screen 0 1280x720x24 &

# Start x11vnc server to expose the virtual X server on port 5900
x11vnc -display :99 -nopw -forever -shared &

export DISPLAY=:99

# Switch to user 1000 and start gnome-session or gnome-terminal for testing
exec sudo -u nobody gnome-session || exec sudo -u nobody gnome-terminal
