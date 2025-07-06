{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
  ];

  # ==== Network ====
  networking.hostName = "lachata";

  # ==== AMD Graphics ====
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };
  boot.initrd.kernelModules = [ "amdgpu" ];
  environment.systemPackages = with pkgs; [ lact ];
  systemd = {
    packages = with pkgs; [ lact ];
    services.lactd.wantedBy = [ "multi-user.target" ];
  };
  services.xserver.videoDrivers = [ "amdgpu" ];

  system.stateVersion = "25.05";
}
