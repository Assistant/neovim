{ pkgs, ... }: {
  plugins.rustaceanvim.enable = true;

  extraPackages = with pkgs; [
    cargo
    clang
    clippy
    openssl
    pkg-config
    rust-analyzer
    rustPlatform.rustcSrc
    rustc
    rustfmt
  ];
}
