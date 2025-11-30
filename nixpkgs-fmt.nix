{ lib, rustPlatform, fetchFromGitHub }: rustPlatform.buildRustPackage {
  pname = "nixpkgs-fmt";
  version = "1.3.0-unstable-2025-01-21";

  src = fetchFromGitHub {
    owner = "Assistant";
    repo = "nixpkgs-fmt";
    rev = "a6e30bca8a409026d032014b60406aa831b90b19";
    hash = "sha256-ROSlByPLJhX+BwQYFrTiTLYwT9TWicz9z+Adgr+qg9s=";
  };

  cargoHash = "sha256-yUcamgt+lLOjL+V+MALUpSjFPp4X0I7uGVYVzQnwUJY=";

  doCheck = false;

  meta = with lib; {
    description = "Nix code formatter for nixpkgs";
    license = licenses.asl20;
    mainProgram = "nixpkgs-fmt";
  };
}
