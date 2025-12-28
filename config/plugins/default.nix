{ lib, ... }: {
  imports = lib.pipe (builtins.readDir ./.) [
    (lib.filterAttrs (_: type: type == "regular" || type == "directory"))
    lib.attrNames
    (map (file: ./. + "/${file}"))
    (lib.subtractLists [
      ./default.nix
    ])
  ];

  plugins = {
    vim-be-good.enable = true;
    which-key.enable = true;
  };
}
