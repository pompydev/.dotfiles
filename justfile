r HOST:
    sudo nixos-rebuild switch --flake ./#{{HOST}} --print-build-logs

u:
    nix flake update

lg:
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

gc:
    nix-collect-garbage -d
