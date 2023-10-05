# Load homebrew onto path first (most scripts here depend on it)
case "$(uname -m)" in
  # M1 Mac running native (ARM) terminal
  arm64) BREW=/opt/homebrew/bin/brew ;;
  # Intel Mac or M1 Mac running Rosetta terminal
  x86_64) BREW=/usr/local/bin/brew ;;
esac
if ! [ -f "$BREW" ]; then
  echo "Unable to locate Homebrew install; please install Homebrew first."
  return
fi
eval "$($BREW shellenv)"
unset BREW

# Load library functions
for file in ${0:a:h}/lib/*.zsh(.); do
  source $file
done

# Load all plugin files (the '(.)' qualifier limits to files)
for file in ${0:a:h}/*.plugin.zsh(.); do
  if [[ "$file" != "${0:a}" ]]; then
    load_module "$file"
  fi
done

# Recompile zsh completions (allows modules to add to FPATH, etc.)
rm -f ~/.zcompdump; compinit

# Add `bin` to the front of the path (allow overriding homebrew commands, etc.)
export PATH="${0:a:h}/bin:$PATH"
