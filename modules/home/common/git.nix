{config, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Aleksei Rybin";
        email = "aleksei@tapni.su";
        signingkey = "4DED407482DB6E6E";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = config.home.sessionVariables.EDITOR;
      commit.gpgsign = true;
      tag.gpgsign = true;
    };
  };
}
