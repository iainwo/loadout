<h1 align="center" style="border-bottom: none;">🐳🚚 loadout</h1>
<h3 align="center">Fully automated version management and package publishing</h3>
<p align="center">
  <a href="#badge">
    <img alt="semantic-release: angular" src="https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release">
  </a>
</p>

**loadout** is a containerized environment for development.

## Highlights

- ZSH
- Prezto for ZSH
- Tmux
- Neovim

## How-to: Use Loadout

```bash
docker build -t iainwong/loadout .
docker run \
  -p 2022:22 \
  -v /my_ssh_key:/home/iainwong/.ssh/id_ed25519
  -v /my_ssh_key.pub:/home/iainwong/.ssh/id_ed25519.pub
  -v /my_git_dir/:/home/iainwong/git/
  iainwong/loadout
```

## How-to: Setup Development Environment

1. Go to the Extensions tab in Vscode
2. Open the "Recommended" list and install the extensions
