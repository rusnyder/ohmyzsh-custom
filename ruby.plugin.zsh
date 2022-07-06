# Add Homebrew-installed ruby first to PATH (if avaialable)
HOMEBREW_RUBY_BIN_DIR="${HOMEBREW_PREFIX}/opt/ruby/bin"
if [[ -d "$HOMEBREW_RUBY_BIN_DIR" ]]; then
  # Also put that Ruby install's gems on the path
  RUBY_GEM_BIN_DIR="$(${HOMEBREW_RUBY_BIN_DIR}/gem environment gemdir)/bin"
  export PATH="${HOMEBREW_RUBY_BIN_DIR}:${RUBY_GEM_BIN_DIR}:$PATH"
  unset RUBY_GEM_BIN_DIR
fi
unset HOMEBREW_RUBY_BIN_DIR
