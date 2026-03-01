{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = if pkgs.stdenv.isDarwin
	      then pkgs.emacs30
	      else pkgs.emacs-pgtk;
    extraPackages = epkgs: with epkgs; [
      reverse-im
    ];
  };

  home.file.".config/doom/init.el".source = ./doom/init.el;
  home.file.".config/doom/config.el".source = ./doom/config.el;
  home.file.".config/doom/packages.el".source = ./doom/packages.el;
  
  # Дополнительные системные утилиты для Emacs
  home.packages = with pkgs; [
    # Зависимости для работы и сборки Doom Emacs
    git
    ripgrep     # Обязательно для поиска (doom/lookup)
    fd          # Обязательно для быстрого поиска файлов
    gnutls      # Для безопасных соединений (скачивание пакетов)
   
    sbcl        # :lang common-lisp
    nixfmt      # :lang nix
    symbola     # Шрифт-fallback (чтобы не было крашей)
 
    # Для модуля vterm (чтобы скомпилировался внутри Emacs)
    cmake
    gnumake
    libtool
    # Добавляем обертку, которая сделает glibtool доступным для скриптов
    (writeShellScriptBin "glibtool" "exec ${libtool}/bin/libtool \"$@\"")
    gcc
  ];

  # Прописываем путь к бинарнику doom в PATH, если он в стандартном месте
  home.sessionPath = [ "$HOME/.config/emacs/bin" ];
}
