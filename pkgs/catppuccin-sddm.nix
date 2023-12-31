{ lib
, stdenvNoCC
, fetchFromGitHub
, qtgraphicaleffects
, qtsvg
, qtquickcontrols2
, flavour ? "frappe"
}:

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

  installPhase = ''
    mkdir -p $out/share/sddm/themes/

    cp -r src/catppuccin-${flavour} $out/share/sddm/themes/
  '';

  meta = with lib; {
    description = "Official catppuccin sddm theme";
    homepage = "https://github.com/catppuccin/sddm";
    license = licenses.mit;
  };
}
