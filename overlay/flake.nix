{
  description = "Package overlay";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
    in import ./shell.nix { inherit pkgs;});

    overlay = lib.mkOverlays {
      inherit allPkgs;
      overlayFunc = sys: pkgs: (top: last: {
        hello = self.packages."${sys}".hello;
      });
    };

    defaultPackage = lib.withDefaultSystems (sys: self.packages."${sys}".hello);

    packages = lib.withDefaultSystems (sys: let
      pkgs = allPkgs."${sys}";
    in {
      hello = pkgs.hello;
    });
  };
}
