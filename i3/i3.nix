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
    extra-1 = "1";
    extra-2 = "2";
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
          "${modifier}+space" = "workspace ${workspace.terminal}";
          "${modifier}+m" = "workspace ${workspace.code}";
          "${modifier}+comma" = "workspace ${workspace.browser}";
          "${modifier}+period" = "workspace ${workspace.bitwarden}";
          "${modifier}+slash" = "workspace ${workspace.spotify}";
          "${modifier}+u" = "workspace ${workspace.discord}";
          "${modifier}+i" = "workspace ${workspace.signal}";
          "${modifier}+o" = "workspace ${workspace.extra-1}";
          "${modifier}+p" = "workspace ${workspace.extra-2}";

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
