FROM archlinux:latest

# Install necessary packages
RUN pacman -Sy --noconfirm \
    base-devel \
    systemd \
    systemd-sysvcompat \
    xorg-server-xvfb \
    x11vnc \
    tigervnc \
    dbus \
    gnome \
    gnome-terminal \
    && pacman -Scc --noconfirm

# Enable systemd services
RUN systemctl enable dbus.service

# Copy entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
