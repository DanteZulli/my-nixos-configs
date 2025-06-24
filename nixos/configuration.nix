# For Help, check NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Bootloader
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

  # Networking
  networking.hostName = "lachata"; 
  networking.networkmanager.enable = true;

  # Time Zone and Internationalisation
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

  # Sway WM & Ly DM
  programs.sway = {
    enable = true;
  };
  services.displayManager.ly.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # GNOME Desktop Environment
  /* services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    baobab
    cheese
    eog
    epiphany
    gedit
    simple-scan
    totem
    yelp
    evince
    geary
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-photos
    gnome-system-monitor
    gnome-weather
    gnome-disk-utility
    gnome-connections
    gnome-text-editor
    gnome-tour  
  ];*/

  # Keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # ZRam
  zramSwap.enable = true;

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User Account
  users.users.dante = {
    isNormalUser = true;
    description = "Dante Zulli";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Sway Related
    grim
    slurp
    wl-clipboard
    mako
    
    # Password & Keys Managment
    seahorse

    # Terminal Emulators
    foot
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
