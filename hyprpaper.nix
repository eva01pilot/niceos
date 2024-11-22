let
  picsPath = builtins.toPath ./pics/gruvbox-light-anime.png;
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = [
        "${picsPath}"
      ];

      wallpaper = [
        "HDMI-A-4,${picsPath}"
        "DP-4,${picsPath}"
      ];
    };
  };
}
