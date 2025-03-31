# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):

    #../modules/home-manager/default.nix
  ];

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

  home.packages = with pkgs; [ 
    steam
    vlc 
    networkmanagerapplet
    killall
    duf
    pciutils
    nfs-utils
    qdirstat

  ];
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
