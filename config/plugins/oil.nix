{ lib, ... }: {
  plugins = {
    oil = {
      enable = true;
      settings = {
        default_file_explorer = true;
        win_options.signcolumn = "yes:2";
        watch_for_changes = true;
        win_options.winbar = "%!v:lua.get_oil_winbar()";
        keymaps."gd" = lib.nixvim.mkRaw ''
          {
            desc = "Toggle file detail view",
            callback = function()
              detail = not detail
              if detail then
                require("oil").set_columns({ "permissions", "size", "mtime", "icon" })
              else
                require("oil").set_columns({ "icon" })
              end
            end,
          }
        '';
      };
      luaConfig.pre = ''
        local detail = false
        function _G.get_oil_winbar()
          local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
          local dir = require("oil").get_current_dir(bufnr)
          if dir then
            return vim.fn.fnamemodify(dir, ":~")
          else
            -- If there is no current directory (e.g. over ssh), just show the buffer name
            return vim.api.nvim_buf_get_name(0)
          end
        end
      '';
    };
    oil-git-status.enable = true;
  };

  keymaps = [
    {
      action = "<CMD>Oil<CR>";
      key = "-";
      mode = [ "n" ];
      options.desc = "Open parent directory";
    }
    {
      action = "<CMD>Oil<CR>";
      key = "<leader>pv";
      mode = [ "n" ];
      options.desc = "Open oil file browser";
    }
  ];
}
