{pkgs, ...}:

{
  catppuccin = {
    alacritty.enable = true;
    gtk.enable = true;
    btop.enable = true;
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
    ulauncher
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
    };
    #not working 
    "/org/gnome/desktop/interface/" = {
      color-scheme = "prefer-dark";
    };

    #"/org/gnome/shell/extensions/openbar/" = {
    #  reloadstyle = "true";
    #};

    #/org/gnome/shell/extensions/dash-to-dock/background-color
    #'rgb(24,24,37)'





  };  
}