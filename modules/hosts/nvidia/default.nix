{...}: {
  imports = [
    ./ffmpeg.nix
    ./obs.nix
  ];

  nixpkgs.config.cudaSupport = true;
}
