set -U fish_greeting

export LANG=en_US.UTF-8
export EDITOR=nvim

export PATH="$HOME/.local/bin:$PATH"

# Zoxide
zoxide init fish | source

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Go
export PATH="$HOME/go/bin:$PATH"
export GOROOT="/usr/local/lib/go"
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
