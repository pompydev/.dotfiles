r HOST="desktop":
    sudo nixos-rebuild switch --flake ./#{{HOST}} --print-build-logs

u:
    sudo nix flake update

lg:
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

gc:
    sudo nix-collect-garbage -d
