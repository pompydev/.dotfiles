#region PATH
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/.local/bin"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
#endregion PATH

#region perl
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
#endregion perl

#region editor
export EDITOR=vim
export VISUAL=vim
#endregion editor
