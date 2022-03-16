_log()
{
  local color="$1"
  local level="$2"
  shift 2
  echo -e \
    "$(colorize "white" "(bashme)")" \
    "$(colorize "$color" "[$(echo "$level" | tr '[:lower:]' '[:upper:]')]")" \
    "$@" >/dev/stderr
} # _log

log_info()
{
  _log green info "$@"
} # log_info

log_warn()
{
  _log yellow warn "$@"
} # log_warn

log_error()
{
  _log red error "$@"
} # log_error
