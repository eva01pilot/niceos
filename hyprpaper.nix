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

      wallpapers = [
        "monitor1,${picsPath}"
        "DP-1,${picsPath}"
      ];
    };
  };
}
