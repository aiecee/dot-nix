{
  description = "Your new nix config";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nur.url = "github:nix-community/NUR";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , sops-nix
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      utils = import ./utils { inherit inputs; };
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      devShellForSystems = f:
        lib.genAttrs systems (system:
          f {
            pkgs = import nixpkgs { inherit system; };
          });
    in
    {
      packages = utils.shared.forAllSystems (pkgs: import ./pkgs { inherit pkgs; });
      formatter = utils.shared.forAllSystems (pkgs: pkgs.nixpkgs-fmt);

      overlays = import ./overlays { inherit inputs outputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        christopher = utils.nixos.mkSystem ./hosts/christopher;
      };

      homeConfigurations = {
        "matt@christopher" = utils.home-manager.mkHome "x86_64-linux" ./home/matt/christopher.nix;
      };

      devShells = devShellForSystems ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nil
            nixpkgs-fmt
            statix
          ];
        };
      });
    };
}
