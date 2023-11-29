{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = rec {
          satty = pkgs.callPackage ./derivation.nix { };
          default = satty;
        };

        apps = rec {
          satty = flake-utils.lib.mkApp { drv = packages.satty; };
          default = satty;
        };
      });
}
