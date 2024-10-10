{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    authenticator
  ];
}
