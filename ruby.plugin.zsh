# Add Homebrew-installed ruby first to PATH (if avaialable)
HOMEBREW_RUBY_BIN_DIR="${HOMEBREW_PREFIX}/opt/ruby/bin"
if [[ -d "$HOMEBREW_RUBY_BIN_DIR" ]]; then
  export PATH="${HOMEBREW_RUBY_BIN_DIR}:$PATH"
fi
