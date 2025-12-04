{
  plugins = {
    treesitter = {
      enable = true;
      settings.highlight = {
        additional_vim_regex_highlighting = true;
        enable = true;
      };
    };
    treesitter-context.enable = true;
  };
}
