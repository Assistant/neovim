{
  plugins = {
    oil = {
      enable = true;
      settings = {
        default_file_explorer = true;
        win_options.signcolumn = "yes:2";
        columns = [ "permissions" "size" "icon" ];
        watch_for_changes = true;
      };
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
