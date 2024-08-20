{modules, ...}: {
  imports = [modules];
  config.modules = {
    # gui
    hyprland.enable = true;
    eww.enable = true;
    kitty.enable = true;
    fuzzel.enable = true;
    dunst.enable = true;

    # cli
    nvim.enable = true;
    fish.enable = true;
    git.enable = true;
    pass.enable = true;
    tmux.enable = true;
    starship.enable = true;

    # system
    xdg.enable = true;
    packages.enable = true;
  };
}
