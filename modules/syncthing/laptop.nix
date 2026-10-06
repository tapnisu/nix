{...}: {
  services.syncthing.settings.folders = {
    "Documents" = {
      id = "y2inw-olohw";
      path = "~/Documents";
      devices = ["Tapnisu PhoneWave" "Tapnisu Desktop"];
    };
    "Pictures" = {
      id = "hzurs-cxhec";
      path = "~/Pictures";
      devices = ["Tapnisu PhoneWave" "Tapnisu Desktop"];
    };
    "MELTY BLOOD: TYPE LUMINA Save Files" = {
      id = "kghqy-e9vfj";
      path = "~/.local/share/Steam/steamapps/common/MELTY BLOOD TYPE LUMINA/winsave";
      devices = ["Tapnisu Desktop" "Kohaku"];
    };
    "MELTY BLOOD: TYPE LUMINA Replays" = {
      id = "wiydf-urtqz";
      path = "~/.local/share/Steam/steamapps/common/MELTY BLOOD TYPE LUMINA/Replay";
      devices = ["Tapnisu Desktop" "Kohaku"];
    };
  };
}
