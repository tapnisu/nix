{pkgs, ...}: {
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird-esr;
    profiles.default = {
      isDefault = true;
    };
  };
}
