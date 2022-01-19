{
  description = "My Go Application";

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
    in import ./shell.nix { inherit pkgs;});

    overlay = lib.mkOverlays {
      inherit allPkgs;
      overlayFunc = sys: pkgs: (top: last: {
        myApp = self.packages."${sys}".myApp;
      });
    };

    defaultPackage = lib.withDefaultSystems (sys: self.packages."${sys}".myApp);

    packages = lib.withDefaultSystems (sys: let
      pkgs = allPkgs."${sys}";
    in {
      myApp = pkgs.buildGoModule rec {
        pname ="myApp";
        version = "0.1.0";

        buildInputs = with pkgs; [ ];

        proxyVendor = true;

        src = ./.;

        vendorSha256 = "";
      };

    });
  };
}
