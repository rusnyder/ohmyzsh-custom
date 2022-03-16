#   wa:     Cd's into redowl workspace, optionally into the project specified
#   Examples:
#     wa
#     wa ansible/roles
#   --------------------------------------------------------------------
export ARCEO_WORKSPACE="$HOME/workspace/code/arceo-labs"
wa () { cd "$ARCEO_WORKSPACE/$1" || return; }
_wa() {
  ((CURRENT == 2)) &&
  _files -/ -W $HOME/workspace/code/arceo-labs
}
compdef _wa wa
