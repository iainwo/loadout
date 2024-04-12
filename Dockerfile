FROM python:3.11.9-slim-bullseye

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
            curl=7.74.0-1.3+deb11u11 \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
    # install Neovim 
    && mkdir /scratch \
    && curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o "/scratch/nvim.appimage" \
    && chmod u+x /scratch/nvim.appimage \
    && /scratch/nvim.appimage --appimage-extract \
    && mv ./squashfs-root/usr/bin/nvim /usr/bin/nvim \
    && mkdir -p "$HOME/.config/nvim/"