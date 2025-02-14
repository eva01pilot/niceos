{
  pkgs,
  lib,
  ...
}: let
  modifier = "Mod4";
  workspace = {
    terminal = "terminal";
    code = "code";
    browser = "browser";
    spotify = "spotify";
    discord = "discord";
    bitwarden = "bitwarden";
    signal = "signal";
    "1" = "1";
    "2" = "2";
    "3" = "3";
    "4" = "4";
    "5" = "5";
    "6" = "6";
    "7" = "7";
    "8" = "8";
    "9" = "9";
    "0" = "10";
  };
in {
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        inherit modifier;

        bars = [];

        window = {
          border = 0;
          hideEdgeBorders = "both";

          commands = [
            # Start chromium in fullscreen by default.
            {
              command = "fullscreen enable";
              criteria = {class = "Chromium-browser";};
            }

            # Start vscode in fullscreen by default.
            {
              command = "fullscreen enable";
              criteria = {class = "Code";};
            }

            # Bind spotify workspace.
            # This is a workaround for spotify not working with "assigns".
            {
              command = "move to workspace ${workspace.spotify}";
              criteria = {class = "Spotify";};
            }
          ];
        };

        gaps = {
          inner = 10;
          outer = 5;
        };

        keybindings = {
          # Alacritty terminal
          "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";

          # Rofi
          "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";

          # Movement
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+h" = "focus left";
          "${modifier}+l" = "focus right";

          # Workspaces
          "${modifier}+1" = "workspace ${workspace."1"}";
          "${modifier}+2" = "workspace ${workspace."2"}";
          "${modifier}+3" = "workspace ${workspace."3"}";
          "${modifier}+4" = "workspace ${workspace."4"}";
          "${modifier}+5" = "workspace ${workspace."5"}";
          "${modifier}+6" = "workspace ${workspace."6"}";
          "${modifier}+7" = "workspace ${workspace."7"}";
          "${modifier}+8" = "workspace ${workspace."8"}";
          "${modifier}+9" = "workspace ${workspace."9"}";
          "${modifier}+0" = "workspace ${workspace."0"}";

          # Misc
          "${modifier}+q" = "kill";
          "${modifier}+f" = "fullscreen toggle";
          "${modifier}+z" = "split h";
          "${modifier}+x" = "split v";
          "${modifier}+r" = "mode resize";
        };

        assigns = {
          ${workspace.browser} = [{class = "Chromium-browser";}];
        };

        modes.resize = {
          "h" = "resize grow width 10 px or 10 ppt";
          "j" = "resize shrink height 10 px or 10 ppt";
          "k" = "resize grow height 10 px or 10 ppt";
          "l" = "resize shrink width 10 px or 10 ppt";
          "Escape" = "mode default";
        };
      };
    };
  };
}
