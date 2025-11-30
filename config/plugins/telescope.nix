{ pkgs, ... }: {
  plugins.telescope = {
    enable = true;
    extensions = {
      fzy-native.enable = true;
      media-files.enable = true;
      ui-select.enable = true;
      undo.enable = true;
    };
    keymaps = {
      "<leader>ff" = { action = "find_files"; options.desc = "Open Telescope file finder"; };
      "<C-p>" = { action = "git_files"; options.desc = "Open git files in Telescope"; };
    };
  };

  keymaps = [{
    action = "<CMD>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ')})<CR>";
    options.desc = "Search for text to grep in Telescope";
    key = "<leader>fs";
    mode = [ "n" ];
  }];

  extraPackages = with pkgs; [
    ripgrep
    fd
  ];
}
