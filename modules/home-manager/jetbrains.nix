{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains-toolbox
    (writeShellScriptBin "reset_jetbrains" ../../misc/reset_jetbrains)
  ];
}
