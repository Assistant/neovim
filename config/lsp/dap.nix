{ pkgs, ... }: {
  plugins = {
    dap.enable = true;
    dap-ui.enable = true;
  };

  extraPackages = with pkgs; [ lldb ];
}
