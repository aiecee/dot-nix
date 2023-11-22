{ writeShellApplication, dmenu-wayland }:

writeShellApplication {
  name = "dmenu-power";
  runtimeInputs = [ dmenu-wayland ];
  text = ''
  OPTION=$(echo -e "Shutdown\nReboot" | dmenu -i -p "Power Menu" "$@")
  case $OPTION in
    Shutdown)
      $(sleep 5 && shutdown now);;
    Reboot)
      $(sleep 5 && shutdown --reboot now);;
  esac
  '';
}
