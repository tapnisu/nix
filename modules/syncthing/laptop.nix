{...}: {
  services.syncthing = {
    settings = {
      options.deviceName = "Tapnisu Laptop NixOS";
      devices = {
        "Kohaku" = {id = "N6D4XN5-4SFUGUD-CSOVG67-QJNIDTZ-PIUZIWV-JNHTJE2-AOSNFOG-6NBTEAK";};
        "Tapnisu PhoneWave" = {id = "6NM7XYU-UHWI23M-Y5CAGDE-WMXLF2E-ZMN5RCW-ECQ2DT6-UD4G4TF-LTQAKQI";};
        "Tapnisu Desktop" = {id = "F6FWJLA-TZXKDLD-BKEYDQM-7C3B2OK-TXWKBB4-Z27CSBB-J527OKV-W6EWRQQ";};
      };
      folders = {
        "Documents" = {
          path = "~/Documents";
          devices = ["Tapnisu PhoneWave" "Tapnisu Desktop"];
        };
        "Pictures" = {
          path = "~/Pictures";
          devices = ["Tapnisu PhoneWave" "Tapnisu Desktop"];
        };
      };
    };
  };
}
