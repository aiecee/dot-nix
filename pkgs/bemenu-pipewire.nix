{ writeShellApplication, pipewire, jq, libnotify, wireplumber, bemenu }:

writeShellApplication {
  name = "bemenu-pipewire";
  runtimeInputs = [ pipewire, jq, libnotify, wireplumber, bemenu ];
  text = ''
  NAME=$(pw-dump | jq '(.[] | .info | select(.props["media.class"] == "Audio/Sink") | .props["node.nick"])' | sed 's/"//g' | ${bemenu}/bin/bemenu -i -p "Audio Device" "$@")
  if [[ $NAME != "" ]]; then
    ID=$(pw-dump | jq --arg name "$NAME" '(.[] | .info | select(.props["node.nick"] == $name) | .props["object.id"])')
    $(wpctl set-default $ID)
    notify-send "Audio Device" "Changed to: $NAME"
  fi
  '';
}
