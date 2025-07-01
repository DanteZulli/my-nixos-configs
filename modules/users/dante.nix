{ ... }:

{
  users.users.dante = {
    isNormalUser = true;
    description = "Dante Zulli";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
      "docker"
    ];
  };
}
