{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "xterm-256color";
    escapeTime = 0;
    mouse = true;
    extraConfig = ''
      # 0. Fish
      set -as terminal-features ",xterm-256color:RGB"
      set -ag terminal-overrides ",xterm-256color:Tc"
      set -g default-terminal "xterm-256color"
      set -g default-command "${pkgs.fish}/bin/fish"
      set -g default-shell "${pkgs.fish}/bin/fish"

      # 1. Основные цвета (спокойный темно-серый фон)
      set -g status-style bg='#282c34',fg='#bbc2cf'

      # 2. Левая часть (Имя сессии)
      set -g status-left-length 30
      set -g status-left "#[bg=blue,fg=black,bold]  #S #[bg=default,fg=blue] "

      # 3. Настройка списка окон (центр)
      set -g window-status-format " #I:#W "
      set -g window-status-current-format "#[fg=cyan,bold]#[bg=cyan,fg=black,bold] #I:#W #[bg=default,fg=cyan]"
      set -g window-status-separator ""

      # 4. Правая часть (Дата, время, хост)
      set -g status-right-length 150
      set -g status-right "#[fg=magenta]#[bg=magenta,fg=black,bold] %H:%M #[fg=blue]#[bg=blue,fg=black,bold] #H "

      # 5. Обновлять статус-бар каждую секунду (для часов)
      set -g status-interval 1
    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];
  };
}
