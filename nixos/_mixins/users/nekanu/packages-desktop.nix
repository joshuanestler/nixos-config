{ pkgs, ... }: {
  # Desktop application momentum follows the unstable channel.
  programs = {
    firefox = {
      enable = true;
      package = pkgs.unstable.firefox;
    };
  };
}
