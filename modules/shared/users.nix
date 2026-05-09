{pkgs, ...}: {
  users.users.dante = {
    isNormalUser = true;
    description = "Dante Zulli";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
    ];
  };
}
