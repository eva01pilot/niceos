{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./waybar/waybar.nix
    ./wofi/wofi.nix
    ./kitty/kitty.nix
    ./tmux/tmux.nix
    ./zellij/zellij.nix
    ./nixvim.nix
  ];
  home.username = "ilya";
  programs.nixvim.enable = true;
  home.homeDirectory = "/home/ilya";
  programs.direnv = {
    enable = true;
    enableBashIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };
  programs.neovim.defaultEditor = true;
  wayland.windowManager.hyprland.enable = true; # enable Hyprland

  programs.fish = {
    enable = true;
    shellInit = ''
      # direnv hook
      if status --is-interactive
        eval (direnv hook fish)
      end
    '';
  };
  home.sessionVariables.SUDO_EDITOR = "nvim";
  home.sessionVariables.EDITOR = "nvim";
  gtk = {
    enable = true;
    iconTheme.name = "Gruvbox-Plus-Dark";
    iconTheme.package = pkgs.gruvbox-plus-icons;
    theme.package = pkgs.gruvbox-gtk-theme;
    theme.name = "Gruvbox-Dark";
  };
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 16;
  };
  # set cursor size and dpi for 4k monitor

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    libreoffice-qt
    obs-studio
    zellij
    vial
    pamixer
    pavucontrol
    rustlings
    d2
    qemu
    direnv
    prettierd
    tmux
    typescript
    ags
    cloc
    slurp
    wl-clipboard
    grim
    rustc
    cargo
    rust-analyzer
    bat
    font-awesome
    julia-mono
    playerctl
    hyprpaper
    killall
    dunst
    alejandra
    libnotify
    waybar
    nixfmt-rfc-style
    dolphin
    wofi
    nautilus
    clickhouse
    go
    flameshot
    sqlite
    vscodium
    jdk
    android-studio
    nitrogen
    dmenu # application launcher most people use
    i3status # gives you the default i3 status bar
    i3lock # default i3 screen locker
    i3blocks # if you are planning on using i3blocks over i3status
    rofi
    font-awesome
    i3blocks
    vim
    kitty
    chromium
    #neovim
    git
    xclip
    yarn
    pritunl-client
    gcc
    nodejs
    cmake
    shadowsocks-libev
    blueman
    haskellPackages.shadowsocks
    neofetch
    telegram-desktop
    nnn # terminal file manager
    zip
    xz
    unzip
    p7zip
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Ilya";
    userEmail = "eva01pilothmm@gmail.com";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };
  programs.java.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
