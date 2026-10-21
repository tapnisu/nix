{pkgs, ...}: {
  programs.thunderbird = {
    enable = true;
    package = pkgs.thunderbird-esr;
    languagePacks = ["ru"];
    settings = {
      "intl.locale.requested" = "ru";
      "intl.regional_prefs.configured" = "ru";
    };
    profiles.default = {
      isDefault = true;
    };
  };

  home.sessionVariables.MOZ_USE_XINPUT2 = "1";
}
