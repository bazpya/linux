{
  description = "baz flake 0";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      nixosConfigurations = {
        baznix = lib.nixosSystem { # host name
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        baz = home-manager.lib.homeManagerConfiguration { # user name
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
