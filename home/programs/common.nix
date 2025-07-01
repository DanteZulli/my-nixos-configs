{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    ferdium
    code-cursor
    temurin-bin
    dbeaver-bin
    qbittorrent
    (discord.override {
      withOpenASAR = true;
    })
  ];

}
