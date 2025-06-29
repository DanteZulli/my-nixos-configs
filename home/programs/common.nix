{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    ferdium
    code-cursor
    temurin-bin
    (discord.override {
      withOpenASAR = true;
    })
  ];

}
