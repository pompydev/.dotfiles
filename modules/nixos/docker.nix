{ pkgs, ... }:

{
  users.users.pomp.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    docker
    docker-buildx
    docker-compose
    lazydocker
  ];

  virtualisation.docker.enable = true;
}
