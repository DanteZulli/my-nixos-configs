{...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Dante Zulli";
      user.email = "dantezulli2004@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      alias.sync = "!git add . && git commit && git push";
    };
  };
}
