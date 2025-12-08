{ lib, config, pkgs, ... }: {
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight = {
          additional_vim_regex_highlighting = true;
          enable = true;
        };
        indent.enable = true;
      };
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars
        ++ (lib.optionals config.plugins.neorg.enable (with pkgs.tree-sitter-grammars;
        [ tree-sitter-norg tree-sitter-norg-meta ]));
    };
    treesitter-context.enable = true;
  };
}
