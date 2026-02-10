{
  config,
  pkgs,
  ...
}: {
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  time.timeZone = "Asia/Krasnoyarsk";
  android-integration.termux-setup-storage.enable = true;
  user.userName = "tapnisu";

  environment.sessionVariables.EDITOR = "nvim";
  environment.motd = null;

  system.stateVersion = "25.11";
}
