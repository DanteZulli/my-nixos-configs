{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    ferdium
    code-cursor
    temurin-bin
  ];

  programs = {
    btop.enable = true; 
  };

}
