{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      
      history = {
        size = 1000;
        path = ".local/share/zsh/history";
      };
    };
  };
}
