# loadout

 [![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

## How-to: Use Loadout

```bash
docker build -t iainwong/loadout
docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -p 2022:22 -d iainwong/loadout
ssh -X root@localhost -p 2022
export DISPLAY=:0

# in neovim run set clipboard+=unnamedplus
```

## How-to: Setup Development Environment

1. Go to the Extensions tab in Vscode
2. Open the "Recommended" list and install the extensions