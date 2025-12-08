{
  imports = [
    ./git.nix
    ./harpoon.nix
    ./mini.nix
    ./neorg.nix
    ./oil.nix
    ./statusbar.nix
    ./telescope.nix
    ./undotree.nix
  ];

  plugins = {
    vim-be-good.enable = true;
    which-key.enable = true;
  };
}
