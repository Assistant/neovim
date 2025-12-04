{
  plugins = {
    lazygit.enable = true;
    gitsigns.enable = true;
  };

  keymaps = [{
    action = "<CMD>LazyGit<CR>";
    key = "<leader>gg";
    mode = [ "n" ];
    options = {
      desc = "Open LazyGit";
      silent = true;
    };
  }];
}
