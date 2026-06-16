{den, ...}: {
  den.aspects.packages = {
    includes = [
      (den.batteries.unfree [
        "discord"
        "code"
        "vscode"
      ])
    ];

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        alejandra
        android-tools
        alsa-utils
        ani-cli
        btop
        calibre
        docker-compose
        direnv
        discord
        dbeaver-bin
        eom
        fastfetch
        fortune
        grim
        slurp
        wl-clipboard
        mako
        fatsort
        ffmpeg
        heroic
        hugo
        just
        krabby
        mangohud
        micro
        nodejs_24
        protonup-ng
        simplescreenrecorder
        yt-dlp
        blanket
        libreoffice
        kdePackages.kdenlive
        nicotine-plus
        skyscraper
        sqlite
        temurin-bin
        eclipses.eclipse-jee
        engrampa
        unzip
        p7zip
        vlc
        lxappearance
        qogir-theme
        arc-icon-theme
        psmisc
        prusa-slicer
        vscode-fhs
      ];
    };
  };
}
