{pkgs, ...}: {
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.autoSuspend = false;
  services.xserver.desktopManager.budgie.enable = true;
  environment.budgie.excludePackages = with pkgs; [
    mate.engrampa
    gnome-terminal
    mate.mate-terminal
  ];
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };
  console.keyMap = "us-acentos";
}
