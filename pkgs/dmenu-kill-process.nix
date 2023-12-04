{ writeShellApplication, dmenu }:

writeShellApplication {
  name = "dmenu-kill-process";
  runtimeInputs = [ dmenu ];
  text = ''
    $PROCESS=$(ps -a -u $USER -o pid,comm --no-headers | \
      dmenu -i -p "Kill" -l 10 "$@" |\
      awk '{print $1" "$2}');

    if [[ $PROCESS != "" ]]; then
      $CONFIRM=$(echo -e "Yes/No" | \
        dmenu -i -p "Are you sure?" "$@");

      if [[ $CONFIRM == "Yes" ]]; then
        SELECTED=$(awk '{print $1}' <<< "$PROCESS"); 
        pkill "$SELECTED";
      fi

    fi
  '';

}
