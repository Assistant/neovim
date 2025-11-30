{
  description = "Assistant's neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixvim }:
    let
      systems = [ "aarch64-linux" "i686-linux" "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      configuration = system:
        { inherit system; extraSpecialArgs = { inherit self; }; module = import ./config; };
    in
    {
      packages = forAllSystems (system: {
        default = (nixvim.legacyPackages.${system}.makeNixvimWithModule (configuration system));
        nixpkgs-fmt = nixpkgs.legacyPackages.${system}.callPackage ./nixpkgs-fmt.nix { };
      });

      legacyPackages = self.packages;

      checks = forAllSystems (system: {
        default = (nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule
          (configuration system));
      });
    };
}
