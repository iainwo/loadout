FROM python:3.11.9-slim-bullseye

ARG USER_NAME=root
ARG USER_PASS=iainwong

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
            curl=7.74.0-1.3+deb11u11 \
            openssh-server=1:8.4p1-5+deb11u3 \
            xauth=1:1.1-1 \
            xclip=0.13-2 \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
    # configure ssh
    && mkdir /var/run/sshd \
    && echo 'root:root' | chpasswd \
    && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && mkdir /root/.ssh \
    # install Neovim
    && curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz \
    && tar -C /opt -xzf nvim-linux64.tar.gz \
    && ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim \
    && mkdir -p "$HOME/.config/nvim/"

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]