# loadout

 [![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

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
