{ self, lib, pkgs, ... }: {
  plugins.render-markdown = {
    enable = true;
    settings = {
      render_modes = [ "n" "no" "c" "t" "i" "ic" ];
      completions.lsp.enabled = true;
      code = {
        sign = false;
        border = "thin";
        disable_background = lib.nixvim.mkRaw "{}";
        position = "right";
        width = "block";
        above = "▁";
        below = "▔";
        language_left = "█";
        language_right = "█";
        language_border = "▁";
        left_pad = 1;
        right_pad = 1;
      };
      heading = {
        width = "block";
        backgrounds = [
          "MiniStatusLineModeNormal"
          "MiniStatusLineModeInsert"
          "MiniStatusLineModeReplace"
          "MiniStatusLineModeVisual"
          "MiniStatusLineModeCommand"
          "MiniStatusLineModeOther"
        ];
        sign = false;
        left_pad = 1;
        position = "right";
        icons = [
          ""
          ""
          ""
          ""
          ""
          ""
        ];
      };
    };
  };
  highlightOverride."@markup.raw.block".link = "@markup";
  extraPackages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.libtexprintf ];
}
