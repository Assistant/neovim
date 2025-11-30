{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      icons = { };
      notify = { };
      trailspace = { };
      pairs = { };
      move.mappings = {
        left = "H";
        right = "L";
        down = "J";
        up = "K";

        line_left = "<C-left>";
        line_right = "<C-right>";
        line_down = "<C-down>";
        line_up = "<C-up>";
      };
    };
  };
}
