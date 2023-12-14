{ writeShellApplication, bemenu }:

writeShellApplication {
  name = "bemenu-power";
  runtimeInputs = [ bemenu ];
  text = ''
    OPTION=$(echo -e "Shutdown\nReboot" | ${bemenu}/bin/bemenu -i -p "Power Menu" "$@")
    case $OPTION in
      Shutdown)
        sleep 5 && shutdown now;;
      Reboot)
        sleep 5 && shutdown --reboot now;;
    esac
  '';
}
