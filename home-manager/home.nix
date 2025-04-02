# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  catppuccin,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):

    ../modules/home-manager/default.nix
  ];
  
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "keion";
    homeDirectory = "/home/keion";
  };

  programs = {
    firefox = {
      enable = true; 
    };
    alacritty.enable = true;
  };

  gtk = {
    enable = true;
  };
  qt = {
    enable = true;
    #Already defined elsewhere?
    #platformTheme = "gtk";
  };

  home.packages = with pkgs; [ 
    vlc 
    dconf-editor
    dconf2nix
    plex-desktop
    discord
    btop
    

  ];
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
