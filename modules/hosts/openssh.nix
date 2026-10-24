{...}: {
  services.openssh = {
    enable = true;
    openFirewall = true;
    ports = [22222];

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
}
