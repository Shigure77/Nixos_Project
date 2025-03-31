{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, nvf, home-manager, catppuccin, ... }@inputs: {

    packages."x86_64-linux".default = 
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
	      modules = [ ./modules/nixos/default.nix ];
      }).neovim;

    nixosConfigurations.baal = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        ./nixos/baal/configuration.nix
        catppuccin.nixosModules.catppuccin
	      inputs.home-manager.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          #home-manager.useGlobal.Pkgs = true;
          #home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.keion = { 
            import = [
            ./home-manager/home.nix;
            catppuccin.homeManagerModules.catppuccin
            ];
          };
        };
      ];
    };
  };
}
