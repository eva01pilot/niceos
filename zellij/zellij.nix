{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    xdg.configFile."zellij/config.kdl".text = ''
      keybinds {
          // keybinds are divided into modes
          normal {
              // bind instructions can include one or more keys (both keys will be bound separately)
              // bind keys can include one or more actions (all actions will be performed with no sequential guarantees)
              bind "Alt h" "Alt Left" { MoveFocusOrTab "Left"; }
              bind "Alt l" "Alt Right" { MoveFocusOrTab "Right"; }
          }
      }
    '';
  };
}
