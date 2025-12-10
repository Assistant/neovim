{ lib, ... }: {
  keymaps = [
    # Move selected text
    {
      action = lib.nixvim.mkRaw "[[:m '>+1<CR>gv=gv]]";
      key = "J";
      mode = [ "v" ];
      options.desc = "Move selected text down";
    }
    {
      action = lib.nixvim.mkRaw "[[:m '<-2<CR>gv=gv]]";
      key = "K";
      mode = [ "v" ];
      options.desc = "Move selected text up";
    }
    # Keep cursor in sensible position
    {
      action = "mzJ`z";
      key = "J";
      mode = [ "n" ];
      options.desc = "Merge next line while keeping cursor in place";
    }
    {
      action = "<C-d>zz";
      key = "<C-d>";
      mode = [ "n" ];
      options.desc = "Half page down keeping cursor in middle ";
    }
    {
      action = "<C-u>zz";
      key = "<C-u>";
      mode = [ "n" ];
      options.desc = "Half page up keeping cursor in middle";
    }
    {
      action = "nzzzv";
      key = "n";
      mode = [ "n" ];
      options.desc = "Next search result keeping cursor in middle";
    }
    {
      action = "Nzzzv";
      key = "N";
      mode = [ "n" ];
      options.desc = "Previous search result keeping cursor in middle";
    }
    # Do not cut on paste/delete
    {
      action = lib.nixvim.mkRaw ''[["_dP]]'';
      key = "<leader>p";
      mode = [ "x" ];
      options.desc = "Paste without cutting into register";
    }
    {
      action = lib.nixvim.mkRaw ''[["_d]]'';
      key = "<leader>d";
      mode = [ "n" "v" ];
      options.desc = "Delete without cutting into register";
    }
    # Copy to primary buffer
    {
      action = lib.nixvim.mkRaw ''[["+y]]'';
      key = "<leader>y";
      mode = [ "n" "v" ];
      options.desc = "yank into primary buffer";
    }
    {
      action = lib.nixvim.mkRaw ''[["+Y]]'';
      key = "<leader>Y";
      mode = [ "n" ];
      options.desc = "Yank into primary buffer";
    }
    # Unbind Q
    {
      action = "<nop>";
      key = "Q";
      mode = [ "n" ];
      options.desc = "Unbind Q";
    }
    # QuickFix
    {
      action = "<CMD>cnext<CR>zz";
      key = "<C-k>";
      mode = [ "n" ];
      options.desc = "Go to next QuickFix item";
    }
    {
      action = "<CMD>cprev<CR>zz";
      key = "<C-j>";
      mode = [ "n" ];
      options.desc = "Go to previous QuickFix item";
    }
    {
      action = "<CMD>lnext<CR>zz";
      key = "<leader>k";
      mode = [ "n" ];
      options.desc = "Go to next location";
    }
    {
      action = "<CMD>lprev<CR>zz";
      key = "<leader>j";
      mode = [ "n" ];
      options.desc = "Go to previous location";
    }
    # Replace under cursor
    {
      action = lib.nixvim.mkRaw "[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]";
      key = "<leader>s";
      mode = [ "n" ];
      options.desc = "Search and replace under cursor";
    }
    # Make file executable
    {
      action = "<CMD>!chmod +x %<CR>";
      key = "<leader>x";
      mode = [ "n" ];
      options = { silent = true; desc = "Make file executable"; };
    }
  ];
}
