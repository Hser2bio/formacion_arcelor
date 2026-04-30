FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

RUN apt update && \
    apt install -y \
    xfce4 xfce4-goodies \
    xvfb x11vnc novnc websockify \
    curl git sudo wget \
    build-essential \
    ca-certificates \
    libgl1 \
    && apt clean

# Node 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash && \
    apt install -y nodejs

# usuario
RUN useradd -ms /bin/bash dev && \
    echo "dev:dev123" | chpasswd && \
    adduser dev sudo

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /home/dev

CMD ["/start.sh"]
