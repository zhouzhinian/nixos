{ config, pkgs, ... }:

{


  home.username = "zhinian";
  home.homeDirectory = "/home/zhinian";
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";


}
