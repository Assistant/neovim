{
  plugins.harpoon.enable = true;

  keymaps = [
    {
      action = "<CMD>lua require('harpoon'):list():add()<CR>";
      key = "<leader>a";
      mode = [ "n" ];
      options.desc = "Mark current file with harpoon";
    }
    {
      action = "<CMD>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>";
      key = "<C-e>";
      mode = [ "n" ];
      options.desc = "Toggle harpoon quick menu";
    }
  ] ++ builtins.genList
    (x: {
      action = "<CMD>lua require('harpoon'):list():select(${toString (x + 1)})<CR>";
      key = "<C-${toString (x + 1)}>";
      mode = [ "n" ];
      options.desc = "Harpoon to file #${toString (x + 1)}";
    }) 9;
}
