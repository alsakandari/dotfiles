set -U fish_greeting

export LANG=en_US.UTF-8

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

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/yhya/.opam/opam-init/init.fish' && source '/home/yhya/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
