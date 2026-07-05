{ pkgs, lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vim-nixhash"
  ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-nixhash
  ];
}
