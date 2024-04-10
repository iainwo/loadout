FROM python:3.11.9-slim-bullseye

RUN apt-get update \
        && apt-get install -y \
            curl \
    # install Neovim
    && mkdir /scratch \
    && curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o "/scratch/nvim.appimage" \
    && chmod u+x /scratch/nvim.appimage \
    && /scratch/nvim.appimage --appimage-extract \
    && mv ./squashfs-root/usr/bin/nvim /usr/bin/nvim \
    && mkdir -p $HOME/.config/nvim/