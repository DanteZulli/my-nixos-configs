{
  pkgs,
  pkgsUnstable,
  ...
}: {
  home.packages = with pkgs;
    [
      alejandra
      alsa-utils
      ani-cli
      btop
      direnv
      fastfetch
      fortune
      fatsort
      ffmpeg
      gh
      heroic
      just
      krabby
      mangohud
      micro
      nodejs_24
      protonup-ng
      podman-compose
      yt-dlp
      blanket
      file-roller
      nicotine-plus
      skyscraper
      temurin-bin
    ]
    ++ [
      pkgsUnstable.opencode
      pkgsUnstable.vscode-fhs
    ];
}
