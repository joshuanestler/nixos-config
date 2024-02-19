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

      # extraConfig = {
      #   commit.gpgsign = true;
      #   gpg.format = "ssh";
      #   user.signingkey = "SHA256:tka8jPXlGneuMaQQ8EWCDWJ/aVfMlc3iC1MrX1f4+Jo";
      # };

      lfs = {
        enable = true;
      };

      difftastic = {
        enable = true;
      };
    };
  };
}
