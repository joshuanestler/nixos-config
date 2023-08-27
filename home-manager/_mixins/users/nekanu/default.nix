{ pkgs, ... }: {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
        extraNativeMessagingHosts = with pkgs.nur.repos.wolfangaukang; [ vdhcoapp ];
      };
    };
  };
}
