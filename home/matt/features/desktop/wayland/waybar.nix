{ config, pkgs, lib, ... }:

{

  systemd.user.services.waybar = {
    Unit.StartLimitBurst = 30;
  };

  programs.waybar = {
    enable = true;
    package = pkgs.unstable.waybar;
    systemd.enable = true;
    settings = [
      {
        mode = "dock";
        layer = "top";
        height = 36;
        margin = "8";
        position = "top";
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-right = [
          "wireplumber"
          "disk"
          "memory"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "";
          };
          persistant-workspaces = (lib.mapAttrs (name: value: value.defaultWorkspace) config.monitors);
        };

        "hyprland/window" = {
          separate-outputs = true;
        };

        disk = {
          format = " {percentage_free}%";
        };

        memory = {
          format = "󰍛 {percentage}%";
        };

        clock = {
          interval = 1;
          format = "{:%d/%m/%Y %H:%M:%S}";
          timezone = "Europe/London";
          locale = "en_GB.UTF-8";
        };
      }
    ];
    style = let inherit (config.colorScheme) palette; in ''
      * {
        all: unset;
        font-family: ${config.rice.fonts.monospace.family};
        font-size: 10px;
      }

      window#waybar {
        background: #${palette.base01};
        border: 2px solid #${palette.base03};
        border-radius: 0.5rem;
      }
     
      .modules-right {
        background: #${palette.base02};
        border: 2px solid #${palette.base03};
        border-radius: 0.4rem;
        margin: 0.5rem;
        padding-left: 0.5rem;
        padding-right: 0.5rem;
      }

      #workspaces {
        background: #${palette.base02};
        border: 2px solid #${palette.base03};
        border-radius: 0.4rem;
        margin: 0.5rem;
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 11px;
      }
      
      #workspaces button {
        border-radius: 3rem;
        background: transparent;
        color: #${palette.base04};
        padding-left: 0.3rem;
        padding-right: 0.5rem;
      }

      #workspaces button:hover {
        color: #${palette.base09};
      }

      #workspaces button.active {
        color: #${palette.base0A};
      }

      #window {
        color: #${palette.base0A};
        margin-left: 0.75rem;
        font-size: 13px;
        font-weight: bold;
      }

      #wireplumber {
        color: #${palette.base0E};
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 12px;
      }
    
      #disk {
        color: #${palette.base08};
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 12px;
      }

      #memory {
        color: #${palette.base0B};
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 12px;
      }

      #clock {
        color: #${palette.base05};
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 12px;
      }
    '';
  };

}
