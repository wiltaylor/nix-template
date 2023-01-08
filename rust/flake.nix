{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: let

    allPkgs = lib.mkPkgs { 
      inherit nixpkgs; 
      cfg = { allowUnfree = true; };
    };

    lib = import ./lib;
 in {

    devShell = lib.withDefaultSystems (sys: let
      pkgs = allPkgs."${sys}";
    in pkgs.mkShell {
        buildInputs = with pkgs; [
            rustfmt
            cargo
            clippy
            rustc
            just
            rust-analyzer 
        ];
    });

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
