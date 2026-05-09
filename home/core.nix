{pkgs, ...}: {
  home = {
    username = "dante";
    homeDirectory = "/home/dante";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
