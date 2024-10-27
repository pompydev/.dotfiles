{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;

    # List installed extensions: codium --list-extensions
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # {
      #   name = "";
      #   publisher = "";
      #   version = "";
      #   sha256 = "";
      # }

      # general vscode features
      {
        name = "dotenv";
        publisher = "mikestead";
        version = "1.0.1";
        sha256 = "sha256-dieCzNOIcZiTGu4Mv5zYlG7jLhaEsJR05qbzzzQ7RWc=";
      }
      {
        name = "vscode-filesize";
        publisher = "mkxml";
        version = "3.1.0";
        sha256 = "sha256-5485MjY3kMdeq/Z2mYaNjPj1XA+xRHizMrQDWDLWrf8=";
      }
      {
        name = "vscode-wakatime";
        publisher = "wakatime";
        version = "24.6.2";
        sha256 = "sha256-Id4ev+pTaq4Bqsw+saA+fvBTvfkFzI5ClLQ+FMXqKMg=";
      }

      # general editing feature
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "3.0.2";
        sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
      }
      {
        name = "vscode-todo-highlight";
        publisher = "wayou";
        version = "1.0.5";
        sha256 = "sha256-CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
      }
      {
        name = "editorconfig";
        publisher = "editorconfig";
        version = "0.16.4";
        sha256 = "sha256-j+P2oprpH0rzqI0VKt0JbZG19EDE7e7+kAb3MGGCRDk=";
      }
      {
        name = "code-spell-checker";
        publisher = "streetsidesoftware";
        version = "4.0.7";
        sha256 = "sha256-y+xD8rOa/ljavAF7tdEpaOKEd4gUzfH15WBwMHyW7z4=";
      }
      {
        name = "errorlens";
        publisher = "usernamehw";
        version = "3.20.0";
        sha256 = "sha256-0gCT+u6rfkEcWcdzqRdc4EosROllD/Q0TIOQ4k640j0=";
      }
      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "2.9.0";
        sha256 = "sha256-Dy2uhiTRtT14fgfqawUaPnRhddTxoqZmVHFzoz6iUOs=";
      }
      {
        name = "vscode-quick-select";
        publisher = "dbankier";
        version = "0.2.9";
        sha256 = "sha256-XeyjXU+ZdpZ7VOK4oECZp4As3MZxhExq6lXMTMJRAcA=";
      }
      {
        name = "sort-lines-by-selection";
        publisher = "earshinov";
        version = "1.2.0";
        sha256 = "sha256-mxwMX4r+3XuPxG9pRN7MmmvCft0fLtKxp5dv/VFOeK8=";
      }
      {
        name = "rewrap";
        publisher = "stkb";
        version = "17.8.0";
        sha256 = "sha256-9t1lpVbpcmhLamN/0ZWNEWD812S6tXG6aK3/ALJCJvg=";
      }
      {
        name = "vscode-template-literal-editor";
        publisher = "plievone";
        version = "0.10.0";
        sha256 = "sha256-AiDtJadgEQA5Zmrk28oTfOG6eS4QYIA8GQVO6RNUM5Y=";
      }

      # Markdown/Markup
      {
        name = "vscode-xml";
        publisher = "redhat";
        version = "0.27.1";
        sha256 = "sha256-0a1IksSTfqrDDXu/M5ZWVTeEY2rAtpjoU4Rs/9Mlq7A=";
      }
      {
        name = "vscode-yaml";
        publisher = "redhat";
        version = "1.15.0";
        sha256 = "sha256-NhlLNYJryKKRv+qPWOj96pT2wfkiQeqEip27rzl2C0M=";
      }
      {
        name = "vscode-mdx";
        publisher = "unifiedjs";
        version = "1.8.11";
        sha256 = "sha256-fUmyEBTvAxjgYaHXPGsT6c6j4TpSLEi8+WGG9I1wH74=";
      }

      # General web tech
      {
        name = "vscode-tailwindcss";
        publisher = "bradlc";
        version = "0.13.45";
        sha256 = "sha256-kIPIG1NnqTaqRC4gT3FgDmWASOzo4cyTFZ9MOvUdOiE=";
      }
      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "3.0.10";
        sha256 = "sha256-EVmexnTIQQDmj25/rql3eCfJd47zRui3TpHol6l0Vgs=";
      }
      {
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "11.0.0";
        sha256 = "sha256-pNjkJhof19cuK0PsXJ/Q/Zb2H7eoIkfXJMLZJ4lDn7k=";
      }
      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.10";
        sha256 = "sha256-uXqWebxnDwaUVLFG6MUh4bZ7jw5d2rTHRm5NoR2n0Vs=";
      }
      {
        name = "svg";
        publisher = "jock";
        version = "1.5.4";
        sha256 = "sha256-LZLKUmYSnlgypLXKFOGezMepV10t35unpEnCMaLRjeU=";
      }
      {
        name = "color-highlight";
        publisher = "naumovs";
        version = "2.8.0";
        sha256 = "sha256-mT2P1lEdW66YkDRN6fi0rmmvvyBfXiJjAUHns8a8ipE=";
      }
      {
        name = "vscode-stylelint";
        publisher = "stylelint";
        version = "1.4.0";
        sha256 = "sha256-CsQBRoVDtNLlkHa6NLmOspkswB/JUMfMuU2dMYDlDnc=";
      }

      # JS & TS ecosystem
      {
        name = "bun-vscode";
        publisher = "oven";
        version = "0.0.15";
        sha256 = "sha256-9aoDDO7hh+YPTKh64z3rZhnTW5H8Se3+ZTncGrsKyJ0=";
      }
      {
        name = "vscode-deno";
        publisher = "denoland";
        version = "3.42.0";
        sha256 = "sha256-bfhpIxqHeUph51VBMlKBvdBJIeSO9E1ZitrfVl/MqgQ=";
      }
      {
        name = "pretty-ts-errors";
        publisher = "yoavbls";
        version = "0.6.0";
        sha256 = "sha256-cmleAs7EMXT1z0o8Uq5ne2LrthUt/vhcN+iqfAy/i/8=";
      }
      {
        name = "jsdoc-markdown-highlighting";
        publisher = "bierner";
        version = "0.0.1";
        sha256 = "sha256-f87gKQwEPu/aJOhz5sstW804B8hf0pQRdC3C2PAnfgQ=";
      }
      {
        name = "vscode-postcss";
        publisher = "vunguyentuan";
        version = "2.0.2";
        sha256 = "sha256-ttvCwxk3dMwva5LmVHq4p31INTa/T91qQISEU4gYNbg=";
      }

      # icons & themes
      {
        name = "material-icon-theme";
        publisher = "pkief";
        version = "5.12.0";
        sha256 = "sha256-FLHEaWFZ9JAy8S1il10D/2qQG7aNH8n6iA+kFhUTZVs=";
      }
      {
        # One Dark Pro Theme
        name = "material-theme";
        publisher = "zhuangtongfa";
        version = "3.17.5";
        sha256 = "sha256-5rpLTG5MWvOf2l/KMA+/aZgJxoBTzBiHGY4q7Ac1xhg=";
      }

      # git & github
      {
        name = "gitlens";
        publisher = "eamodio";
        version = "15.6.2";
        sha256 = "sha256-mrmQZJhDUEaK0Hgg9sgzG8kCGqatUIlZIsKh1Cd410o=";
      }
      {
        name = "vscode-github-actions";
        publisher = "github";
        version = "0.27.0";
        sha256 = "sha256-sZ831fPgy/HGsXL1gTezbTsnVcYjwxEd79JfMu1jaGo=";
      }
      {
        name = "vscode-pull-request-github";
        publisher = "github";
        version = "0.98.0";
        sha256 = "sha256-oOnojfVPB5XdEQbmmmeFQrZEGW41ZtotJRYKVbiehBM=";
      }
      {
        name = "vscode-conventional-commits";
        publisher = "vivaxy";
        version = "1.26.0";
        sha256 = "sha256-Lj2+rlrKm9h21zEoXwa2TeGFNKBmlQKr7MRX0zgngdg=";
      }

      # Low level stuff
      {
        name = "vscode-decompiler";
        publisher = "tintinweb";
        version = "0.1.0";
        sha256 = "sha256-AyUABtVUTQi9NRjo3O8Ma+XE3rcY+NSxahKUEvxvFG8=";
      }
      {
        name = "ilspy-vscode";
        publisher = "icsharpcode";
        version = "0.19.0";
        sha256 = "sha256-1KagEAoS21MqKE6Zp//9ER10C/bTYIXbpwEajGf7Z2w=";
      }
      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.10.0";
        sha256 = "sha256-EDUspQrqVvIq4CkPjO6+Mnw5fvepahUM1TS6rnxekVY=";
      }
      {
        name = "vscode-lldb";
        publisher = "vadimcn";
        version = "1.11.0";
        sha256 = "sha256-WqUAD9yUCnaYToiZh03PLkPmVvry3+8mH0CvW5pOwIw=";
      }

      # Markdown
      {
        name = "markdown-all-in-one";
        publisher = "yzhang";
        version = "3.6.2";
        sha256 = "sha256-BIbgUkIuy8clq4G4x1Zd08M8k4u5ZPe80+z6fSAeLdk=";
      }
      {
        name = "markdown-katex";
        publisher = "jeff-tian";
        version = "0.1.4";
        sha256 = "sha256-NEVoT1zn9ehG/XJJyPunL3LAeiWORW/8nt+HOH5VxcI=";
      }
      {
        name = "markdown-mermaid";
        publisher = "bierner";
        version = "1.26.0";
        sha256 = "sha256-O91+4K/bnDHdx+YKj2DDnZ+rEUKToXmnrd6G2w+AE5Y=";
      }
      {
        name = "mermaid-markdown-syntax-highlighting";
        publisher = "bpruitt-goddard";
        version = "1.6.6";
        sha256 = "sha256-1WwjGaYNHN6axlprjznF1S8BB4cQLnNFXqi7doQZjrQ=";
      }

      # General vscode features
      {
        name = "dependi";
        publisher = "fill-labs";
        version = "0.7.10";
        sha256 = "sha256-m8W21ztTmEOjDI1KCymeBgQzg9jdgKG9dCFp+U1D818=";
      }

      # Rust
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.3.2154";
        sha256 = "sha256-EYm62FyEcqYR1vEnTTw6VHlAzPddByo75MVvG4WxXrc=";
      }
      {
        name = "even-better-toml";
        publisher = "tamasfe";
        version = "0.19.2";
        sha256 = "sha256-JKj6noi2dTe02PxX/kS117ZhW8u7Bhj4QowZQiJKP2E=";
      }

      # Python
      {
        name = "python";
        publisher = "ms-python";
        version = "2024.16.1";
        sha256 = "sha256-wji6cVeW4nuLr0G1xfxeuKjWpC/bdke4PO+y6u+V/cY=";
      }
      {
        name = "ruff";
        publisher = "charliermarsh";
        version = "2024.52.0";
        sha256 = "sha256-WdgH3fO0xAnzfh/8uX0zUFrml7DhsAUGJl8Xgsv5e2c=";
      }

      # Go
      {
        name = "go";
        publisher = "golang";
        version = "0.42.1";
        sha256 = "sha256-nso/4PspoYxSdKp1JoVcYUMo/coL22StCm3KcgkLMro=";
      }

      # C++
      {
        name = "cpptools";
        publisher = "ms-vscode";
        version = "1.22.10";
        sha256 = "sha256-mwx/wh7AXxv4JG4++3lAEyetUr42GcTF8NgD8P8EMaQ=";
      }

      # C#
      {
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.50.27";
        sha256 = "sha256-TSohDtn+VOhPi5FbA7VbzH8kom+GmdMfq5FoMCXlv5U=";
      }
      {
        name = "csdevkit";
        publisher = "ms-dotnettools";
        version = "1.11.14";
        sha256 = "sha256-YYgADoTb7e6MN3XOBnsx2qi79QeSEr7UK6PYOGybYbE=";
      }
      {
        name = "vscode-dotnet-runtime";
        publisher = "ms-dotnettools";
        version = "2.2.1";
        sha256 = "sha256-vDwtVvXQR8AMZ3z/usz7EQXyMnS9eyiWTaKW3SZ2tgM=";
      }
      {
        name = "mono-debug";
        publisher = "ms-vscode";
        version = "0.16.3";
        sha256 = "sha256-6IU8aP4FQVbEMZAgssGiyqM+PAbwipxou5Wk3Q2mjZg=";
      }

      # Unity
      {
        name = "vstuc";
        publisher = "visualstudiotoolsforunity";
        version = "1.0.4";
        sha256 = "sha256-LkLdXbXW91wMmaXpnRxSpff/zHCOE74nPP3aS0Ig3Gc=";
      }

      # Svelte
      {
        name = "svelte-vscode";
        publisher = "svelte";
        version = "109.1.0";
        sha256 = "sha256-ozD9k/zfklwBJtc1WdC52hgJckxBgVRmcZOwSYboACM=";
      }
      {
        name = "svelte-intellisense";
        publisher = "ardenivanov";
        version = "0.7.1";
        sha256 = "sha256-/AiGMgwCeD9B3y8LxTe6HoIswLuCnLbmwV7fxwfWSLw=";
      }

      # Shell
      {
        name = "shell-format";
        publisher = "foxundermoon";
        version = "7.2.5";
        sha256 = "sha256-kfpRByJDcGY3W9+ELBzDOUMl06D/vyPlN//wPgQhByk=";
      }
      {
        name = "shellcheck";
        publisher = "timonwong";
        version = "0.37.1";
        sha256 = "sha256-JSS0GY76+C5xmkQ0PNjt2Nu/uTUkfiUqmPL51r64tl0=";
      }

      # Docker
      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.29.3";
        sha256 = "sha256-z0RqFos0ZG2Id/alUBZJyroX3coTcJ+x2R8v4FD2Zcg=";
      }

      # LaTeX
      {
        name = "latex-workshop";
        publisher = "james-yu";
        version = "10.5.5";
        sha256 = "sha256-s8Btb769LS1AEOWFDkzJeJXO6YghfDMDm1kZyjgekII=";
      }

      # vim
      {
        name = "viml";
        publisher = "xadillax";
        version = "2.2.0";
        sha256 = "sha256-WNwTWJ3fDdIc9gsfOdtAd6Rg3xH0sbs6ONo7fKjtJuI=";
      }

      # CSV
      {
        name = "rainbow-csv";
        publisher = "mechatroner";
        version = "3.12.0";
        sha256 = "sha256-pnHaszLa4a4ptAubDUY+FQX3F6sQQUQ/sHAxyZsbhcQ=";
      }

      # Godot
      {
        name = "godot-tools";
        publisher = "geequlim";
        version = "2.3.0";
        sha256 = "sha256-iuSec4PoVxyu1KB2jfCYOd98UrqQjH3q24zOR4VCPgs=";
      }
      {
        name = "godot-files";
        publisher = "alfish";
        version = "0.1.0";
        sha256 = "sha256-WYxKCaLsnTFrBSsbJq6+/95yyH8YfbEDY9ne4zkPpf4=";
      }
      {
        name = "godot-csharp-vscode";
        publisher = "neikeq";
        version = "0.2.1";
        sha256 = "sha256-sLsP+4deo/O8NjHGGXVdSOPWQPALypW/H0oZOMMM9RE=";
      }

      # nginx
      {
        name = "vscode-nginx-conf";
        publisher = "ahmadalli";
        version = "0.3.5";
        sha256 = "sha256-6gJtMQH2zanFt+UTaD0Vn1vDq5GY9R1CfelPCklYxYE=";
      }

      # Linux
      {
        name = "systemd-unit-file";
        publisher = "coolbear";
        version = "1.0.6";
        sha256 = "sha256-ZhxSUT3zqdPNiHnfaDp/LQiGxTSLY1Vpc5zEbpv+gGk=";
      }
      {
        name = "linux-desktop-file";
        publisher = "nico-castell";
        version = "0.0.21";
        sha256 = "sha256-4qy+2Tg9g0/9D+MNvLSgWUE8sc5itsC/pJ9hcfxyVzQ=";
      }

      # Tauri
      {
        name = "tauri-vscode";
        publisher = "tauri-apps";
        version = "0.2.9";
        sha256 = "sha256-ySfsmKAReKTLl6lHax2fnPu9paQ2pBSEMUoeGtGJelA=";
      }

      # Terraform / OpenTofu
      {
        name = "opentofu";
        publisher = "gamunu";
        version = "0.2.1";
        sha256 = "sha256-OizdHTSGuwBRuD/qPXjmna6kZWfRp9EimhcFk3ICN9I=";
      }

      # Zig
      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.5.9";
        sha256 = "sha256-tKDIGALQT4mgZ7u+LSbdzW2pdH0RhyUjpWyH4YHNR10=";
      }

      # Nix
      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.3.5";
        sha256 = "sha256-hiyFZVsZkxpc2Kh0zi3NGwA/FUbetAS9khWxYesxT4s=";
      }
      {
        name = "direnv";
        publisher = "mkhl";
        version = "0.17.0";
        sha256 = "sha256-9sFcfTMeLBGw2ET1snqQ6Uk//D/vcD9AVsZfnUNrWNg=";
      }

      # Lua
      {
        name = "lua";
        publisher = "sumneko";
        version = "3.11.1";
        sha256 = "sha256-DPJxMmu5gdZqs+eMpbvpPgir+4aJ22viqsBpuyBzi6A=";
      }

      # Assembly
      {
        name = "language-x86-64-assembly";
        publisher = "13xforever";
        version = "3.1.4";
        sha256 = "sha256-FJRDm1H3GLBfSKBSFgVspCjByy9m+j9OStlU+/pMfs8=";
      }

      # SQL
      {
        name = "vscode-sqlite";
        publisher = "alexcvzz";
        version = "0.14.1";
        sha256 = "sha256-jOQkRgBkUwJupD+cRo/KRahFRs82X3K49DySw6GlU8U=";
      }
      {
        name = "prettier-sql-vscode";
        publisher = "inferrinizzard";
        version = "1.6.0";
        sha256 = "sha256-l6pf/+uv8Bn4uDMX0CbzSjydTStr73uRY550Ad9wm7Q=";
      }

      # PHP
      {
        name = "vscode-intelephense-client";
        publisher = "bmewburn";
        version = "1.12.6";
        sha256 = "sha256-PBshvtO7NDMfKK482GN8qSyGw7OEeExEwr1/whH9yUA=";
      }

      # i18n
      {
        name = "vscode-fluent";
        publisher = "macabeus";
        version = "1.1.0";
        sha256 = "sha256-cDo8nH6hFvYNiHuoriDzgZC4xt/vm+yJdLZ1pgggpSA=";
      }

      # Justfile
      {
        name = "vscode-just-syntax";
        publisher = "nefrob";
        version = "0.6.0";
        sha256 = "sha256-CYFDNQQFk6vC6RG/ZLp36npunuJKHrqxrwiOF9RmPrM=";
      }
    ];

    userSettings = {
      # general
      "editor.rulers" = [ 80 ];
      "color-highlight.enable" = false;
      "workbench.colorTheme" = "One Dark Pro Flat";
      "security.workspace.trust.untrustedFiles" = "open";
      "window.restoreWindows" = "none";

      # font
      "editor.fontFamily" = "'NotoSansM Nerd Font Mono', 'MesloLGS Nerd Font Mono'";
      "terminal.integrated.fontSize" = 15;

      # sidebar
      "workbench.hover.delay" = 200;
      "workbench.iconTheme" = "material-icon-theme";
      "explorer.compactFolders" = false;

      # editor
      "editor.cursorBlinking" = "solid";
      "editor.largeFileOptimizations" = false;

      # terminal
      "terminal.external.linuxExec" = "kitty";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.enableMultiLinePasteWarning" = "never";
      "terminal.integrated.enablePersistentSessions" = false;

      # git
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.openRepositoryInParentFolders" = "always";
      "gitlens.currentLine.enabled" = false;
      "gitlens.hovers.currentLine.over" = "line";
      "gitlens.statusBar.enabled" = false;
      "gitlens.advanced.messages" = {
        "suppressCreatePullRequestPrompt" = true;
      };

      # lldb
      "lldb.suppressUpdateNotifications" = true;

      # telemetry
      "dotnetAcquisitionExtension.enableTelemetry" = false;
      "gitlens.telemetry.enabled" = false;
      "intelephense.telemetry.enabled" = false;
    };
  };
}
