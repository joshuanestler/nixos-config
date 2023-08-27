{ pkgs, ... }: {
  programs = {
    gh = {
      enable = true;
      extensions = with pkgs.unstable; [ gh-markdown-preview ];
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };

    git = {
      enable = true;

      userName = "Joshua Nestler";
      userEmail = "developer.jn@mailbox.org";

      signing = {
        key = "0x92D7059CF7BD6BEC";
        signByDefault = true;
      };

      lfs = {
        enable = true;
      };

      difftastic = {
        enable = true;
      };
    };
  };
}
