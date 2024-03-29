{
  description = "Nekanu's NixOS configuration";



  inputs = {

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    nur.url = github:nix-community/NUR;

    # Version of nixpkgs where pCloud doesn't crash
    # See https://github.com/NixOS/nixpkgs/issues/226339
    nixpkgs-unstable-pcloud-ok.url = "github:NixOS/nixpkgs/e3652e0735fbec227f342712f180f4f21f0594f2";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-software-center.url = "github:vlinkz/nix-software-center";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.2.0";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    # Generator
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # GRUB themes
    grub-themes.url = "github:vinceliuice/grub2-themes";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, nixos-generators, home-manager, nixos-hardware, nix-software-center, nix-flatpak, grub-themes, plasma-manager, nur, ... } @ inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];
      stateVersion = "23.11";
      rootPath = ./.;
      nur-modules = import nur rec {
        nurpkgs = nixpkgs.legacyPackages.x86_64-linux;
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
    in
    rec {
      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );
      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit nixpkgs inputs; };

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        harmony = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs stateVersion rootPath;
            desktopEnvironments = [ "plasma5" "hyprland" ];
            additionalFeatures = [ "gaming" "virtualisation" ];
            hostname = "harmony";
            username = "nekanu";
            hostid = "a69480bd";
          };
          modules = [
            ./nixos
            grub-themes.nixosModules.default
            nur.nixosModules.nur
            nur-modules.repos.LuisChDev.modules.nordvpn
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };

        opportunity = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs stateVersion rootPath;
            desktopEnvironments = [ "plasma5" ];
            additionalFeatures = [ "virtualisation" ];
            hostname = "opportunity";
            username = "nekanu";
            hostid = "2b927153";
          };
          modules = [
            ./nixos
            grub-themes.nixosModules.default
            nur.nixosModules.nur
            nur-modules.repos.LuisChDev.modules.nordvpn
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "nekanu@harmony" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs stateVersion rootPath;
            desktopEnvironments = [ "plasma5" "hyprland" ];
            additionalFeatures = [ "gaming" ];
            hostname = "harmony";
            username = "nekanu";
          };
          modules = [ 
            ./home-manager
            plasma-manager.homeManagerModules.plasma-manager
          ];
        };

        "nekanu@opportunity" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs stateVersion rootPath;
            desktopEnvironments = [ "plasma5" ];
            additionalFeatures = [ ];
            hostname = "opportunity";
            username = "nekanu";
          };
          modules = [ 
            ./home-manager
            plasma-manager.homeManagerModules.plasma-manager
          ];
        };
      };
    };
}
