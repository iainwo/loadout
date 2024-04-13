FROM python:3.11.9-slim-bullseye

ARG GIT_USER="Iain Wong"
ARG GIT_EMAIL="iainwong@outlook.com"
ARG HOME="/root"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
            curl=7.74.0-1.3+deb11u11 \
            openssh-server=1:8.4p1-5+deb11u3 \
            xauth=1:1.1-1 \
            xclip=0.13-2 \
            zsh=5.8-6+deb11u1 \
            tmux=3.1c-1+deb11u1 \
            git=1:2.30.2-1+deb11u2 \
            tree=1.8.0-1+b1 \
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
    && mkdir -p "$HOME/.config/nvim/" \
    # install other tools
    && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash \
    && git config --global user.email "$GIT_EMAIL" \
    && git config --global user.name "$GIT_USER" \
    && git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto" \
    && git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh-autosuggestions" \
    && curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

COPY prezto/.aliases.zsh "$HOME/"
COPY prezto/.functions.zsh "$HOME/"
COPY prezto/.zlogin "$HOME/"
COPY prezto/.zlogout "$HOME/"
COPY prezto/.zpreztorc "$HOME/"
COPY prezto/.zprofile "$HOME/"
COPY prezto/.zshenv "$HOME/"
COPY prezto/.zshrc "$HOME/"

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
