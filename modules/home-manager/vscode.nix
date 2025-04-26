{ pkgs, ... }:

{
  xdg.mimeApps.defaultApplications = {
    "text/plain" = "code.desktop";
    "text/x-csrc" = "code.desktop";
    "application/octet-stream" = "code.desktop";
    "application/xml" = "code.desktop";
    "application/x-zerosize" = "code.desktop";
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      userSettings = {
        # general
        "editor.rulers" = [ 80 ];
        "color-highlight.enable" = false;
        "workbench.colorTheme" = "One Dark Pro Flat";
        "security.workspace.trust.untrustedFiles" = "open";
        "window.restoreWindows" = "none";
        "extensions.autoUpdate" = false;
        "chat.commandCenter.enabled" = false;

        # font
        "editor.fontFamily" = "'MesloLGS NF', 'Terminess Nerd Font Mono'";

        # sidebar
        "workbench.hover.delay" = 200;
        "workbench.iconTheme" = "material-icon-theme";
        "explorer.compactFolders" = false;

        # editor
        "editor.cursorBlinking" = "solid";
        "editor.largeFileOptimizations" = false;

        # terminal
        "terminal.external.linuxExec" = "ghostty";
        "terminal.integrated.suggest.enabled" = true;
        "terminal.integrated.defaultProfile.linux" = "zsh";
        "terminal.integrated.enableMultiLinePasteWarning" = "never";
        "terminal.integrated.enablePersistentSessions" = false;
        "terminal.integrated.scrollback" = 65536; # default is 1000

        # git
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.openRepositoryInParentFolders" = "always";
        "diffEditor.ignoreTrimWhitespace" = false;
        "gitlens.currentLine.enabled" = false;
        "gitlens.hovers.currentLine.over" = "line";
        "gitlens.statusBar.enabled" = false;
        "gitlens.advanced.messages" = {
          "suppressCreatePullRequestPrompt" = true;
        };

        # telemetry
        "dotnetAcquisitionExtension.enableTelemetry" = false;
        "gitlens.telemetry.enabled" = false;
        "intelephense.telemetry.enabled" = false;

        # AI
        "continue.enableTabAutocomplete" = false;
      };

      keybindings = [
        {
          key = "ctrl+alt+s";
          command = "git.stageSelectedRanges";
          when = "editorTextFocus && !operationInProgress && resourceScheme == 'file'";
        }
        {
          key = "ctrl+alt+u";
          command = "git.unstageSelectedRanges";
          when = "editorTextFocus && isInDiffEditor && resourceScheme == 'file'";
        }
        {
          key = "ctrl+alt+r";
          command = "git.revertSelectedRanges";
          when = "editorTextFocus && !operationInProgress && resourceScheme == 'file'";
        }
      ];

      enableExtensionUpdateCheck = false;
      # List installed extensions: codium --list-extensions
      extensions =
        with pkgs.vscode-extensions;
        [
          # General
          wakatime.vscode-wakatime # https://marketplace.visualstudio.com/items?itemName=wakatime.vscode-wakatime
          fill-labs.dependi # https://marketplace.visualstudio.com/items?itemName=fill-labs.dependi
          aaron-bond.better-comments # https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments
          streetsidesoftware.code-spell-checker # https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker
          usernamehw.errorlens # https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens
          christian-kohler.path-intellisense # https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense
          formulahendry.auto-rename-tag # https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag
          naumovs.color-highlight # https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
          ms-vscode.hexeditor # https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor
          vadimcn.vscode-lldb # https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb
          bradlc.vscode-tailwindcss # https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss
          jock.svg # https://marketplace.visualstudio.com/items?itemName=jock.svg
          nefrob.vscode-just-syntax # https://marketplace.visualstudio.com/items?itemName=nefrob.vscode-just-syntax
          ms-vscode.makefile-tools # https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools
          stkb.rewrap # https://marketplace.visualstudio.com/items?itemName=stkb.rewrap
          antfu.slidev # https://marketplace.visualstudio.com/items?itemName=antfu.slidev
          ms-vscode-remote.remote-containers # https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

          # Appearance
          pkief.material-icon-theme # https://marketplace.visualstudio.com/items?itemName=pkief.material-icon-theme
          zhuangtongfa.material-theme # https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.material-theme

          # AI
          continue.continue # https://marketplace.visualstudio.com/items?itemName=continue.continue

          # Git/GitHub
          eamodio.gitlens # https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens
          github.vscode-github-actions # https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions

          # Config/Data
          mechatroner.rainbow-csv # https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv
          redhat.vscode-xml # https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml
          redhat.vscode-yaml # https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml
          coolbear.systemd-unit-file # https://marketplace.visualstudio.com/items?itemName=coolbear.systemd-unit-file
          xadillax.viml # https://marketplace.visualstudio.com/items?itemName=xadillax.viml
          editorconfig.editorconfig # https://marketplace.visualstudio.com/items?itemName=editorconfig.editorconfig

          # Shell
          foxundermoon.shell-format # https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format
          timonwong.shellcheck # https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck

          # Nodejs ecosystem
          dbaeumer.vscode-eslint # https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
          esbenp.prettier-vscode # https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
          denoland.vscode-deno # https://marketplace.visualstudio.com/items?itemName=denoland.vscode-deno
          yoavbls.pretty-ts-errors # https://marketplace.visualstudio.com/items?itemName=yoavbls.pretty-ts-errors
          svelte.svelte-vscode # https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode
          stylelint.vscode-stylelint # https://marketplace.visualstudio.com/items?itemName=stylelint.vscode-stylelint
          vue.volar # https://marketplace.visualstudio.com/items?itemName=Vue.volar

          # Markdown
          yzhang.markdown-all-in-one # https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one
          bierner.markdown-mermaid # https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid
          unifiedjs.vscode-mdx # https://marketplace.visualstudio.com/items?itemName=unifiedjs.vscode-mdx

          # LaTeX
          james-yu.latex-workshop # https://marketplace.visualstudio.com/items?itemName=james-yu.latex-workshop

          # Docker
          ms-azuretools.vscode-docker # https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker

          # Nix
          mikestead.dotenv # https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv
          jnoortheen.nix-ide # https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide
          mkhl.direnv # https://marketplace.visualstudio.com/items?itemName=mkhl.direnv

          # Rust
          rust-lang.rust-analyzer # https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer
          tamasfe.even-better-toml # https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml
          tauri-apps.tauri-vscode # https://marketplace.visualstudio.com/items?itemName=tauri-apps.tauri-vscode

          # Zig
          ziglang.vscode-zig # https://marketplace.visualstudio.com/items?itemName=ziglang.vscode-zig

          # Python
          ms-python.python # https://marketplace.visualstudio.com/items?itemName=ms-python.python
          ms-python.vscode-pylance # https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance
          ms-python.black-formatter # https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter
          ms-python.mypy-type-checker # https://marketplace.visualstudio.com/items?itemName=ms-python.mypy-type-checker
          ms-python.pylint # https://marketplace.visualstudio.com/items?itemName=ms-python.pylint
          charliermarsh.ruff # https://marketplace.visualstudio.com/items?itemName=charliermarsh.ruff

          # Go
          golang.go # https://marketplace.visualstudio.com/items?itemName=golang.go

          # C/C++
          ms-vscode.cpptools # https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools

          # C#
          ms-dotnettools.csharp # https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
          ms-dotnettools.csdevkit # https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit

          # PHP
          bmewburn.vscode-intelephense-client # https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client

          # Lua
          sumneko.lua # https://marketplace.visualstudio.com/items?itemName=sumneko.lua

          # Java
          vscjava.vscode-java-pack # https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack
          vscjava.vscode-gradle # https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-gradle
          redhat.java # https://marketplace.visualstudio.com/items?itemName=redhat.java
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          # General
          {
            # https://marketplace.visualstudio.com/items?itemName=mkxml.vscode-filesize
            name = "vscode-filesize";
            publisher = "mkxml";
            version = "3.2.2";
            sha256 = "sha256-RVhgCt/zY155oeL7EbVBokNFFBB9xvGL3j3zySdjGRg=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=dprint.dprint
            name = "dprint";
            publisher = "dprint";
            version = "0.16.4";
            sha256 = "sha256-PL4qVr9WMmADZkcNBlZDx9+LdvKlzW+mVRqakkbSM6M=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight
            name = "vscode-todo-highlight";
            publisher = "wayou";
            version = "1.0.5";
            sha256 = "sha256-CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=dbankier.vscode-quick-select
            name = "vscode-quick-select";
            publisher = "dbankier";
            version = "0.2.9";
            sha256 = "sha256-XeyjXU+ZdpZ7VOK4oECZp4As3MZxhExq6lXMTMJRAcA=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=earshinov.sort-lines-by-selection
            name = "sort-lines-by-selection";
            publisher = "earshinov";
            version = "1.2.0";
            sha256 = "sha256-mxwMX4r+3XuPxG9pRN7MmmvCft0fLtKxp5dv/VFOeK8=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=plievone.vscode-template-literal-editor
            name = "vscode-template-literal-editor";
            publisher = "plievone";
            version = "0.10.0";
            sha256 = "sha256-AiDtJadgEQA5Zmrk28oTfOG6eS4QYIA8GQVO6RNUM5Y=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=iamhyc.overleaf-workshop
            name = "overleaf-workshop";
            publisher = "iamhyc";
            version = "0.15.0";
            sha256 = "sha256-//PGvogsYMe3NzKTvmNFUUyxOokH298J5/0eCM4Z63U=";
          }

          # Nodejs ecosystem
          {
            # https://marketplace.visualstudio.com/items?itemName=oven.bun-vscode
            name = "bun-vscode";
            publisher = "oven";
            version = "0.0.26";
            sha256 = "sha256-klMkKAorWJj2o015FWbQQfpmYe4JM0UOM+WVh+YPtI4=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=bierner.jsdoc-markdown-highlighting
            name = "jsdoc-markdown-highlighting";
            publisher = "bierner";
            version = "0.0.1";
            sha256 = "sha256-f87gKQwEPu/aJOhz5sstW804B8hf0pQRdC3C2PAnfgQ=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=vunguyentuan.vscode-postcss
            name = "vscode-postcss";
            publisher = "vunguyentuan";
            version = "2.0.2";
            sha256 = "sha256-ttvCwxk3dMwva5LmVHq4p31INTa/T91qQISEU4gYNbg=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=ardenivanov.svelte-intellisense
            name = "svelte-intellisense";
            publisher = "ardenivanov";
            version = "0.7.1";
            sha256 = "sha256-/AiGMgwCeD9B3y8LxTe6HoIswLuCnLbmwV7fxwfWSLw=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=oxc.oxc-vscode
            name = "oxc-vscode";
            publisher = "oxc";
            version = "0.16.0";
            sha256 = "sha256-2u8Z7xjygnUItPjveeI3XnpzdsJgzZ/Lh3I0vrbfzcY=";
          }

          # Git/GitHub
          {
            # https://marketplace.visualstudio.com/items?itemName=vivaxy.vscode-conventional-commits
            name = "vscode-conventional-commits";
            publisher = "vivaxy";
            version = "1.26.0";
            sha256 = "sha256-Lj2+rlrKm9h21zEoXwa2TeGFNKBmlQKr7MRX0zgngdg=";
          }

          # Low level stuff
          {
            # https://marketplace.visualstudio.com/items?itemName=tintinweb.vscode-decompiler
            name = "vscode-decompiler";
            publisher = "tintinweb";
            version = "0.1.0";
            sha256 = "sha256-AyUABtVUTQi9NRjo3O8Ma+XE3rcY+NSxahKUEvxvFG8=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=13xforever.language-x86-64-assembly
            name = "language-x86-64-assembly";
            publisher = "13xforever";
            version = "3.1.4";
            sha256 = "sha256-FJRDm1H3GLBfSKBSFgVspCjByy9m+j9OStlU+/pMfs8=";
          }

          # Markdown
          {
            # https://marketplace.visualstudio.com/items?itemName=jeff-tian.markdown-katex
            name = "markdown-katex";
            publisher = "jeff-tian";
            version = "0.1.4";
            sha256 = "sha256-NEVoT1zn9ehG/XJJyPunL3LAeiWORW/8nt+HOH5VxcI=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting
            name = "mermaid-markdown-syntax-highlighting";
            publisher = "bpruitt-goddard";
            version = "1.7.0";
            sha256 = "sha256-Vjmc9tlHSFdhhcSopUG3MnyBSi//B6cpnavqFLhVRho=";
          }

          # C#
          {
            # https://marketplace.visualstudio.com/items?itemName=ms-vscode.mono-debug
            name = "mono-debug";
            publisher = "ms-vscode";
            version = "0.16.3";
            sha256 = "sha256-6IU8aP4FQVbEMZAgssGiyqM+PAbwipxou5Wk3Q2mjZg=";
          }

          # Unity
          {
            # https://marketplace.visualstudio.com/items?itemName=visualstudiotoolsforunity.vstuc
            name = "vstuc";
            publisher = "visualstudiotoolsforunity";
            version = "1.1.0";
            sha256 = "sha256-86KDksbTKlPgKC1joUc7uQTsDe2w9AIL0fekZP0z6gE=";
          }

          # Godot
          {
            # https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools
            name = "godot-tools";
            publisher = "geequlim";
            version = "2.4.0";
            sha256 = "sha256-iuSec4PoVxyu1KB2jfCYOd98UrqQjH3q24zOR4VCPgs=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=alfish.godot-files
            name = "godot-files";
            publisher = "alfish";
            version = "0.1.3";
            sha256 = "sha256-0cMcVpkFHRZLlm5wjOwPiqamZaRyfTUDwck5hUwIhyE=";
          }
          {
            # https://marketplace.visualstudio.com/items?itemName=neikeq.godot-csharp-vscode
            name = "godot-csharp-vscode";
            publisher = "neikeq";
            version = "0.2.1";
            sha256 = "sha256-sLsP+4deo/O8NjHGGXVdSOPWQPALypW/H0oZOMMM9RE=";
          }

          # Nginx
          {
            # https://marketplace.visualstudio.com/items?itemName=ahmadalli.vscode-nginx-conf
            name = "vscode-nginx-conf";
            publisher = "ahmadalli";
            version = "0.3.5";
            sha256 = "sha256-6gJtMQH2zanFt+UTaD0Vn1vDq5GY9R1CfelPCklYxYE=";
          }

          # Linux
          {
            # https://marketplace.visualstudio.com/items?itemName=nico-castell.linux-desktop-file
            name = "linux-desktop-file";
            publisher = "nico-castell";
            version = "0.0.21";
            sha256 = "sha256-4qy+2Tg9g0/9D+MNvLSgWUE8sc5itsC/pJ9hcfxyVzQ=";
          }

          # Terraform / OpenTofu
          {
            # https://marketplace.visualstudio.com/items?itemName=gamunu.opentofu
            name = "opentofu";
            publisher = "gamunu";
            version = "0.2.1";
            sha256 = "sha256-OizdHTSGuwBRuD/qPXjmna6kZWfRp9EimhcFk3ICN9I=";
          }

          # SQL
          {
            # https://marketplace.visualstudio.com/items?itemName=inferrinizzard.prettier-sql-vscode
            name = "prettier-sql-vscode";
            publisher = "inferrinizzard";
            version = "1.6.0";
            sha256 = "sha256-l6pf/+uv8Bn4uDMX0CbzSjydTStr73uRY550Ad9wm7Q=";
          }

          # i18n
          {
            # https://marketplace.visualstudio.com/items?itemName=macabeus.vscode-fluent
            name = "vscode-fluent";
            publisher = "macabeus";
            version = "1.1.0";
            sha256 = "sha256-cDo8nH6hFvYNiHuoriDzgZC4xt/vm+yJdLZ1pgggpSA=";
          }

          # Android
          {
            # https://marketplace.visualstudio.com/items?itemName=expo.vscode-expo-tools
            name = "vscode-expo-tools";
            publisher = "expo";
            version = "1.6.0";
            sha256 = "sha256-on+QlNwHQzmBBDYkRWJ2hVMuW+xLhJHx7Og6tuR2nMo=";
          }
        ];
    };
  };
}
