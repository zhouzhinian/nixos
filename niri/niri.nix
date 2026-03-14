{ config, pkgs, lib, ... }:

{

programs.niri = {
   enable = true;
   useNautilus = true;
 
   };
services.displayManager.dms-greeter = {
  enable = true;
  compositor.name = "niri";  # Or "hyprland" or "sway"
   };
environment.systemPackages = with pkgs; [
	yazi
	bat
	lsd
	nautilus
];

}
