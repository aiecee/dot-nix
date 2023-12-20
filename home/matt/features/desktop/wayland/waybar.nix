{ config, pkgs, lib, ... }:

{
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
          timezone = "GB";
          locale = "en_GB";
        };
        "custom/clock" = {
          interval = 1;
          exec = "date +'%d/%m/%Y %H:%M:%S'";
        };
      }
    ];
    style = let inherit (config.colorScheme) colors; in ''
      * {
        all: unset;
        font-family: ${config.customFonts.monospace.family};
        font-size: 10px;
      }

      window#waybar {
        background: #${colors.base01};
        border: 1px solid #${colors.base03};
        border-radius: 0.5rem;
      }
     
      .modules-right {
        background: #${colors.base02};
        border: 1px solid #${colors.base03};
        border-radius: 0.4rem;
        margin: 0.5rem;
        padding-left: 0.5rem;
        padding-right: 0.5rem;
      }

      #workspaces {
        background: #${colors.base02};
        border: 1px solid #${colors.base03};
        border-radius: 0.4rem;
        margin: 0.5rem;
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 11px;
      }
      
      #workspaces button {
        border-radius: 3rem;
        background: transparent;
        color: #${colors.base04};
        padding-left: 0.3rem;
        padding-right: 0.5rem;
      }

      #workspaces button:hover {
        color: #${colors.base0A};
      }

      #workspaces button.active {
        color: #${colors.base09};
      }

      #window {
        color: #${colors.base09};
        margin-left: 0.75rem;
        font-size: 13px;
        font-weight: bold;
      }

      #wireplumber {
        color: #${colors.base0E};
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 12px;
      }
    
      #disk {
        color: #${colors.base08};
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 12px;
      }

      #memory {
        color: #${colors.base0B};
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 12px;
      }

      #clock {
        color: #${colors.base05};
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 12px;
      }

      #custom-clock {
        color: #${colors.base05};
        padding-left: 0.5rem;
        padding-right: 0.5rem;
        font-size: 12px;
      }
    '';
  };

}
