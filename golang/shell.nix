{ pkgs ? <nixpkgs> }:
let

  tmuxIde = pkgs.writeScriptBin "tmuxide" ''
    tmux new-session -d -s myApp vim
    tmux rename-window 'neovim'
    tmux select-window -t 'myApp:0'
    tmux split-window -v -p 30 zsh
    tmux attach-session -t myApp
  '';
in pkgs.mkShell {
  name = "golangdevshell";
  buildInputs = with pkgs; [
    go
    dep2nix
    delve
    tmuxIde
  ];



  shellHook = ''
    echo "myApp DevShell"
    export SHELL=zsh
    export EDITOR=vim
  '';
}
