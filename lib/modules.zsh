# Constants
__PLUGIN_DIR="$(cd ${0:a:h}/.. && pwd)"

# Single-time import dependency resolution
declare -A __LOADED_MODULES
is_module_loaded() {
  local module="$1"
  [[ ${__LOADED_MODULES["$module"]} == true ]]
} # is_module_loaded

load_module() {
  local module="$1"
  if [[ "$module" != *.plugin.zsh ]]; then
    module="$__PLUGIN_DIR/$module.plugin.zsh"
  fi

  if ! is_module_loaded "$module"; then
    source "$module"

    __LOADED_MODULES["$module"]=true
  fi
}
