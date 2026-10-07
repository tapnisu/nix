{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;

    # optional Nvidia hardware acceleration
    # package = (
    #   pkgs.obs-studio.override {
    #     cudaSupport = true;
    #   }
    # );

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi #optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  # boot.extraModulePackages = [
  #   config.boot.kernelPackages.v4l2loopback
  # ];
  # boot.kernelModules = ["v4l2loopback"];
}
