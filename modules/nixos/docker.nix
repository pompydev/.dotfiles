{
  pkgs,
  user ? "pomp",
  ...
}:

{
  users.users.${user}.extraGroups = [ "docker" ];
  environment.systemPackages = with pkgs; [
    docker
    docker-buildx
    docker-compose
    lazydocker
  ];

  virtualisation.docker.enable = true;
}
