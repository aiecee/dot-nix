{ writeShellApplication, dmenu, bitwarden-cli }:

writeShellApplication {
  name = "dmenu-bitwarden";
  runtimeInputs = [ dmenu, bitwarden-cli ];
  text = let
    dmenu-cmd = "${dmenu}/bin/dmenu";
    bw-cmd = "${bitwarden-cli}/bin/bw";
  in
    ''
      SESSION_KEY=""
      bw login --check
      if [[ $? == 1 ]]; then
        USERNAME=$(${dmenu-cmd} -p "Bitwarden Username" "$@" < /dev/null)
        PASSWORD=$(${dmenu-cmd} -p "Bitwarden Password" -P "$@" < /dev/null)
        SESSION_KEY=$(${bw-cmd} login "$USERNAME" "$PASSWORD" --raw)
      else
        PASSWORD=$(${dmenu-cmd} -p "Bitwarden Password" -P "$@" < /dev/null)
        SESSION_KEY=$(${bw-cmd} unlock "$PASSWORD" --raw)
      fi

      NAME=$(${bw-cmd} list items --session "$SESSION_KEY" | jq '(.[] | .name)' | sed 's/"//g' | ${dmenu-cmd} -p "Bitwarden Item" "$@")
      ${bw-cmd} get password "$NAME" | xclip -sel c
      notify-send "Bitwarden" "Password for $NAME copied to clipboard"
   '';

}
