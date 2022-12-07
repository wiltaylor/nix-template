{
  description = "Flake for building books";

  outputs = { self, nixpkgs }: let
    lib = import ./lib;

    allPkgs = lib.mkPkgs { 
      inherit nixpkgs; 
      cfg = { allowUnfree = true; };
    };
  in {
    devShells = lib.withDefaultSystems (sys: let
        pkgs = allPkgs."${sys}";
    in {
        default = import ./shell.nix { inherit pkgs;};
   } 
    );
  };
}
