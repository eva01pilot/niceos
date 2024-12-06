{pkgs, ...}: {
  imports = [
    ./hyprland.nix
  ];
  wayland.windowManager.hyprland.settings = {
    monitor = ["DP-4,preferred,0x0,1" "HDMI-A-4,preferred,1920x0,1" ", preferred, auto, 1"];
    workspace = ["DP-4,1" "HDMI-A-4,2"];
  };
}
