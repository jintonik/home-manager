### Install
1. Install nix
2. git clone
3. 
```bash
home-manager switch
doom sync
```

#### Rust
``` bash
rustup toolchain install stable
rustup component add rust-analyzer rust-src
```

#### MacOS
```bash
ln -s $(which libtool) ~/.nix-profile/bin/glibtool
```

#### Linux
``` bash
chsh -s $(which fish)
```

### Cleanup 
``` bash
nix-collect-garbage -d
```

