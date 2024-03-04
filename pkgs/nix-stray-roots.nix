{ gnugrep, writeShellScriptBin }:

writeShellScriptBin "nix-stray-roots" ''
  nix-store --gc --print-roots \
    | ${gnugrep}/bin/egrep -v "^(/nix/var|/run/\w+-system|\{memory|\{censored|/proc/maps/)"
''
