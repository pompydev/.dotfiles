r:
    sudo nixos-rebuild switch --flake ./#$(hostname) --print-build-logs

rj jobs='1':
    sudo nixos-rebuild switch --flake ./#$(hostname) --print-build-logs --max-jobs {{jobs}}

u:
    sudo nix flake update

lg:
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

gc:
    sudo nix-collect-garbage -d
    nix-env --delete-generations old
