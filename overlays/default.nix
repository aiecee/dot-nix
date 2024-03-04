# This file defines overlays
{ inputs, ... }:
let
  addPatches = pkg: patches: pkg.overrideAttrs (oldAttrs: {
    patches = (oldAttrs.patches or [ ]) ++ patches;
  });
in
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    dwm = addPatches prev.dwm [ ./dwm-nixos.diff ];
    slstatus = addPatches prev.slstatus [ ./slstatus-nixos.diff ];
    # Fix slack screen sharing following: https://github.com/flathub/com.slack.Slack/issues/101#issuecomment-1807073763
    #slack = prev.slack.overrideAttrs (previousAttrs: {
    #  installPhase =
    #    previousAttrs.installPhase
    #    + ''
    #      sed -i'.backup' -e 's/,"WebRTCPipeWireCapturer"/,"LebRTCPipeWireCapturer"/' $out/lib/slack/resources/app.asar
#
#        '';
#    });
    # dmenu = addPatches prev.dmenu [ ./dmenu-password-5.0.diff ];
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
