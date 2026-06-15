{den, ...}: {
  den.aspects.starship.homeManager = {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
      };
      presets = ["tokyo-night"];
    };
  };
}
