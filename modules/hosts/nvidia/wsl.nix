# https://yomaq.github.io/posts/nvidia-on-nixos-wsl-ollama-up-24-7-on-your-gaming-pc/
{pkgs, ...}: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.open = true;

  environment.sessionVariables = {
    CUDA_PATH = "${pkgs.cudatoolkit}";
    EXTRA_LDFLAGS = "-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
    EXTRA_CCFLAGS = "-I/usr/include";
    LD_LIBRARY_PATH = [
      "/usr/lib/wsl/lib"
      "${pkgs.linuxPackages.nvidia_x11}/lib"
      "${pkgs.ncurses5}/lib"
    ];
    MESA_D3D12_DEFAULT_ADAPTER_NAME = "Nvidia";

    ZED_ALLOW_EMULATED_GPU = 1; # Zed
  };
}
