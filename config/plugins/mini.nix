{ config, lib, ... }:
let
  isEnabled = module: lib.hasAttrByPath [ "plugins" "mini" "modules" module ] config;
in
{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      ai = { };
      icons = { };
      notify = { };
      trailspace = { };
      pairs = { };
    };
  };

  autoCmd = lib.optionals (isEnabled "trailspace")
    [{
      event = [ "BufWritePre" ];
      callback = lib.nixvim.mkRaw ''
        function()
          require('mini.trailspace').trim()
          require('mini.trailspace').trim_last_lines()
        end
      '';
    }];
}
