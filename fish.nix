{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting "" # Убираем приветствие

      # 1. Отключаем надоедливое сообщение о миграции
      set -g fish_key_bindings fish_default_key_bindings

      # 2. Форсируем цвета для Fish 4.0 (новый синтаксис)
      set -gx TERM xterm-256color
      set -gx COLORTERM truecolor

      # Принудительно задаем основные цвета, если они "слетели"
      set -g fish_color_command green --bold
      set -g fish_color_keyword cyan --bold
      set -g fish_color_quote yellow
      set -g fish_color_redirection blue
      set -g fish_color_end white
      set -g fish_color_error red
      set -g fish_color_param cyan
      set -g fish_color_comment 555
      set -g fish_color_selection --background=brblack
      set -g fish_color_search_match --background=brblack
      set -g fish_color_autosuggestion 555

      fish_add_path $HOME/.config/emacs/bin #Doom
    '';
    # Полезные сокращения (алиасы)
    shellAliases = {
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -a --icons";
      tree = "eza --tree --icons";
      cat = "bat";
      g = "git";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    
    settings = {
      add_newline = false;
      format = "$os$directory$git_branch$git_status$rust$nodejs$nix_shell$character";

      directory = {
        style = "bold cyan";
        truncate_to_repo = true;
      };

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      # Настройки для Rust 🦀
      rust = {
        symbol = "🦀 ";
        style = "bold red";
        format = "via [$symbol($version)]($style) ";
      };

      # Настройки для Node.js 
      nodejs = {
        symbol = " ";
        style = "bold green";
        format = "via [$symbol($version)]($style) ";
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
      };

      nix_shell = {
        symbol = "❄️  ";
        format = "[$symbol]($style) ";
      };

      os.symbols.Macos = " ";
    };
  };

  # Добавим современные замены стандартным утилитам
  home.packages = with pkgs; [
    eza # современный ls
    bat # современный cat с подсветкой
  ];
}

