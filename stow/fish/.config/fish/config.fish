set -U fish_greeting

export EDITOR=nvim

export PATH="$HOME/.local/bin:$PATH"

# Zoxide
zoxide init fish | source

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Go
export PATH="$HOME/go/bin:$PATH"
export GOROOT="/usr/lib/go"
export GOPROXY=https://proxy.golang.org,direct
export GOSUMDB=sum.golang.org
export GOTOOLCHAIN=auto

# Erlang
export ELP_EQWALIZER_PATH="$HOME/.local/apps/eqwalizer/eqwalizer/target/scala-3.6.4/eqwalizer.jar"
export EQWALIZER_SUPPORT_DIR="$HOME/.local/apps/eqwalizer/eqwalizer_support/"

# Yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Lean
export PATH="$HOME/.elan/bin:$PATH"

# Bob
source $HOME/.local/share/bob/env/env.fish


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/yhya/.opam/opam-init/init.fish' && source '/home/yhya/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
