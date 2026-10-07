{pkgs, ...}: {
  imports = [
    ../desktop/zed.nix
  ];

  home.packages = [
    (pkgs.writeShellScriptBin "wslview" ''
      exec cmd.exe /c start "" "$@"
    '')
  ];

  home.sessionVariables = {
    BROWSER = "wslview";
  };
}
