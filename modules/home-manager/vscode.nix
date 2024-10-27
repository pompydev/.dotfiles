{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    # List installed extensions: codium --list-extensions
    extensions = with pkgs.vscode-extensions; [
      # general vscode features
      mikestead.dotenv # .env file support
      # mkxml.vscode-filesize # show file size on bottom bar
      wakatime.vscode-wakatime # Wakatime support

      # general editing feature
      aaron-bond.better-comments # comment color highlighting
      # wayou.vscode-todo-highlight
      editorconfig.editorconfig # EditorConfig support
      streetsidesoftware.code-spell-checker # spell checking
      usernamehw.errorlens # show error on lines they originated from
      christian-kohler.path-intellisense # autocomplete filenames
      # dbankier.vscode-quick-select # selecting quoted text
      # earshinov.sort-lines-by-selection # sort lines by selection
      stkb.rewrap # auto-wrap long text
      # plievone.vscode-template-literal-editor # template string syntax highlight

      # Markdown/Markup
      redhat.vscode-xml
      redhat.vscode-yaml
      unifiedjs.vscode-mdx

      # general web tech
      bradlc.vscode-tailwindcss # Tailwind support
      dbaeumer.vscode-eslint # ESLint support
      esbenp.prettier-vscode # Prettier support
      formulahendry.auto-rename-tag # HTML/XML tag auto rename
      jock.svg # SVG support
      naumovs.color-highlight # Color stuff like #000000
      stylelint.vscode-stylelint # CSS linter

      # JS & TS ecosystem
      # oven.bun-vscode # bun support
      denoland.vscode-deno # deno support
      yoavbls.pretty-ts-errors # make TS error human readable
      # bierner.jsdoc-markdown-highlighting # markdown syntax highlighting for jsdoc comments
      # vunguyentuan.vscode-postcss # postcss support
      styled-components.vscode-styled-components

      # icons & themes
      pkief.material-icon-theme # explorer icon theme
      zhuangtongfa.material-theme # One Dark Pro theme

      # git / github
      eamodio.gitlens
      github.vscode-github-actions
      github.vscode-pull-request-github
      # vivaxy.vscode-conventional-commits

      # reverse engineering & debugging
      # tintinweb.vscode-decompiler # Decompile jar, apk, pyc, pyo, binary executable, etc
      # icsharpcode.ilspy-vscode # C# reverse engineering
      ms-vscode.hexeditor # hex editor
      vadimcn.vscode-lldb

      # Markdown
      yzhang.markdown-all-in-one # markdown swiss army knife
      # jeff-tian.markdown-katex # markdown KaTeX support
      bierner.markdown-mermaid # markdown mermaid preview
      # bpruitt-goddard.mermaid-markdown-syntax-highlighting # markdown mermaid color highlight

      # Rust
      rust-lang.rust-analyzer # rust support
      tamasfe.even-better-toml # toml support
      serayuzgur.crates # crates.io features (crate version, vscode palette actions, etc)

      # Python
      charliermarsh.ruff # fast python formatter with drop-in parity with flake8, isort, and black
      ms-python.black-formatter # popular python formatter
      ms-python.python # python support
      ms-toolsai.jupyter # jupyter extension pack
      # donjayamanne.python-extension-pack

      # Go
      golang.go # Go support

      # C++
      ms-vscode.cpptools # C/C++ support

      # C#
      ms-dotnettools.csharp # C# support
      ms-dotnettools.csdevkit # C# dev tools
      ms-dotnettools.vscode-dotnet-runtime # .NET install tools
      # ms-vscode.mono-debug # mono Debugging

      # Unity
      # visualstudiotoolsforunity.vstuc # unity-vscode integration

      # Svelte
      svelte.svelte-vscode # svelte support
      # ardenivanov.svelte-intellisense # svelte intellisense

      # Shell
      foxundermoon.shell-format # shell formatting
      timonwong.shellcheck # shell linting

      # Docker
      ms-azuretools.vscode-docker # docker support

      # LaTeX
      james-yu.latex-workshop # LaTeX support

      # vim
      xadillax.viml # vim script support

      # CSV
      mechatroner.rainbow-csv # better csv coloring

      # Godot
      # alfish.godot-files # godot file support
      # geequlim.godot-tools # godot-vscode integratrion
      # neikeq.godot-csharp-vscode # godot C# tools
      # razoric.gdscript-toolkit-formatter

      # nginx
      # ahmadalli.vscode-nginx-conf # nginx config support

      # Linux
      coolbear.systemd-unit-file # systemd unit file support
      # nico-castell.linux-desktop-file # desktop entry file support

      # Tauri
      tauri-apps.tauri-vscode # tauri support

      # Terraform / OpenTofu
      # gamunu.opentofu # OpenTofu support

      # Zig
      ziglang.vscode-zig

      # Nix
      jnoortheen.nix-ide
      mkhl.direnv # for devenv

      # Lua
      sumneko.lua

      # Assembly
      # xforever.language-x86-64-assembly

      # SQL
      # alexcvzz.vscode-sqlite
      # inferrinizzard.prettier-sql-vscode

      # PHP
      bmewburn.vscode-intelephense-client

      # Tests
      # hbenl.test-adapter-converter

      # i18n
      # macabeus.vscode-fluent

      # Justfile
      nefrob.vscode-just-syntax
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
