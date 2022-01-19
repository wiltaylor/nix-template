{ pkgs ? <nixpkgs> }:
pkgs.mkShell {
  name = "golangdevshell";
  buildInputs = with pkgs; [
    go
    dep2nix
    delve
  ];

  shellHook = ''
    echo "myApp DevShell"
  '';
}
