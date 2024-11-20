{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    style = ''${builtins.readFile ./style.css}'';
    settings = [
      {
        layer = "top";
        position = "top";
        mode = "dock";
        exclusive = true;
        passthrough = false;
        tk-layer-shell = true;
        ipc = false;
        reload_style_on_change = true;
        height = 0;
        modules-left = [
          "custom/updates"
          "hyprland/workspaces"
        ];
        modules-center = [
          "cava"
          "pulseaudio"
        ];
        modules-right = [
          "keyboard-state"
          "tray"
          "hyprland/language"
          "clock"
          "custom/power"
        ];
        "hyprland/window" = {
          format = "{}";
        };
        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
          show-special = true;
          on-scroll-up = "hyprctl dispatch workspace m-1";
          on-scroll-down = "hyprctl dispatch workspace m+1";
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
            urgent = "";
            default = "󰐗";
            magic = "󰓏";
          };
          persistent-workspaces = {
            "1" = "[]";
            "2" = "[]";
            "3" = "[]";
            "4" = "[]";
            "5" = "[]";
            "6" = "[]";
            "7" = "[]";
            "8" = "[]";
            "9" = "[]";
            "10" = "[]";
          };
          sort-by-number = true;
        };
        "hyprland/language" = {
          format = "{}";
          format-en = "Eng";
          format-ru = "Rus";
        };
        tray = {
          icon-size = 11;
          spacing = 8;
        };
        clock = {
          locale = "ru_RU.UTF-8";
          timezone = "Europe/Moscow";
          format = "{:L%R  %d/%m %a}";
          tooltip-format = "<span font='BlexMono Nerd Font Bold 11'><tt><small>{calendar}</small></tt></span>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            format = {
              months = "<span color='#504945'><b>{}</b></span>";
              days = "<span color='#ebdbb2'><b>{}</b></span>";
              weeks = "<span color='#928374'><b>W{}</b></span>";
              weekdays = "<span color='#7c6f64'><b>{}</b></span>";
              today = "<span color='#d79921'><b><u>{}</u></b></span>";
            };
          };
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 2";
          on-scroll-down = "pamixer -d 2";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };
        "custom/power" = {
          format = "";
          tooltip = false;
          on-click = "wlogout -b 5 --protocol layer-shell";
        };
        cava = {
          framerate = 40;
          autosens = 0;
          sensitivity = 38;
          bars = 18;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 12000;
          method = "pulse";
          hide_on_silence = false;
          sleep_timer = 5;
          source = "auto";
          stereo = false;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          noise_reduction = 0.77;
          input_delay = 0;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          actions = {
            on-click-right = "mode";
          };
        };
      }
    ];
  };
}
