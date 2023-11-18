{ lib
, stdenvNoCC
, fetchFromGitHub
, qtgraphicaleffects
, qtsvg
, qtquickcontrols2
, variant ? "frappe"
}:

let
  flavours = [ "latte" "frappe" "macchiato" "mocha" ];
in
stdenvNoCC.mkDerivation rec {
  pname = "catppuccin-sddm";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "main";
    hash = "sha256-tyuwHt48cYqG5Pn9VHa4IB4xlybHOxPmhdN9eae36yo=";
  };

  propagateUserEnvPkgs = [ qtgraphicaleffects qtsvg qtquickcontrols2 ];

  outputs = flavours ++ [ "out" ];
  outptusToInstall = [ ];

  installPhase = ''
    mkdir -p $out/share/sddm/themes/

    for flavour in $(getAllOutputNames); do
      if [ "$flavour" != "out" ]; then
        cp -r src/catppuccin-$flavour/ $out/share/sddm/themes/
      fi
    done
  '';

  meta = with lib; {
    description = "Official catppuccin sddm theme";
    homepage = "https://github.com/catppuccin/sddm";
    license = licenses.mit;
  };
}
