{ pkgs, stylix, ...}:

{
  # List your module files here
  # my-module = import ./my-module.nix;
  imports = [
    ./catppuccin.nix
    ./consoleapps.nix
    ./desktopapps.nix
    ./vscode.nix
  ];

}
