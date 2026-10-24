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
    "Readest Books" = {
      id = "vkiuw-ajunr";
      path = "~/.local/share/com.bilingify.readest/Readest/Books";
      devices = ["Tapnisu Desktop" "Kohaku"];
    };
    "Steam Grid" = {
      id = "9phis-fsh6t";
      path = "~/.local/share/Steam/userdata/471257832/config/grid";
      devices = ["Tapnisu Desktop"];
    };
    "Steam Screenshots" = {
      id = "wag33-nh4z6";
      path = "~/.local/share/Steam/userdata/471257832/760";
      devices = ["Tapnisu Desktop" "Kohaku"];
    };
    "Touhou 15.5: Antinomy of Common Flowers save data" = {
      id = "7kfel-bqmgs";
      path = "~/.local/share/Steam/steamapps/common/th155";
      devices = ["Tapnisu Desktop" "Kohaku"];
      ignorePatterns = [
        "!/replay"
        "!/replay/**"
        "!/system.dat"
        "!/score.dat"
        "*"
      ];
    };
    "MBAACC Results & Replays" = {
      id = "dj6pe-y3jqa";
      path = "~/Games/melty-blood-actress-again-current-code/drive_c/Program\ Files/MBAACC/";
      devices = ["Tapnisu Desktop" "Kohaku"];
      ignoreParrents = [
        "!/results.csv"
        "!/ReplayVS/"
        "!/ReplayVS/**"
        "*"
      ];
    };
  };
}
