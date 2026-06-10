{...}: {
  programs.sway.enable = true;

  services.displayManager.ly = {
    enable = true;
    settings = {
      default_session = "sway";
    };
  };
}
