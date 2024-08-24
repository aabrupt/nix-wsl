{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.wifi;
in {
  options.modules.wifi = {enable = mkEnableOption "wifi";};
  config = mkIf cfg.enable {
    networking.wireless.enable = true;
    networking.networkmanager.enable = false;

    networking.wireless.userControlled.enable = true;
    networking.wireless.environmentFile = config.age.secrets.wifi-env.path;
    networking.wireless.networks = {
      "Spökhuset" = {
        psk = "@PSK_SPOKHUSET@";
        priority = 0;
      };
      "Nygren" = {
        psk = "@PSK_NYGREN@";
        priority = 1;
      };
      "Cinderblock" = {
        psk = "@PSK_CINDERBLOCK@";
        priority = 3;
      };
    };
  };
}
