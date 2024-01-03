{ writeShellApplication, bemenu, grim, slurp, wl-clipboard, jq }:

writeShellApplication {
  name = "bemenu-screenshot";
  runtimeInputs = [ bemenu grim slurp wl-clipboard jq ];
  text = let
    bemenucmd = "${bemenu}/bin/bemenu";
    grimcmd = "${grim}/bin/grim";
    slurpcmd = "${slurp}/bin/slurp";
    jqcmd = "${jq}/bin/jq";
    wlcopycmd = "${wl-clipboard}/bin/wl-copy -t image/png";
  in
  ''
    OPTION=$(echo -e "Screen\nMonitor\nWindow\nRegion" | ${bemenucmd} -i -p "Screenshot" "$@")
    sleep .5
    case $OPTION in
      Screen)
        ${grimcmd} - | ${wlcopycmd};;
      Monitor)
        ${grimcmd} -o "$(hyprctl monitors -j | "${jqcmd}" -r '.[] | select(.focused) | .name')" - | ${wlcopycmd};;
      Window)
        ${grimcmd} -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | ${wlcopycmd};;
      Region)
        ${grimcmd} -g "$(${slurpcmd})" - | ${wlcopycmd};;
    esac
  '';
}
