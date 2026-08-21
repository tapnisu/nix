{
  config,
  pkgs,
  lib,
  isWSL ? false,
  tapciify,
  ...
}: {
  home.username = lib.mkDefault "tapnisu";
  home.homeDirectory = lib.mkDefault "/home/tapnisu";

  xdg.configFile."niri/config.kdl".source = ./niri/niri.kdl;
  xdg.userDirs.setSessionVariables = true;

  fonts.fontconfig.enable = true;

  programs.firefox = {
    enable = !isWSL;
    package = pkgs.firefox-esr;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    languagePacks = ["ru"];
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
    EDITOR =
      if isWSL
      then "nvim"
      else "zed";
    BROWSER =
      if isWSL
      then "wslview"
      else "firefox";
    TERMINAL = "alacritty";
  };

  xdg = {
    userDirs.enable = true;
    mimeApps = {
      enable = !isWSL;
      defaultApplications = {
        "inode/directory" = ["thunar.desktop"];
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-scheme-handler/about" = ["firefox.desktop"];
        "x-scheme-handler/unknown" = ["firefox.desktop"];
      };
    };
  };

  programs.zed-editor = {
    enable = !isWSL;
    extensions = ["nix" "toml" "rust"];
    userSettings = {
      autosave = "on_focus_change";
      auto_update = false;
      disable_ai = true;
      terminal = {
        font_family = "IosevkaTerm Nerd Font";
      };
      ui_font_family = ".ZedSans";
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "dark";
        light = "Gruvbox Light Soft";
        dark = "Gruvbox Dark Hard";
      };
      buffer_font_family = "Iosevka Nerd Font";
    };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs;
    [
      tapciify.packages.${pkgs.stdenv.hostPlatform.system}.default

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

      nil
      alejandra
    ]
    ++ lib.optionals isWSL [
      (pkgs.writeShellScriptBin "wslview" ''
        exec cmd.exe /c start "" "$@"
      '')
    ]
    ++ lib.optionals (!isWSL) [
      keepassxc
      nautilus
      loupe
      imv
      swaybg
      telegram-desktop
      vencord
      moonlight-qt
      obsidian
      readest
    ];

  programs.mpv.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Aleksei Rybin";
        email = "aleksei@tapni.su";
        signingkey = "4DED407482DB6E6E";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = config.home.sessionVariables.EDITOR;
      commit.gpgsign = true;
      tag.gpgsign = true;
    };
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
    cursorTheme = {
      name = "Breeze_Light";
      package = pkgs.kdePackages.breeze-icons;
      size = 48;
    };

    gtk4.theme = null;

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.kdePackages.breeze-icons;
    name = "Breeze_Light";
    size = 48;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  dconf = {
    enable = !isWSL;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Adwaita-dark";
        cursor-theme = "Breeze_Light";
      };
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
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
    enable = !isWSL;
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
    enable = !isWSL;
  };

  programs.fuzzel = {
    enable = !isWSL;
    settings = {
      main = {
        terminal = "${pkgs.alacritty}/bin/alacritty";
        layer = "overlay";
      };
    };
  };

  # https://github.com/ae5259/nihh/blob/6d3f74e557c52fb16bdc68243acc78a364d8cd89/modules/zsh.nix
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    enableCompletion = true;

    envExtra = "bindkey '^?' backward-kill-word";

    plugins = [
      # {
      #   name = "vi-mode";
      #   src = pkgs.zsh-vi-mode;
      #   file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      # }
      {
        name = "zsh-fzf-history-search";
        file = "zsh-fzf-history-search.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "joshskidmore";
          repo = "zsh-fzf-history-search";
          rev = "master";
          sha256 = "sha256-6UWmfFQ9JVyg653bPQCB5M4jJAJO+V85rU7zP4cs1VI=";
        };
      }
    ];

    history = {
      extended = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "robbyrussell";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    extraOptions = ["--group-directories-first" "--header"];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
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
