{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    audacity
    flameshot #screenshots
    gpu-viewer
    gparted
    mission-center #resource monitor
    wireshark
    flatpak
  ];

}