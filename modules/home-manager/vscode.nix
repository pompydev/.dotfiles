{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    # List installed extensions: codium --list-extensions
    extensions = with pkgs.vscode-extensions; [
      # general vscode features
      aaron-bond.better-comments # comment color highlighting
      editorconfig.editorconfig # EditorConfig support
      mikestead.dotenv # .env file support
      # mkxml.vscode-filesize # show file size on bottom bar
      streetsidesoftware.code-spell-checker # spell checking
      wakatime.vscode-wakatime # Wakatime support
      usernamehw.errorlens # show error on lines they originated from

      # general editing feature
      christian-kohler.path-intellisense # autocomplete filenames
      # dbankier.vscode-quick-select # selecting quoted text
      # earshinov.sort-lines-by-selection # sort lines by selection
      stkb.rewrap # auto-wrap long text
      # plievone.vscode-template-literal-editor # template string syntax highlight

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

      # icons & themes
      pkief.material-icon-theme # explorer icon theme
      zhuangtongfa.material-theme # One Dark Pro theme

      # git / github
      eamodio.gitlens # basic git action as GUI
      github.vscode-github-actions # Github action features

      # reverse engineering
      # tintinweb.vscode-decompiler # Decompile jar, apk, pyc, pyo, binary executable, etc
      # icsharpcode.ilspy-vscode # C# reverse engineering
      ms-vscode.hexeditor # hex editor

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

      # xforever.language-x86-64-assembly
      # alexcvzz.vscode-sqlite
      bmewburn.vscode-intelephense-client
      # donjayamanne.python-extension-pack
      github.vscode-pull-request-github
      graphql.vscode-graphql
      graphql.vscode-graphql-syntax
      # hbenl.test-adapter-converter
      # inferrinizzard.prettier-sql-vscode
      jnoortheen.nix-ide
      # macabeus.vscode-fluent
      mkhl.direnv
      nefrob.vscode-just-syntax
      # razoric.gdscript-toolkit-formatter
      redhat.vscode-xml
      redhat.vscode-yaml
      styled-components.vscode-styled-components
      sumneko.lua
      unifiedjs.vscode-mdx
      vadimcn.vscode-lldb
      # vivaxy.vscode-conventional-commits
      # wayou.vscode-todo-highlight
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
