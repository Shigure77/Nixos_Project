{pkgs, ...}:

{
  imports = [
    ./catppuccindconf.nix
  ];

  catppuccin = {
    alacritty.enable = true;
    gtk.enable = true;
    btop.enable = true;
    yazi.enable = true;

  };
  stylix.targets.gtk.enable = false;

  gtk = {

    #Below is handled by the cappuccin package 
    #theme.package = pkgs.catppuccin-gtk;
    #theme.name = "Catppuccin-Mocha-Compact-Lavender-dark";

    #cursorTheme.package = pkgs.catppuccin-cursors.mochaDark;
    #cursorTheme.name = "Catppuccin-Mocha-Dark-Cursors";

    iconTheme.package = pkgs.whitesur-icon-theme;
    iconTheme.name = "WhiteSur";

  };

  home.packages = with pkgs; [ 
    #catppuccin-gtk
    catppuccin-cursors.mochaDark
    whitesur-icon-theme
    gnomeExtensions.dash-to-dock
    gnomeExtensions.arcmenu
    gnomeExtensions.tiling-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.space-bar
    gnomeExtensions.caffeine
    gnomeExtensions.compiz-windows-effect
    gnomeExtensions.vitals
    #Open bar has its own configuration that needs exported
    gnomeExtensions.open-bar
    gnomeExtensions.burn-my-windows
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "arcmenu@arcmenu.com"
        "dash-to-dock@micxgx.gmail.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com" 
        "drive-menu@gnome-shell-extensions.gcampax.github.com" 
        #"system-monitor@gnome-shell-extensions.gcampax.github.com" 
        "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
        "tilingshell@ferrarodomenico.com"
        "space-bar@luchrioh"
        "clipboard-indicator@tudmotu.com"
        "compiz-windows-effect@hermes83.github.com"
        "caffeine@patapon.info"
        "openbar@neuromorph"
        "burn-my-windows@schneegans.github.com"

      ];
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "io.missioncenter.MissionCenter.desktop"
        "firefox.desktop"
        "steam.desktop"
        "discord.desktop"
        "Alacritty.desktop"
        "codium.desktop"
        "org.flameshot.Flameshot.desktop"
        "org.gnome.Settings.desktop"
        "org.gnome.Extensions.desktop"      
      ];

      last-selected-power-profile = "performance";

    };

    "org/gnome/desktop/background" = {
      picture-uri = "file://" + ../../assets/images/nixos-wallpaper-catppuccin.png;
      picture-uri-dark = "file://" + ../../assets/images/nixos-wallpaper-catppuccin.png;
    };


    #not working 
    #"org/gnome/desktop/interface".color-scheme = "prefer-dark";


    #/org/gnome/shell/extensions/dash-to-dock/background-color
    #'rgb(24,24,37)'







  };  
}