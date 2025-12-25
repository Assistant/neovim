{
  imports = [
    ./git.nix
    ./harpoon.nix
    ./image.nix
    ./mini.nix
    ./neorg.nix
    ./oil.nix
    ./render-markdown.nix
    ./statusbar.nix
    ./telescope.nix
    ./undotree.nix
  ];

  plugins = {
    vim-be-good.enable = true;
    which-key.enable = true;
  };
}
