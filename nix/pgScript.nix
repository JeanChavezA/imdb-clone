{ postgresql, writeShellScriptBin } :

let
  LOGMIN = builtins.getEnv "LOGMIN";
  logMin = if builtins.stringLength LOGMIN == 0 then "WARNING" else LOGMIN; # warning is the default in pg
  ver = builtins.head (builtins.splitVersion postgresql.version);
  script = ''
    set -euo pipefail

    export PATH=${postgresql}/bin:"$PATH"

    tmpdir="$(mktemp -d)"

    export PGDATA="$tmpdir"
    export PGHOST="$tmpdir"
    export PGUSER=postgres
    export PGDATABASE=postgres

    trap 'pg_ctl stop -m i && rm -rf "$tmpdir"' sigint sigterm exit

    PGTZ=UTC initdb --no-locale --encoding=UTF8 --nosync -U "$PGUSER"

    options="-F -c listen_addresses=\"\" -c log_min_messages=${logMin} -k $PGDATA"

    pg_ctl start -o "$options"

    psql -v ON_ERROR_STOP=1 -c 'create extension "imdb-clone"' -d postgres

    "$@"
  '';
in
writeShellScriptBin "with-pg-${ver}" script
