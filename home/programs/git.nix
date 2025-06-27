{
  ...
}:

{
  programs.git = {
    enable = true;
    userName = "Dante Zulli";
    userEmail = "dantezulli2004@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
