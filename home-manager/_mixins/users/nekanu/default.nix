{ pkgs, ... }: {
  programs = {
    git = {
      userEmail = "developer.jn@mailbox.org";
      userName = "Joshua Nestler";
    };

    firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
        extraNativeMessagingHosts = with pkgs.nur.repos.wolfangaukang; [ vdhcoapp ];
      };
    };
  };
}
