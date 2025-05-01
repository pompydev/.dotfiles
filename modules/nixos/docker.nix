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
    nvidia-docker
    lazydocker
  ];

  # https://github.com/nix-community/NixOS-WSL/discussions/487#discussioncomment-11180666
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        features.cdi = true;
        cdi-spec-dirs = [ "/home/${user}/.cdi" ];
      };
    };
    daemon.settings.features.cdi = true;
  };
  hardware.nvidia-container-toolkit.enable = true;
}
