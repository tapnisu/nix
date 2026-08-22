{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "wslview" ''
      exec cmd.exe /c start "" "$@"
    '')
  ];

  home.sessionVariables = {
    BROWSER = "wslview";
  };
}
