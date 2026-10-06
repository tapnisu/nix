{...}: {
  services.syncthing = {
    settings = {
      options.deviceName = "Tapnisu Laptop NixOS";
      devices = {
        "Tapnisu Desktop" = {id = "F6FWJLA-TZXKDLD-BKEYDQM-7C3B2OK-TXWKBB4-Z27CSBB-J527OKV-W6EWRQQ";};
        "Tapnisu Laptop" = {id = "XE5RPQS-KUNJALJ-XJUXGYI-WZDPWEJ-XH4QKVJ-EQH6KRX-VPLIBBV-5P2OWQQ";};
        "Tapnisu Laptop NixOS" = {id = "U6NKQLP-RH3BKAD-2TZIUXC-3HNMK45-RSYQRYL-2AILKYI-W5NBYFC-5BINTA4";};
        "Tapnisu PhoneWave" = {id = "6NM7XYU-UHWI23M-Y5CAGDE-WMXLF2E-ZMN5RCW-ECQ2DT6-UD4G4TF-LTQAKQI";};
        "Kohaku" = {id = "N6D4XN5-4SFUGUD-CSOVG67-QJNIDTZ-PIUZIWV-JNHTJE2-AOSNFOG-6NBTEAK";};
      };
      folders = {
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
      };
    };
  };
}
