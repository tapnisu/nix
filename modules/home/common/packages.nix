{
  pkgs,
  tapciify,
  ...
}: {
  home.packages = with pkgs; [
    tapciify.packages.${pkgs.stdenv.hostPlatform.system}.default

    nnn # terminal file manager

    zip
    xz
    unzip
    p7zip

    ripgrep
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq

    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    glow
    fastfetch

    htop
    btop
    iotop # io monitoring
    iftop # network monitoring

    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    nil
    alejandra
  ];
}
