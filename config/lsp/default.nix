{ self, lib, pkgs, ... }: {
  imports = [
    ./dap.nix
    ./rust.nix
  ];

  plugins = {
    lspconfig.enable = true;
    treesitter.enable = true;
    nix-develop.enable = true;
    lsp-format.enable = true;
    blink-cmp = {
      enable = true;
      settings.keymap = {
        "<PageUp>" = [ "scroll_documentation_up" "fallback" ];
        "<Esc>" = [ "hide" "fallback" ];
        "<PageDown>" = [ "scroll_documentation_down" "fallback" ];
        "<C-Space>" = [ "show" "show_documentation" "hide_documentation" ];
        "<CR>" = [ "accept" "fallback" ];
        "<Up>" = [ "select_prev" "fallback" ];
        "<Down>" = [ "select_next" "fallback" ];
        "<Tab>" = [ "select_next" "fallback" ];
        "<S-Tab>" = [ "select_prev" "fallback" ];
      };
    };
  };

  lsp = {
    inlayHints.enable = true;
    servers = {
      cssls.enable = true;
      jedi_language_server.enable = true;
      nil_ls = {
        enable = true;
        config.settings =
          let
            system = pkgs.stdenv.hostPlatform.system;
            nixpkgs-fmt = lib.getExe self.packages.${system}.nixpkgs-fmt;
          in
          { nil = { formatting.command = [ nixpkgs-fmt ]; nix.flake.autoArchive = true; }; };
      };
      ts_ls.enable = true;
    };
    keymaps = [
      { key = "<F4>"; lspBufAction = "code_action"; }
      { key = "K"; lspBufAction = "hover"; mode = [ "n" ]; }
      { key = "gt"; lspBufAction = "type_definition"; }
      { key = "gi"; lspBufAction = "implementation"; }
      { key = "gd"; action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_definitions"; }
      { key = "gD"; action = lib.nixvim.mkRaw "require('telescope.builtin').lsp_references"; }
    ];
  };

  diagnostic.settings.signs.text = lib.nixvim.mkRaw ''{
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "⚑",
    }'';

  keymaps = [
    {
      action = "<CMD>Telescope diagnostics<CR>";
      key = "<leader><C-d>";
      mode = [ "n" "v" ];
      options.desc = "Open diagnostics in Telescope";
    }
    {
      action = "<CMD>lua require('nix-develop').nix_develop({'--allow-dirty'})<CR>";
      key = "<F9>";
      mode = [ "n" ];
      options.desc = "Load Nix development environment";
    }
  ];
}
