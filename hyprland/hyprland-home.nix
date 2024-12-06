{pkgs, ...}: {
  imports = [
    ./hyprland.nix
  ];
  wayland.windowManager.hyprland.settings = {
    monitor = ["DP-1,1920x1080@165,0x0,1"];
  };
}