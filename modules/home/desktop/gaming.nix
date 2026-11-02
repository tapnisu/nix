{inputs, pkgs, ...}: {
  imports = [
    "${inputs.nix-flatpak}/modules/home-manager.nix"
  ];

  programs.lutris.enable = true;
  programs.mangohud.enable = true;

  services.flatpak.packages = [
    "com.fightcade.Fightcade"
  ];

  home.packages = with pkgs; [protontricks];
}
