{ pkgs ? <nixpkgs> }:
pkgs.mkShell {
  name = "HelloDevShell";
  buildInputs = with pkgs; [
  ];

  shellHook = ''
    echo "DEV DevShell"
  '';
}
