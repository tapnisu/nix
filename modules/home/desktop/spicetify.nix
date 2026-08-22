# https://github.com/aelloc/nihh/blob/01935ed1cc09bcbcd943c7c9b30f6ae979fbe01b/hosts/shared/spicetify.nix
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      marketplace
      ncsVisualizer
    ];
  };
}
