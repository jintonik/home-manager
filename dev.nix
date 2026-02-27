{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #Node
	nodejs
    
	#Rust
	rustup

	#Utils
	nodePackages.typescript-language-server
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
