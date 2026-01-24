{
  config,
  pkgs,
  isWSL ? false,
  tapciify,
  ...
}: {
  # TODO please change the username & home directory to your own
  home.username = "tapnisu";
  home.homeDirectory = "/home/tapnisu";

  # Import files from the current configuration directory into the Nix store,
  # and create symbolic links pointing to those store files in the Home directory.

  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # Import the scripts directory into the Nix store,
  # and recursively generate symbolic links in the Home directory pointing to the files in the store.
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  xdg.configFile."niri/config.kdl".source = ./niri/niri.kdl;

  programs.vscode = {
    enable = !isWSL;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [];
    };
  };

  programs.firefox = {
    enable = !isWSL;
    package = pkgs.firefox-esr;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      settings = {
        "browser.shell.checkDefaultBrowser" = false;
      };
    };
  };

  programs.thunderbird = {
    enable = !isWSL;
    package = pkgs.thunderbird-esr;
    profiles.default = {
      isDefault = true;
    };
  };

  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    EDITOR = "code";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    tapciify.packages.${pkgs.stdenv.hostPlatform.system}.default

    keepassxc

    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
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
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    fastfetch

    htop
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

    swaybg

    telegram-desktop
    vencord

    nil
    alejandra
  ];

  programs.mpv.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Aleksei Rybin";
        email = "aleksei@tapni.su";
        signingkey = "08AB2A9B83C7ED9F";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "code";
      commit.gpgsign = true;
      tag.gpgsign = true;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.kdePackages.breeze-icons;
    name = "Breeze_Light";
    size = 48;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "kohaku" = {
        hostname = "kohaku.tapni.su";
        user = "tapnisu";
      };
      "hisui" = {
        hostname = "hisui.tapni.su";
        user = "tapnisu";
      };
      "akiha" = {
        hostname = "akiha.tapni.su";
        user = "tapnisu";
      };
      "desktop" = {
        hostname = "desktop.tapni.su";
        user = "tapnisu";
      };
      "laptop" = {
        hostname = "laptop.tapni.su";
        user = "tapnisu";
      };
      "phonewave" = {
        hostname = "phonewave.tapni.su";
        user = "u0_a338";
      };
      "rybin-pc" = {
        hostname = "rybin-pc";
        user = "zlobi";
      };
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
        normal = {
          family = "Iosevka Term Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "Iosevka Term Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Iosevka Term Nerd Font";
          style = "Italic";
        };
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.waybar = {
    enable = true;
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.alacritty}/bin/alacritty";
        layer = "overlay";
      };
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
