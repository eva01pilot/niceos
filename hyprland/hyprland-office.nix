{pkgs, ...}: {
  imports = [
    ./hyprland.nix
  ];
  wayland.windowManager.hyprland.settings = {
    monitor = ["DP-4,preferred,0x0,1" "HDMI-A-4,preferred,1920x0,1" ", preferred, auto, 1"];
    workspace = [
      "1, monitor:DP-4, on-created-empty:kitty"
      "2, monitor:HDMI-A-4, on-created-empty:chromium"
      "3, monitor:DP-4, on-created-empty:telegram-desktop"
      "4, monitor:HDMI-A-4, on-created-empty:firefox"
    ];
  };
}
