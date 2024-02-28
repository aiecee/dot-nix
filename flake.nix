{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      forAllSystems = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
      devShellForSystems = f: lib.genAttrs systems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      packages = forAllSystems (pkgs: import ./pkgs { inherit pkgs; });
      formatter = forAllSystems (pkgs: pkgs.nixpkgs-fmt);

      overlays = import ./overlays { inherit inputs outputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        christopher = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/christopher
          ];
        };
      };

      homeConfigurations = {
        "matt@christopher" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/matt/christopher.nix
          ];
        };
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
