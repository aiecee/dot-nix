{ writeShellApplication, bemenu, grim, slurp, wl-copy, jq }:

writeShellApplication {
  name = "bememu-screenshot";
  runtimeInputs = [ bemenu grim slurp wl-copy jq ];
  text = let
    grimcmd = "${grim}/bin/grim";
    slurpcmd = "${slurp}/bin/slurp";
    jqcmd = "${jq}/bin/jq";
    wlcopycmd = "${wl-copy}/bin/wl-copy";
  in
  ''
    OPTION=$(echo -e "Screen\nMonitor\nWindow\nRegion" | ${bemenu}/bin/bemenu -i -p "Screenshot" "$@")
    case $OPTION in
      Screen)
        ${grimcmd} - | ${wlcopycmd};;
      Monitor)
        ${grimcmd} -o $(hyprctl monitors -j | ${jqcmd} -r '.[] | select(.focused) | .name') - | ${wlcopycmd};;
  '';
}
