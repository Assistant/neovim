{
  imports = [
    ./keymaps.nix
    ./lsp
    ./plugins
    ./theme.nix
  ];

  viAlias = true;
  vimAlias = true;

  globals.mapleader = " ";

  opts = {
    number = true;
    relativenumber = true;

    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    expandtab = true;

    smartindent = true;

    swapfile = false;
    backup = false;
    undofile = true;

    hlsearch = false;
    incsearch = true;

    termguicolors = true;
    cursorline = true;

    scrolloff = 8;
    signcolumn = "yes";

    updatetime = 50;
    colorcolumn = "98";
  };

  autoCmd = [{
    event = "Filetype";
    pattern = "nix";
    command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2";
  }];
}
