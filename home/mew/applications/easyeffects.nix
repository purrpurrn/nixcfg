{ config, pkgs, ... }: {
  config = {
    services.easyeffects = {
      enable = true;
      preset = ''
        Preamp: -4.48 dB
        Filter 1: ON LSC Fc 105.0 Hz Gain 0.2 dB Q 0.70
        Filter 2: ON PK Fc 59.3 Hz Gain 2.1 dB Q 1.56
        Filter 3: ON PK Fc 107.8 Hz Gain -3.3 dB Q 1.27
        Filter 4: ON PK Fc 160.0 Hz Gain -1.6 dB Q 2.48
        Filter 5: ON PK Fc 266.6 Hz Gain 3.8 dB Q 1.88
        Filter 6: ON PK Fc 679.9 Hz Gain -0.8 dB Q 1.95
        Filter 7: ON PK Fc 1641.4 Hz Gain -2.3 dB Q 1.04
        Filter 8: ON PK Fc 3665.5 Hz Gain 5.3 dB Q 2.98
        Filter 9: ON PK Fc 5687.1 Hz Gain -3.5 dB Q 2.86
        Filter 10: ON HSC Fc 10000.0 Hz Gain -0.5 dB Q 0.70
      '';
    };
  };
}
