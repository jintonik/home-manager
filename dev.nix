{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #Node
    nodejs
    
    #Rust
    rustup
    sqlx-cli         # Утилита для миграций (обязательно!)
    postgresql       # Чтобы были доступны клиентские либы (libpq)
    pkg-config       # Чтобы Rust нашел либы в Nix-сторе
    openssl          # Для защищенных соединений

    #Utils
    nodePackages.typescript-language-server
    docker
  ];

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkg-config";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
