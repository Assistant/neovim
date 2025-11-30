{ lib, ... }: {
  plugins.undotree.enable = true;

  keymaps = [{
    action = "<CMD>UndotreeToggle<CR>";
    key = "<leader>u";
    mode = [ "n" ];
    options.desc = "Open Undotree";
  }];

  opts.undodir = lib.nixvim.mkRaw /* lua */ "vim.fn.stdpath('state') .. '/undodir'";
}
