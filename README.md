### Install
1. Install nix https://nixos.org/download/#download-nix
``` bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```
2. Add user to nix-users
``` bash
sudo gpasswd -a $USER nix-users # systemctl reboot after
```
3. Install `home-manager` https://nix-community.github.io/home-manager/
``` bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

4. Clone
``` bash
git clone https://github.com/jintonik/home-manager
```

5. Apply config
``` bash
home-manager switch
```

6. Sync doom
``` bash
doom sync
```


### Tune

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

#### Docker
``` bash
sudo gpasswd -a $USER docker # + restart after
sudo pacman -S docker
sudo systemctl enable --now docker.service
sudo usermod -aG docker $USER
```

### Cleanup 
``` bash
nix-collect-garbage -d
```

