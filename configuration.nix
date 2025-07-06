{ config, pkgs, ... }:

{
  # ==== BootLoader (Grub) ====
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      configurationLimit = 10;
    };
    timeout = null;
  };

  # ==== Nix ====
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # ==== TimeZone and Locale ====
  time.timeZone = "America/Argentina/Buenos_Aires";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };

  # ==== Network ====
  networking.networkmanager.enable = true;

  # ==== Fonts ====
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-sans
      nerd-fonts.ubuntu-mono
      nerd-fonts.symbols-only
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "UbuntuSans Nerd Font" ];
        serif = [ "Ubuntu Nerd Font" ];
        monospace = [ "UbuntuMono Nerd Font" ];
      };
    };
  };

  # ==== Hyprland ====
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # ==== DisplayManager ====
  services.displayManager.ly.enable = true;

  # ==== Polkit ====
  security.polkit.enable = true;

  # ==== dconf ====
  programs.dconf.enable = true;

  # ==== XDG Desktop Portals ====
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };

  # ==== Environment Variables ====
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  # ==== Audio ====
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];

  # ==== Users (Dante) ====
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

  # ==== Bluetooth ====
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # ==== Docker ====
  virtualisation.docker.enable = true;

  # ==== ZRam ====
  zramSwap.enable = true;

}
